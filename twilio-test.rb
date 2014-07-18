require 'twilio-ruby'


# put your own credentials here 
account_sid = 'ACe64ef03366d02dab54a00906e91c73c2' 
auth_token = '65f71c1911468212140ef06343fd7985' 
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
@client.account.messages.create({
	:from => '+441539234045', 
	:to => '+447852349285',
	:body => 'Hey there this was sent by the computer @ #{Time.now}'   
})