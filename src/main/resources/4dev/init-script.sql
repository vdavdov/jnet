CREATE TABLE "user" (
                        id SERIAL PRIMARY KEY,
                        username VARCHAR(50) UNIQUE NOT NULL,
                        email VARCHAR(100) UNIQUE NOT NULL,
                        password VARCHAR(255) NOT NULL,
                        first_name VARCHAR(50),
                        last_name VARCHAR(50),
                        profile_picture VARCHAR(255),
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "post" (
                        id SERIAL PRIMARY KEY,
                        user_id INT NOT NULL,
                        content TEXT NOT NULL,
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE
);

CREATE TABLE "comment" (
                           id SERIAL PRIMARY KEY,
                           post_id INT NOT NULL,
                           user_id INT NOT NULL,
                           content TEXT NOT NULL,
                           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           FOREIGN KEY (post_id) REFERENCES "post"(id) ON DELETE CASCADE,
                           FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE
);

CREATE TABLE "friendship" (
                              id SERIAL PRIMARY KEY,
                              user_id INT NOT NULL,
                              friend_id INT NOT NULL,
                              status VARCHAR(20) CHECK (status IN ('pending', 'accepted', 'declined')) NOT NULL,
                              created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE,
                              FOREIGN KEY (friend_id) REFERENCES "user"(id) ON DELETE CASCADE,
                              UNIQUE (user_id, friend_id)
);

CREATE TABLE "like" (
                        id SERIAL PRIMARY KEY,
                        post_id INT NOT NULL,
                        user_id INT NOT NULL,
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        FOREIGN KEY (post_id) REFERENCES "post"(id) ON DELETE CASCADE,
                        FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE
);

CREATE TABLE "message" (
                           id SERIAL PRIMARY KEY,
                           sender_id INT NOT NULL,
                           receiver_id INT NOT NULL,
                           content TEXT NOT NULL,
                           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           is_read BOOLEAN DEFAULT FALSE,
                           FOREIGN KEY (sender_id) REFERENCES "user"(id) ON DELETE CASCADE,
                           FOREIGN KEY (receiver_id) REFERENCES "user"(id) ON DELETE CASCADE
);


CREATE TABLE "message_attachment" (
                                     id SERIAL PRIMARY KEY,
                                     message_id INT NOT NULL,
                                     file_url VARCHAR(255) NOT NULL,
                                     file_type VARCHAR(50), -- например, 'image/png', 'image/jpeg', 'video/mp4'
                                     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                     FOREIGN KEY (message_id) REFERENCES "message"(id) ON DELETE CASCADE
);
