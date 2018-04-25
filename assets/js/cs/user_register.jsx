import React from 'react';
import { Form, FormGroup, NavItem, Input, Button } from 'reactstrap';
import { Redirect, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import utils from '../util'
import api from '../api';

function UserRegForm(props){
	function update(ev){
		let tgt = $(ev.target);
		let data = {};
		data[tgt.attr('name')] = tgt.val();
		props.dispatch({
			type: 'NEW_USER_CHANGE',
			newuser: data,
		});
	}
	function add_user(){
		if(utils.is_empty(props.newuser.email)){
			alert("Name is required");
			return;
		}
		else if(utils.is_empty(props.newuser.password) || utils.is_empty(props.newuser.confpass)){
			alert("Password is required");
			return;
		}
		else if(props.newuser.password != props.newuser.confpass){
			alert("The passwords field should match");
			return;
		}
		api.add_user(props.newuser);
	}
	if (props.redirect.can_redirect){

		return <Redirect to={utils.clear_redirect(props.redirect.redirect_to)} />
	}
	else
	return (
		<table className="navbar-text reg-tbl">
			<tr>
				<td>
							<Input type="text" name="name" placeholder="Enter Full Name..."
							value={props.newuser.name} onChange={update} />
				</td>
				<td>
					<Input required type="text" name="email" placeholder="Enter Email..."
						value={props.newuser.email} onChange={update} />
				</td>
		  </tr>
		  <tr>
				<td>
							<Input type="password" name="password"  placeholder="Enter Password..."
							value={props.newuser.password} onChange={update} />
				</td>
				<td>
							<Input type="password" name="confpass"  placeholder="Confirm Password..."
							value={props.newuser.confpass} onChange={update} />
		     </td>
		  </tr>
		  <tr>
		 	 <td>
		 		 <Button onClick={add_user} className="btn btn-warning btn-lg reg-btn">Register</Button>
			 </td>
			 <td>
			 </td>
		  </tr>
		</table>);
	}

	function state2props(state){
		return {
			newuser: state.newuser,
			redirect: state.redirect
		};
	}

	export default withRouter(connect(state2props)(UserRegForm));
