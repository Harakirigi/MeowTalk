import React from "react";

function App() {
  return (
    <div className="wrapper">
        <div className="container">
            <img className="logo-gradient" src="priv/static/images/logo-gradient.svg"></img>
            <h1 className="main-heading">MeowTalk</h1>
            <h1 className="heading">Welcome to our messenger based on cats theme</h1>
            <p className="main-text">To start using MeowTalk you have to  <span className="inline-special-text">login</span> to our system just by your username and password, nothing else complicated</p>
            <div className="buttons-container">
                <button className="secondary">Learn About Us</button>
                <button className="primary">Get Started Now</button>
            </div>
            <p className="secondary-text">You can set up your e-mail later if you wish to</p>
            <p className="secondary-text">You may want to <a className="primary-link">sign in</a>, if you already have an account</p>
        </div>
    </div>
  );
}

export default App;