from datetime import datetime
from time import sleep
import requests

# Create your views here.

from django.http import HttpResponse
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
import json
from requests import post
from django.conf import settings
from main.models import User, Plan, Course, UsersToApprove

from cron import unban_user_from_channels

HTTPS_ADDR = "https://72f9-109-227-124-221.ngrok-free.app/"

course_to_change_name = ""
course_to_change_description = ""
course_to_change_courses = ""
plan_to_change_name = ""
plan_to_change_description = ""
plan_to_change_channels = ""
get_user_name = False
mailing_status = False
plans_to_add_to_user = []

[["https://t.me/+6tzqzO_mR0ExNWRi", -1001844384264, "Pentagon 2.0"]]
def page_not_found(request, exception):
    return HttpResponse('Oops, page not found!')


def server_error(request):
    return HttpResponse('Oops, server error!')


def picture(request, name):
    from django.http import FileResponse
    img = open(f'/home/lolka0d/Стільниця/crypto_sliv_bot/main/stattic/{name}', 'rb')

    response = FileResponse(img)

    return response


def set_webhook(webhook_url):  # telegram bot webhook
    url = f'https://api.telegram.org/bot{settings.TOKEN}/setWebhook'
    return post(url=url, json={'url': webhook_url}).text


print(set_webhook(HTTPS_ADDR + 'webhook/'))


def home(request):
    return HttpResponse('Hello, world!')


@csrf_exempt
def webhook(request):
    # return HttpResponse(status=200)
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))

        global course_to_change_name
        global course_to_change_description
        global course_to_change_courses
        global plan_to_change_name
        global plan_to_change_description
        global plan_to_change_channels

        global get_user_name
        global mailing_status
        global mailing_status
        global plans_to_add_to_user

        if 'message' in data.keys():
            print(data)
            text = data['message']['text']
            user_id = data['message']['chat']['id']
            message_id = data['message']['message_id']
            if text == '/start':
                try:
                    user = User.objects.get(user_id=user_id)
                    if user.is_active:
                        start_message(user_id)
                    else:
                        send_message(user_id, 'Ваш аккаунт не активирован')
                except User.DoesNotExist:
                    User.objects.create(user_id=user_id, is_active=True, is_admin=False, plan='Бесплатный', course='Бесплатный', active_to=timezone.now() + timezone.timedelta(days=1))
                    start_message(user_id)
	        #except Exception as e:
		    #print(e)
                return HttpResponse(status=200)
            if mailing_status:
                users = User.objects.all()
                for user in users:
                    send_message(user.user_id, text)
                mailing_status = False
                successful_mailing(user_id)
                return HttpResponse(status=200)
            elif get_user_name == True and User.objects.get(
                    user_id=user_id).is_admin and text != '/admin':
                try:
                    get_user_name = User.objects.get(user_id=int(text)).user_id
                    edit_active_to(user_id)
                except User.DoesNotExist:
                    send_message(user_id, 'Пользователь не найден')
                except ValueError:
                    send_message(user_id, 'Ошибка')
            elif type(get_user_name) is int and get_user_name != "" and type(
                    get_user_name) is not bool and User.objects.get(
                    user_id=user_id).is_admin and text != '/admin':
                try:
                    user = User.objects.get(user_id=get_user_name)

                    user.active_to = timezone.now() + timezone.timedelta(days=int(text))
                    user.save()

                    choose_channels_for_plan(user_id, message_id)

                    # get_user_name = False
                    # successful_edit(user_id, text + ' д.')
                    # unban_user_from_channels(get_user_name)

                except User.DoesNotExist:
                    send_message(user_id, 'Ошибка')
            else:
                try:
                    user = User.objects.get(user_id=user_id)

                    if user.is_admin:
                        if text == '/admin':
                            admin_start_message(user_id)

                        elif course_to_change_name != "":
                            course = Course.objects.get(name=course_to_change_name)
                            course.name = text
                            course.save()

                            users = User.objects.filter(course=course_to_change_name)
                            for user in users:
                                user.course = text
                                user.save()
                            successful_edit(user_id, text)

                        elif course_to_change_description != "":
                            course = Course.objects.get(description=course_to_change_description)
                            course.description = text
                            course.save()
                            successful_edit(user_id, text)

                        elif course_to_change_courses != "":
                            course = Course.objects.get(courses=course_to_change_courses)
                            course.courses = text
                            course.save()
                            successful_edit(user_id, text)

                        elif plan_to_change_name != "":
                            plan = Plan.objects.get(name=plan_to_change_name)
                            plan.name = text
                            plan.save()

                            users = User.objects.filter(plan=plan_to_change_name)
                            for user in users:
                                user.plan = text
                                user.save()
                            successful_edit(user_id, text)

                        elif plan_to_change_description != "":
                            plan = Plan.objects.get(description=plan_to_change_description)
                            plan.description = text
                            plan.save()
                            successful_edit(user_id, text)

                        elif plan_to_change_channels != "":

                            raw_urls = eval(text)
                            plan_to_change_channels = eval(plan_to_change_channels)
                            UsersToApprove.objects.all().delete()

                            for channel_id in raw_urls:

                                pointer = raw_urls.index(channel_id)
                                url = f'https://api.telegram.org/bot{settings.TOKEN}/getChat'

                                data = {'chat_id': channel_id}
                                json_ = requests.post(url, data=data).json()
                                if json_['ok']:
                                    raw_urls[pointer].append(json_['result']['title'])
                                else:
                                    return send_message(user_id, 'Ошибка1')

                                sleep(0.5)
                                url = f'https://api.telegram.org/bot{settings.TOKEN}/createChatInviteLink'

                                data = {'chat_id': channel_id}

                                json_ = requests.post(url, data=data).json()
                                if json_['ok']:
                                    raw_urls[pointer].insert(0, json_['result']['invite_link'])
                                else:
                                    return send_message(user_id, 'Ошибка2')
                                sleep(0.5)

                                UsersToApprove.objects.create(
                                    name=raw_urls[pointer][2],
                                    channel_id=channel_id[1],
                                    users_ids="[]",
                                    created_at=datetime.now()
                                )

                            plan = Plan.objects.get(name="Основний")

                            plan.channels = json.dumps(raw_urls)
                            plan.save()
                            successful_edit(user_id, text)
                except User.DoesNotExist:
                    print(data)
            return HttpResponse(status=200)
        elif 'callback_query' in data.keys():
            user_id = data['callback_query']['from']['id']
            message_id = data['callback_query']['message']['message_id']
            data_message: str
            data_message = data['callback_query']['data']

            if data_message == 'cabinet':
                cabinet_message(user_id, message_id)
            elif data_message == 'clubs':
                clubs_message(user_id, message_id)
            elif data_message == 'courses':
                courses_message(user_id, message_id)
            elif data_message == 'my_clubs':
                if User.objects.get(user_id=user_id).plan == 'Бесплатный':
                    free_clubs_message(user_id, message_id)
                else:
                    my_clubs_message(user_id, message_id)
            elif data_message == 'my_courses':
                if User.objects.get(user_id=user_id).course == 'Бесплатный':
                    free_courses_message(user_id, message_id)
                else:
                    my_courses_message(user_id, message_id)
            elif data_message == 'start':
                start_message_callback(user_id, message_id)
            elif data_message == 'admin':
                admin_start_message(user_id, message_id)
                course_to_change_name = ""
                course_to_change_description = ""
                course_to_change_courses = ""
                plan_to_change_name = ""
                plan_to_change_description = ""
                plan_to_change_channels = ""
                get_user_name = False
                mailing_status = False
                plans_to_add_to_user = []

            elif 'add_to_' in data_message:

                channels = eval(Plan.objects.get(name='Основний').channels)
                channel_added_list = list

                for channel in channels:
                    if channel[1] == int(data_message[8:]):
                        channel_url = channel[0]
                        channel_id = channel[1]
                        channel_name = channel[2]

                        channel_added_list = [channel_url, channel_id, channel_name]
                        break
                # channel_url = channels[int(data_message[7:])][0]
                # channel_id = channels[int(data_message[7:])][1]
                # channel_name = channels[int(data_message[7:])][2]

                plans_to_add_to_user.append(channel_added_list)

                print(plans_to_add_to_user)
                print(channel_added_list)

                choose_channels_for_plan(user_id, message_id, f"Успешно добавлено в план ({channel_name})")
            elif data_message == 'all_channels':
                all_channels(user_id, message_id)
            elif data_message == 'save_plan':
                for i in plans_to_add_to_user:
                    channel_id = i[1]
                    approve = UsersToApprove.objects.get(channel_id=channel_id)
                    print(approve.name)
                    print(str(eval(approve.users_ids)))
                    approve.users_ids = str(eval(approve.users_ids) + [get_user_name])
                    approve.save()

                Plan.objects.create(name=str(get_user_name), description=f"Личный план id: {get_user_name}", channels=json.dumps(plans_to_add_to_user))

                plan_to_change_channels = []

                user = User.objects.get(user_id=get_user_name)

                user.plan = str(get_user_name)
                user.course = "Основний"
                user.save()
                unban_user_from_channels(get_user_name)

                get_user_name = False

                # successful_edit(user_id, 'План сохранен')

                send_message(user_id, 'План сохранен')

            elif data_message == 'all_users':
                all_users(user_id, message_id)
            elif data_message == 'mailing':
                mailing(user_id, message_id)
                mailing_status = True
            elif data_message == 'change_plan':
                change_plan(user_id, message_id)
            elif data_message == 'change_course':
                change_course(user_id, message_id)
            elif data_message == 'change_user':
                change_user(user_id, message_id)
                get_user_name = True
            elif data_message[0:5] == 'plan_' and len(data_message) < 9:
                what_to_change_in_plan(user_id, message_id, int(data_message[5:]))
            elif data_message[0:7] == 'course_' and len(data_message) < 11:
                what_to_change_in_course(user_id, message_id, int(data_message[7:]))
            elif data_message[0:10] == 'plan_name_':
                plan = Plan.objects.all()[int(data_message[10:])]
                plan_to_change_name = plan.name
                change_name(user_id, message_id, plan.name)
            elif data_message[0:17] == 'plan_description_':
                plan = Plan.objects.all()[int(data_message[17:])]
                plan_to_change_description = plan.description
                change_name(user_id, message_id, plan.description)
            elif data_message[0:14] == 'plan_channels_':
                plan = Plan.objects.all()[int(data_message[14:])]
                plan_to_change_channels = plan.channels
                raw_plan_channels = eval(plan_to_change_channels)
                # simple_plan_channels = [['https://t.me/+J2NytJvj3b8xNmZi', -1001844384264, 'Pentagon 2.0'], ['https://t.me/+OhIoQukPODczMWZi', -1001887199326, 'Mozart']]

                for i in range(len(raw_plan_channels)):
                    raw_plan_channels[i].pop(0)
                    raw_plan_channels[i].pop(1)

                change_name(user_id, message_id, f"{raw_plan_channels}")
            elif data_message[0:12] == 'course_name_':
                course = Course.objects.all()[int(data_message[12:])]
                course_to_change_name = course.name
                change_name(user_id, message_id, course.name)
            elif data_message[0:19] == 'course_description_':
                course = Course.objects.all()[int(data_message[19:])]
                course_to_change_description = course.description
                change_name(user_id, message_id, course.description)
            elif data_message[0:15] == 'course_courses_':
                course = Course.objects.all()[int(data_message[15:])]
                course_to_change_courses = course.courses
                change_name(user_id, message_id, course.courses)
        elif 'chat_join_request' in data.keys():
            print(data)
            user_id = data['chat_join_request']['user_chat_id']
            chat_id = data['chat_join_request']['chat']['id']

            if user_id in eval(UsersToApprove.objects.get(channel_id=chat_id).users_ids):
                approve_join(chat_id, user_id)
        else:
            print(data)
        return HttpResponse(status=200)
    else:
        return HttpResponse("Start message=)")


def send_message(chat_id, text):
    url = f'https://api.telegram.org/bot{settings.TOKEN}/sendMessage'
    data = {'chat_id': chat_id, 'text': text}
    requests.post(url, data=data)


def start_message(chat_id):
    url = f'https://api.telegram.org/bot{settings.TOKEN}/sendPhoto'

    caption = """🥷🏻 Добро пожаловать!

У нас ты найдешь самые лучшие инфопродукты и складчины крипто тематики. В этом боте мы собрали лучшие материалы по крипте и инвестициям в СНГ: инсайды, клубы, P2P связки, курсы, платная аналитика и прочие источники на которые ежегодно тратится >100.000$.


При возникновении любого вопроса можешь смело писать моему менеджеру  который проведет для тебя полную консультацию.

Мой личный контакт — @cryptoslivmanager"""

    # Кабинет
    # Клубы Курсы

    data = {'chat_id': chat_id, 'photo': 'https://i.ibb.co/vP9Ybtn/main.jpg', 'caption': caption,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Клубы🔒', 'callback_data': 'clubs'},
                     {'text': 'Курсы📚', 'callback_data': 'courses'}],

                    [{'text': 'Кабинет', 'callback_data': 'cabinet'},
                     {'text': 'Поддержка', 'url': 'https://t.me/cryptoslivmanager'},
                     {'text': 'Тест', 'url': 'https://t.me/cryptoslivmanager'}],
                ]})}
    print(requests.post(url, data=data).text)


def cabinet_message(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id, 'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendPhoto"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    caption = """Кабинет"""

    data = {'chat_id': chat_id, 'message_id': message_id, 'caption': caption,
            'photo': 'https://i.ibb.co/JqbcbV9/cabinet.jpg', 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Клубы🔒', 'callback_data': 'my_clubs'},
                     {'text': 'Курсы📚', 'callback_data': 'my_courses'}],

                    [{'text': 'Главное меню', 'callback_data': 'start'},
                     {'text': 'Поддержка', 'url': 'https://t.me/cryptoslivmanager'},
                     {'text': 'Тест', 'url': 'https://t.me/cryptoslivmanager'}],
                ]})}

    print(requests.post(url, data=data).text)


def clubs_message(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id, 'message_id': message_id}
    print(requests.post(url, data=data).text)

    plan = Plan.objects.get(name='Основний')

    lines = split_text_into_lines(plan.description)

    channels = [
        [{'text': 'Курсы📚', 'callback_data': 'courses'},
         {'text': 'Кабинет', 'callback_data': 'cabinet'}],
        [{'text': 'Главное меню', 'callback_data': 'start'},
         {'text': 'Поддержка', 'url': 'https://t.me/cryptoslivmanager'},
         {'text': 'Тест', 'url': 'https://t.me/cryptoslivmanager'}],
    ]

    if lines.__len__() == 1:
        url = f"https://api.telegram.org/bot{settings.TOKEN}/sendPhoto"

        caption = f"""<b>{lines['Line 1']}</b>"""

        data = {'chat_id': chat_id, 'message_id': message_id, 'caption': caption,
                'photo': 'https://i.ibb.co/pwP2DW2/my-clubs.jpg', 'resize_keyboard': True,
                'reply_markup': json.dumps({
                    'inline_keyboard': channels}), 'parse_mode': 'HTML'}
        print(requests.post(url, data=data).text)
    else:
        url = f"https://api.telegram.org/bot{settings.TOKEN}/sendPhoto"

        caption = f"""<b>{lines['Line 1']}</b>"""

        data = {'chat_id': chat_id, 'message_id': message_id, 'caption': caption,
                'photo': 'https://i.ibb.co/pwP2DW2/my-clubs.jpg', 'parse_mode': 'HTML'}
        print(requests.post(url, data=data).text)

        lines.pop('Line 1')

        for encounter in lines.keys():
            if list(lines.keys())[-1] == encounter:
                url = f"https://api.telegram.org/bot{settings.TOKEN}/sendMessage"

                caption = f"""<b>{lines[encounter]}</b>"""

                data = {'chat_id': chat_id, 'message_id': message_id,
                        'text': caption, 'resize_keyboard': True,
                        'reply_markup': json.dumps({
                            'inline_keyboard': channels}), 'parse_mode': 'HTML'}

                print(requests.post(url, data=data).text)
            else:
                url = f"https://api.telegram.org/bot{settings.TOKEN}/sendMessage"

                caption = f"""<b>{lines[encounter]}</b>"""

                data = {'chat_id': chat_id, 'message_id': message_id,
                        'text': caption, 'parse_mode': 'HTML'}

                print(requests.post(url, data=data).text)


def courses_message(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id, 'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendPhoto"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    caption = """"""

    courses = Course.objects.all()

    caption += """""".join([f"""<b>{course.description}</b>\n\n""" for course in courses])

    data = {'chat_id': chat_id, 'caption': caption, 'photo': 'https://i.ibb.co/q56xTg1/courses.jpg',
            'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Клубы🔒', 'callback_data': 'clubs'}, {'text': 'Кабинет', 'callback_data': 'cabinet'}],
                    [{'text': 'Главное меню', 'callback_data': 'start'},
                     {'text': 'Поддержка', 'url': 'https://t.me/cryptoslivmanager'},
                     {'text': 'Тест', 'url': 'https://t.me/cryptoslivmanager'}],
                ]}), 'parse_mode': 'HTML'}
    print(requests.post(url, data=data).text)


# def my_clubs_message(chat_id, message_id):
#     method = "deleteMessage"
#     url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"
#
#     data = {"chat_id": chat_id, 'message_id': message_id}
#     print(requests.post(url, data=data).text)
#
#     plans = Plan.objects.get(name=User.objects.get(user_id=chat_id).plan)
#
#     raw_urls = eval(plans.channels)
#
#     result_dict = {}
#
#     for item in raw_urls:
#         result_dict[item[0]] = item[2]
#
#     lines = split_and_format_data(result_dict)
#
#     channels = [
#         [{'text': 'Курсы📚', 'callback_data': 'my_courses'},
#          {'text': 'Кабинет', 'callback_data': 'cabinet'}],
#         [{'text': 'Главное меню', 'callback_data': 'start'},
#          {'text': 'Поддержка', 'url': 'https://t.me/cryptoslivmanager'},
#          {'text': 'Тест', 'url': 'https://t.me/cryptoslivmanager'}],
#     ]
#
#     if lines.__len__() == 1:
#         url = f"https://api.telegram.org/bot{settings.TOKEN}/sendPhoto"
#
#         caption = f"""<b>{lines['Line 1']}</b>"""
#
#         data = {'chat_id': chat_id, 'message_id': message_id, 'caption': caption,
#                 'photo': 'https://i.ibb.co/pwP2DW2/my-clubs.jpg', 'resize_keyboard': True,
#                 'reply_markup': json.dumps({
#                     'inline_keyboard': channels}), 'parse_mode': 'HTML'}
#         print(requests.post(url, data=data).text)
#     else:
#         url = f"https://api.telegram.org/bot{settings.TOKEN}/sendPhoto"
#
#         caption = f"""<b>{lines['Line 1']}</b>"""
#
#         data = {'chat_id': chat_id, 'message_id': message_id, 'caption': caption,
#                 'photo': 'https://i.ibb.co/pwP2DW2/my-clubs.jpg', 'parse_mode': 'HTML'}
#         print(requests.post(url, data=data).text)
#
#         lines.pop('Line 1')
#
#         for encounter in lines.keys():
#             if list(lines.keys())[-1] == encounter:
#                 url = f"https://api.telegram.org/bot{settings.TOKEN}/sendMessage"
#
#                 caption = f"""<b>{lines[encounter]}</b>"""
#
#                 data = {'chat_id': chat_id, 'message_id': message_id,
#                         'text': caption, 'resize_keyboard': True,
#                         'reply_markup': json.dumps({
#                             'inline_keyboard': channels}), 'parse_mode': 'HTML'}
#
#                 print(requests.post(url, data=data).text)
#             else:
#                 url = f"https://api.telegram.org/bot{settings.TOKEN}/sendMessage"
#
#                 caption = f"""<b>{lines[encounter]}</b>"""
#
#                 data = {'chat_id': chat_id, 'message_id': message_id,
#                         'text': caption, 'parse_mode': 'HTML'}
#
#                 print(requests.post(url, data=data).text)


def my_clubs_message(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id, 'message_id': message_id}
    print(requests.post(url, data=data).text)

    user_active_to = User.objects.get(user_id=chat_id).active_to
    plans = Plan.objects.get(name=int(chat_id))

    raw_urls = eval(plans.channels)

    result_dict = {}

    for item in raw_urls:
        result_dict[item[0]] = item[2]

    # lines = split_and_format_data(result_dict)
    #
    # channels = [
    #     [{'text': 'Курсы📚', 'callback_data': 'my_courses'},
    #      {'text': 'Кабинет', 'callback_data': 'cabinet'}],
    #     [{'text': 'Главное меню', 'callback_data': 'start'},
    #      {'text': 'Поддержка', 'url': 'https://t.me/cryptoslivmanager'},
    #      {'text': 'Тест', 'url': 'https://t.me/cryptoslivmanager'}],
    # ]

    channels = [[{'text': '👉' + channel_name + '👈', 'url': channel_url}] for channel_url, channel_name in
                result_dict.items()]

    for channel in [
        [{'text': 'Курсы📚', 'callback_data': 'my_courses'},
         {'text': 'Кабинет', 'callback_data': 'cabinet'}],
        [{'text': 'Главное меню', 'callback_data': 'start'},
         {'text': 'Поддержка', 'url': 'https://t.me/cryptoslivmanager'},
         {'text': 'Тест', 'url': 'https://t.me/cryptoslivmanager'}],
    ]:
        channels.append(channel)

    url = f"https://api.telegram.org/bot{settings.TOKEN}/sendPhoto"

    caption = f"""<b>Подписка действует до: {user_active_to.strftime('%d.%m.%Y')}</b>"""

    data = {'chat_id': chat_id, 'message_id': message_id, 'caption': caption,
            'photo': 'https://i.ibb.co/pwP2DW2/my-clubs.jpg', 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': channels}), 'parse_mode': 'HTML'}

    print(requests.post(url, data=data).text)


def my_courses_message(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id, 'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendPhoto"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    course = Course.objects.get(name=User.objects.get(user_id=chat_id).course)

    caption = f"""<b>Подписка действует до: {User.objects.get(user_id=chat_id).active_to.strftime('%d.%m.%Y')}</b>"""

    channels = [
        [{'text': '👉' + course[0] + '👈', 'url': course[1]}] for course in eval(course.courses)
    ]

    for channel in [
        [{'text': 'Клубы🔒', 'callback_data': 'my_clubs'}, {'text': 'Кабинет', 'callback_data': 'cabinet'}],
        [{'text': 'Главное меню', 'callback_data': 'start'},
         {'text': 'Поддержка', 'url': 'https://t.me/cryptoslivmanager'},
         {'text': 'Тест', 'url': 'https://t.me/cryptoslivmanager'}],
    ]:
        channels.append(channel)

    data = {'chat_id': chat_id, 'message_id': message_id, 'caption': caption,
            'photo': 'https://i.ibb.co/q56xTg1/courses.jpg',
            'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': channels}), 'parse_mode': 'HTML'}

    print(requests.post(url, data=data).text)


def start_message_callback(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id, 'message_id': message_id}
    print(requests.post(url, data=data).text)

    start_message(chat_id)


# admin panel


def admin_start_message(chat_id, message_id=None):
    if message_id:
        url = f'https://api.telegram.org/bot{settings.TOKEN}/deleteMessage'

        data = {'chat_id': chat_id, 'message_id': message_id}
        print(requests.post(url, data=data).text)

    url = f'https://api.telegram.org/bot{settings.TOKEN}/sendMessage'

    caption = """🥷🏻 Добро пожаловать в админ панель!"""

    data = {'chat_id': chat_id, 'text': caption,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Планы', 'callback_data': 'change_plan'},
                     {'text': 'Курсы📚', 'callback_data': 'change_course'}],
                    [{'text': 'Пользователи', 'callback_data': 'change_user'},
                     {'text': 'Рассылка', 'callback_data': 'mailing'}],
                    [{'text': 'Все пользователи с доступом', 'callback_data': 'all_users'}],
                    [{'text': 'Выйти', 'callback_data': 'start'}],
                ]})}

    print(requests.post(url, data=data).text)


def change_plan(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id, 'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    plans = Plan.objects.all()
    caption = """Введите номер плана:\n\n"""
    caption += """""".join([f"""{i}. {plan.name}\n""" for i, plan in enumerate(plans)])

    data = {'chat_id': chat_id, 'message_id': message_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                                       [{'text': i, 'callback_data': f'plan_{i}'}] for i in range(len(plans))
                                   ] + [[{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def change_course(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id, 'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    courses = Course.objects.all()
    caption = """Введите номер курса:\n\n"""
    caption += """""".join([f"""{i}. {course.name}\n""" for i, course in enumerate(courses)])

    data = {'chat_id': chat_id, 'message_id': message_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [

                                       [{'text': i, 'callback_data': f'course_{i}'}] for i in range(len(courses))
                                   ] + [[{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def what_to_change_in_plan(chat_id, message_id, plan_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id, 'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    plan = Plan.objects.all()[plan_id]

    caption = f"""Выбран план {plan.name}\n\n"""
    caption += f"""Выберите что хотите изменить:"""

    data = {'chat_id': chat_id, 'message_id': message_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Описание', 'callback_data': f'plan_description_{plan_id}'}],
                    [{'text': 'Каналы', 'callback_data': f'plan_channels_{plan_id}'}],
                    [{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def what_to_change_in_course(chat_id, message_id, course_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id, 'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    course = Course.objects.all()[course_id]

    caption = f"""Выбран курс {course.name}\n\n"""
    caption += f"""Выберите что хотите изменить:"""

    data = {'chat_id': chat_id, 'message_id': message_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Описание', 'callback_data': f'course_description_{course_id}'}],
                    [{'text': 'Курсы📚', 'callback_data': f'course_courses_{course_id}'}],
                    [{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def change_name(chat_id, message_id, name=None):
    url = f'https://api.telegram.org/bot{settings.TOKEN}/deleteMessage'

    data = {'chat_id': chat_id, 'message_id': message_id}

    print(requests.post(url, data=data).text)

    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"
    if name is None:
        caption = """Введите новый вариант:"""
    else:
        caption = f"""Введите новый вариант 
{name}:"""

    data = {'chat_id': chat_id, 'message_id': message_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def successful_edit(chat_id, name):
    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    caption = f"""Успешно изменено на {name}"""

    data = {'chat_id': chat_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def split_and_format_data(data, max_chars=1000):
    lines = list()
    current_line = f"Line 1\n"
    current_length = 0

    for url, title in data.items():
        entry = f"▪️{title}\n{url}\n\n"

        if current_length + len(entry) <= max_chars:
            current_line += entry
            current_length += len(entry)
        else:
            lines.append(current_line.strip())
            current_line = f"Line {len(lines) + 1}\n" + entry
            current_length = len(entry)

    lines.append(current_line.strip())
    result_lines_dict = {}
    for line in lines:
        result_lines_dict[line[:6]] = '▪️' + line[8:]
    return result_lines_dict


def free_clubs_message(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id,
            'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendPhoto"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    caption = """<b>🏴‍☠️ | В этом разделе</b> ты найдешь ссылки на все доступные тебе клубы. Напомню — у телеги стоит спам ограничение в 5 вступлений каждые 5-10 минут."""

    data = {'chat_id': chat_id, 'message_id': message_id, 'caption': caption,
            'photo': 'https://i.ibb.co/pwP2DW2/my-clubs.jpg',
            'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Курсы📚', 'callback_data': 'my_courses'},
                     {'text': 'Кабинет', 'callback_data': 'cabinet'}],
                    [{'text': 'Главное меню', 'callback_data': 'start'},
                     {'text': 'Поддержка', 'url': 'https://t.me/cryptoslivmanager'},
                     {'text': 'Тест', 'url': 'https://t.me/cryptoslivmanager'}],
                ]}), 'parse_mode': 'HTML'}

    print(requests.post(url, data=data).text)


def free_courses_message(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id,
            'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendPhoto"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    caption = """<b>🏴‍☠️ | В этом разделе</b> ты найдешь ссылки на все доступные тебе курсы. Напомню — у телеги стоит спам ограничение в 5 вступлений каждые 5-10 минут."""

    data = {'chat_id': chat_id, 'message_id': message_id, 'caption': caption,
            'photo': 'https://i.ibb.co/q56xTg1/courses.jpg',
            'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Клубы🔒', 'callback_data': 'my_clubs'},
                     {'text': 'Кабинет', 'callback_data': 'cabinet'}],
                    [{'text': 'Главное меню', 'callback_data': 'start'},
                     {'text': 'Поддержка', 'url': 'https://t.me/cryptoslivmanager'},
                     {'text': 'Тест', 'url': 'https://t.me/cryptoslivmanager'}],
                ]}), 'parse_mode': 'HTML'}

    print(requests.post(url, data=data).text)


def change_user(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id,
            'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    caption = """Введите id пользователя:"""

    data = {'chat_id': chat_id, 'message_id': message_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def edit_active_to(chat_id):
    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    caption = """Введите новое время активности пользователя:"""

    data = {'chat_id': chat_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def get_channel_id(chat_id):
    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    caption = """Введите id канала:"""

    data = {'chat_id': chat_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def split_text_into_lines(text, max_chars=1000):
    lines = text.split('\n')
    result_dict = {}
    current_line = ""

    for line in lines:
        if len(current_line + line) <= max_chars:
            current_line += line + "\n"
        else:
            key = f"Line {len(result_dict) + 1}"
            result_dict[key] = current_line
            current_line = line + "\n"

    if current_line:  # Add remaining characters if any
        key = f"Line {len(result_dict) + 1}"
        result_dict[key] = current_line

    return result_dict


def all_users(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id,
            'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"
    # all users with access and active_to date is not None and not in the past
    users = User.objects.filter(active_to__isnull=False, active_to__gte=datetime.now())
    print(users)
    caption = """Все пользователи с доступом:\n\n"""
    caption += """""".join(
        [f"""{i + 1}. {user.user_id} до {user.active_to.strftime('%d.%m.%Y')}\n""" for i, user in enumerate(users)])

    data = {'chat_id': chat_id, 'message_id': message_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [[{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def mailing(chat_id, message_id):
    method = "deleteMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {"chat_id": chat_id,
            'message_id': message_id}
    print(requests.post(url, data=data).text)

    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    caption = """Введите текст рассылки:"""

    data = {'chat_id': chat_id, 'message_id': message_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [[{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def successful_mailing(chat_id):
    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    caption = f"""Рассылка успешно отправлена"""

    data = {'chat_id': chat_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': [
                    [{'text': 'Главное меню', 'callback_data': 'admin'}]]})}

    print(requests.post(url, data=data).text)


def choose_channels_for_plan(chat_id, message_id, caption="Выберите каналы для плана:"):

    url = f'https://api.telegram.org/bot{settings.TOKEN}/deleteMessage'

    data = {'chat_id': chat_id, 'message_id': message_id}

    print(requests.post(url, data=data).text)


    raw_channels = Plan.objects.get(name='Основний').channels
    channels = {item[0]: {'id': item[1], 'name': item[2]} for item in eval(raw_channels)}

    channel_buttons = []

    for channel_url in channels:
        channel_buttons.append([{'text': channels[channel_url]['name'],
                                 'callback_data': 'add_to_' + '_' + str(channels[channel_url]['id'])}])
    channel_buttons.append([{'text': 'Все', 'callback_data': 'all_channels'}])
    channel_buttons.append([{'text': 'Главное меню', 'callback_data': 'admin'}])
    channel_buttons.append([{'text': 'Сохранить', 'callback_data': 'save_plan'}])

    method = "sendMessage"
    url = f"https://api.telegram.org/bot{settings.TOKEN}/{method}"

    data = {'chat_id': chat_id, 'text': caption, 'resize_keyboard': True,
            'reply_markup': json.dumps({
                'inline_keyboard': channel_buttons})}

    print(requests.post(url, data=data).text)


def all_channels(chat_id, message_id):
    url = f'https://api.telegram.org/bot{settings.TOKEN}/deleteMessage'

    data = {'chat_id': chat_id, 'message_id': message_id}

    print(requests.post(url, data=data).text)

    unban_user_from_channels(get_user_name)

    channels = eval(Plan.objects.get(name='Основний').channels)

    approves = UsersToApprove.objects.all()

    for approve in approves:
        approve.users_ids = str(eval(approve.users_ids) + [get_user_name])
        approve.save()

    Plan.objects.create(name=str(get_user_name), channels=channels, description=f'Личный план id: {get_user_name}')

    user = User.objects.get(user_id=get_user_name)

    user.plan = str(get_user_name)
    user.course = "Основний"
    user.save()

    send_message(chat_id, 'План успешно сохранен')


def approve_join(chat_id, user_id):
    url = f'https://api.telegram.org/bot{settings.TOKEN}/approveChatJoinRequest'

    data = {'chat_id': chat_id, 'user_id': user_id}

    print(requests.post(url, data=data).text)
