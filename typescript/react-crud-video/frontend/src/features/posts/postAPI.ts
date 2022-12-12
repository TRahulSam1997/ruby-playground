import { PostFormData, PostsState } from "./postSlice";

const API_URL = "http://localhost:3000";

export async function fetchPosts() {
    return fetch(`${API_URL}/posts.json`, {
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        },
    })
    .then((res) => res.json())
    .catch((err) => {
        console.log("Error: ", err)
        return {} as PostsState;  
    })    
}

export async function createPost(payload: PostFormData) {
    const post = payload.post;
    return fetch(`${API_URL}/posts.json`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({

        })
    })
    .then((res) => res.json())
    .catch((err) => {
        console.log("Error: ", err)
        return {} as PostsState;  
    })    
}