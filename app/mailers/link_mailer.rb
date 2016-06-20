class LinkMailer < ActionMailer::Base
	default from: "o0rnixsz@gmail.com"
	layout false
	def download_link(link)
		@link = link
		@product = link.product
		mail(to: link.email,subject:"Descarga los productos que adqueriste en Namakaloyan.com")
		
	end

end