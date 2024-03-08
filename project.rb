rails generate migration AddFieldsToEmployees field_of_study:string
university:string 
graduation_year:integer 
gpa:float 
additional_degrees:string
educational_history:text
birthdate:date
address:string
phone_number:string
gender:string
marital_status:string
nationality:string
emergency_contact:string
emergency_contact_relationship:string


<%= render 'employees/educational_form', employee: @employee %>
<%= render 'employees/personal_form', employee: @employee %>