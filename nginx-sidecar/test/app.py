from aiohttp import web


async def index(request):
    return web.Response(text="Success!")


async def websocket(request):
    ws = web.WebSocketResponse()

    await ws.prepare(request)
    async for msg in ws:
        await ws.send_str(msg.data.strip()[::-1])

    return ws


app = web.Application()
app.add_routes([web.get("/", index), web.get("/ws", websocket)])

if __name__ == "__main__":
    web.run_app(app)
