// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.myessay.model;

import com.myessay.model.MessagePK;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect MessagePK_Roo_Json {
    
    public String MessagePK.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String MessagePK.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static MessagePK MessagePK.fromJsonToMessagePK(String json) {
        return new JSONDeserializer<MessagePK>()
        .use(null, MessagePK.class).deserialize(json);
    }
    
    public static String MessagePK.toJsonArray(Collection<MessagePK> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String MessagePK.toJsonArray(Collection<MessagePK> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<MessagePK> MessagePK.fromJsonArrayToMessagePKs(String json) {
        return new JSONDeserializer<List<MessagePK>>()
        .use("values", MessagePK.class).deserialize(json);
    }
    
}
