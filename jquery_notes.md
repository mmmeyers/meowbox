1. Must render at least one index page (index resource - 'list of things') via jQuery and an Active Model Serialization JSON Backend. For example, in a blog domain with users and posts, you might display the index of the users posts on the users show page, fetching the posts via an AJAX GET request, with the backend rendering the posts in JSON format, and then appending the posts to the page.

  - Display the description for each subscription on the subscriptions index page.
  - Add functionality to hide description upon clicking the button again.
  - I want to go to a user show page as an admin and be able to click a button to see all of the boxes.

2. Must render at least one show page (show resource - 'one specific thing') via jQuery and an Active Model Serialization JSON Backend. For example, in the blog domain, you might allow a user to sift through the posts by clicking a 'Next' button on the posts show page, with the next post being fetched and rendered via JQuery/AJAX.

  - Display boxes paginated, and you can click on the page number or previous/next without page refresh.

3. The rails API must reveal at least one has-many relationship in the JSON that is then rendered to the page. For example if each of those posts has many comments, you could render those comments as well on that show page.

  - Display the boxes for each subscription level.
  - kitten = Subscription.first
  - kitten.boxes

4. Must use your Rails API and a form to create a resource and render the response without a page refresh. For example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM.

5. Must translate the JSON responses into Javascript Model Objects. The Model Objects must have at least one method on the prototype. Formatters work really well for this. Borrowing from the previous example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.


<%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
<%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
