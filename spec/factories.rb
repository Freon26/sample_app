FactoryGirl.define do 
	factory :user do
		name					"Steven Tapican"
		email					"stapican@example.com"
		password 				"foobar"
		password_confirmation	"foobar"
	end
end