from firebase import firebase  
firebase = firebase.FirebaseApplication('https://console.firebase.google.com/u/0/project/technician-new/authentication/users', None) #https://console.firebase.google.com/u/0/project/technician-new/authentication/users
data =  { 'Name': 'Vivek',  
          'RollNo': 1,  
          'Percentage': 76.02  
          }  
result = firebase.post('/python-sample-ed7f7/Students/',data)  
print(result) 