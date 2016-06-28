require 'raspell'

def get_password_strenght(password)
    reduced_password = reduce_password(password)
    representative_characters_count = get_representative_character_count(reduced_password)
    strenght = representative_characters_count * reduced_password.size
    if(strenght <= 10) 
    	"Unacceptable"
    elsif (strenght < 50)
        "Week"
    else
        "Strong"
    end
end


print get_password_strenght(password)
