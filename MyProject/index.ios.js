
/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';
// var React = require('react-native')
// var {
//   AppRegistry,
//   TabBarIOS,
//   Component
// } = React
// var TabBarIOS = require('./SQTabBar')
// var hello = require ('./Hello')
// class Movie extends Component {
//   constructor(props) {
//     super(props)
//     this.state = {
//       selectedTab: 'MoveList'
//     };
//   } render(){
//     return(
//       <TabBarIOS selectedTab = {this.state.selectedTab}>
//       <Tabbars>
//         <TabBarIOS.item
//
//         icon = {{uri:'moveList'}}
//         title = {'MoveList'}>
//         </TabBarIOS.item>
//         <TabBarIOS.item
//
//         icon = {{uri:'moveList'}}
//         title = {'look'}>
//         </TabBarIOS.item>
//         </Tabbars>
//     )
//   }
//
// }
// AppRegistry.registerComponent('MyProject', () => Movie);
import React, {
  AppRegistry,
  Component,
  StyleSheet,
  Text,
  View
} from 'react-native';

class MyProject extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit index.ios.js
        </Text>
        <Text style={styles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('MyProject', () => MyProject);
