<div class="col-md-12 col-xl-12">
<div class="markdown-body">
<p class="text-muted m-b-15">
</p><h1>My Users App</h1>
<p>Remember to git add &amp;&amp; git commit &amp;&amp; git push each exercise!</p>
<p>We will execute your function with our test(s), please DO NOT PROVIDE ANY TEST(S) in your file</p>
<p>For each exercise, you will have to create a folder and in this folder, you will have additional files that contain your work. Folder names are provided at the beginning of each exercise under <code>submit directory</code> and specific file names for each exercise are also provided at the beginning of each exercise under <code>submit file(s)</code>.</p>
<hr>
<table>
<thead>
<tr>
<th>My Users App</th>
<th></th>
</tr>
</thead>
<tbody>
<tr>
<td>Submit directory</td>
<td>.</td>
</tr>
<tr>
<td>Submit files</td>
<td>my_user_model.rb - app.rb - views/ - index.html</td>
</tr>
</tbody>
</table>
<h3>Description</h3>
<p>In this project we will implement a very famous architecture: MVC (Model View Controller).</p>
<h1>Part I</h1>
<p>Create a <code>class</code> <code>User</code>, it will be your interface in order to</p>
<ul>
<li>
<code>create</code> user</li>
<li>
<code>find</code> user</li>
<li>get <code>all</code> users</li>
<li>
<code>update</code> user</li>
<li>
<code>destroy</code> user
in sqlite.</li>
</ul>
<p>You will use the gem <code>sqlite3</code>.
The sqlite filename will be named <code>db.sql</code>.</p>
<p>Your table will be name <code>users</code> and will have multiple attributes:</p>
<ul>
<li>
<code>firstname</code> as <code>string</code>
</li>
<li>
<code>lastname</code> as <code>string</code>
</li>
<li>
<code>age</code> as <code>integer</code>
</li>
<li>
<code>password</code> as <code>string</code>
</li>
<li>
<code>email</code> as <code>string</code>
</li>
</ul>
<p>Your class will have the following methods:</p>
<ul>
<li>
<p><code>def create(user_info)</code>
It will create a user. User info will be: <code>firstname</code>, <code>lastname</code>, <code>age</code>, <code>password</code> and <code>email</code>
And it will return a unique ID (a positive <code>integer</code>)</p>
</li>
<li>
<p><code>def find(user_id)</code>
It will retrieve the associated <code>user</code> and return all information contained in the database.</p>
</li>
<li>
<p><code>def all</code>
It will retrieve all users and return a hash of users.</p>
</li>
<li>
<p><code>def update(user_id, attribute, value)</code>
It will retrieve the associated <code>user</code>, update the attribute send as <code>parameter</code> with the <code>value</code> and return the user <code>hash</code>.</p>
</li>
<li>
<p><code>def destroy(user_id)</code>
It will retrieve the associated <code>user</code> and destroy it from your database.</p>
</li>
</ul>
<h1>Part II</h1>
<p>Create a controller. You will use your <code>User</code> class from Part I. Your route will return a JSON.</p>
<p>It will have multiple routes:</p>
<ul>
<li>
<p><code>GET</code> on <code>/users</code>. This action will return all users (without their passwords).</p>
</li>
<li>
<p><code>POST</code> on <code>/users</code>. Receiving <code>firstname</code>, <code>lastname</code>, <code>age</code>, <code>password</code> and <code>email</code>. It will create a user and store in your database and returns the user created (without password).</p>
</li>
<li>
<p><code>POST</code> on <code>/sign_in</code>. Receiving <code>email</code> and <code>password</code>. It will add a session containing the <code>user_id</code> in order to be <code>logged in</code> and returns the user created (without password).</p>
</li>
<li>
<p><code>PUT</code> on <code>/users</code>. This action require a user to be <code>logged in</code>. It will receive a new password and will update it. It returns the user created (without password).</p>
</li>
<li>
<p><code>DELETE</code> on <code>/sign_out</code>. This action require a user to be <code>logged in</code>. It will sign_out the current user. It returns nothing (code 204 in HTTP).</p>
</li>
<li>
<p><code>DELETE</code> on <code>/users</code>. This action require a user to be <code>logged in</code>. It will sign_out the current user and it will destroy the current user. It returns nothing (code 204 in HTTP).</p>
</li>
</ul>
<p>For the signed in method, we will be using <a href="https://webapps-for-beginners.rubymonstas.org/sessions/sinatra_sessions.html" target="_blank">session &amp; cookies</a>
In order to perform a request with curl and <a href="https://stackoverflow.com/a/23039038" target="_blank">save cookies</a>
(Be aware it's not the same flags to save &amp; load)</p>
<p><strong>Example00</strong></p>
<pre class=" language-plain"><code class=" language-plain">$&gt;curl -X POST -i http://web-XXXXXXXXX.docode.YYYY.qwasar.io/users -d "firstname=value1" -d "lastname=value2"
...
$&gt;
</code></pre>
<h1>Part III</h1>
<p>Add a route <code>/</code>. This one will respond with HTML.
Create subdirectory <code>views</code> and inside, create a file named: <code>index.html</code> (you will have to submit it)</p>
<pre class=" language-plain"><code class=" language-plain">$&gt;cat views/index.html
&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;title&gt;Users index page&lt;/title&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;h1&gt;Users&lt;/h1&gt;
        &lt;table&gt;
            &lt;tr&gt;
                &lt;th&gt;FirstName&lt;/th&gt;
                &lt;th&gt;LastName&lt;/th&gt;
                &lt;th&gt;Age&lt;/th&gt;
                &lt;th&gt;Email&lt;/th&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;td&gt;XXXX&lt;/td&gt;
                &lt;td&gt;XXXX&lt;/td&gt;
                &lt;td&gt;XXXX&lt;/td&gt;
                &lt;td&gt;XXXX&lt;/td&gt;
            &lt;/tr&gt;
        &lt;/table&gt;
    &lt;/body&gt;
&lt;/html&gt;
$&gt;
</code></pre>
<p>-- <code>tr</code> are for line in the table
-- <code>th</code> are for header row (you should only have one of them)
-- <code>td</code> are for content row (you should have a lot of them)</p>
<pre class=" language-plain"><code class=" language-plain"># set('views', './views')
</code></pre>
<p><strong>Tips</strong>
To run a server locally you need to use port: 8080
and if you want to access it from your browser, you need to change the binding address to: 0.0.0.0</p>
<p>It will have a route <code>GET</code> on <code>/</code>. This action will render the template in <code>index.html</code>.</p>
<p><em>Tips</em>
Google: Sql syntax
Google Create a sql table</p>

<p></p>
</div>

</div>
