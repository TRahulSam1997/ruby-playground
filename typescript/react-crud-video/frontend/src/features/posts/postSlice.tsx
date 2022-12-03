import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import produce from "immer";
import { RootState } from "../../app/store";

export enum Statuses {
    
}

const initialState: any = {
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