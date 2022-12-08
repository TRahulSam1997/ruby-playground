import { PostsState } from "./postSlice";

const API_URL = "http://localhost:3000";

export async function fetchPosts() {
    return fetch(`${API_URL}/posts.json`, {
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        },
    }).then((res) => res.json())
    .catch((err) => {
        console.log("Error: ", err)
        return {} as PostsState;  
    })    
}