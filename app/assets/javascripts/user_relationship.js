$("#follow_form").html("= escape_javascript(render('users/unfollow'))");
$("#followers").html('= @user.followers.count %>');

$("#follow_form").html("= escape_javascript(render('users/follow'))");
$("#followers").html('= @user.followers.count');