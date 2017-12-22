From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Fri, 22 Dec 2017 11:45:19 +1100
Message-ID: <20171222114519.612087d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54617 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753313AbdLVApW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Dec 2017 19:45:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ido Schimmel <idosch@mellanox.com>, Eric Dumazet <edumazet@google.com>

Hi all,

After merging the net-next tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

net/ipv6/route.c: In function 'inet6_rtm_getroute':
net/ipv6/route.c:4324:25: error: 'struct dst_entry' has no member named 'from'
  if (fibmatch && rt->dst.from) {
                         ^
In file included from include/linux/uio.h:12:0,
                 from include/linux/socket.h:8,
                 from net/ipv6/route.c:34:
net/ipv6/route.c:4325:46: error: 'struct dst_entry' has no member named 'from'
   struct rt6_info *ort = container_of(rt->dst.from,
                                              ^
include/linux/kernel.h:929:26: note: in definition of macro 'container_of'
  void *__mptr = (void *)(ptr);     \
                          ^
In file included from include/linux/kernel.h:10:0,
                 from include/linux/uio.h:12,
                 from include/linux/socket.h:8,
                 from net/ipv6/route.c:34:
net/ipv6/route.c:4325:46: error: 'struct dst_entry' has no member named 'from'
   struct rt6_info *ort = container_of(rt->dst.from,
                                              ^
include/linux/compiler.h:301:19: note: in definition of macro '__compiletime_assert'
   bool __cond = !(condition);    \
                   ^
include/linux/compiler.h:324:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
include/linux/build_bug.h:47:37: note: in expansion of macro 'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
include/linux/kernel.h:930:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
  ^
include/linux/kernel.h:930:20: note: in expansion of macro '__same_type'
  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                    ^
net/ipv6/route.c:4325:26: note: in expansion of macro 'container_of'
   struct rt6_info *ort = container_of(rt->dst.from,
                          ^
net/ipv6/route.c:4325:46: error: 'struct dst_entry' has no member named 'from'
   struct rt6_info *ort = container_of(rt->dst.from,
                                              ^
include/linux/compiler.h:301:19: note: in definition of macro '__compiletime_assert'
   bool __cond = !(condition);    \
                   ^
include/linux/compiler.h:324:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
include/linux/build_bug.h:47:37: note: in expansion of macro 'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
include/linux/kernel.h:930:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
  ^
include/linux/kernel.h:931:6: note: in expansion of macro '__same_type'
     !__same_type(*(ptr), void),   \
      ^
net/ipv6/route.c:4325:26: note: in expansion of macro 'container_of'
   struct rt6_info *ort = container_of(rt->dst.from,
                          ^

Caused by commit

  3a2232e92e87 ("ipv6: Move dst->from into struct rt6_info")

interacting with commit

  58acfd714e6b ("ipv6: Honor specified parameters in fibmatch lookup"

from the net tree.

I have added the following merge fix patch for today (I am guessing
a bit here):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 22 Dec 2017 11:25:13 +1100
Subject: [PATCH] ipv6: fix up for "ipv6: Move dst->from into struct rt6_info"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 net/ipv6/route.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 4efaac956f0c..2490280b3394 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -4321,9 +4321,8 @@ static int inet6_rtm_getroute(struct sk_buff *in_skb, struct nlmsghdr *nlh,
 		goto errout;
 	}
 
-	if (fibmatch && rt->dst.from) {
-		struct rt6_info *ort = container_of(rt->dst.from,
-						    struct rt6_info, dst);
+	if (fibmatch && rt->from) {
+		struct rt6_info *ort = rt->from;
 
 		dst_hold(&ort->dst);
 		ip6_rt_put(rt);
-- 
2.15.0

-- 
Cheers,
Stephen Rothwell
