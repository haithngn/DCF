/**
 * Sample React Native Bootstrap
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {NativeModules} from 'react-native';
import {StyleSheet, Text, View } from 'react-native';
import { Button, Input, Divider } from 'react-native-elements';
import Icon from "react-native-vector-icons/FontAwesome";
import Main from '../main/Main';
import { createAppContainer, createStackNavigator, StackActions, NavigationActions } from 'react-navigation'; // 3.0.9

let RFBridging = NativeModules.RFBridging;

class Bootstrap extends React.Component {
    _authorized = async () => {
        console.log("ABC");
    };
    _signInAsync = async () => {
        RFBridging.submitUsername(this.state.username, this.state.password, ((error) => {
            console.log(error);
            if (error) {
                this.props.navigation.dispatch(StackActions.reset({
                    index: 0,
                    actions: [
                        NavigationActions.navigate({ routeName: 'Details' })
                    ],
                }))
            } else {
                this.props.navigation.dispatch(StackActions.reset({
                    index: 0,
                    actions: [
                        NavigationActions.navigate({ routeName: 'Details' })
                    ],
                }))
            }
        }));
    };

    state = { username: '', password: '' }

    onChangeText = (key, val) => {
        this.setState({ [key]: val})
    }

    render() {
        return (
            <View style={styles.container}>
                <View style={{backgroundColor: '#1f65ff'}} />
                <View style={{width: 250, flexDirection: 'column', justifyContent: 'center'}}>
                    <View style={{backgroundColor: '#1f65ff'}} />
                    <View style={{height: 250, flexDirection: 'column', justifyContent: 'flex-start'}}>
                        <Input
                            placeholder='username'
                            leftIcon={
                                <Icon
                                    name='user'
                                    size={24}
                                    color='white'
                                />
                            }
                            inputStyle={{color:'white'}} onChangeText={val => this.onChangeText('username', val)}
                        />
                        <Divider style={{ height:8, backgroundColor: 'rgba(52, 52, 52, 0.0)' }} />
                        <Input
                            placeholder='password'
                            leftIcon={
                                <Icon
                                    name='user'
                                    size={24}
                                    color='white'
                                />
                            }
                            inputStyle={{color:'white'}} secureTextEntry={true} onChangeText={val => this.onChangeText('password', val)}
                        />
                        <Divider style={{ height:32, backgroundColor: 'rgba(52, 52, 52, 0.0)' }} />
                        <Button
                            raised
                            icon={{name: 'cached'}}
                            title='Sign In' onPress={this._signInAsync}/>
                    </View>
                    <View style={{backgroundColor: '#1f65ff'}} />
                </View>
                <View style={{backgroundColor: '#1f65ff'}} />
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#1f65ff',
        flexDirection:'row',
        justifyContent: 'center'
    }
});



const AppNavigator = createStackNavigator({
    Home: {
        screen: Bootstrap,
    },
    Details: {
        screen: Main,
    },
}, {
    initialRouteName: 'Home',
});

export default createAppContainer(AppNavigator);