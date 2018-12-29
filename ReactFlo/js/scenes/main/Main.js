import React, {Component} from 'react';
import {AppRegistry, FlatList, NativeModules, StyleSheet, Text, View} from 'react-native';

let RFBridging = NativeModules.RFBridging;
RFBridging.getCollections((collections) => {
    console.log(JSON.parse(collections));
    console.log('collections');
});

export default class Main extends React.Component {
    render() {
        return (
            <View style={styles.container}>
                <FlatList
                    data={[
                        {key: 'Devin'},
                        {key: 'Jackson'},
                        {key: 'James'},
                        {key: 'Joel'},
                        {key: 'John'},
                        {key: 'Jillian'},
                        {key: 'Jimmy'},
                        {key: 'Julie'},
                    ]}
                    renderItem={({item}) => <Text style={styles.item}>{item.key}</Text>}
                />
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        paddingTop: 22
    },
    item: {
        padding: 10,
        fontSize: 18,
        height: 44,
    },
});