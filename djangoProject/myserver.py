import socket

mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
mysock.connect(('data.pr4e.org', 80))
cmd = 'GET http://data.pr4e.org/page1.htm HTTP/1.0\r\n\r\n'.encode() #encode to unicode
mysock.send(cmd)

while True:
    data = mysock.recv(512)   #wait till 512 characters recieved 
    if len(data) < 1:
        break
    print(data.decode(),end='')     #decode to UTF-8

mysock.close()