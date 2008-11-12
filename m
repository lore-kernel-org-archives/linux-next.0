From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: linux-next: Tree for November 12 - lguest build failure
Date: Wed, 12 Nov 2008 14:41:02 +0530
Message-ID: <20081112091102.GA8063@linux.vnet.ibm.com>
References: <20081112182818.6e259488.sfr@canb.auug.org.au>
Reply-To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from E23SMTP02.au.ibm.com ([202.81.18.163]:49367 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751129AbYKLJL0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Nov 2008 04:11:26 -0500
Content-Disposition: inline
In-Reply-To: <20081112182818.6e259488.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rusty@rustcorp.com.au
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfr@canb.auug.org.au, lguest@ozlabs.org

Hi Rusty,

 lguest build fails with next-20081112 kernel,

drivers/lguest/lguest_device.c: In function =E2=80=98lg_find_vq=E2=80=99=
:
drivers/lguest/lguest_device.c:252: error: too many arguments to functi=
on =E2=80=98vring_size=E2=80=99
make[2]: *** [drivers/lguest/lguest_device.o] Error 1

removing the extra argument passed to vring_size function.

Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
--
--- linux-2.6/drivers/lguest/lguest_device.c	2008-09-22 15:32:33.000000=
000 +0530
+++ linux-2.6/drivers/lguest/~lguest_device.c	2008-11-12 14:16:17.00000=
0000 +0530
@@ -249,8 +249,7 @@ static struct virtqueue *lg_find_vq(stru
 	       (unsigned long)lvq->config.pfn << PAGE_SHIFT);
 	/* Figure out how many pages the ring will take, and map that memory =
*/
 	lvq->pages =3D lguest_map((unsigned long)lvq->config.pfn << PAGE_SHIF=
T,
-				DIV_ROUND_UP(vring_size(lvq->config.num,
-							PAGE_SIZE),
+				DIV_ROUND_UP(vring_size(lvq->config.num),
 					     PAGE_SIZE));
 	if (!lvq->pages) {
 		err =3D -ENOMEM;
--=20
Thanks & Regards,
Kamalesh Babulal,
Linux Technology Center,
IBM, ISTL.
