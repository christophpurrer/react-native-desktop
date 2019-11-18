/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

'use strict';

const React = require('react');
const {
    SafeAreaView,
    ScrollView,
    StyleSheet,
    Text,
    View,
} = require('react-native');

const RNmacos: () => React$Node = () => {
    return (
            <>
              <SafeAreaView>
                <ScrollView
                  contentInsetAdjustmentBehavior="automatic"
                  style={styles.scrollView}>
                  <Header />
                  {global.HermesInternal == null ? null : (
                    <View style={styles.engine}>
                      <Text style={styles.footer}>Engine: Hermes</Text>
                    </View>
                  )}
                  <View style={styles.body}>
                    <View style={styles.sectionContainer}>
                      <Text style={styles.sectionTitle}>Stufe Eins</Text>
                      <Text style={styles.sectionDescription}>
                        Edit <Text style={styles.highlight}>App.js</Text> to change this
                        screen and then come back to see your edits.
                      </Text>
                    </View>
                    <View style={styles.sectionContainer}>
                      <Text style={styles.sectionTitle}>See Your Changes</Text>
                      <Text style={styles.sectionDescription}>
                        <ReloadInstructions />
                      </Text>
                    </View>
                    <View style={styles.sectionContainer}>
                      <Text style={styles.sectionTitle}>Debug</Text>
                      <Text style={styles.sectionDescription}>
                        <DebugInstructions />
                      </Text>
                    </View>
                    <View style={styles.sectionContainer}>
                      <Text style={styles.sectionTitle}>Learn More</Text>
                      <Text style={styles.sectionDescription}>
                        Read the docs to discover what to do next:
                      </Text>
                    </View>
                    <LearnMoreLinks />
                  </View>
                </ScrollView>
              </SafeAreaView>
            </>);
};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});

export default RNmacos;
