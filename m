From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Tue, 09 Dec 2008 00:04:23 -0800 (PST)
Message-ID: <20081209.000423.18106461.davem@davemloft.net>
References: <20081209172954.bab90ae4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:44345
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751395AbYLIIEW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 03:04:22 -0500
In-Reply-To: <20081209172954.bab90ae4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, marcel@holtmann.org, rmk@arm.linux.org.uk

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 9 Dec 2008 17:29:54 +1100

> The linux-next build (arm xm_x2xx_defconfig) fails like this:
> 
> net/bluetooth/rfcomm/sock.c: In function 'rfcomm_sock_ioctl':
> net/bluetooth/rfcomm/sock.c:795: error: 'sk' undeclared (first use in this function)
> 
> Introduced (I think) by commit a418b893a6af11ae73c762ed5b76c1bad6dc19d8
> ("Bluetooth: Enable per-module dynamic debug messages").

I just pushed the following fix for this, thanks Stephen:

bluetooth: Fix rfcomm_sock_ioctl() build failure with debugging enabled.

It's 'sock' not 'sk'.

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 net/bluetooth/rfcomm/sock.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index ad00cbf..ffaa6b0 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -792,7 +792,7 @@ static int rfcomm_sock_ioctl(struct socket *sock, unsigned int cmd, unsigned lon
 #endif
 	int err;
 
-	BT_DBG("sk %p cmd %x arg %lx", sk, cmd, arg);
+	BT_DBG("sk %p cmd %x arg %lx", sock, cmd, arg);
 
 	err = bt_sock_ioctl(sock, cmd, arg);
 
-- 
1.5.6.5
