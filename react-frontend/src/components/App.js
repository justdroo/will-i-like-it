import React, { Component } from 'react';
import { Grid } from 'react-bootstrap'
import Nav from './Nav'
import '../App.css';

class App extends Component {
  render() {
    return (
      <Grid>
        <Nav/>
        <div className="childrens">
          {this.props.children}
        </div>
      </Grid>
    );
  }
}

export default App;
