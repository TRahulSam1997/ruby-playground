import { PostDeleteData, PostFormData, PostsState } from "./postSlice";

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
            post
        })
    })
    .then((res) => res.json())
    .catch((err) => {
        console.log("Error: ", err)
        return {} as PostsState;  
    })    
}

export async function updatePost(payload:PostFormData) {
    const post = payload.post;
    return fetch(`${API_URL}/posts/${post.id}.json`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            post,
        }),
    })
    .then((res) => res.json())
    .catch((err) => {
        console.log("Error: ", err);
        return {} as PostsState;
    });
}

export async function destroyPost(payload: PostDeleteData) {
    const post = payload.post;
    return fetch(`${API_URL}/posts/${post.post_id}.json`, {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            post,
        }),
    })
    .then((response) => response.json())
    .catch((e) => {
        console.log("Error: ", e);
        return {} as PostsState;
    });   
}