import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score


# Collecting Data

category = input("Please enter the name of the main column: ")

message = input("Please enter the name of the message or numerical column: ")

mailDataRaw = pd.read_csv('spam_ham_dataset.csv')

# Modyfing the null values to null strings

mailData = mailDataRaw.where(pd.notnull(mailDataRaw)," ")

# Defining ham and spam mails 

mailData.loc [mailData[category] == 'spam', category,] = 0  
mailData.loc [mailData[category] == 'ham', category,] = 1

#Separating the data as text as labels and texts

message = mailData[message]
category = mailData[category]


# Training & Testnig the Data

messageTrain , messageTest , categoryTrain , categoryTest = train_test_split(message, category, test_size=0.2, random_state=3)

# Data Text to Feature Vectors

featureExtraction = TfidfVectorizer(min_df=1, stop_words='english', lowercase= True)

messageTrainFeatures = featureExtraction.fit_transform(messageTrain)

messageTestFeatures = featureExtraction.transform(messageTest)

# Changing category train & test to intgers

categoryTrain = categoryTrain.astype('int')

categoryTest = categoryTest.astype('int')

# Logistic Regression 

model = LogisticRegression()

model.fit(messageTrainFeatures, categoryTrain)

# Accurcy Score

prediction = model.predict(messageTrainFeatures)

accuracy =accuracy_score(categoryTrain, prediction)  

print ("Accuracy: " , (accuracy * 100), "%") 
