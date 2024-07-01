import { Connection, createConnection } from 'mysql2';

interface DbConfig {
    host: string;
    user: string;
    password: string;
    database: string;
}

const dbConfig: DbConfig = {
    host: 'localhost',
    user: 'root',
    password: 'test-db-password',
    database: 'test-db-name'
};

function connectToDatabase(config: DbConfig): Connection {
    const connection = createConnection({
        host: config.host,
        user: config.user,
        password: config.password,
        database: config.database
    });

    connection.connect(err => {
        if (err) {
            console.error('Error connecting to the database:', err);
            return;
        }
        console.log('Connected to the MySQL database.');
    });

    return connection;
}

const connection = connectToDatabase(dbConfig);

// Example query
connection.query('SELECT 1 + 1 AS solution', (err, results) => {
    if (err) {
        console.error('Error executing query:', err);
        return;
    }
    console.log('The solution is:', results);
});

// Close the connection
connection.end(err => {
    if (err) {
        console.error('Error ending the connection:', err);
        return;
    }
    console.log('Connection closed.');
});