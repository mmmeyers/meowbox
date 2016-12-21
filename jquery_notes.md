1. (DONE) Must render at least one index page (index resource - 'list of things') via jQuery and an Active Model Serialization JSON Backend. For example, in a blog domain with users and posts, you might display the index of the users posts on the users show page, fetching the posts via an AJAX GET request, with the backend rendering the posts in JSON format, and then appending the posts to the page.

  - Display the index page for subscriptions when clicking the link.(DONE)
  - When on the box show page, you can click on item details and ajax will display the item index page for that box without page refresh (DONE)
  - User can see paginated index of boxes and click previous/next/pg number without reloading the page or going to a new page. (DONE)

2. Must render at least one show page (show resource - 'one specific thing') via jQuery and an Active Model Serialization JSON Backend. For example, in the blog domain, you might allow a user to sift through the posts by clicking a 'Next' button on the posts show page, with the next post being fetched and rendered via JQuery/AJAX.

  - User 'quick view'


3. (DONE) The rails API must reveal at least one has-many relationship in the JSON that is then rendered to the page. For example if each of those posts has many comments, you could render those comments as well on that show page.

  - Box has many Items - on the box show page, the item details are rendered (items index) (DONE)

4. (DONE) Must use your Rails API and a form to create a resource and render the response without a page refresh. For example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM.

  - Admin can add an item to a box. The item is serialized and submitted via an AJAX POST request which is appended to the DOM. (DONE)

5. (DONE) Must translate the JSON responses into Javascript Model Objects. The Model Objects must have at least one method on the prototype. Formatters work really well for this. Borrowing from the previous example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.

  - For user quick view, used a concatenation method for user's first and last name.
  - On the subscriptions index page, concatenated subscription level and description.



this is what the item data looks like:

data = {
 'authenticity_token': $("input[name='authenticity_token']").val(),
    'item': {
       'title': $("#item_title").val(),
       'description': $("#item_description").val(),
       'size': $("#item_size").val(),
       'url': $("#item_url").val()
     }
   }
