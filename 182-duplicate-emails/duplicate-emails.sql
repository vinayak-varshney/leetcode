Select email as Email
from Person
Group By email
Having count(email)>1 