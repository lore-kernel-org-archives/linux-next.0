From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Tue, 09 Dec 2008 01:05:03 -0800 (PST)
Message-ID: <20081209.010503.36680697.davem@davemloft.net>
References: <20081209172954.bab90ae4.sfr@canb.auug.org.au>
	<20081209.000423.18106461.davem@davemloft.net>
	<20081209195417.1b671249.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:54884
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752143AbYLIJFE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 04:05:04 -0500
In-Reply-To: <20081209195417.1b671249.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, marcel@holtmann.org, rmk@arm.linux.org.uk

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 9 Dec 2008 19:54:17 +1100

> Hi Dave,
> 
> On Tue, 09 Dec 2008 00:04:23 -0800 (PST) David Miller <davem@davemloft.net> wrote:
> > diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
> > index ad00cbf..ffaa6b0 100644
> > --- a/net/bluetooth/rfcomm/sock.c
> > +++ b/net/bluetooth/rfcomm/sock.c
> > @@ -792,7 +792,7 @@ static int rfcomm_sock_ioctl(struct socket *sock, unsigned int cmd, unsigned lon
> >  #endif
> >  	int err;
> >  
> > -	BT_DBG("sk %p cmd %x arg %lx", sk, cmd, arg);
> > +	BT_DBG("sk %p cmd %x arg %lx", sock, cmd, arg);
> 
> I am not sure this is correct as there is a "sk" defined just above here
> but surrounded by
> 
> #if defined(CONFIG_BT_RFCOMM_TTY) || defined(CONFIG_BT_RFCOMM_DEBUG)

Hmmm...

BT_DBG is unconditionally defined these days.  And it evaluates to
pr_debug() which is conditional on other "DEBUG" or
"DYNAMIC_PRINTK_DEBUG".

This looks like a job for either __maybe_unused since I can't see
a clean way to keep this issue inside of the BT_DBG() macro
definition since it's varargs.

So, I've gone with this for now:

bluetooth: Fix unused var warning properly in rfcomm_sock_ioctl().

As Stephen Rothwell points out, we don't want 'sock' here but
rather we really do want 'sk'.

This local var is protected by all sorts of bluetooth debugging
kconfig vars, but BT_DBG() is just a straight pr_debug() call
which is unconditional.

pr_debug() evaluates it's args only if either DEBUG or
CONFIG_DYNAMIC_PRINTK_DEBUG is defined.

Solving this inside of the BT_DBG() macro is non-trivial since
it's varargs.  And these ifdefs are ugly.

So, just mark this 'sk' thing __maybe_unused and kill the ifdefs.

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 net/bluetooth/rfcomm/sock.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index ffaa6b0..d3fc6fc 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -787,12 +787,10 @@ static int rfcomm_sock_getsockopt(struct socket *sock, int level, int optname, c
 
 static int rfcomm_sock_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 {
-#if defined(CONFIG_BT_RFCOMM_TTY) || defined(CONFIG_BT_RFCOMM_DEBUG)
-	struct sock *sk = sock->sk;
-#endif
+	struct sock *sk __maybe_unused = sock->sk;
 	int err;
 
-	BT_DBG("sk %p cmd %x arg %lx", sock, cmd, arg);
+	BT_DBG("sk %p cmd %x arg %lx", sk, cmd, arg);
 
 	err = bt_sock_ioctl(sock, cmd, arg);
 
-- 
1.5.6.5
