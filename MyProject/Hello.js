/*@flow*/
'usr strict'

var React = require ('react-native ')
var {
  AppRegistry,
  StyleSheet,
  View,
  Text,
  Component
} = React
class  Hello extends Component {
render() {
  return (
    <View styles = {style.container}>
    <View style = {styles.container}>
    <Text style = {styles.description}>
    Move List Tab
    </Text>

    </View>
    <Text styles = {styles.description}>
    Hello world </Text>
    </View>
  )
}
}
var styles.create({
  container: {
    flex : 15,
    justifyContent:'center'
    alignItems: 'center'
    backgroundColor '#F5FCFF'

  },
  description: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
})
module.exports = Hello
