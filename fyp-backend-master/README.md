# Instructions to run back-end
- Clone the repo to a folder, say ```back-end```
- Install dependencies
```bash
cd back-end
npm install --save express cors morgan body-parse fabric-network
```
- Open a terminal window in ```back-end``` and start the server. The server will start at http://localhost:4000
```bash
node index.js
```

<b>Important</b>: The paths mentioned in ```createClient.js``` and ```fabricClient.js``` are machine specific and are such that the folder with the [blockchain components](https://github.com/sashankr98/fyp-blockchain) is at the same directory level as this back-end folder.
```
complete_network/
 ├── fyp-backend/
 └── fyp-blockchain/
```
If your file structure is different, then the paths in the mentioned filed need to be modified accordingly. ```config.yaml``` uses absolute paths so those need to be changed regardless of the project file structure so that it matches the system it is running on
