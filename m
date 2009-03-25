From: Subrata Modak <tosubrata@gmail.com>
Subject: [PATCH] Re: Next March 25: staging/epl build break.
Date: Wed, 25 Mar 2009 19:37:13 +0530
Message-ID: <20090325140713.4919.64147.sendpatchset@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e8.ny.us.ibm.com ([32.97.182.138]:48221 "EHLO e8.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752734AbZCYOHU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Mar 2009 10:07:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Sachin Sant <sachinp@in.ibm.com>, Subrata Modak <tosubrata@gmail.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, LKML <linux-kernel@vger.kernel.org>

Hi Greg,

>Today's next x86 randconfig build failed with
>
>drivers/staging/epl/VirtualEthernetLinux.c: In function VEthAddInstanc=
e:
>drivers/staging/epl/VirtualEthernetLinux.c:302: error: struct net_devi=
ce has no member named open
>drivers/staging/epl/VirtualEthernetLinux.c:303: error: struct net_devi=
ce has no member named stop
>drivers/staging/epl/VirtualEthernetLinux.c:304: error: struct net_devi=
ce has no member named get_stats
>drivers/staging/epl/VirtualEthernetLinux.c:305: error: struct net_devi=
ce has no member named hard_start_xmit
>drivers/staging/epl/VirtualEthernetLinux.c:306: error: struct net_devi=
ce has no member named tx_timeout
>

The above build problem reported by Sachin can be fixed with the
patch below. However, it still will leave with the following
warnings, which i think can be ignored:

drivers/staging/epl/VirtualEthernetLinux.c:164: warning: =E2=80=98VEthO=
pen=E2=80=99 defined but not used
drivers/staging/epl/VirtualEthernetLinux.c:183: warning: =E2=80=98VEthC=
lose=E2=80=99 defined but not used
drivers/staging/epl/VirtualEthernetLinux.c:196: warning: =E2=80=98VEthX=
mit=E2=80=99 defined but not used
drivers/staging/epl/VirtualEthernetLinux.c:231: warning: =E2=80=98VEthG=
etStats=E2=80=99 defined but not used
drivers/staging/epl/VirtualEthernetLinux.c:238: warning: =E2=80=98VEthT=
imeout=E2=80=99 defined but not used

>.config attached.
>
>Thanks
>-Sachin

Signed-Off-By: Subrata Modak <subrata@linux.vnet.ibm.com>
---

--- a/linux-2.6.29/drivers/staging/epl/Kconfig	2009-03-24 04:42:14.0000=
00000 +0530
+++ b/linux-2.6.29/drivers/staging/epl/Kconfig	2009-03-25 19:01:18.0000=
00000 +0530
@@ -1,6 +1,7 @@
 config EPL
 	tristate "openPOWERLINK protocol stack"
 	depends on NET && HIGH_RES_TIMERS && X86
+        depends on COMPAT_NET_DEV_OPS
 	default N
 	---help---
 	  Enable support for the openPOWERLINK network protocol stack.
--- a/linux-2.6.29/drivers/staging/epl/VirtualEthernetLinux.c	2009-03-2=
5 18:38:06.000000000 +0530
+++ b/linux-2.6.29/drivers/staging/epl/VirtualEthernetLinux.c	2009-03-2=
5 19:03:16.000000000 +0530
@@ -299,11 +299,13 @@ tEplKernel VEthAddInstance(tEplDllkInitP
 		goto Exit;
 	}
=20
+#ifdef CONFIG_COMPAT_NET_DEV_OPS
 	pVEthNetDevice_g->open =3D VEthOpen;
 	pVEthNetDevice_g->stop =3D VEthClose;
 	pVEthNetDevice_g->get_stats =3D VEthGetStats;
 	pVEthNetDevice_g->hard_start_xmit =3D VEthXmit;
 	pVEthNetDevice_g->tx_timeout =3D VEthTimeout;
+#endif
 	pVEthNetDevice_g->watchdog_timeo =3D EPL_VETH_TX_TIMEOUT;
 	pVEthNetDevice_g->destructor =3D free_netdev;

--
Regards--
Subrata
=20
