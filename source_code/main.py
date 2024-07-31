import subprocess as sp
import pymysql
import pymysql.cursors

def print_result(cur):
    data = cur.fetchall()
    if len(data) == 0 :
        print("No Result")
        return
    for l in list(data[0].keys()): 
        print (l, end="\t")
    print()
    for d in data:
        for l in list(d.values()) :
            print (l, end="\t")
        print()


def option1():      
    try:
        name_value = input("Enter Name: ")
        gender_value = input("Enter Gender: ")
        preferred_gender_value = input("Enter Preferred Gender: ")
        age_value = int(input("Enter Age: "))
        phone_num_value = input("Enter Phone Number: ")
        language_value = input("Enter Language: ")
        state_value = input("Enter State: ")

        # Create the formatted SQL query
        sql_query = f"insert into user(name,gender,preffered_gender,age,phone_num,language,state) values('{name_value}','{gender_value}','{preferred_gender_value}','{age_value}','{phone_num_value}','{language_value}','{state_value}');"

        # Print the SQL query
        # print("Generated SQL Query:")
        # print(sql_query)

        cur.execute(sql_query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)

    return


def option2():

    try:
    # Take input for variables
        id1_value = int(input("Enter ID1: "))
        id2_value = int(input("Enter ID2: "))

        # Create the formatted SQL query
        sql_query_conversation = f"INSERT INTO conversation(user1_id,user2_id) VALUES ({id1_value}, {id2_value});"
        sql_query_conversation2 = f"INSERT INTO conversation2 VALUES ({id1_value}, {id2_value}, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());"

        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        cur.execute(sql_query_conversation2)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)

    return



def option3():
    try:
    # Take input for variables
        c1 = int(input("Enter change in 'Sporty': "))
        c2 = int(input("Enter change in 'Academic': "))
        c3 = int(input("Enter change in 'Extroverted': "))
        id1 = int(input("Enter ID1: "))
        id2 = int(input("Enter ID2: "))

        # Create the formatted SQL query
        sql_query_conversation = f"update rating set change1={c1},change2={c2},change3={c3} where user1_id={id1} and user2_id={id2};"


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)

    return


def option4():
    try:
    # Take input for variables
        id1 = int(input("Enter ID1: "))
        id2 = int(input("Enter ID2: "))
        message = input("Enter message: ")

        # Create the formatted SQL query
        sql_query_conversation = f"update conversation2 set most_recent_ts=(SELECT CURRENT_TIMESTAMP()) where (user1_id = {id1} and user2_id = {id2}) or (user1_id = {id2} and user2_id = {id1});"
        sql_query_conversation2 = f"insert into message values({id1}, CURRENT_TIMESTAMP(), (select id from conversation where (user1_id = {id1} and user2_id = {id2}) or (user1_id = {id2} and user2_id = {id1})), '{message}')"


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        cur.execute(sql_query_conversation2)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)

    return


def option5():
    try:
    # Take input for variables

        id = int(input("Enter ID: "))

        # Create the formatted SQL query
        sql_query_conversation = f"delete from user where id = {id};"


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)


def option6():
    try:
    # Take input for variables
        link = input("Enter Link: ")

        # Create the formatted SQL query
        sql_query_conversation = f"delete from user_photo where link = '{link}';"


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)

    return


def option7():
    try:
    # Take input for variables

        # Create the formatted SQL query
        sql_query_conversation = f"select * from user where id in (select sender_id from message group by sender_id having count(sender_id)>1); "


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()
        print_result(cur)

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)

    return


def option8():
    try:
    # Take input for variables
        id = int(input("Enter ID: "))

        # Create the formatted SQL query
        sql_query_conversation = f"select * from rating where user1_id={id}; "


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()
        print_result(cur)

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)

    return


def option9():
    try:
    # Take input for variables

        # Create the formatted SQL query
        sql_query_conversation = f"select distinct(Name) from user, conversation2  where date(start_ts)=(SELECT CURRENT_DATE()) and (user.id=conversation2.user1_id or user.id=conversation2.user2_id); "


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()
        print_result(cur)

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)

    return


def option10():
    try:
    # Take input for variables
        id = int(input("Enter ID: "))

        # Create the formatted SQL query
        sql_query_conversation = f"select start_ts from conversation2 where user1_id={id} or user2_id={id}; "


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()
        print_result(cur)

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)


def option11():
    try:
    # Take input for variables
        id = int(input("Enter ID: "))

        # Create the formatted SQL query
        sql_query_conversation = f"select count(sender_id) as messages_sent from message where sender_id={id};"


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()
        print_result(cur)

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)


def option12():
    try:
    # Take input for variables
        id = int(input("Enter ID: "))

        # Create the formatted SQL query
        sql_query_conversation = f"select ((value1+value2+value3)/3) as avg from parameters where user_id = {id} and isTarget = 0;"


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()
        print_result(cur)

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)


def option13():
    try:
    # Take input for variables

        # Create the formatted SQL query
        sql_query_conversation = f'select * from message where content like "%how you doing%";'


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()
        print_result(cur)

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)


def option14():
    try:
    # Take input for variables

        # Create the formatted SQL query
        sql_query_conversation = f"select AVG(c.cnt) from  \
    (select us.id, COUNT(*) as cnt from  \
        (select u.id from user as u, parameters as p where p.isTarget = 0 and u.id = p.user_id and p.value3 > 60)us \
        , message \
        where sender_id= us.id\
        group by us.id)c;"


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()
        print_result(cur)

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)


def option15():
    try:
    # Take input for variables

        # Create the formatted SQL query
        sql_query_conversation = f"select count(*) as number_of_users from (select user.id from user join user_location_rated on user.id=user_location_rated.user_id group by user.id having avg(user_location_rated.rating) > 50) ct;"


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()
        print_result(cur)

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)


def option16():
    try:
    # Take input for variables

        # Create the formatted SQL query
        sql_query_conversation = f"select b.cnt as max_matches from \
    (select us.id, COUNT(*) as cnt from \
        (select user.id from user,message where user.id=sender_id group by sender_id having count(sender_id)>1) us\
        ,  user_matched where us.id = user_matched.user1_id or us.id = user_matched.user2_id\
        group by us.id\
        order by cnt DESC\
        limit 1)b;"


        # Print the SQL query
        # print("Generated SQL Query for Conversation:")
        # print(sql_query_conversation)

        cur.execute(sql_query_conversation)
        con.commit()
        print_result(cur)

    except Exception as e:
        con.rollback()
        print("Error in operation")
        print(">>>>>>>>>>>>>", e)




def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """
    if ch == 1:
        option1()
    elif ch == 2:
        option2()
    elif ch == 3:
        option3()
    elif ch == 4:
        option4()
    elif ch == 5:
        option5()
    elif ch == 6:
        option6()
    elif ch == 7:
        option7()
    elif ch == 8:
        option8()
    elif ch == 9:
        option9()
    elif ch == 10:
        option10()
    elif ch == 11:
        option11()
    elif ch == 12:
        option12()
    elif ch == 13:
        option13()
    elif ch == 14:
        option14()
    elif ch == 15:
        option15()
    elif ch == 16:
        option16()
    else:
        print("Error: Invalid Option")



# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    # username = input("Username: ")
    # password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=30306,
                              user="myadmin",
                              password="Password@123",
                              db='INTERCOURSES',
                              unix_socket="/var/run/mysqld/mysqld.sock",
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                
                print("1. INSERT a new USER and its details ")  # INSERT a new USER and its details tuple whenever a new USER registers
                print("2. INSERT a new CONVERSATION and its details ")  # INSERT a new CONVERSATION and its details tuple whenever a CONVERSATION is started 
                print("3. UPDATE a USER’s RATINGS")  # UPDATE a USER’s RATINGS based on other USERS suggest
                print("4. UPDATE the CONVERSATION whenever a new message is sent")  # UPDATE the CONVERSATION whenever a new message is sent between two users.
                print("5. DELETE a USERs details")  # DELETE a USERs details and their CONVERSATIONs if they delete their account.
                print("6. DELETE a USER PHOTO")  # DELETE a USER PHOTO if they decide to remove it
                print("7. List all the details of USERs that have sent more than 1 MESSAGE.")  # List all the details of USERs that have sent more than 100 MESSAGEs.
                print("8. List all the details of RATINGS by a given USER.")  # List all the details of RATINGS by a given USER.
                print("9. Show the name of all the USERS that have started CONVERSATIONS today.")  # Show the name of all the USERS that have started CONVERSATIONS in the last 24 hours
                print("10. Show the start times of all CONVERSATIONS of a given USER.") # Show the start times of all CONVERSATIONS of a given USER
                print("11. Find the COUNT of number of MESSAGES sent by a USER.") # Find the COUNT of number of MESSAGES sent by a USER.
                print("12. Find the AVG of PARAMETERS for a USER.") # Find the AVG of PARAMETERS for a USER
                print("13. SEARCH for all MESSAGEs that contain the phrase 'how you doing'.") # SEARCH for all MESSAGEs that contain the phrase ’how you do-ing’.
                print("14. Find the AVG number messages sent by USERs who have a high value(>60) for the 'Extroverted' PARAMATER.") # Find the AVG number messages sent by USERs who have a high value(>0.7) for the ’Extroverted’ PARAMATER.
                print("15. Find the COUNT of USERS that give AVG rating greater than 50 .") # Find the COUNT of USERS that give AVG rating greater than 0.5
                print("16. Find the MAX number of matches for a user that has more than 2 MESSAGEs sent.") #  Find the MAX number of matches for a user that has more than 1000 MESSAGEs sent.
                
                print("17. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 17:
                     exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")