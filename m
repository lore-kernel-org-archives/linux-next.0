From: Roland Dreier <rdreier@cisco.com>
Subject: [ofa-general] Re: linux-next: origin tree build failure
Date: Mon, 29 Dec 2008 12:18:06 -0800
Message-ID: <adaljtyu45d.fsf@cisco.com>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
	<ada4p0nve4r.fsf@cisco.com> <1230544737.4261.33.camel@alst60>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <1230544737.4261.33.camel@alst60> (Aleksey Senin's message of
	"Mon, 29 Dec 2008 11:58:57 +0200")
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Aleksey Senin <alekseys@voltaire.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, "general@lists.openfabrics.org" <general@lists.openfabrics.org>
List-Id: linux-next.vger.kernel.org

Something like the following maybe?  (This turns off the RDMA CM if
INFINIBAND=y and IPV6=m -- another possibility would be to just turn off
RDMA CM IPv6 support in the case that IB is build-in but IPv6 is
modular, but that seems like a worse idea overall)

diff --git a/drivers/infiniband/Kconfig b/drivers/infiniband/Kconfig
index a5dc78a..538a0ba 100644
--- a/drivers/infiniband/Kconfig
+++ b/drivers/infiniband/Kconfig
@@ -36,7 +36,7 @@ config INFINIBAND_USER_MEM
 
 config INFINIBAND_ADDR_TRANS
 	bool
-	depends on INET
+	depends on INET && !(INFINIBAND = y && IPV6 = m)
 	default y
 
 source "drivers/infiniband/hw/mthca/Kconfig"
diff --git a/drivers/infiniband/core/addr.c b/drivers/infiniband/core/addr.c
index d98b05b..ec7abb5 100644
--- a/drivers/infiniband/core/addr.c
+++ b/drivers/infiniband/core/addr.c
@@ -128,6 +128,7 @@ int rdma_translate_ip(struct sockaddr *addr, struct rdma_dev_addr *dev_addr)
 		ret = rdma_copy_addr(dev_addr, dev, NULL);
 		dev_put(dev);
 		break;
+#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
 	case AF_INET6:
 		for_each_netdev(&init_net, dev) {
 			if (ipv6_chk_addr(&init_net,
@@ -138,6 +139,7 @@ int rdma_translate_ip(struct sockaddr *addr, struct rdma_dev_addr *dev_addr)
 			}
 		}
 		break;
+#endif
 	default:
 		break;
 	}
@@ -179,10 +181,11 @@ static void addr_send_arp(struct sockaddr *dst_in)
 {
 	struct rtable *rt;
 	struct flowi fl;
-	struct dst_entry *dst;
 
 	memset(&fl, 0, sizeof fl);
-	if (dst_in->sa_family == AF_INET)  {
+
+	switch (dst_in->sa_family) {
+	case AF_INET:
 		fl.nl_u.ip4_u.daddr =
 			((struct sockaddr_in *) dst_in)->sin_addr.s_addr;
 
@@ -191,8 +194,13 @@ static void addr_send_arp(struct sockaddr *dst_in)
 
 		neigh_event_send(rt->u.dst.neighbour, NULL);
 		ip_rt_put(rt);
+		break;
+
+#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
+	case AF_INET6:
+	{
+		struct dst_entry *dst;
 
-	} else {
 		fl.nl_u.ip6_u.daddr =
 			((struct sockaddr_in6 *) dst_in)->sin6_addr;
 
@@ -202,6 +210,9 @@ static void addr_send_arp(struct sockaddr *dst_in)
 
 		neigh_event_send(dst->neighbour, NULL);
 		dst_release(dst);
+		break;
+	}
+#endif
 	}
 }
 
@@ -254,6 +265,7 @@ out:
 	return ret;
 }
 
+#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
 static int addr6_resolve_remote(struct sockaddr_in6 *src_in,
 			       struct sockaddr_in6 *dst_in,
 			       struct rdma_dev_addr *addr)
@@ -282,6 +294,14 @@ static int addr6_resolve_remote(struct sockaddr_in6 *src_in,
 	dst_release(dst);
 	return ret;
 }
+#else
+static int addr6_resolve_remote(struct sockaddr_in6 *src_in,
+			       struct sockaddr_in6 *dst_in,
+			       struct rdma_dev_addr *addr)
+{
+	return -EADDRNOTAVAIL;
+}
+#endif
 
 static int addr_resolve_remote(struct sockaddr *src_in,
 				struct sockaddr *dst_in,
@@ -340,7 +360,9 @@ static int addr_resolve_local(struct sockaddr *src_in,
 	struct net_device *dev;
 	int ret;
 
-	if (dst_in->sa_family == AF_INET) {
+	switch (dst_in->sa_family) {
+	case AF_INET:
+	{
 		__be32 src_ip = ((struct sockaddr_in *) src_in)->sin_addr.s_addr;
 		__be32 dst_ip = ((struct sockaddr_in *) dst_in)->sin_addr.s_addr;
 
@@ -362,7 +384,12 @@ static int addr_resolve_local(struct sockaddr *src_in,
 				memcpy(addr->dst_dev_addr, dev->dev_addr, MAX_ADDR_LEN);
 		}
 		dev_put(dev);
-	} else {
+		break;
+	}
+
+#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
+	case AF_INET6:
+	{
 		struct in6_addr *a;
 
 		for_each_netdev(&init_net, dev)
@@ -390,6 +417,13 @@ static int addr_resolve_local(struct sockaddr *src_in,
 			if (!ret)
 				memcpy(addr->dst_dev_addr, dev->dev_addr, MAX_ADDR_LEN);
 		}
+		break;
+	}
+#endif
+
+	default:
+		ret = -EADDRNOTAVAIL;
+		break;
 	}
 
 	return ret;
