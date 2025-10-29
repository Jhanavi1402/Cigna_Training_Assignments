import React, { useState, useEffect } from "react";

function ProductTable() {
  const [products, setProducts] = useState([]);

  // Load initial hard-coded data using useEffect
  useEffect(() => {
    const initialData = [
      { pid: 101, pname: "Laptop", price: 50000 },
      { pid: 102, pname: "Mouse", price: 800 },
      { pid: 103, pname: "Keyboard", price: 1200 },
    ];
    setProducts(initialData);
  }, []);

  return (
    <div style={{ padding: "20px" }}>
      <h2>Product List</h2>
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

export default ProductTable;
