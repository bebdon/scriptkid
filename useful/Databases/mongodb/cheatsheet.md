# 🐚 mongosh Cheat Sheet

MongoDB’s modern shell, `mongosh`, provides an interactive JavaScript interface to work with MongoDB.
---
## 📂 MongoDB Data Structures & Hierarchy

MongoDB organizes data in a simple, flexible hierarchy:

```
MongoDB Server
└── Database(s)
    └── Collection(s)
        └── Document(s) (BSON/JSON)
            └── Fields (key-value pairs)
```

#### Example:

- **Server:** The MongoDB instance you connect to.
- **Database:** Logical container for collections (like a schema in SQL).
- **Collection:** Group of documents (like a table in SQL).
- **Document:** JSON-like object with data (one record).
- **Field:** A key-value pair inside a document.
- **Embedded Document:** A document nested within another document.
- **Array:** A list of values or documents within a field.

#### Sample Document in a Collection:
```json
{
  "_id": ObjectId("507f1f77bcf86cd799439011"),
  "name": "Alice",
  "age": 30,
  "address": {
    "street": "123 Main St",
    "city": "Metropolis"
  },
  "hobbies": ["reading", "cycling"]
}
```

- `address` is an embedded document.
- `hobbies` is an array.

MongoDB’s schema-less design means you can have documents with different fields in the same collection.

---

## 🚀 Starting mongosh

### Connect to the default localhost:
```bash
mongosh
```

### Connect to a specific host, port, and database:
```bash
mongosh "mongodb://username:password@host:port/dbname"
```

### Connect to MongoDB Atlas (cloud):
```bash
mongosh "mongodb+srv://cluster0.mongodb.net/mydb" --username myUser
```

---

## 📄 Working with Databases

### Show all databases:
```js
show dbs
```

### Switch to or create a database:
```js
use myDatabase
```

### Check current database:
```js
db
```

---

## 📦 Working with Collections

### Show collections:
```js
show collections
```

### Create a collection:
```js
db.createCollection("myCollection")
```

### Drop a collection:
```js
db.myCollection.drop()
```

---

## 📋 CRUD Operations

### Insert one document:
```js
db.users.insertOne({ name: "Alice", age: 30 })
```

### Insert many documents:
```js
db.users.insertMany([{ name: "Bob" }, { name: "Carol" }])
```

### Find all documents:
```js
db.users.find()
```

### Pretty print documents:
```js
db.users.find().pretty()
```

### Find with a condition:
```js
db.users.find({ age: { $gt: 25 } })
```

### Find one document:
```js
db.users.findOne({ name: "Alice" })
```

### Update one document:
```js
db.users.updateOne(
  { name: "Bob" },
  { $set: { age: 35 } }
)
```

### Update many documents:
```js
db.users.updateMany(
  { age: { $lt: 30 } },
  { $inc: { age: 1 } }
)
```

### Delete one document:
```js
db.users.deleteOne({ name: "Carol" })
```

### Delete many documents:
```js
db.users.deleteMany({ age: { $gt: 50 } })
```

---

## 🔍 Indexes

### Create an index:
```js
db.users.createIndex({ email: 1 })
```

### Show indexes:
```js
db.users.getIndexes()
```

---

## 📜 Aggregation

### Basic aggregation:
```js
db.users.aggregate([
  { $match: { age: { $gte: 25 } } },
  { $group: { _id: null, avgAge: { $avg: "$age" } } }
])
```

---

## 🛠️ Admin Commands

### Show server status:
```js
db.serverStatus()
```

### Show replica set status:
```js
rs.status()
```

### Show current operations:
```js
db.currentOp()
```

### Kill an operation:
```js
db.killOp(<opid>)
```

---

## 📑 Tips

✅ Use `it` to iterate large query results:  
```js
DBQuery.shellBatchSize = 50
```

✅ Use tab-completion for commands and collection names.

✅ Use `.help()` for context-aware help:
```js
db.help()
db.users.help()
```

---

For more details, see [https://www.mongodb.com/docs/mongodb-shell/](https://www.mongodb.com/docs/mongodb-shell/)