import React, { useState, useEffect } from "react";

function ProductTables() {
  const [products, setProducts] = useState([]);
  const [pid, setPid] = useState("");
  const [pname, setPname] = useState("");
  const [price, setPrice] = useState("");

  useEffect(() => {
    setProducts([
      { pid: 101, pname: "Laptop", price: 50000 },
      { pid: 102, pname: "Mouse", price: 800 },
      { pid: 103, pname: "Keyboard", price: 1200 },
    ]);
  }, []);

  const addProduct = () => {
    const newProduct = {
      pid: parseInt(pid),
      pname: pname,
      price: parseFloat(price),
    };
    setProducts([...products, newProduct]);
    setPid("");
    setPname("");
    setPrice("");
  };

  return (
    <div style={{ padding: "20px" }}>
      <h2>Product Management</h2>

      <div style={{ marginBottom: "20px" }}>
        <input
          type="number"
          placeholder="Product ID"
          value={pid}
          onChange={(e) => setPid(e.target.value)}
        />
        <input
          type="text"
          placeholder="Product Name"
          value={pname}
          onChange={(e) => setPname(e.target.value)}
        />
        <input
          type="number"
          placeholder="Price"
          value={price}
          onChange={(e) => setPrice(e.target.value)}
        />
        <button onClick={addProduct}>Add Product</button>
      </div>

      <table border="1" cellPadding="10">
        <thead>
          <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Price (₹)</th>
          </tr>
        </thead>
        <tbody>
          {products.map((p) => (
            <tr key={p.pid}>
              <td>{p.pid}</td>
              <td>{p.pname}</td>
              <td>{p.price}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default ProductTables;
