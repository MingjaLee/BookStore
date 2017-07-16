DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE bookstore DEFAULT CHARACTER SET utf8;
USE bookstore;


drop table if exists book;

drop table if exists category;

drop table if exists user;

drop table if exists orders;

drop table if exists orderitem;

#
# source for table category
#
create table category
(
  id varchar(40) primary key,
  name varchar(100) not null unique,
  description varchar(255)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# dumping data for talbe category
INSERT INTO category VALUES (1, '文学类', '文学类书籍');
INSERT INTO category VALUES (2, '技术类', '技术类书籍');
INSERT INTO category VALUES (3, '诗歌', '诗与歌');


#
# source for table book
#

create table book
(
  id varchar(40) primary key,
  name varchar(100) not null unique,
  author varchar(100) not null,
  price double not null,
  image varchar(100),
  description varchar(255),
  category_id varchar(40),
  constraint category_id_FK foreign key(category_id) references category(id)
)ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# dumping data for book table
INSERT INTO book VALUES (1, '人性的枷锁', '毛姆', 80.5, 'book-cover/human-bondage.jpg', '英国文学家毛姆的长篇小说', 1);
INSERT INTO book VALUES (2, '西游记', '吴承恩', 24.0, 'book-cover/xyj.jpg', '四大名著', 1);
INSERT INTO book VALUES (3, '红楼梦', '曹雪芹', 50.0, 'book-cover/hlm.jpg' , '四大名著', 1);
INSERT INTO book VALUES (4, '水浒传', '施耐庵', 20.0, 'book-cover/shz.jpg' , '四大名著', 1);
INSERT INTO book VALUES (5, '三国演义', '罗贯中', 13.0, 'book-cover/sgyy.jpg' , '四大名著', 1);
INSERT INTO book VALUES (6, '深入java虚拟机', '周志明', 53.8, 'book-cover/JVM.jpg' , 'Java虚拟机深入分析', 2);

#
# source for table user
#
create table user
(
  id varchar(40) primary key,
  username varchar(40) not null unique,
  password varchar(40) not null,
  phone varchar(40) not null,
  cellphone varchar(40) not null,
  email varchar(40) not null,
  address varchar(255) not null
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
# dumping data for table user
INSERT INTO user VALUES (1, 'lee', '123456', '18767104321', '0571', 'lee@qq.com', 'zjut');
INSERT INTO user VALUES (2, 'ming', '123456', '13743216710', '0572', 'ming@qq.com', 'zjut');



# source for table orders
create table orders
(
  id varchar(40) primary key,
  ordertime datetime not null,
  price double not null,
  state boolean,
  user_id varchar(40),
  constraint user_id_FK foreign key(user_id) references user(id)
)ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

# source for table orderitem
create table orderitem
(
  id varchar(40) primary key,
  quantity int,
  price double,
  order_id varchar(40),
  book_id varchar(40),
  constraint order_id_FK foreign key(order_id) references orders(id),
  constraint book_id_FK foreign key(book_id) references book(id)
)ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;