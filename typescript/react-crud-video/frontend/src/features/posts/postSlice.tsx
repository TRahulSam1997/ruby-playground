import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import produce from "immer";
import { RootState } from "../../app/store";
import { fetchPosts, createPost, destroyPost } from "./postAPI";

export enum Statuses {
    Initial = "Not Fetched",
    Loading = "Loading...",
    UpToDate = "Up To Date",
    Deleted = "Deleted",
    Error = "Error"
}

export interface PostFormData {
    post: {
        id?: string;
        title: string;
        body: string;
    }
}

export interface PostState {
    id?: number;
    title?: string;
    body?: string;
    created_at?: any;
    updated_at?: any;
}

export interface PostsState {
    posts: PostState[];
    status: string;
}

export interface PostUpdateData {
    post_id: number;
    post: PostsState;
}

export interface PostDeleteData {
    post: {
        post_id: number;
    }
}

const initialState: PostsState = {
    posts: [
        {
            id: 0,
            title: "",
            body: "",
            created_at: "",
            updated_at: "",
        }
    ],
    status: Statuses.Initial
}

export const fetchPostsAsync = createAsyncThunk(
    'posts/fetchPosts',
    async () => {
        return await fetchPosts();
    }
)

export const createPostAsync = createAsyncThunk(
    "posts/createPost",
    async (payload: PostFormData) => {
        return await createPost(payload);
    }
)

export const destroyPostAsync = createAsyncThunk(
    "posts/destroyPost",
    async (payload: PostDeleteData) => {
        return await destroyPost(payload);
    }
)

export const postSlice = createSlice({
    name: "posts",
    initialState,
    reducers: {},
    extraReducers: (builder) => {
        builder
            .addCase(fetchPostsAsync.pending, (state) => {
                return produce(state, (draftState) => {
                    draftState.status = Statuses.Loading;
                })
            })
            .addCase(fetchPostsAsync.fulfilled, (state, action) => {
                return produce(state, (draftState) => {
                    draftState.posts = action.payload;
                    draftState.status = Statuses.UpToDate;
                })
            })
            .addCase(fetchPostsAsync.rejected, (state) => {
                return produce(state, (draftState) => {
                    draftState.status = Statuses.Error;
                })
            })
            /** Update Section */
            .addCase(createPostAsync.pending, (state) => {
                return produce(state, (draftState) => {
                    draftState.status = Statuses.Loading;
                })
            })
            .addCase(createPostAsync.fulfilled, (state, action) => {
                return produce(state, (draftState) => {
                    draftState.posts.push(action.payload);
                    draftState.status = Statuses.UpToDate;
                })
            })
            .addCase(createPostAsync.rejected, (state) => {
                return produce(state, (draftState) => {
                    draftState.status = Statuses.Error;
                })
            })
            /** Delete Section */
            .addCase(destroyPostAsync.pending, (state) => {
                return produce(state, (draftState) => {
                    draftState.status = Statuses.Loading;
                })
            })
            .addCase(destroyPostAsync.fulfilled, (state, action) => {
                return produce(state, (draftState) => {
                    draftState.posts = action.payload;
                    draftState.status = Statuses.UpToDate;
                })
            })
            .addCase(destroyPostAsync.rejected, (state) => {
                return produce(state, (draftState) => {
                    draftState.status = Statuses.Error;
                })
            })
    } 
})

export const {} = postSlice.actions;

export const selectPosts = (state: RootState) => state.posts.posts;

export const selectStatus = (state: RootState) => state.posts.status;

export default postSlice.reducer;