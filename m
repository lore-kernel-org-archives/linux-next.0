From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH 2/2] Staging: comedi: data.c should include delay.h
Date: Wed, 13 May 2009 17:23:42 +0400
Message-ID: <20090513132342.GA16280@orion>
References: <1242219648-16165-1-git-send-email-a.beregalov@gmail.com> <1242219648-16165-2-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.224]:8908 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753765AbZEMNXw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2009 09:23:52 -0400
Content-Disposition: inline
In-Reply-To: <1242219648-16165-2-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@suse.de
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this build error:
.../data.c:86: error: implicit declaration of function 'udelay'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

This one is better.

 drivers/staging/comedi/kcomedilib/data.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/comedi/kcomedilib/data.c b/drivers/staging/comedi/kcomedilib/data.c
index 3e5fe2c..d808556 100644
--- a/drivers/staging/comedi/kcomedilib/data.c
+++ b/drivers/staging/comedi/kcomedilib/data.c
@@ -26,6 +26,7 @@
 #include "../comedidev.h"
 
 #include <linux/string.h>
+#include <linux/delay.h>
 
 int comedi_data_write(void *dev, unsigned int subdev, unsigned int chan,
 	unsigned int range, unsigned int aref, unsigned int data)
