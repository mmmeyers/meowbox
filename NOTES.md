Business objective:
- Create “Meowbox” - a website where people can sign up for a monthly subscription for toys and treats for their favorite feline!

VISITOR
- See a list of monthly subscriptions (three subscription levels hard coded - $10/mo, $30/mo and $100/mo): subscriptions INDEX page
- Learn more about a particular description so I can decide whether or not it’s worth buying (detail page for subscription): subscriptions SHOW pages
- Purchase a subscription (don’t worry about processing payments - just ask for first name, last name and email): NEW subscriptions form

SUBSCRIBER
- Cancel my subscription at any time so I don’t have to pay for ever: subscriptions DESTROY form (use dependent: :destroy for user)
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

To meet the nested form and custom attribute writer you should be able to add up to three items to the box as part of creating the box, and if their title matches exactly an existing item, it should not create a new item, it should just join the box to an existing item. The quantity of the item should be stored in a join table joining the boxes and the items so one box may have the 3 oz kitty bright hair gel and another might have the 6oz.

To meet the nested resource requirements /boxes/1/items should show all of the items in box #1 to anyone who wants to see it and boxes/1/items/new should allow an administrator to add a new item to a box.

/items/new should also allow an admin to add a new item to a box, but they'll have to select from a drop down list of boxes


---

1. What is the root route? - 'welcome#home'
  - need to make a welcome controller (acts like a static controller)
  - need to make a view that links to sign up or log in

2. When a user signs up, they are taken from the root page to a sign up page.
  - after they sign up, where do they go? - probably want them to see all subscriptions available, so to a subscriptions index page

3. When a user logs in, they are taken from the root page to a login page.
  - after they log in, where do they go? - probably want them to see a personalized page that shows them their current subscription. Currently they go to the home page. Maybe do an <%= if logged_in? %>

3. Add roles to user class.

To work on tomorrow:
1. Be able to sign up and see all subscriptions available.
2. Be able to log in and see profile page (user show page)
