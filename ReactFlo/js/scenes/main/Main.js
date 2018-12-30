import React, {Component} from 'react';
import {AppRegistry, FlatList, NativeModules, StyleSheet, Text, View} from 'react-native';

let RFBridging = NativeModules.RFBridging;

export default class Main extends React.Component {
    async getCollections() {
        RFBridging.getCollections((error, collections) => {
            if (error) {
                console.log(error);
            } else {
                var collectionsInJSON = JSON.parse(collections);
                console.log('aka : ' + collectionsInJSON.collections);
                let cols = collectionsInJSON.collections;
                console.log(cols);
                var col;
                for (var i = 0; i < cols.length; i++) {
                    let col = cols[i];
                    console.log(col['id']);
                }
                this.setState({ data: [
                        {key: 'Devin'},
                        {key: 'Hai'},
                        {key: 'James'},
                        {key: 'Joel'},
                        {key: 'John'},
                        {key: 'Jillian'},
                        {key: 'Jimmy'},
                        {key: 'Julie'},
                    ]});
            }
        });
    };

    constructor(props) {
        super(props);
        this.state = { data: []};
        this.getCollections();
    }

    render() {
        return (
            <View style={styles.container}>
                <FlatList
                    data={this.state.data}
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