import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn import svm
from sklearn.metrics import accuracy_score
diabetes_dataset = pd.read_csv('diabetes.csv')
df = pd.DataFrame(diabetes_dataset)
Data = diabetes_dataset.drop(columns = 'Outcome', axis=1)
Outcome = diabetes_dataset['Outcome'] 
scaler = StandardScaler()
scaler.fit(Data)
standardized_data = scaler.transform(Data)
Data = standardized_data
classifier = svm.SVC(kernel='linear')
def DiabetesTest():
    MissVal = df.isna().sum().sum()
    print(MissVal)
    if MissVal == 0:
        pass
    else:
        df.dropna()
    Data_train, Data_test, Outcome_train, Outcome_test = train_test_split(Data,Outcome, test_size = 0.25, stratify=Outcome, random_state=10)
    classifier.fit(Data_train, Outcome_train)
    Data_train_prediction = classifier.predict(Data_train)
    training_data_accuracy = accuracy_score(Data_train_prediction, Outcome_train)
    input_data = (6,193,64,22,200,26,0.7,49)
    print('Accuracy score of the training data : ', training_data_accuracy)

def MakePrediction():
    x= "Some Error Has Happened."
    input_tuple = tuple([eval(val) for val in input("Please enter some values: ").split(',')])
    print('tuple:',input_tuple)
    input_data_as_numpy_array = np.asarray(input_tuple)
    input_data_reshaped = input_data_as_numpy_array.reshape(1,-1)
    std_data = scaler.transform(input_data_reshaped)
    print(std_data)

    prediction = classifier.predict(std_data)
    print(prediction)

    if (prediction[0] == 0):
        x=0
    else:
        x=1
    return(x)
DiabetesTest()
