import sys

Lag1 = sys.argv[1]
Lag2 = sys.argv[2]
Lag3 = sys.argv[3]
Lag4 = sys.argv[4]
Lag5 = sys.argv[5]
Volume = sys.argv[6] 
print(Lag1, Lag2, Lag3, Lag4, Lag5)

file = open("coef.csv", "r").readlines()
model = {}

for i,j in zip(file[0].split(','), file[1].split(',')):
        model[i.replace('\n',"").replace('"','')]= float(j.replace('"',''))
print("model is: ", model)
score = model['Intercept'] + float(Lag1)*model['Lag1'] + float(Lag2)*model['Lag2'] + float(Lag3)*model['Lag3'] + float(Lag4)*model['Lag4'] + float(Lag5)*model['Lag5'] + float(Volume)*model['Volume'] 

print("final_score is: ", score)
