importScripts('sql-wasm.js');
importScripts('sqlite3.js');

self.onmessage = function(e) {
  const data = e.data;
  const db = new SQL.Database();
  
  try {
    switch(data.type) {
      case 'exec':
        db.exec(data.sql);
        self.postMessage({ type: 'success' });
        break;
      case 'query':
        const result = db.exec(data.sql);
        self.postMessage({ type: 'result', data: result });
        break;
      default:
        self.postMessage({ type: 'error', message: 'Unknown command type' });
    }
  } catch (err) {
    self.postMessage({ type: 'error', message: err.message });
  } finally {
    db.close();
  }
}; 