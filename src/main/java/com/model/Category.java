package com.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

@JsonAutoDetect
public enum Category {
    BREAKING,
    HOW_I_WORK,
    APP_REVIEW,
    BOOK_REVIEW,
    BUSINESS
}
