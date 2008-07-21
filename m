From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net-current tree build failure
Date: Mon, 21 Jul 2008 10:58:52 +1000
Message-ID: <20080721105852.d49ec615.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__21_Jul_2008_10_58_52_+1000_bq.aF8kISfoZ+Gp1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53384 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754344AbYGUA7D (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 20 Jul 2008 20:59:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__21_Jul_2008_10_58_52_+1000_bq.aF8kISfoZ+Gp1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

net/built-in.o: In function `.dev_queue_xmit':
(.text+0x125a4): undefined reference to `.qdisc_calculate_pkt_len'
net/built-in.o: In function `.__qdisc_destroy':
sch_generic.c:(.text+0x28710): undefined reference to `.qdisc_put_stab'

This config has CONFIG_NET_SCHED not set.

I applied the patch below, but it is probably not the correct solution.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 4534fc79b6efe71fbd478271238ce3122e07e010 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 21 Jul 2008 10:51:13 +1000
Subject: [PATCH] net: fix schedule breakage

The powerpc ppc64_defconfig build failed like this:

net/built-in.o: In function `.dev_queue_xmit':
(.text+0x125a4): undefined reference to `.qdisc_calculate_pkt_len'
net/built-in.o: In function `.__qdisc_destroy':
sch_generic.c:(.text+0x28710): undefined reference to `.qdisc_put_stab'

These changes make the kernel build.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 net/sched/Makefile |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/sched/Makefile b/net/sched/Makefile
index 1d2b0f7..1b133d2 100644
--- a/net/sched/Makefile
+++ b/net/sched/Makefile
@@ -4,7 +4,8 @@
=20
 obj-y	:=3D sch_generic.o
=20
-obj-$(CONFIG_NET_SCHED)		+=3D sch_api.o sch_blackhole.o
+obj-y				+=3D sch_api.o
+obj-$(CONFIG_NET_SCHED)		+=3D sch_blackhole.o
 obj-$(CONFIG_NET_CLS)		+=3D cls_api.o
 obj-$(CONFIG_NET_CLS_ACT)	+=3D act_api.o
 obj-$(CONFIG_NET_ACT_POLICE)	+=3D act_police.o
@@ -14,7 +15,7 @@ obj-$(CONFIG_NET_ACT_IPT)	+=3D act_ipt.o
 obj-$(CONFIG_NET_ACT_NAT)	+=3D act_nat.o
 obj-$(CONFIG_NET_ACT_PEDIT)	+=3D act_pedit.o
 obj-$(CONFIG_NET_ACT_SIMP)	+=3D act_simple.o
-obj-$(CONFIG_NET_SCH_FIFO)	+=3D sch_fifo.o
+obj-y				+=3D sch_fifo.o
 obj-$(CONFIG_NET_SCH_CBQ)	+=3D sch_cbq.o
 obj-$(CONFIG_NET_SCH_HTB)	+=3D sch_htb.o
 obj-$(CONFIG_NET_SCH_HFSC)	+=3D sch_hfsc.o
--=20
1.5.6.2


--Signature=_Mon__21_Jul_2008_10_58_52_+1000_bq.aF8kISfoZ+Gp1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiD30wACgkQjjKRsyhoI8xQ4QCfWn8BLoEslkk39et1UGthe7dW
yOcAnid6QTkl65g8D8XW2lMUjccgO+tv
=X2K8
-----END PGP SIGNATURE-----

--Signature=_Mon__21_Jul_2008_10_58_52_+1000_bq.aF8kISfoZ+Gp1--
