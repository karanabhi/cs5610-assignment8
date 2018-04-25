import React from 'react';
import ReactDOM from 'react-dom';
import { Provider, connect } from 'react-redux';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import Nav from './nav';
import LoginForm from './loginform';
import UserRegForm from './user_register';
import TaskForm from './task_form';
import TaskList from './tasklist';
import AddTaskForm from './addform';
import api from '../api';
import utils from '../util';

export default function tracker_init(store){
	let root = document.getElementById("root");
	ReactDOM.render(
		<Provider store={store}>
		<Tracker state={store.getState()}/>
		</Provider>, root);
		api.get_users();
	}

	let Tracker = connect((state) => state)((props) => {
		let content = <LoginForm />;
		if (!utils.is_empty(props.token)){
			utils.clear_redirect();
			content = <h5>Task Tracker 3 applicaiton let's user:<ul>
								<li>Register an account</li>
								<li>Sign in / Sign out</li>
								<li>Create Tasks, entering a title and a description</li>
								<li>Assign tasks to themselves or other users</li>
								<li>Assign tasks to themselves or other users</li>
								<li>Track how long they've worked on a task they're assigned to, in 15-minute increments</li>
								<li>Mark a task as completed</li></ul></h5>;
							}

		return (
			<Router>
			<div>
			<Nav />
			<Route path="/" exact={true} render = {() =>
				<div>{ content } </div>
			} />
			<Route path="/register" exact={true} render = {() =>
				<UserRegForm />
			}
			/>
			<Route path="/addtask" exact={true} render = {() =>
				<div>
				<AddTaskForm />
				</div>
			}
			/>
			<Route path="/viewtasks" render={() =>
				<TaskList tasks={props.tasks.filter((t) => t.user_id == props.user.id )} redirect={props.redirect} />
			}/>
			<Route path="/edittask" exact={true} render = {() =>
				<div>
				<TaskForm />
				</div>
			}
			/>
			</div>
			</Router>
		);
	});
