from __future__ import print_function
import datetime
from datetime import date
import os.path
import email
from tarfile import XHDTYPE
from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
from google.auth.transport.requests import Request
from httplib2 import Http
import datefinder
from Heart_Diesease_Prediction import *
from oauth2client import file, client, tools
from dateutil import parser
import os.path
import base64
import email
from bs4 import BeautifulSoup
import os
import pickle
from base64 import urlsafe_b64decode, urlsafe_b64encode
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.image import MIMEImage
from email.mime.audio import MIMEAudio
from email.mime.base import MIMEBase
from mimetypes import guess_type as guess_mime_type
from Hackathon_Diabetes import *
SCOPES = ['https://www.googleapis.com/auth/calendar', 'https://mail.google.com/', 'https://www.googleapis.com/auth/calendar.events']
our_email = 'mohamed.1021094@stemoctober.moe.edu.eg'
def main():
    creds = None
    if os.path.exists('token.json'):
        creds = Credentials.from_authorized_user_file('token.json', SCOPES)
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(r'C:/Users/1021094/Hackathon/credentials.json', SCOPES)
            creds = flow.run_local_server(port=0)
        with open('token.json', 'w') as token:
            token.write(creds.to_json())
    try:
        service = build('calendar', 'v3', credentials=creds)
        now = datetime.datetime.utcnow().isoformat() + 'Z'  # 'Z' indicates UTC time
        print('Getting the upcoming 8 events')
        events_result = service.events().list(calendarId='primary', timeMin=now,
                                              maxResults=8, singleEvents=True,
                                              orderBy='startTime').execute()
        events = events_result.get('items', [])

        if not events:
            print('No upcoming events found.')
            return
        for event in events:
            start = event['start'].get('dateTime', event['start'].get('date'))
            print(start, event['summary'])

    except HttpError as error:
        print('An error occurred: %s' % error)
if __name__ == '__main__':
    main()


def gmail_authenticate():
    creds = None

    if os.path.exists("token.pickle"):
        with open("token.pickle", "rb") as token:
            creds = pickle.load(token)
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file('credentials.json', SCOPES[1])
            creds = flow.run_local_server(port=0)
        with open("token.pickle", "wb") as token:
            pickle.dump(creds, token)
    return build('gmail', 'v1', credentials=creds)

service = gmail_authenticate()
def search_messages(service, query):
    result = service.users().messages().list(userId='me',q=query).execute()
    messages = [ ]
    if 'messages' in result:
        messages.extend(result['messages'])
    while 'nextPageToken' in result:
        page_token = result['nextPageToken']
        result = service.users().messages().list(userId='me',q=query, pageToken=page_token).execute()
        if 'messages' in result:
            messages.extend(result['messages'])
    return messages

def get_size_format(b, factor=1024, suffix="B"):
    for unit in ["", "K", "M", "G", "T", "P", "E", "Z"]:
        if b < factor:
            return f"{b:.2f}{unit}{suffix}"
        b /= factor
    return f"{b:.2f}Y{suffix}"


def clean(text):
    return "".join(c if c.isalnum() else "_" for c in text)
def parse_parts(service, parts, folder_name, message):
    if parts:
        for part in parts:
            filename = part.get("filename")
            mimeType = part.get("mimeType")
            body = part.get("body")
            data = body.get("data")
            file_size = body.get("size")
            part_headers = part.get("headers")
            if part.get("parts"):
                parse_parts(service, part.get("parts"), folder_name, message)
            if mimeType == "text/plain":
                if data:
                    text = urlsafe_b64decode(data).decode()
                    print(text)
            elif mimeType == "text/html":
                if not filename:
                    filename = "index.html"
                filepath = os.path.join(folder_name, filename)
                print("Saving HTML to", filepath)
                with open(filepath, "wb") as f:
                    f.write(urlsafe_b64decode(data))
            else:
                for part_header in part_headers:
                    part_header_name = part_header.get("name")
                    part_header_value = part_header.get("value")
                    if part_header_name == "Content-Disposition":
                        if "attachment" in part_header_value:
                            print("Saving the file:", filename, "size:", get_size_format(file_size))
                            attachment_id = body.get("attachmentId")
                            attachment = service.users().messages() \
                                        .attachments().get(id=attachment_id, userId='me', messageId=message['id']).execute()
                            data = attachment.get("data")
                            filepath = os.path.join(folder_name, filename)
                            if data:
                                with open(filepath, "wb") as f:
                                    f.write(urlsafe_b64decode(data))   
def read_message(service, message):
    msg = service.users().messages().get(userId='me', id=message['id'], format='full').execute()
    payload = msg['payload']
    headers = payload.get("headers")
    parts = payload.get("parts")
    folder_name = "email"
    has_subject = False
    if headers:
        for header in headers:
            name = header.get("name")
            value = header.get("value")
            if name.lower() == 'from':
                print("From:", value)
            if name.lower() == "to":
                print("To:", value)
            if name.lower() == "subject":
                has_subject = True
                folder_name = clean(value)
                folder_counter = 0
                while os.path.isdir(folder_name):
                    folder_counter += 1
                    if folder_name[-1].isdigit() and folder_name[-2] == "_":
                        folder_name = f"{folder_name[:-2]}_{folder_counter}"
                    elif folder_name[-2:].isdigit() and folder_name[-3] == "_":
                        folder_name = f"{folder_name[:-3]}_{folder_counter}"
                    else:
                        folder_name = f"{folder_name}_{folder_counter}"
                os.mkdir(folder_name)
                print("Subject:", value)
            if name.lower() == "date":
                print("Date:", value)
    if not has_subject:
        if not os.path.isdir(folder_name):
            os.mkdir(folder_name)
    parse_parts(service, parts, folder_name, message)
    print("="*50)
    matches = list(datefinder.find_dates(str(parts)))
    if len(matches) > 0:
        date = matches[0]
        print(date)
    else:
        print('No dates found')
    
def Havesearch(service, x):

    results = search_messages(service, x)
    for msg in results:
        read_message(service, msg)
    
'''    message = email.message_from_string(.text)
    for payload in message.get_payload():
    print(parser.parse(payload.get_payload()))'''

Receiver = input("Enter the email address:")
def build_message(destination, obj, body):
        message = MIMEText(body)
        message['to'] = destination
        message['from'] = our_email
        message['subject'] = obj
        return {'raw': urlsafe_b64encode(message.as_bytes()).decode()}
def send_message(service, destination, obj, body):
    return service.users().messages().send(
      userId="me",
      body=build_message(destination, obj, body)
            
    
    ).execute()

'''def MakeAppointment():

    Elnharda = datetime.datetime.now()
    Ba3d_Week = Elnharda + datetime.timedelta(days = 7)
    Ba3d_Week_Appointment = Ba3d_Week.replace(hour=18, minute=00, second=00, microsecond=00)
    Ba3d_Week_Appointment_End = Ba3d_Week_Appointment.replace(hour=19, minute=00)

    Anevent = {
            'summary': 'Diabetes Diagnosis Appointment',
            'location': '17, Ahmed Al-Zomar Street, Nasr City, Cairo',
            'description': 'Further diagnosis for you case of diabetes.',
            'start': {
                    'dateTime': f'{Ba3d_Week_Appointment}',
                    'timeZone': 'Cairo',
                },
            'end': {
                    'dateTime': f'{Ba3d_Week_Appointment_End}',
                    'timeZone': 'Cairo',
                },
            
                'attendees': [
                    {'email': f'{Receiver}'}
                ],
                'reminders': {
                    'useDefault': False,
                    'overrides': [
                    {'method': 'email', 'minutes': 24 * 60},
                    {'method': 'popup', 'minutes': 30},
                    ],
                },
            }
            
    event_created = service.events().insert(calendarId= Receiver, body=Anevent).execute()
    print('Event created: %s' % (event_created.get('htmlLink')))'''
    


def ReceiveResults():
    Elnharda = datetime.datetime.now()
    Ba3d_Week = Elnharda + datetime.timedelta(days = 7)
    Ba3d_Week_Appointment = Ba3d_Week.replace(hour=18, minute=00, second=00, microsecond=00)
    Ba3d_Week_Appointment_End = Ba3d_Week_Appointment.replace(hour=19, minute=00)
    x = MakePrediction()
    y = "An unexpected error happened."
    if x == 0 or x == 1:
        x = bool(int(x))
        if x:
            y=f"Dear user,\n\nYou can find the results for your test below \nPrediction Results: Positive \n \nIt seems that there is a great chance that you have diabetes mellitus. \n\n Do not stress yourself about it; this test is not 100 % accurate. However, we strongly recommend that you make further diagnosis to check whether you have diabetes or not.\n\nAn Appointment will be scheduled for you at {Ba3d_Week_Appointment}, and you can cancel it through your account dashboard.\n \n \nWebsite Link: https://www.cdc.gov/diabetes/basics/diabetes.html#:~:text=Diabetes%20is%20a%20chronic%20(long,your%20pancreas%20to%20release%20insulin." 
            send_message(service, Receiver, "Your Prediction Results", 
            f"{y}")
            
        else:
            y="Dear user,\n\nYou can find the results for your test below \nPrediction Results: Negative \n \nOur results show that you most likely do not have diabetes. \nHowever, we recommend that you know more about the disease and how to deal with it.\n \nWebsite Link: https://www.cdc.gov/diabetes/basics/diabetes.html#:~:text=Diabetes%20is%20a%20chronic%20(long,your%20pancreas%20to%20release%20insulin." 
            send_message(service, Receiver, "Your Prediction Results", 
            f"{y}")
def ReceiveResults2():
    Elnharda = datetime.datetime.now()
    Ba3d_Week = Elnharda + datetime.timedelta(days = 7)
    Ba3d_Week_Appointment = Ba3d_Week.replace(hour=18, minute=00, second=00, microsecond=00)
    Ba3d_Week_Appointment_End = Ba3d_Week_Appointment.replace(hour=19, minute=00)
    x = MakePrediction2()
    y = "An unexpected error happened."
    if x == 0 or x == 1:
        x = bool(int(x))
        if x:
            y=f"Dear user,\n\nYou can find the results for your test below \nPrediction Results: Positive \n \nIt seems that there is a great chance that you have a heart disease. \n\n Do not stress yourself about it; this test is not 100 % accurate. However, we strongly recommend that you make further diagnosis to check whether you have a heart disease or not.\n\nAn Appointment will be scheduled for you at {Ba3d_Week_Appointment}, and you can cancel it through your account dashboard.\n \n \nWebsite Link: https://www.cdc.gov/heartdisease/index.htm#:~:text=Heart%20disease%20is%20the%20leading,can%20lead%20to%20heart%20attack." 
            send_message(service, Receiver, "Your Prediction Results", 
            f"{y}")
            
        else:
            y="Dear user,\n\nYou can find the results for your test below \nPrediction Results: Negative \n \nOur results show that you most likely do not have a heart disease. \nHowever, we recommend that you know more about the disease and how to deal with it.\n \nWebsite Link: https://www.cdc.gov/heartdisease/index.htm#:~:text=Heart%20disease%20is%20the%20leading,can%20lead%20to%20heart%20attack." 
            send_message(service, Receiver, "Your Prediction Results", 
            f"{y}")
