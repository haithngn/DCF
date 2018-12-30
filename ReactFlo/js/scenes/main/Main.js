import React, {Component} from 'react';
import {AppRegistry, FlatList, NativeModules, StyleSheet, Text, View, Alert} from 'react-native';
import {Button} from "react-native-elements";
import {AppNavigator} from "../bootstrap/Bootstrap";
import Icon from "react-native-vector-icons/FontAwesome";
import {NavigationActions, StackActions} from "react-navigation";

let RFBridging = NativeModules.RFBridging;

class LogoTitle extends React.Component {
    render() {
        return (
            <Text
                style={{ height: 36, color: '#0e5aff', fontSize: 24 }}
            >Collections</Text>
        );
    }
}

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
                var theData = [];
                for (var i = 0; i < cols.length; i++) {
                    let col = cols[i];
                    console.log(col['id']);
                    theData.push({key:col['name']})
                }
                this.setState({ data: theData});
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
                    renderItem={({item}) =>
                        <View style={{flex: 1, flexDirection:'row', alignItems: 'center', paddingLeft: 16}}>
                            <Icon name='suitcase' size={24} color='#1f65ff'/>
                            <Text style={styles.item}>{item.key}</Text>
                        </View>
                    }
                />
            </View>
        );
    }

    onPress = () => {
        this.props.navigation.goBack();
    };

    static navigationOptions = ({ navigation }) => ({
        headerTitle: <LogoTitle />,
        headerLeft:<View style={{margin: 16, height:36}}>
            <Icon
            name='bars'
            size={24}
            color='#1f65ff'
        /></View>,
        headerRight: <View style={{margin: 16, height:36}}>
                <Icon
                    name='sign-out'
                    size={24}
                    color='#1f65ff' onPress={() =>
                    Alert.alert(
                        'React Flo',
                        'Do you want to sign out ?',
                        [
                            {text: 'Cancel', onPress: () => Main.onPress},
                            {text: 'Yes', onPress: () => RFBridging.signOut()},
                        ],
                        { cancelable: false }
                    )
                }
                /></View>
    });

    static goBack() {
        this.props.navigation.dispatch(StackActions.reset({
            index: 0,
            actions: [
                NavigationActions.navigate({ routeName: 'Home' })
            ],
        }))
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