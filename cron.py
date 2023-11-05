import datetime
import json
import random
from time import sleep

import pymysql
from django.utils import timezone
from pymysql import cursors

import requests

from crypto_sliv_bot import settings


# Open database connection
db = pymysql.connect(
    host="localhost",
    db="crypto_sliv_bot",
    user="admin",
    passwd="Fese1520..",
    cursorclass=pymysql.cursors.DictCursor,
)

# prepare a cursor object using cursor() method
cursor = db.cursor()

# execute SQL query using execute() method.

today = datetime.datetime.now().date()
hour = datetime.datetime.now().hour
minute = datetime.datetime.now().minute

def end_of_subscription(chat_id, days=None):
    if days:
        if days == 7:
            url = f'https://api.telegram.org/bot{settings.TOKEN}/sendPhoto'
            data = {'chat_id': chat_id, 'photo': 'https://i.ibb.co/Yf5CBFH/7-days.jpg',
                'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Продлить подписку', 'url': 'https://t.me/cryptoslivmanager'}],
                ]})}
            requests.post(url, data=data)
        elif days == 3:
            url = f'https://api.telegram.org/bot{settings.TOKEN}/sendPhoto'
            data = {'chat_id': chat_id, 'photo': 'https://i.ibb.co/tqNmnFR/3-days.jpg', 
                'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Продлить подписку', 'url': 'https://t.me/cryptoslivmanager'}],
                ]})}

            requests.post(url, data=data)
        elif days == 2:
            url = f'https://api.telegram.org/bot{settings.TOKEN}/sendPhoto'
            data = {'chat_id': chat_id, 'photo': 'https://i.ibb.co/ygsn1wM/2-days.jpg', 
                'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Продлить подписку', 'url': 'https://t.me/cryptoslivmanager'}],
                ]})}

            requests.post(url, data=data)
        return

    url = f'https://api.telegram.org/bot{settings.TOKEN}/sendPhoto'

    data = {'chat_id': chat_id, 'photo': 'https://i.ibb.co/gtgBT9Y/end-of-subscribe.jpg', 
                'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Продлить подписку', 'url': 'https://t.me/cryptoslivmanager'}],
                ]})}


    requests.post(url, data=data)



def ban_user_from_channels(chat_id):
    cursor.execute("""SELECT channels FROM main_plan WHERE name = "Основний" """)

    channels = [item[1] for item in eval(cursor.fetchone()['channels'])]

    for channel_id in channels:
        url = f'https://api.telegram.org/bot{settings.TOKEN}/banChatMember'

        data = {'chat_id': channel_id, 'user_id': chat_id}
        requests.post(url, data=data)

    cursor.execute(f"""SELECT * FROM main_userstoapprove""")

    for i in cursor.fetchall():
        if chat_id in eval(i['users_ids']):
            cursor.execute(f"""SELECT * FROM main_userstoapprove WHERE name = "{i['name']}" """)
            users_ids = eval(cursor.fetchone()['users_ids'])
            users_ids.remove(chat_id)
            cursor.execute(f"""UPDATE main_userstoapprove SET users_ids = "{users_ids}" WHERE name = "{i['name']}" """)

            db.commit()

    cursor.execute(f"""DELETE FROM main_plan WHERE name = "{chat_id}" """)
    db.commit()

    cursor.execute(f"""UPDATE main_user SET main_user.plan = "Бесплатный", main_user.course = "Бесплатный" WHERE user_id = {chat_id} """)
    db.commit()


def unban_user_from_channels(chat_id):
    cursor.execute("""SELECT channels FROM main_plan WHERE name = "Основний" """)

    channels = [item[1] for item in eval(cursor.fetchone()['channels'])]

    for channel_id in channels:
        url = f'https://api.telegram.org/bot{settings.TOKEN}/unbanChatMember'

        data = {'chat_id': channel_id, 'user_id': chat_id}
        requests.post(url, data=data)
    try:
        cursor.execute(f"""SELECT data FROM main_admindata WHERE name = "main" """)
        data = eval(cursor.fetchone()['data'])

        data['banned'].remove(chat_id)

        cursor.execute(f"""UPDATE main_admindata SET data="{data}" WHERE name = "main" """)
        db.commit()
    except:
        pass


"""
prototype of data

"{
  "banned": [],
  "7_days": [],
  "3_days": [
    1319498352
  ],
  "2_days": []
}"
"""


def check_banned_users():
    random_num = random.randint(1, 20)
    cursor.execute(f"""UPDATE main_user SET hash="{random_num}" WHERE user_id = 1970247612""")
    db.commit()
    cursor.execute("SELECT * FROM main_user")
    users = cursor.fetchall()
    for i in users:
        print(i['active_to'].year, i['active_to'].month, i['active_to'].day, i['user_id'])
	
	
        if i['user_id'] not in [376488524, 285328584, 208852923, 1003177247, 881262516, 1642080580, 1695449370,
                                109624844, 97760197, 381582592, 203655062, 174061591, 377472146, 360909504,
                                5352533415, 376488524, 6140422762, 578007451, 1099975963, 431268796, 402326682,
                                249301267, 434851368, 374551206, 355106464, 190310919, 373081110, 531894719,
                                5547865865, 487773888, 404175563, 124122138, 1600252414, 5985377542, 5284027175,
                                5038558615, 624007130, 376488524, 1086342278, 5662291071, 881398904]:
            # show day amount
            cursor.execute("SELECT data from main_admindata WHERE name = 'main'")
            data = eval(cursor.fetchone()['data'])
	    
            if i['active_to'].year == today.year and i['active_to'].month == today.month and i[
                'active_to'].day == today.day and i['user_id'] not in data['banned']:
                cursor.execute("SELECT data from main_admindata WHERE name = 'main'")
                data = eval(cursor.fetchone()['data'])

                chat_id = i['user_id']
                ban_user_from_channels(chat_id)
                end_of_subscription(chat_id)
                print("Banned id:", chat_id)
                data['banned'].append(chat_id)

                try:
                    data['7_days'].remove(chat_id)
                except:
                    pass
                try:
                    data['3_days'].remove(chat_id)
                except:
                    pass
                try:
                    data['2_days'].remove(chat_id)
                except:
                    pass
                try:
                    data['1_hour'].remove(chat_id)
                except:
                    pass

                cursor.execute(f"""UPDATE main_admindata SET data="{data}" WHERE name = "main" """)
                db.commit()
            elif i['active_to'].year == today.year and i['active_to'].month == today.month and i[
                'active_to'].day == today.day + 7 and i['user_id'] not in data['7_days']:
                cursor.execute("SELECT data from main_admindata WHERE name = 'main'")
                data = eval(cursor.fetchone()['data'])

                chat_id = i['user_id']
                end_of_subscription(chat_id, days=7)
                print("7 days left id:", chat_id)

                data['7_days'].append(chat_id)

                cursor.execute(f"""UPDATE main_admindata SET data="{data}" WHERE name = "main" """)
                db.commit()
            elif i['active_to'].year == today.year and i['active_to'].month == today.month and i[
                'active_to'].day == today.day + 3 and i['user_id'] not in data['3_days']:
                cursor.execute("SELECT data from main_admindata WHERE name = 'main'")
                data = eval(cursor.fetchone()['data'])
                chat_id = i['user_id']
                print("3 days left id:", chat_id)
                end_of_subscription(chat_id, days=3)

                data['3_days'].append(chat_id)

                cursor.execute(f"""UPDATE main_admindata SET data="{data}" WHERE name = "main" """)
                db.commit()
            elif i['active_to'].year == today.year and i['active_to'].month == today.month and i[
                'active_to'].day == today.day + 2 and i['user_id'] not in data['2_days']:
                cursor.execute("SELECT data from main_admindata WHERE name = 'main'")
                data = eval(cursor.fetchone()['data'])

                chat_id = i['user_id']
                end_of_subscription(chat_id, days=2)
                print("2 days left id:", chat_id)

                data['2_days'].append(chat_id)

                cursor.execute(f"""UPDATE main_admindata SET data="{data}" WHERE name = "main" """)
                db.commit()
            elif i['active_to'].year == today.year and i['active_to'].month == today.month and i['active_to'] == today and i['active_to'].hour == hour + 1 and i['user_id'] not in data['1_hour']:
                chat_id = i['user_id']
                print("1 hour left id:", chat_id)
                url = f'https://api.telegram.org/bot{settings.TOKEN}/sendPhoto'

                data = {'chat_id': chat_id, 'photo': 'https://i.ibb.co/xJzqnTn/1-hour.jpg'}

                cursor.execute("SELECT data from main_admindata WHERE name = 'main'")
                data = eval(cursor.fetchone()['data'])

                data['1_hour'].append(chat_id)

                cursor.execute(f"""UPDATE main_admindata SET data="{data}" WHERE name = "main" """)
                db.commit()

                requests.post(url, data=data)


def edit_all_recording():
    user_id = 107933705

    cursor.execute(f"""SELECT name, users_ids FROM main_userstoapprove""")
    for i in cursor.fetchall():
        users_ids = eval(i['users_ids'])
        channel_name = i['name']
        print("Name:", channel_name)
        print("Ids before:", users_ids)
        if user_id in users_ids:
            user_entries_amount = users_ids.count(user_id)
            for _ in range(user_entries_amount):
                users_ids.remove(user_id)
            cursor.execute(f"""UPDATE main_userstoapprove SET users_ids="{users_ids}" WHERE name = "{i['name']}" """)
            db.commit()
        print("Ids after:", users_ids)
    print("Done!")

#edit_all_recording()

if __name__ == '__main__':
    check_banned_users()


