import React from 'react';
//import { NavLink } from 'react-router-dom';
import { Form, FormGroup, NavItem, Input, Button } from 'reactstrap';
import { connect } from 'react-redux';
import api from '../api';

//let LoginForm = connect((login) => {return {login};})((props) => {
function LoginForm(props){
	//function update(ev) {
		/*
		let tgt = $(ev.target)
		let logindata = {}
		logindata[tgt.attr('name')]=*/
	function create_token(ev){
		console.log('login');
		api.user_login(props.login);
	}
	function update(ev){
		let tgt = $(ev.target);
    		let data = {};
	    	data[tgt.attr('name')] = tgt.val();
    		props.dispatch({
      			type: 'USER_LOGIN',
      			logindata: data,
    		});

	}
	console.log(props);
		return (<div className="navbar-text">
    <Form inline>
      <FormGroup>
        <Input type="text" name="name" placeholder="Enter Email or Name..."
               value={props.login.name} onChange={update} className="mrgn-eml"/>
      </FormGroup>
			<br />
      <FormGroup>
        <Input type="password" name="pass" placeholder="Enter Password..."
               value={props.login.pass} onChange={update} className="mrgn-pass"/>
      </FormGroup>
			<br /><br />
      <Button onClick={create_token} className="btn btn-lg btn-success mrgn-btn">Sign In</Button>
    </Form>
  </div>);
}
//);

function state2props(state) {
  return {
    login: state.login
  };
}

export default connect(state2props)(LoginForm);
