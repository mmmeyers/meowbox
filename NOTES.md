Business objective:
- Create “Meowbox” - a website where people can sign up for a monthly subscription for toys and treats for their favorite feline!

VISITOR (DONE)
- See a list of monthly subscriptions (three subscription levels hard coded - $10/mo, $30/mo and $100/mo)
- Learn more about a particular description so I can decide whether or not it’s worth buying (detail page for subscription)
- Purchase a subscription (don’t worry about processing payments - just ask for first name, last name and email)

SUBSCRIBER
- Cancel my subscription at any time so I don’t have to pay forever
- See what boxes I have received and what each one contained so I can remember what stuff I got and where I could get more of it (this will require login including support for “forgotten password” as users who initially sign up won’t have a password, so they’ll need to have a link emailed to them to update it.: boxes INDEX page with links to each SHOW page

ADMINISTRATOR
- Create a new box (subscription level, month and year to uniquely identify it and a title for the theme e.g. “cat coolers for summer”)
- Add a new item to a box (title, description, image, size, URL to buy more from amazon or other partners)
- Manually ship a box (when I click the “ship” button on the box it adds it to the history for all current subscribers - but not subscribers who have cancelled)


class User < ActiveRecord::Base
  belongs_to :subscription

  def boxes
    self.subscription.boxes#.where(sent: true)
  end



end

user = User.Create
user.boxes[1].items

MODELS
- User
  - belongs to subscription
  - has many boxes (as subscriber)
  - has_secure_password
- Subscription
  - has_many users
  - has_many boxes
- Box
  - belongs to a subscription
  - has many items
- Item
  - belongs to a box

  MIGRATIONS
  - User
    - username
    - email
    - first_name
    - last_name
    - subscription_id

  - Subscription
    - type

  - Box
    - title
    - subscription_id
    - month and year
    - shipped

  - Item
    - title
    - description
    - image
    - size
    - URL
    - box_id

To get all the user's items, can we just run user.boxes.each do |box| and then for each box, list its items.

Remember that the ability to perform the admin tasks should be limited to administrative users, not just logged in users.

*** DOING TODAY 9/1:

To meet the nested form and custom attribute writer you should be able to add up to three items to the box as part of creating the box, and if their title matches exactly an existing item, it should not create a new item, it should just join the box to an existing item. The size of the item should be stored in a join table joining the boxes and the items so one box may have the 3 oz kitty bright hair gel and another might have the 6oz.

To meet the nested resource requirements /boxes/1/items should show all of the items in box #1 to anyone who wants to see it (DONE)

and boxes/1/items/new should allow an administrator to add a new item to a box.

/items/new should also allow an admin to add a new item to a box, but they'll have to select from a drop down list of boxes


---

1. What is the root route? - 'subscriptions#index'
  - A visitor can see the list of available subscriptions as well as click on the links to see each individual one, and they can subscribe using the link (which also creates a new user).

2. When a user signs up or logs in, they are taken to the subscriptions index page where they can see each individual item and then subscribe.

3. Add roles to user class. (DONE)

4. We want to list on the subscriptions index page the 3 types of subscriptions available, along with links to each of their show pages. The visitor should be able to see this page, along with the show pages as well. Subscriptions are hard-coded. - DONE - Anyone can access the subscriptions page at this point and link to each level's show page. (DONE)

5. When a user signs up, they become a subscriber instead of just a visitor so we need to change their role. (DONE)

6. Subscriber can cancel their account (DONE)

7. Subscriber should be able to see which boxes they have already gotten. How do we assign a user to a box?

8. Add a new item to a box (admin only) box << item (DONE)
