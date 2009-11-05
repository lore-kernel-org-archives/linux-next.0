From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: [PATCH net-next-2.6] net: net/ipv4/devinet.c cleanups
Date: Thu, 05 Nov 2009 05:39:56 +0100
Message-ID: <4AF2571C.7040700@gmail.com>
References: <20091105133041.a2aa30f7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw1.cosmosbay.com ([212.99.114.194]:52136 "EHLO
	gw1.cosmosbay.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751716AbZKEEkE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Nov 2009 23:40:04 -0500
In-Reply-To: <20091105133041.a2aa30f7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell a =E9crit :
> Hi Dave,
>=20
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>=20
> net/ipv4/devinet.c: In function 'inet_select_addr':
> net/ipv4/devinet.c:902: warning: label 'out' defined but not used
>=20
> Probably introduced by commit c6d14c84566d6b70ad9dc1618db0dec87cca930=
0
> ("net: Introduce for_each_netdev_rcu() iterator").
>=20

Thanks Stephen !

[PATCH net-next-2.6] net: net/ipv4/devinet.c cleanups

As pointed by Stephen Rothwell, commit c6d14c84 added a warning :

net/ipv4/devinet.c: In function 'inet_select_addr':
net/ipv4/devinet.c:902: warning: label 'out' defined but not used

delete unused 'out' label and do some cleanups as well

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>
---
 net/ipv4/devinet.c |   61 +++++++++++++++++++++++--------------------
 1 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/net/ipv4/devinet.c b/net/ipv4/devinet.c
index 8aa7a13..c2045f9 100644
--- a/net/ipv4/devinet.c
+++ b/net/ipv4/devinet.c
@@ -140,11 +140,11 @@ void in_dev_finish_destroy(struct in_device *idev=
)
 #endif
 	dev_put(dev);
 	if (!idev->dead)
-		printk("Freeing alive in_device %p\n", idev);
-	else {
+		pr_err("Freeing alive in_device %p\n", idev);
+	else
 		kfree(idev);
-	}
 }
+EXPORT_SYMBOL(in_dev_finish_destroy);
=20
 static struct in_device *inetdev_init(struct net_device *dev)
 {
@@ -159,7 +159,8 @@ static struct in_device *inetdev_init(struct net_de=
vice *dev)
 			sizeof(in_dev->cnf));
 	in_dev->cnf.sysctl =3D NULL;
 	in_dev->dev =3D dev;
-	if ((in_dev->arp_parms =3D neigh_parms_alloc(dev, &arp_tbl)) =3D=3D N=
ULL)
+	in_dev->arp_parms =3D neigh_parms_alloc(dev, &arp_tbl);
+	if (!in_dev->arp_parms)
 		goto out_kfree;
 	if (IPV4_DEVCONF(in_dev->cnf, FORWARDING))
 		dev_disable_lro(dev);
@@ -413,6 +414,7 @@ struct in_device *inetdev_by_index(struct net *net,=
 int ifindex)
 	rcu_read_unlock();
 	return in_dev;
 }
+EXPORT_SYMBOL(inetdev_by_index);
=20
 /* Called only from RTNL semaphored context. No locks. */
=20
@@ -558,7 +560,7 @@ static int inet_rtm_newaddr(struct sk_buff *skb, st=
ruct nlmsghdr *nlh, void *arg
  *	Determine a default network mask, based on the IP address.
  */
=20
-static __inline__ int inet_abc_len(__be32 addr)
+static inline int inet_abc_len(__be32 addr)
 {
 	int rc =3D -1;	/* Something else, probably a multicast. */
=20
@@ -647,13 +649,15 @@ int devinet_ioctl(struct net *net, unsigned int c=
md, void __user *arg)
 	rtnl_lock();
=20
 	ret =3D -ENODEV;
-	if ((dev =3D __dev_get_by_name(net, ifr.ifr_name)) =3D=3D NULL)
+	dev =3D __dev_get_by_name(net, ifr.ifr_name);
+	if (!dev)
 		goto done;
=20
 	if (colon)
 		*colon =3D ':';
=20
-	if ((in_dev =3D __in_dev_get_rtnl(dev)) !=3D NULL) {
+	in_dev =3D __in_dev_get_rtnl(dev);
+	if (in_dev) {
 		if (tryaddrmatch) {
 			/* Matthias Andree */
 			/* compare label and address (4.4BSD style) */
@@ -721,7 +725,8 @@ int devinet_ioctl(struct net *net, unsigned int cmd=
, void __user *arg)
=20
 		if (!ifa) {
 			ret =3D -ENOBUFS;
-			if ((ifa =3D inet_alloc_ifa()) =3D=3D NULL)
+			ifa =3D inet_alloc_ifa();
+			if (!ifa)
 				break;
 			if (colon)
 				memcpy(ifa->ifa_label, ifr.ifr_name, IFNAMSIZ);
@@ -823,10 +828,10 @@ static int inet_gifconf(struct net_device *dev, c=
har __user *buf, int len)
 	struct ifreq ifr;
 	int done =3D 0;
=20
-	if (!in_dev || (ifa =3D in_dev->ifa_list) =3D=3D NULL)
+	if (!in_dev)
 		goto out;
=20
-	for (; ifa; ifa =3D ifa->ifa_next) {
+	for (ifa =3D in_dev->ifa_list; ifa; ifa =3D ifa->ifa_next) {
 		if (!buf) {
 			done +=3D sizeof(ifr);
 			continue;
@@ -877,16 +882,17 @@ __be32 inet_select_addr(const struct net_device *=
dev, __be32 dst, int scope)
 			addr =3D ifa->ifa_local;
 	} endfor_ifa(in_dev);
=20
-no_in_dev:
 	if (addr)
 		goto out_unlock;
+no_in_dev:
=20
 	/* Not loopback addresses on loopback should be preferred
 	   in this case. It is importnat that lo is the first interface
 	   in dev_base list.
 	 */
 	for_each_netdev_rcu(net, dev) {
-		if ((in_dev =3D __in_dev_get_rcu(dev)) =3D=3D NULL)
+		in_dev =3D __in_dev_get_rcu(dev);
+		if (!in_dev)
 			continue;
=20
 		for_primary_ifa(in_dev) {
@@ -899,9 +905,9 @@ no_in_dev:
 	}
 out_unlock:
 	rcu_read_unlock();
-out:
 	return addr;
 }
+EXPORT_SYMBOL(inet_select_addr);
=20
 static __be32 confirm_addr_indev(struct in_device *in_dev, __be32 dst,
 			      __be32 local, int scope)
@@ -937,7 +943,7 @@ static __be32 confirm_addr_indev(struct in_device *=
in_dev, __be32 dst,
 		}
 	} endfor_ifa(in_dev);
=20
-	return same? addr : 0;
+	return same ? addr : 0;
 }
=20
 /*
@@ -960,7 +966,8 @@ __be32 inet_confirm_addr(struct in_device *in_dev,
 	net =3D dev_net(in_dev->dev);
 	rcu_read_lock();
 	for_each_netdev_rcu(net, dev) {
-		if ((in_dev =3D __in_dev_get_rcu(dev))) {
+		in_dev =3D __in_dev_get_rcu(dev);
+		if (in_dev) {
 			addr =3D confirm_addr_indev(in_dev, dst, local, scope);
 			if (addr)
 				break;
@@ -979,14 +986,16 @@ int register_inetaddr_notifier(struct notifier_bl=
ock *nb)
 {
 	return blocking_notifier_chain_register(&inetaddr_chain, nb);
 }
+EXPORT_SYMBOL(register_inetaddr_notifier);
=20
 int unregister_inetaddr_notifier(struct notifier_block *nb)
 {
 	return blocking_notifier_chain_unregister(&inetaddr_chain, nb);
 }
+EXPORT_SYMBOL(unregister_inetaddr_notifier);
=20
-/* Rename ifa_labels for a device name change. Make some effort to pre=
serve existing
- * alias numbering and to create unique labels if possible.
+/* Rename ifa_labels for a device name change. Make some effort to pre=
serve
+ * existing alias numbering and to create unique labels if possible.
 */
 static void inetdev_changename(struct net_device *dev, struct in_devic=
e *in_dev)
 {
@@ -1005,11 +1014,10 @@ static void inetdev_changename(struct net_devic=
e *dev, struct in_device *in_dev)
 			sprintf(old, ":%d", named);
 			dot =3D old;
 		}
-		if (strlen(dot) + strlen(dev->name) < IFNAMSIZ) {
+		if (strlen(dot) + strlen(dev->name) < IFNAMSIZ)
 			strcat(ifa->ifa_label, dot);
-		} else {
+		else
 			strcpy(ifa->ifa_label + (IFNAMSIZ - strlen(dot) - 1), dot);
-		}
 skip:
 		rtmsg_ifa(RTM_NEWADDR, ifa, NULL, 0);
 	}
@@ -1056,8 +1064,9 @@ static int inetdev_event(struct notifier_block *t=
his, unsigned long event,
 		if (!inetdev_valid_mtu(dev->mtu))
 			break;
 		if (dev->flags & IFF_LOOPBACK) {
-			struct in_ifaddr *ifa;
-			if ((ifa =3D inet_alloc_ifa()) !=3D NULL) {
+			struct in_ifaddr *ifa =3D inet_alloc_ifa();
+
+			if (ifa) {
 				ifa->ifa_local =3D
 				  ifa->ifa_address =3D htonl(INADDR_LOOPBACK);
 				ifa->ifa_prefixlen =3D 8;
@@ -1178,7 +1187,8 @@ static int inet_dump_ifaddr(struct sk_buff *skb, =
struct netlink_callback *cb)
 			goto cont;
 		if (idx > s_idx)
 			s_ip_idx =3D 0;
-		if ((in_dev =3D __in_dev_get_rtnl(dev)) =3D=3D NULL)
+		in_dev =3D __in_dev_get_rtnl(dev);
+		if (!in_dev)
 			goto cont;
=20
 		for (ifa =3D in_dev->ifa_list, ip_idx =3D 0; ifa;
@@ -1673,8 +1683,3 @@ void __init devinet_init(void)
 	rtnl_register(PF_INET, RTM_GETADDR, NULL, inet_dump_ifaddr);
 }
=20
-EXPORT_SYMBOL(in_dev_finish_destroy);
-EXPORT_SYMBOL(inet_select_addr);
-EXPORT_SYMBOL(inetdev_by_index);
-EXPORT_SYMBOL(register_inetaddr_notifier);
-EXPORT_SYMBOL(unregister_inetaddr_notifier);
