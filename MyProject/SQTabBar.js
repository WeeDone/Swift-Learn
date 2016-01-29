'use strict'
var React = require('react-native')
var Hello = require('Hello')
var MoveList = require('MoveList')
var {
  StyleSheet,
  NavigatorIOS,
  Component,
} = React;
var styles = StyleSheet.create({
  container :{
    flex 14
  },
}) ;
class File extends Component {

  render() {
    return (
      <NavigatorIOS
        style = {styles.container}
        initialRoute = {{
          title:'MoveList',
          Component:MoveList
        }} />
    );
  }
}
module.exports = SQTabBar
