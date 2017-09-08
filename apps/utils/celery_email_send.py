from celery.decorators import task  
from celery.utils.log import get_task_logger  
logger = get_task_logger(__name__) 
from email_send import *
logger = get_task_logger(__name__)



@task(name="send_feedback_email_task")
def send_feedback_email_task(email, send_type='register'):
    send_register_email(email,send_type)
    return "%s email sent OK" % (email)

