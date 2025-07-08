from flask import Flask, jsonify
from db_connection import get_connection

app = Flask(__name__)

@app.route('/users')

def get_users():

    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("SELECT user_id,user_name,user_email,user_created FROM users ORDER BY user_created;")
        rows = cur.fetchall()
        cur.close()
        conn.close()

        users = [
            {
                "id": row[0],
                "name": row[1],
                "email": row[2],
                "created_date": row[3].strftime("%Y-%m-%d %H:%M:%S")
            }
            for row in rows
        ]
        return jsonify(users)
    except Exception as exception:
        return jsonify({"error":str(exception)}),500

if __name__ == '__main__':
    app.run(debug=True)