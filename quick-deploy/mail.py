from email.message import EmailMessage
import ssl
import smtplib
import datetime


def read_mail_list():
    # Create mail.txt // test1@gmail.com line by line
    with open('mail.txt') as read:
        lines = read.readlines()
        read.close()
        return [line.strip() for line in lines]


class MailSend:
    def __init__(self, email_sender, email_password):
        self.email_sender = email_sender
        self.email_password = email_password
        self.context = ssl.create_default_context()

    def send_email(self, email_receiver, subject, body, attachment_path=None):
        em = EmailMessage()
        em['From'] = self.email_sender
        em['To'] = email_receiver
        em['Subject'] = subject
        em.set_content(body)

        if attachment_path:
            with open(attachment_path, 'rb') as attachment_file:
                attachment_data = attachment_file.read()
                attachment_name = attachment_path.split('/')[-1]
                em.add_attachment(attachment_data, maintype='application', subtype='xlsx', filename=attachment_name)

        with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=self.context) as smtp:
            smtp.login(self.email_sender, self.email_password)
            smtp.sendmail(self.email_sender, email_receiver, em.as_bytes())


if __name__ == "__main__":
    email_sender = 'test@gmail.com'  # Main Gmail Account
    email_password = 'pass'  # Google  https://myaccount.google.com/apppasswords Password
    # email_receiver = 'receiver@gmail.com'  # Manual Example
    current_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    subject = f"{current_time} Report"
    body = "Latest Report in Attachment"
    attachment_path = 'combined_data.xlsx'  # Dosya ismi

    mail_list = read_mail_list()  # Array
    mailer = MailSend(email_sender, email_password)
    for i in mail_list:
        mailer.send_email(i, subject, body, attachment_path)
        print(i, " Has been sent")

"""
    mailer = MailSend(email_sender, email_password)
    mailer.send_email(email_receiver, subject, body, attachment_path)
"""
