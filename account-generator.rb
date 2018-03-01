num_students = 2
email_domain = "@mycoolemail.com"

def accountGenerator(num_students, email_domain)
  student_data = []
  num_students.times do
    print "Enter first and last name > "
    full_name = gets.chomp.upcase
    if !(full_name =~ /[A-Z]+\s([A-Z]+\s)?[A-Z]+/)
      print 'Error. Please enter a valid name.'
      return
    end

    rand_ID = rand(111111..999999)
    # Ensure that we did not generate an ID that already exists
    exists = true
    while exists
      exists = false
      student_data.each do |student|
        if student["id"] == rand_ID
          exists = true
        end
      end

      if exists
        rand_ID = rand(111111..999999)
      end
    end

    name_split = full_name.split(" ")

    first_initial = name_split[0][0]
    if (name_split.length == 2)
      middle_name = ""
      last_name = name_split[1]
    else
      middle_name = name_split[1][0]
      last_name = name_split[2]
    end

    name_for_email = first_initial + middle_name + last_name

    # get the student id. convert the last 3 digits to string
    three_digit_ID = rand_ID.to_s[-3..-1]

    email = name_for_email + three_digit_ID + "@" + email_domain

    student_data.push({
        "name" => full_name,
        "id" => rand_ID,
        "email" => email
    })
  end

  return student_data
end

def print_students(students)
  students.each do |student|
    puts student["name"] + " " + student["id"].to_s + " " + student["email"]
  end
end

students = accountGenerator(num_students, email_domain)
print_students(students)
