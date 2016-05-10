# -*- coding: utf-8 -*-
from socket import *
import csv
import threading

def register(dat):
    #handshaking
    file = open("usuarios.csv", "a+")
    file.write("%s\n" %(dat))
    print 'sentence recieved'
    data = dat.split(',')
    print "datos recibidos por TCP"
    print "email password   name"
    print data
    datos = "%s   %s    %s" %(data[0],data[1], data[2])
    print datos
    file.close()
    
  
def auth(dat):
    data = dat.split(',')
    with open("usuarios.csv", "rb") as f:
        #reader = csv.reader(f, delimiter="\t")
        for line in f.readlines():
            array=line.split(",")
            mail=array[0]
            password = array[1]
            if mail == data[0] and password==data[1]:
                return 1;
            else:
                return 0;



serverPort = 22002
serverSocket = socket(AF_INET,SOCK_STREAM)
serverSocket.bind(('',serverPort))
serverSocket.listen(1)
print 'The server is ready to receive TCP connection'
#handshaking
sentence =""

while 1:
    connectionSocket, addr = serverSocket.accept()
    sentence += connectionSocket.recv(1024)
    print sentence
    rec_end = sentence.find('.')
    #Lo encontró
    if rec_end != -1:
        data1,data2 = sentence.split(':')
        print data1
        data2=data2[:len(data2)-1]
        print data2
        if data1 == "Registro":
            print "Entramos Regi",data2
            register(data2)
            connectionSocket.send("data updated")
            

        if data1 == "Auth":
            print "Entramos Auth",data2
            if auth(data2) ==1:
                connectionSocket.send("Encontrado")
                print "Encontrado"
            else:
                connectionSocket.send("No encontrado")
                print "No encontrado"
        #break
    sentence = ""

    connectionSocket.close()


