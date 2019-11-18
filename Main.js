'use strict';

import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';

export default class Main extends Component {
  render() {
    return (
      <View style={styles.screen}>
        <Text>Hello, Messenger Desktop!!!</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  screen: {
    backgroundColor: '#DFDFDF',
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  },
});