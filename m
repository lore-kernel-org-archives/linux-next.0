From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] DMA: PL330: Fix build error (on linux-next-20120924)
Date: Tue, 25 Sep 2012 09:50:00 +0530
Message-ID: <1348546800-15857-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:54973 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751978Ab2IYEXr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Sep 2012 00:23:47 -0400
Received: by pbbrr4 with SMTP id rr4so8356942pbb.19
        for <linux-next@vger.kernel.org>; Mon, 24 Sep 2012 21:23:47 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: sachin.kamat@linaro.org, patches@linaro.org, Inderpal Singh <inderpal.singh@linaro.org>, Vinod Koul <vinod.koul@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>

Auto resolution of merge conflict between commits 61c6e753 (DMA: PL330:
Check the pointer returned by kzalloc) from Linus tree and 7c71b8eb
(DMA: PL330: Remove redundant runtime_suspend/resume functions) from sl=
ave-dma
tree probably led to this build error.

drivers/dma/pl330.c: In function =E2=80=98pl330_probe=E2=80=99:
drivers/dma/pl330.c:2921:3: error: label =E2=80=98probe_err5=E2=80=99 u=
sed but not defined

Cc: Inderpal Singh <inderpal.singh@linaro.org>
Cc: Vinod Koul <vinod.koul@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/dma/pl330.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index dcb88b0..13cc576 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2918,7 +2918,7 @@ pl330_probe(struct amba_device *adev, const struc=
t amba_id *id)
 	if (!pdmac->peripherals) {
 		ret =3D -ENOMEM;
 		dev_err(&adev->dev, "unable to allocate pdmac->peripherals\n");
-		goto probe_err5;
+		goto probe_err4;
 	}
=20
 	for (i =3D 0; i < num_chan; i++) {
--=20
1.7.4.1
