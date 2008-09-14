From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: linux-next: net tree build failure (depca)
Date: Sun, 14 Sep 2008 13:49:36 -0700
Message-ID: <1221425376.6397.1.camel@brick>
References: <20080913150326.245fbb6f.sfr@canb.auug.org.au>
	 <20080913080438.30a37469.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.172]:17816 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753736AbYINUtj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 14 Sep 2008 16:49:39 -0400
Received: by wf-out-1314.google.com with SMTP id 27so1730797wfd.4
        for <linux-next@vger.kernel.org>; Sun, 14 Sep 2008 13:49:39 -0700 (PDT)
In-Reply-To: <20080913080438.30a37469.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Julius Volz <juliusv@google.com>, Simon Horman <horms@verge.net.au>, Greg KH <gregkh@suse.de>, Hannes Reinecke <hare@suse.de>

On Sat, 2008-09-13 at 08:04 -0700, Randy Dunlap wrote:
> Also this one on i386:
>=20
> drivers/net/depca.c:404: error: implicit declaration of function 'dep=
ca_common_remove'
> drivers/net/depca.c:1602: error: static declaration of 'depca_common_=
remove' follows non-static declaration
> drivers/net/depca.c:404: error: previous implicit declaration of 'dep=
ca_common_remove' was here
> make[2]: *** [drivers/net/depca.o] Error 1
>=20

I'd already sent a patch for that to those responsible:

=46rom: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH] net: compile fix depca.c

Adding accessors to the ->driver_data field missed a forward
declaration that is needed to compile.

Caused by:
commit 107aeb9753159da848f066b26557f0aaab900a90
Author: Hannes Reinecke <hare@suse.de>
Date:   Wed Sep 10 14:16:04 2008 +0200

    Driver core: Use dev_get_drvdata() accessors

Otherwise:
drivers/net/depca.c:404:9: error: undefined identifier 'depca_common_re=
move'
drivers/net/depca.c: In function =E2=80=98depca_isa_remove=E2=80=99:
drivers/net/depca.c:404: error: implicit declaration of function =E2=80=
=98depca_common_remove=E2=80=99
drivers/net/depca.c: At top level:
drivers/net/depca.c:1601: error: static declaration of =E2=80=98depca_c=
ommon_remove=E2=80=99 follows non-static declaration
drivers/net/depca.c:404: error: previous implicit declaration of =E2=80=
=98depca_common_remove=E2=80=99 was here

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
 drivers/net/depca.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/depca.c b/drivers/net/depca.c
index 6ce66e0..d72c6bc 100644
--- a/drivers/net/depca.c
+++ b/drivers/net/depca.c
@@ -398,6 +398,7 @@ static struct mca_driver depca_mca_driver =3D {
 #endif
=20
 static int depca_isa_probe (struct platform_device *);
+static int depca_common_remove(struct net_device *dev);
=20
 static int __devexit depca_isa_remove(struct platform_device *pdev)
 {
--=20
1.6.0.1.650.gbf45a
