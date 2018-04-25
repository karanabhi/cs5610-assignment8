import React from 'react';
import { NavLink,Link } from 'react-router-dom';
import { NavItem } from 'reactstrap';
import { connect } from 'react-redux';
import utils from '../util';

function Nav(props) {
	if(!utils.is_empty(props.token)){
		return(
			<nav className="navbar navbar-default bg-purple navbar-expand">
			<span className="navbar-brand clr-wht">
			Task Tracker 3
			</span>
			<ul className="navbar-nav mr-auto">
			<NavItem>
			<NavLink to="/" exact={true} activeClassName="active" className="nav-link"><i className="fa fa-home sz-30"></i></NavLink>
			</NavItem>
			&emsp;&emsp;&emsp;&emsp;&emsp;
			<NavItem>
			<NavLink to="/addtask" href="#" className="nav-link"><i className="fa fa-calendar-plus-o sz-22"></i>Add Task</NavLink>
			</NavItem>
			&emsp;&emsp;
			<NavItem>
			<NavLink to="/viewtasks" href="#" className="nav-link"><i className="fa fa-calendar-check-o sz-22"></i>View Tasks</NavLink>
			</NavItem>
			</ul>
			<span className="navbar-text clr-wht">
			Welcome {props.user.name}!
			</span>

			<span className="navbar-text">
			<a href="javascript:void(0)" className="nav-link" onClick={() => {utils.logout();utils.redirect("/"); } }><i className="fa fa-sign-out sz-22"></i>Sign Out</a>
			</span>
			</nav>
		);
	}
	return (
		<nav className="navbar navbar-default bg-purple navbar-expand">
		<span className="navbar-brand clr-wht">
		Task Tracker 3
		</span>
		<ul className="navbar-nav mr-auto">
		<NavItem>
		<NavLink to="/" exact={true} activeClassName="active" className="nav-link"><i className="fa fa-home sz-30"></i></NavLink>
		</NavItem>
		&emsp;&emsp;
		<NavItem>
		<NavLink to="/register" href="#" className="nav-link">Register</NavLink>
		</NavItem>
		</ul>
		<span className="navbar-text">
		</span>
		</nav>
	);
}

function state2props(state){
	return {
		token: state.token,
		user: state.user
	};
}

export default connect(state2props)(Nav);
