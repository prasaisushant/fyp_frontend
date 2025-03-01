import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
export const baseApi = createApi({
  reducerPath: 'api',
  baseQuery: fetchBaseQuery({ 
    baseUrl: 'http://10.200.16.68:30582/',
    prepareHeaders: (headers) => {
      return headers
    }
  }),
  tagTypes: ['Clusters', 'ClusterStats', 'Pods'],
  endpoints: () => ({}),
})