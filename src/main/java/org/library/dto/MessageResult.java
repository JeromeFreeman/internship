package org.library.dto;

import java.io.Serializable;

/**
 * Created by ${Fjq} on 2017-02-25.
 */ 
public class MessageResult<T> implements Serializable{

    private boolean success;

    private T data;

    private String error;

    public MessageResult(boolean success, T data) {
        this.success = success;
        this.data = data;
    }

    public MessageResult(boolean success, String error) {
        this.success = success;
        this.error = error;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
