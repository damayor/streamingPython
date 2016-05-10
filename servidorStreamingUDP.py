import numpy as np
import cv2
from  socket import *
import sys
import threading

#def streaming(serverPort, filename):
def streaming():
    serverPort = 9090
    serverSocket = socket(AF_INET, SOCK_DGRAM)
    serverSocket.bind(('', int(serverPort)))
    print "The server is ready to receive UDP connection in port",serverPort



    message, clientAddress = serverSocket.recvfrom(2048)
    print "The server is connected with client"

    cap = cv2.VideoCapture(0)     #(filename)PARAMETRO

    ret, frame = cap.read()
    count = 0
    while(ret):


        print frame

        cv2.imshow('frameServer',frame)
        #send frame
        encode_param=[int(cv2.IMWRITE_JPEG_QUALITY),50]
        #50% de calidad

        result, imgencode = cv2.imencode('.jpg', frame, encode_param)
        #decimg=cv2.imdecode(imgencode,1)

        print len(imgencode)
        #cv2.imshow('Decoded image',decimg)

        serverSocket.sendto(imgencode, clientAddress)

        #this is it en bytes
        #serverSocket.sendto(imgencode.tobytes(),clientAddress)


        if cv2.waitKey(1)  == ord('q'):
            break


        count+=1
        ret, frame = cap.read()

    # When everything done, release the capture
    cap.release()
    cv2.destroyAllWindows()
    print 'server ha cerrado conexion'


def upload():

    port = 22037
    s = socket(AF_INET, SOCK_STREAM)
    #PUERTO PARAMETRO
    s.bind(('',port))
    s.listen(5)
    print 'port is listening on port ',port

    #FILE NAME PARAMETRO
    #filename = raw_input('Digite el nombre del archivo a subir?')
    #filename = filename+'.mp4'
    filename = 'pasabordo.mp4'
    f = open(filename,'wb')


    while True:
        c, addr = s.accept()     # Establish connection with client.
        print 'Got connection from', addr
        print "Receiving..."
        l = c.recv(16384)
        while (l):
            print "Receiving..."
            f.write(l)
            l = c.recv(16384)
        f.close()
        print "Done Receiving"
        c.send('Thank you for connecting')
        c.close()                # Close the connection


    s.close()

    #encolelo al puerto port-10 y vaya reproduciendo

    streaming(port-10,filename)


#u = threading.Thread(target=streaming(), name='streaming port ')

#t = threading.Thread(target=upload(), name='upload port ')

#u.start()
#t.start()

#upload()
streaming()
