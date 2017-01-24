import React, {Component} from 'react'
import { Row, Col, Form, FormGroup, FormControl, ControlLabel, HelpBlock, Button } from 'react-bootstrap'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { browserHistory } from 'react-router'
import searchByName from '../actions/searchByName'

class Search extends Component {

  constructor(props) {
    super(props)
    this.state = {beerName: ""}
  }

  handleBeerChange(event){
    this.setState({beerName: event.target.value})
  }

  handleSubmit(event){
    event.preventDefault()
    this.props.searchByName(this.state)
  }

  render (){
    return (
      <Row>
        <Col xs ={12}>
          <Form onSubmit={this.handleSubmit.bind(this)}>
            <FormGroup>
              <ControlLabel>Beer Name</ControlLabel>

              <FormControl
                type="text"
                placeholder="beer"
                onChange={this.handleBeerChange.bind(this)}/>

            </FormGroup>
            <Button type="submit">Search</Button>
          </Form>
        </Col>
      </Row>
    )
  }
}

function mapDispatchToProps(dispatch){
  return bindActionCreators({ searchByName }, dispatch)
}

export default connect(null, mapDispatchToProps)(Search)
