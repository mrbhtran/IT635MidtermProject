import psycopg2

conn = psycopg2.connect("postgresql://company_resources:testing@localhost/company_resources")
cur = conn.cursor()

print("Please enter an application ID")
application_id = int(input())
cur.execute("""
    SELECT employees.name, employees.email, servers.name, applications.employee_id, applications.name
    FROM applications, employees, servers
    WHERE applications.employee_id=employees.employee_id
        AND applications.application_id=servers.application_id
        AND applications.application_id=%s
""", (application_id,));
for row in cur:
    employee = row[0]
    employee_email = row[1]
    server = row[2]
    application = row[4]
    print(f"{employee} message at {employee_email}")
print(f"The app: {row[4]} which runs on the server: {row[2]}, please contact {row[0]} ")

cur.close()
conn.close()