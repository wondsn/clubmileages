-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- USERS Table Create SQL
CREATE TABLE USERS
(
    `user_id`    BINARY(16)    NOT NULL    COMMENT '유저 아이디',
    `cur_point`  INT           NOT NULL    DEFAULT 0 COMMENT '현재 보유하고 있는 포인트',
    PRIMARY KEY (user_id)
);


-- REVIEWS Table Create SQL
CREATE TABLE REVIEWS
(
    `review_history_id`  BINARY(16)    NOT NULL    COMMENT '리뷰 변경 내역 아이디',
    `review_id`          BINARY(16)    NOT NULL    COMMENT '리뷰 아이디',
    `user_id`            BINARY(16)    NOT NULL    COMMENT '유저 아이디',
    `place_id`           BINARY(16)    NOT NULL    COMMENT '장소 아이디',
    `content`            LONGTEXT      NULL        COMMENT '리뷰 내용',
    PRIMARY KEY (review_history_id)
);

ALTER TABLE REVIEWS COMMENT '리뷰 변경 내역 추척';

ALTER TABLE REVIEWS
    ADD CONSTRAINT FK_REVIEWS_user_id_USERS_user_id FOREIGN KEY (user_id)
        REFERENCES USERS (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- POINT_HISTORY Table Create SQL
CREATE TABLE POINT_HISTORY
(
    `point_history_id`  BINARY(16)     NOT NULL    COMMENT 'PointHistoryID',
    `user_id`           BINARY(16)     NULL        COMMENT 'UserID',
    `type`              VARCHAR(45)    NULL        COMMENT 'TYPE',
    `create_datetime`   TIMESTAMP      NULL        COMMENT 'CreateDateTime',
    `update_point`      INT            NULL        COMMENT 'Update History Point',
    PRIMARY KEY (point_history_id)
);

ALTER TABLE POINT_HISTORY
    ADD CONSTRAINT FK_POINT_HISTORY_user_id_USERS_user_id FOREIGN KEY (user_id)
        REFERENCES USERS (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- IMAGES Table Create SQL
CREATE TABLE IMAGES
(
    `image_history_id`   BINARY(16)    NOT NULL    COMMENT '이미지 변경 내역 아이디',
    `review_history_id`  BINARY(16)    NOT NULL    COMMENT '리뷰 변경 내역 아이디',
    `image_id`           BINARY(16)    NOT NULL    COMMENT '이미지 아이디',
    PRIMARY KEY (image_history_id)
);

ALTER TABLE IMAGES COMMENT '리뷰용 사진 (변경 내역이 추적되야함)';

ALTER TABLE IMAGES
    ADD CONSTRAINT FK_IMAGES_review_history_id_REVIEWS_review_history_id FOREIGN KEY (review_history_id)
        REFERENCES REVIEWS (review_history_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

