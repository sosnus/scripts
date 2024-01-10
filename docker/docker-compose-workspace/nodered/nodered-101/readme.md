## password generator
`node -e "console.log(require('bcryptjs').hashSync(process.argv[1], 8));" your-password-here`
`npm install bcryptjs`
more about password: https://nodered.org/docs/getting-started/docker


## how to configure nodered
1. create folder for data files
2. generate password
3. copy settings.js
4. replace password hash
5. deploy nodered