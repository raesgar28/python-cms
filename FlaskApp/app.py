#GRACIAS A: https://code.tutsplus.com/es/creating-a-web-app-from-scratch-using-python-flask-and-mysql--cms-22972t


from flask import Flask, render_template, json, request, session, redirect
import os, uuid
import mysql.connector
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
app.secret_key = 'why would I tell you my secret key?'

#conn = mysql.connector.connect(host="localhost",port="3307",user="raesgar",password="Obelix28",database="BucketList")
#cursor = conn.cursor()
#net start MySQL80

@app.route("/")
def main():
    return render_template('index.html')


@app.route('/logout')
def logout():
    session.pop('user',None)
    return redirect('/')

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')

@app.route('/signUp',methods=['POST','GET'])
def signUp():
    try:
        _name = request.form['inputName']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']
        # validate the received values
        if _name and _email and _password:           
            # All Good, let's call MySQL           
            #conn = mysql.connect()
            conn = mysql.connector.connect(host="localhost",port="3307",user="raesgar",password="Obelix28",database="BucketList")
            cursor = conn.cursor()
            _hashed_password = generate_password_hash(_password)
            
            cursor.execute("SELECT * FROM tbl_user WHERE user_username=%s", (_email,))   # >> OJO A LA COMA DESPUES DE _USERNAME !!!!
            data = cursor.fetchall()
            cursor.close() 

            if len(data) == 0:
                cursor = conn.cursor()
                cursor.callproc('sp_createUser',(_name,_email,_hashed_password))   # HABRI QUE ARREGLAR EL SI EXISTE PARA QUE MUESTRE

                conn.commit()
                cursor.close() 
                conn.close()
                return json.dumps({'message':'User created successfully !'})                
            else:
                return json.dumps({'error': 'Usuario ya existente'})
        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})
    except Exception as e:
        return json.dumps({'errores':str(e)})
      

@app.route('/signin')
def showSignin():
    return render_template('signin.html')


@app.route('/api/validateLogin',methods=['POST'])
def validateLogin():
    try:
        _username = request.form['inputEmail']
        _password = request.form['inputPassword']

        conn = mysql.connector.connect(host="localhost",port="3307",user="raesgar",password="Obelix28",database="BucketList")
        cursor = conn.cursor()
        
        #cursor.callproc('sp_validateLogin',(_username,))  #EN LOCAL EL PRCEDUURE NO FUNCIONA / LO EJECUTO CON UN QUERY COMO EL DE ABAJO
        cursor.execute("SELECT * FROM tbl_user WHERE user_username=%s", (_username,))   # >> OJO A LA COMA DESPUES DE _USERNAME !!!!

        data = cursor.fetchall()
        #print(data)
        if len(data) > 0:
            if check_password_hash(str(data[0][3]),_password):
                session['user'] = data[0][0]
                #return redirect('/userHome')
                return redirect('/showDashboard')
            else:
                return render_template('error.html',error = 'Wrong Email address or Password 1- LLEGAMOS A DATA')
        else:
            return render_template('error.html',error = 'Wrong Email address or Password - NO HAY DATA')

    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        conn.close()


@app.route('/userHome')
def userHome():
    return render_template('userHome.html')

@app.route('/showAddWish')
def showAddWish():
    return render_template('addWish.html')


@app.route('/addWish',methods=['POST'])
def addWish():
    try:
        if session.get('user'):
            _title = request.form['inputTitle']
            _description = request.form['inputDescription']
            _user = session.get('user')

            if request.form.get('filePath') is None:
                _filePath = ''
            else:
                _filePath = request.form.get('filePath')
            if request.form.get('private') is None:
                _private = 0
            else:
                _private = 1  
            if request.form.get('done') is None:
                _done = 0
            else:
                _done = 1

            conn = mysql.connector.connect(host="localhost",port="3307",user="raesgar",password="Obelix28",database="BucketList")
            cursor = conn.cursor()
            cursor.callproc('sp_addWish',(_title,_description,_user,_filePath,_private,_done))
            data = cursor.fetchall()

            #cursor.close
            #cursor = conn.cursor()
            #cursor.execute("SELECT * FROM tbl_wish WHERE user_username=%s", (_username,))   # >> OJO A LA COMA DESPUES DE _USERNAME !!!!
               
            if len(data) == 0:
                conn.commit()
                return redirect('/userHome')
            else:
                return render_template('error.html',error = 'An error occurred!')
        
        else:
            return render_template('error.html',error = 'Unauthorized Access')
        
    except Exception as e:
        return render_template('error.html',error = str(e))

    finally:
        cursor.close()
        conn.close()

pageLimit = 2
@app.route('/getWish',methods=['POST','GET'])
def getWish():
    try:
        if session.get('user'):
            _user = session.get('user')
            _limit = pageLimit
            _offset = request.form['offset']

            #print (_offset)
            _total_records = 0

            conn = mysql.connector.connect(host="localhost",port="3307",user="raesgar",password="Obelix28",database="BucketList")
            cursor = conn.cursor()


            cursor.callproc('sp_GetWishByUser',(_user,_limit,_offset,_total_records))   # LOSCALL PROCED ESTOS PARA EL FETCHALL NOP FURIULAN
            wishes0 = [r.fetchall() for r in cursor.stored_results()]     # DID THE TRICK !!!
            wishes = wishes0[0]

      
            cursor.close()

            cursor = conn.cursor()
            #cursor.execute('SELECT @_sp_GetWishByUser_3')
            cursor.execute("SELECT COUNT(*) FROM tbl_wish WHERE wish_user_id=%s", (_user,))   # >> OJO A LA COMA DESPUES DE _USERNAME !!!!
            outParam = cursor.fetchall()   
 
            response = []
 

            wishes_dict = []
            for wish in wishes:
                wish_dict = {
                        'Id': wish[0],
                        'Title': wish[1],
                        'Description': wish[2],
                        'Date': wish[4]}
                wishes_dict.append(wish_dict)

            response.append(wishes_dict)
            response.append({'total':outParam[0][0]}) 

            return json.dumps(response)
        else:
            return render_template('error.html', error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html', error = str(e))


@app.route('/getWishById',methods=['POST'])
def getWishById():
    try:
        if session.get('user'):
            _id = request.form['id']
            _user = session.get('user')
            conn = mysql.connector.connect(host="localhost",port="3307",user="raesgar",password="Obelix28",database="BucketList")
            cursor = conn.cursor()

            cursor.callproc('sp_GetWishById',(_id,_user))
            data0 = [r.fetchall() for r in cursor.stored_results()]     # DID THE TRICK !!!
            result = data0[0]

            #cursor.execute("SELECT * FROM tbl_wish WHERE wish_id=%s AND wish_user_id=%s", (_id,_user,))   # >> OJO A LA COMA DESPUES DE _USERNAME !!!!
            #result = cursor.fetchall()

            wish = []
            wish.append({'Id':result[0][0],'Title':result[0][1],'Description':result[0][2],'FilePath':result[0][3],'Private':result[0][4],'Done':result[0][5]})
            return json.dumps(wish)
        else:
            return render_template('error.html', error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))


@app.route('/updateWish', methods=['POST','GET'])
def updateWish():
    try:
        if session.get('user'):
            _user = session.get('user')
            _title = request.form['title']
            _description = request.form['description']
            _wish_id = request.form['id']
            _filePath = request.form['filePath']
            _isPrivate = request.form['isPrivate']
            _isDone = request.form['isDone']
            print(_filePath)
     
            conn = mysql.connector.connect(host="localhost",port="3307",user="raesgar",password="Obelix28",database="BucketList")
            cursor = conn.cursor()
            
            cursor.callproc('sp_updateWish',(_title,_description,_wish_id,_user,_filePath,_isPrivate,_isDone))
            data = cursor.fetchall()

            if len(data) ==  0:
                conn.commit()
                return json.dumps({'status':'OK'})
            else:
                return json.dumps({'status':'ERROR'})
    except Exception as e:
        return json.dumps({'status':'Unauthorized access'})
    finally:
        cursor.close()
        conn.close()


@app.route('/deleteWish',methods=['POST'])
def deleteWish():
    try:
        if session.get('user'):
            _id = request.form['id']
            _user = session.get('user')
            conn = mysql.connector.connect(host="localhost",port="3307",user="raesgar",password="Obelix28",database="BucketList")
            cursor = conn.cursor()

            #cursor.callproc('sp_deleteWish',(_id,_user))
            cursor.execute("DELETE FROM tbl_wish WHERE  wish_id=%s and wish_user_id=%s", (_id,_user,))   # >> OJO A LA COMA DESPUES DE _USERNAME !!!!

            result = cursor.fetchall()
            if len(result) == 0:
                conn.commit()
                return json.dumps({'status':'OK'})
            else:
                return json.dumps({'status':'An Error occured'})
        else:
            return render_template('error.html',error = 'Unauthorized Access')
    except Exception as e:
        return json.dumps({'status':str(e)})
    finally:
        cursor.close()
        conn.close()


@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        file = request.files['file']
        extension = os.path.splitext(file.filename)[1]
        f_name = str(uuid.uuid4()) + extension
        app.config['UPLOAD_FOLDER'] = 'FlaskApp/static/Uploads/'
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], f_name))
        return json.dumps({'filename':f_name})


@app.route('/showDashboard')
def showDashboard():
    return render_template('dashboard.html')


@app.route('/getAllWishes')
def getAllWishes():
    try:
        if session.get('user'):
            _user = session.get('user')
            conn = mysql.connector.connect(host="localhost",port="3307",user="raesgar",password="Obelix28",database="BucketList")
            cursor = conn.cursor()
            cursor.callproc('sp_GetAllWishes',(_user,))
            data0 = [r.fetchall() for r in cursor.stored_results()]
            #result = cursor.fetchall()
            result = data0[0]
            print(result)

            wishes_dict = []
            for wish in result:
                wish_dict = {
                        'Id': wish[0],
                        'Title': wish[1],
                        'Description': wish[2],
                        'FilePath': wish[3],
                        'Like':wish[4],
                        'HasLiked':wish[5]}  
                print("ID ", end=" ")
                print(wish[0], end=" ")
                print("has liked ", end=" ")
                print(wish[5])

                wishes_dict.append(wish_dict)		
            return json.dumps(wishes_dict)
        else:
            return render_template('error.html', error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))


@app.route('/addUpdateLike',methods=['POST'])

def addUpdateLike():
    
    try:
        if session.get('user'):
            _wishId = request.form['wish']
            _like = request.form['like']
            _user = session.get('user')
           
            conn = mysql.connector.connect(host="localhost",port="3307",user="raesgar",password="Obelix28",database="BucketList")
            cursor = conn.cursor()

            cursor.callproc('sp_AddUpdateLikes',(_wishId,_user,_like))
            data = [r.fetchall() for r in cursor.stored_results()]
            #data = data0[0]
            #print(data)

            if len(data) == 0:
                conn.commit()
                cursor.close()
                conn.close()
                #return json.dumps({'status':'OK'})
            
                conn = mysql.connector.connect(host="localhost",port="3307",user="raesgar",password="Obelix28",database="BucketList")
                cursor = conn.cursor()
                cursor.callproc('sp_getLikeStatus',(_wishId,_user))
                
                result0 = [r.fetchall() for r in cursor.stored_results()]
                result = result0[0]
                print('Result>')
                print(result)
                #result = result0[0]
                print('Hola>')
                print(result[0][0])
                print('Hola2>')
                print(result[0][1])
                
                return json.dumps({'status':'OK','total':result[0][0],'likeStatus':result[0][1]})

            else:
                return render_template('error.html',error = 'An error occurred!')
        else:
            return render_template('error.html',error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        conn.close()


@app.route("/footer")
def footer():
    return render_template('footer.html')


if __name__ == "__main__":
    app.run(debug=True) #CON DEBUG=TRUE LO DEJAMOS EN MODO PRUEBA Y NO HAY QUE ESTAR REINICIANDO EL SERVIDOR   # port=5000
