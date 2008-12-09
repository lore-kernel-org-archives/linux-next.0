From: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] rfcomm/sock: fix build problem
Date: Tue, 9 Dec 2008 15:39:50 +0300
Message-ID: <20081209123950.GA31294@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mingo-X9Un+BFzKDI@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

net/bluetooth/rfcomm/sock.c: In function 'rfcomm_sock_ioctl':
net/bluetooth/rfcomm/sock.c:795: error: 'sk' undeclared (first use in this function)
net/bluetooth/rfcomm/sock.c:795: error: (Each undeclared identifier is reported only once
net/bluetooth/rfcomm/sock.c:795: error: for each function it appears in.)

It is a conflict between a418b893
(Bluetooth: Enable per-module dynamic debug messages)
and 45555c0e
(bluetooth: fix warning in net/bluetooth/rfcomm/sock.c)

Signed-off-by: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

 net/bluetooth/rfcomm/sock.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index ad00cbf..d63040f 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -787,9 +787,7 @@ static int rfcomm_sock_getsockopt(struct socket *sock, int level, int optname, c
 
 static int rfcomm_sock_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 {
-#if defined(CONFIG_BT_RFCOMM_TTY) || defined(CONFIG_BT_RFCOMM_DEBUG)
 	struct sock *sk = sock->sk;
-#endif
 	int err;
 
 	BT_DBG("sk %p cmd %x arg %lx", sk, cmd, arg);
