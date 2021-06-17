alias PumpkinAssignmentElixir.{Users, Images}

# User Creation
{:ok, normal_user} =
  Users.create_user(%{
    name: "Mukesh",
    email: "mukesh@gmail.com",
    type: "NU",
    password: "welcome"
  })

{:ok, contributor} =
  Users.create_user(%{
    name: "Harish",
    email: "harish@gmail.com",
    type: "C",
    password: "welcome"
  })

# Images Creation
Images.create_image(%{
  name: "img1",
  total_downloads: 5,
  image_binary: "",
  user_id: contributor.id
})

Images.create_image(%{
  name: "img2",
  total_downloads: 5,
  image_binary: "",
  user_id: contributor.id
})

Images.create_image(%{
  name: "img3",
  total_downloads: 5,
  image_binary: "",
  user_id: contributor.id
})

Images.create_image(%{
  name: "img4",
  total_downloads: 5,
  image_binary: "",
  user_id: contributor.id
})
