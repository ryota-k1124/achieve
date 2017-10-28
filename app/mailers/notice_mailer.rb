class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  #def sendmail_blog
  # 引数としてblogを追加します。
  def sendmail_blog(blog)
    @greeting = "Hi"
    @blog = blog

    #mail to: "ryota-k@nttpc.co.jp"
    mail to: "tgikyhuj@icloud.com"
    mail subject: '【Achieve】ブログが投稿されました'
  end

  # 引数としてblogを追加します。
  def sendmail_contact(contact)
    @greeting = "Hi"
    @contact = contact

    #mail to: "ryota-k@nttpc.co.jp"
    mail to: @contact.email,
    subject: '【Achieve】お問い合わせを受け付けました'
  end
end
