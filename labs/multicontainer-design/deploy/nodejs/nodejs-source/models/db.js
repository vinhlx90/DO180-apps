
module.exports.params = {
  dbname: process.env.MYSQL_DATABASE,
  username: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  params: {
      host: '10.142.1.100',
      port: '30306',
      dialect: 'mysql'
  }
};
