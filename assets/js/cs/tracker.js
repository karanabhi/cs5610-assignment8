import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import Users from './users';

export default function tracker_init() {
  alert("aaa");
  let root = document.getElementById('root');
  ReactDOM.render(<Tracker />, root);
}

class Tracker extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      tasks: [],
      users: [],
    };

    //this.request_posts();
    this.request_users();
  }

  render() {
    return (<Router>
      <div>
      <Route path="/users" exact={true} render={() =>
        <Users users={this.state.users} />} />
      </div>
      </Router>);
  }


  // request_posts() {
  //   $.ajax("/api/v1/posts", {
  //     method: "get",
  //     dataType: "json",
  //     contentType: "application/json; charset=UTF-8",
  //     success: (resp) => {
  //       this.setState(_.extend(this.state, { posts: resp.data }));
  //     },
  //   });
  // }

  request_users() {
    $.ajax("/api/v1/users", {
      method: "get",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      success: (resp) => {
        this.setState(_.extend(this.state, { users: resp.data }));
      },
    });
  }

}//class ends
