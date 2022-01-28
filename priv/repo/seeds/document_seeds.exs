alias ProjectManagement.Repo
alias ProjectManagement.Management.Decument

# Repo.insert! %Decument{
#   name: "first Document",
#   content: "We Have a list of bunch of stuff",
#   view_content: 1,
#   published: true,
#   project_id: 1
# }

Repo.insert! %Decument{
  name: "Second Document",
  content: "We have list of Second Document",
  view_content: 2,
  published: false,
  project_id: 1
}
Repo.insert! %Decument{
  name: "thirld Document",
  content: "We have list of thirld document",
  view_content: 23,
  published: true,
  project_id: 2
}
Repo.insert! %Decument{
  name: "Hello document",
  content: "We have a list of Hello World Document",
  view_content: 24,
  published: true,
  project_id: 3
}
