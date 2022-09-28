import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score
import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn import svm
from sklearn.metrics import accuracy_score

# Collecting Data

get_dataset = "Heart Disease Data" 

heartData = pd.read_csv(get_dataset)
# targetColumn= input("Please enter the target Column name: ")
targetColumn= "HeartDisease"
# Spilliting Features and targets
# The Target Column is the last column in the dataset and it is important for the operation
features = heartData.drop(columns=targetColumn , axis= 1)

targets = heartData[targetColumn]

# Training & Testing Data

featuresTrain, featuresTest, targetsTrain, targetsTest = train_test_split(features, targets, test_size= 0.2, random_state= 2)

# Logistic Regression

model = LogisticRegression()

model.fit(featuresTrain, targetsTrain)

"""
Importnat Symbols in Medical Department:

Gender : male = 0 , female = 1

Chest Pain: ATA = 0 ,  NAP = 1 , ASY = 2 , TA = 3

ExerciseAngina: N = 0 , Y= 1

RestingECG: Normaleal = 0 , ST = 1 , LVH = 2

"""

# Prediction
def HeartTest():
    inputData = [ 40,0,0,140,289,0,0,172,0,0 ]

    inputDataArray = np.asarray(inputData)

    inputDataReshaped = inputDataArray.reshape( 1 , -1 )

    prediction= model.predict(inputDataReshaped)

    if (prediction[0] == 0):

        print("You don't have a heart disease.")

    else:

        print("You have a heart disease.")

# Accuracy Score

featuresTrainPrediction = model.predict(featuresTrain)

dataAccurcy = accuracy_score(featuresTrainPrediction, targetsTrain)

print ("Accuracy: " , (dataAccurcy * 100), "%") 

scaler = StandardScaler()
scaler.fit(features)
def MakePrediction2():
    xHeart= "Some Error Has Happened."
    input_tuple = tuple([eval(val) for val in input("Please enter some values: ").split(',')])
    print('tuple:',input_tuple)
    input_data_as_numpy_array = np.asarray(input_tuple)
    input_data_reshaped = input_data_as_numpy_array.reshape(1,-1)
    std_data = scaler.transform(input_data_reshaped)
    print(std_data)

    prediction = model.predict(std_data)
    print(prediction)

    if (prediction[0] == 0):
        xHeart=0
    else:
        xHeart=1
    return(xHeart)
