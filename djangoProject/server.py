# https://docs.python.org/3/howto/sockets.html
# https://stackoverflow.com/questions/8627986/how-to-keep-a-socket-open-until-client-closes-it
# https://stackoverflow.com/questions/10091271/how-can-i-implement-a-simple-web-server-using-python-without-using-any-libraries

# listens to any kind of request and sends the same response.

from socket import *

def createServer():
    serversocket = socket(AF_INET, SOCK_STREAM)
    try :
        serversocket.bind(('localhost',9000))
        serversocket.listen(5) #hold those other 4 calls temporarily
        while(1):       #infinite loop.. sits and waits for the phone call indefinitely on port 9000
            (clientsocket, address) = serversocket.accept() #ready to pick up the call

            rd = clientsocket.recv(5000).decode() 
            pieces = rd.split("\n")
            if ( len(pieces) > 0 ) : print(pieces[0])

            #response will be according to RFIC documentation
            data = "HTTP/1.1 200 OK\r\n"
            data += "Content-Type: text/html; charset=utf-8\r\n"
            data += "\r\n"
            data += "<html><body>Hello World</body></html>\r\n\r\n"
            clientsocket.sendall(data.encode())
            clientsocket.shutdown(SHUT_WR)

    except KeyboardInterrupt :
        print("\nShutting down...\n");
    except Exception as exc :
        print("Error:\n");
        print(exc)

    serversocket.close()

print('Access http://localhost:9000')
createServer()
