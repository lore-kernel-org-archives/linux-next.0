From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH 2/2] Staging: comedi: data.c should include delay.h
Date: Wed, 13 May 2009 17:00:48 +0400
Message-ID: <1242219648-16165-2-git-send-email-a.beregalov@gmail.com>
References: <1242219648-16165-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.226]:4781 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754850AbZEMNBE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2009 09:01:04 -0400
In-Reply-To: <1242219648-16165-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@suse.de
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>

Fix this build error:
.../data.c:86: error: implicit declaration of function 'udelay'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/staging/comedi/kcomedilib/data.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/comedi/kcomedilib/data.c b/drivers/staging/comedi/kcomedilib/data.c
index 3e5fe2c..c26df4e 100644
--- a/drivers/staging/comedi/kcomedilib/data.c
+++ b/drivers/staging/comedi/kcomedilib/data.c
@@ -26,6 +26,7 @@
 #include "../comedidev.h"
 
 #include <linux/string.h>
+#include <asm/delay.h>
 
 int comedi_data_write(void *dev, unsigned int subdev, unsigned int chan,
 	unsigned int range, unsigned int aref, unsigned int data)
-- 
1.6.3
