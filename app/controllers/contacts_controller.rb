class ContactsController < ApplicationController
    def new
        if params[:back]
            @contact = Contact.new(contact_params)
        else
            @contact = Contact.new
        end
    end
    
    def create
        #Contact.create(contact_params)
        @contact = Contact.new(contact_params)
        if @contact.save
            #redirect_to new_contact_path, notice: "お問い合わせを受けつけました"
            redirect_to root_path, notice: "お問い合わせを受けつけました"
        else
            render "new"
        end
        
    end
    
    def confirm
        @contact = Contact.new(contact_params)
        render :new if @contact.invalid?
    end

## ストロングパラメータ
## paramsメソッドにて取得した値の内、blogのtitleとcontentだけ取り込み
  private
   def contact_params
      params.require(:contact).permit(:name, :email, :content)
   end
end
