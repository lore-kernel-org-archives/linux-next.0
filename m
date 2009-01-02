From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] 9p: fix RDMA dependency
Date: Fri, 02 Jan 2009 10:18:42 -0800
Message-ID: <495E5A82.9000603@oracle.com>
References: <20090102203303.f314a99a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:33449 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757715AbZABSTd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Jan 2009 13:19:33 -0500
In-Reply-To: <20090102203303.f314a99a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Eric Van Hensbergen <ericvh@gmail.com>, Roland Dreier <rolandd@cisco.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

NET_9P_RDMA uses Infiniband RDMA, which is controlled by the
INFINIBAND_ADDR_TRANS kconfig symbol, so fix NET_9P so that it builds
cleanly.

Found by inspection (suspicion) and then forced via kconfig.

ERROR: "rdma_destroy_id" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_connect" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_create_id" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_create_qp" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_resolve_route" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_disconnect" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_resolve_addr" [net/9p/9pnet_rdma.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc:      Eric Van Hensbergen <ericvh@gmail.com>
cc:      Roland Dreier <rolandd@cisco.com>
---
 net/9p/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090102.orig/net/9p/Kconfig
+++ linux-next-20090102/net/9p/Kconfig
@@ -23,7 +23,7 @@ config NET_9P_VIRTIO
 	  guest partitions and a host partition.
 
 config NET_9P_RDMA
-	depends on INET && INFINIBAND && EXPERIMENTAL
+	depends on INET && INFINIBAND_ADDR_TRANS && EXPERIMENTAL
 	tristate "9P RDMA Transport (Experimental)"
 	help
 	  This builds support for an RDMA transport.

-- 
~Randy
