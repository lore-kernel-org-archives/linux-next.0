From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Mon, 29 Jan 2018 12:50:28 +1100
Message-ID: <20180129125028.75774df6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kirill Tkhai <ktkhai@virtuozzo.com>, Dan Streetman <ddstreet@ieee.org>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from /home/sfr/next/next/include/linux/init_task.h:17:0,
                 from /home/sfr/next/next/init/init_task.c:2:
/home/sfr/next/next/include/net/net_namespace.h: In function 'check_net':
/home/sfr/next/next/include/net/net_namespace.h:228:21: error: passing argument 1 of 'atomic_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
  return atomic_read(&net->count) != 0;
                     ^
In file included from /home/sfr/next/next/include/linux/atomic.h:5:0,
                 from /home/sfr/next/next/include/linux/rcupdate.h:38,
                 from /home/sfr/next/next/include/linux/init_task.h:5,
                 from /home/sfr/next/next/init/init_task.c:2:
/home/sfr/next/next/arch/powerpc/include/asm/atomic.h:34:23: note: expected 'const atomic_t * {aka const struct <anonymous> *}' but argument is of type 'const refcount_t * {aka const struct refcount_struct *}'
 static __inline__ int atomic_read(const atomic_t *v)
                       ^~~~~~~~~~~

and several others similar.

Caused by commit

  273c28bc57ca ("net: Convert atomic_t net::count to refcount_t")

interacting with commit

  4ee806d51176 ("net: tcp: close sock if net namespace is exiting")

from the net tree.

I have applied the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Jan 2018 12:34:37 +1100
Subject: [PATCH] net: fixup for "net: tcp: close sock if net namespace is exiting"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/net/net_namespace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index 235105afa5e1..f306b2aa15a4 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -225,7 +225,7 @@ int net_eq(const struct net *net1, const struct net *net2)
 
 static inline int check_net(const struct net *net)
 {
-	return atomic_read(&net->count) != 0;
+	return refcount_read(&net->count) != 0;
 }
 
 void net_drop_ns(void *);
-- 
2.15.1

-- 
Cheers,
Stephen Rothwell
