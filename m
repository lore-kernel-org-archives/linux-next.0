From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Sun, 03 Feb 2019 20:26:06 -0800 (PST)
Message-ID: <20190203.202606.1052226767975507689.davem@davemloft.net>
References: <20190204104427.0c0da12d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204104427.0c0da12d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, deepa.kernel@gmail.com, gustavo@embeddedor.com, keescook@chromium.org
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 4 Feb 2019 10:44:27 +1100

> After merging the net-next tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> net/core/sock.c: In function 'sock_setsockopt':
> net/core/sock.c:914:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    sock_set_flag(sk, SOCK_TSTAMP_NEW);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> net/core/sock.c:915:2: note: here
>   case SO_TIMESTAMPING_OLD:
>   ^~~~
> 
> Introduced by commit
> 
>   9718475e6908 ("socket: Add SO_TIMESTAMPING_NEW")

Thanks, I just pushed the following:

====================
[PATCH] net: Fix fall through warning in y2038 tstamp changes.

net/core/sock.c: In function 'sock_setsockopt':
net/core/sock.c:914:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   sock_set_flag(sk, SOCK_TSTAMP_NEW);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
net/core/sock.c:915:2: note: here
  case SO_TIMESTAMPING_OLD:
  ^~~~

Fixes: 9718475e6908 ("socket: Add SO_TIMESTAMPING_NEW")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: David S. Miller <davem@davemloft.net>
---
 net/core/sock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/core/sock.c b/net/core/sock.c
index a8904ae40713..71ded4d8025c 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -912,6 +912,7 @@ int sock_setsockopt(struct socket *sock, int level, int optname,
 
 	case SO_TIMESTAMPING_NEW:
 		sock_set_flag(sk, SOCK_TSTAMP_NEW);
+		/* fall through */
 	case SO_TIMESTAMPING_OLD:
 		if (val & ~SOF_TIMESTAMPING_MASK) {
 			ret = -EINVAL;
-- 
2.20.1
