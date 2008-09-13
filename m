From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH-next20080913] net: compile fix depca.c
Date: Sat, 13 Sep 2008 01:19:34 -0700
Message-ID: <1221293974.6518.2.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.171]:1412 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754499AbYIMITh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 13 Sep 2008 04:19:37 -0400
Received: by wf-out-1314.google.com with SMTP id 27so1151426wfd.4
        for <linux-next@vger.kernel.org>; Sat, 13 Sep 2008 01:19:36 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>, Hannes Reinecke <hare@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

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
