# URL Loading System

Interact with URLs and communicate with servers using standard Internet protocols.

## Overview

The URL Loading System provides access to resources identifierd by URLs, using standard protocols like `https` or custom protocols you creates. Loading is performed asysnchronously, so your app cna remain responsive and handle incoming data or errors as they arrive.

You use a __URLSessing__ instance to create one or more __URLSessionTask__ instances, which can fetch and return data to your app, download files, or upload data and files to remote locations. To configure a session, you use a __URLSessionConfiguration__ object, which controls behavior like how to use caches and cookies, or whether to allow connections on a cellular network.

You can use one session repeatedly to create tasks. For example a web browser might have separate sessions for regular and private browsing use, where the private session doesn't cache its data.

## URLSession

### `class`

`URLSession` An object that coordinates a group of related network data transfer tasks.

#### Declaration

```Swift
class URLSession: NSObject
```

#### Overview

The `URLSession` class and related classes provide an API for downloading data from and uploading data to endpoints indicated by URLs. The API also enables your app to perform background downloads when your app isn't running ro, in iOS, while your appp is suspended. A rich set of delegate methods support authentication and allow your app to be notified of events like redirection.