from socket import *
import numpy as np
import cv2


serverName = 'localhost'
serverPort = 9090
clientSocket = socket(AF_INET , SOCK_DGRAM)
message = raw_input('info al server')

#envia datos sin establecer previo acuerdo
clientSocket.sendto(message,(serverName, serverPort))
#modifiedMessage, serverAddress = clientSocket.recvfrom(2048)


while(True):

    modifiedMessage, serverAddress = clientSocket.recvfrom(46080)

    npimg = np.fromstring(modifiedMessage, dtype=np.uint8);
    decimg=cv2.imdecode(npimg,1)
    cv2.imshow('Decoded image',decimg)
        
    if cv2.waitKey(1)  == ord('q'):
        break

    #print modifiedMessage



clientSocket.close()
