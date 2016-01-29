'usr strict'
var React = require('react-native')
var {
  AppRegistry,
  StyleSheet,
  View,
  Text,
  Component,
} = React
class MoveList extends Component {
render() {
  return(
    <View style = {styles.container}>
    <Text style = {styles.description}>
    Move List Tab
    </Text>

    </View>
  )
}
}
var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent:'center',
    alignItems : 'center',
  },
  description: {
    justifyContent: 'center',
    fontSize : 15,
  }
});
module.exports = MoveList;
AppRegistry.registerComponent('MyProject', () => MoveList);
