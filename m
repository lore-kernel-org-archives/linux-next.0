From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH 1/2] Staging: comedi: comedi_test.c should include timer.h
Date: Wed, 13 May 2009 17:00:47 +0400
Message-ID: <1242219648-16165-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.226]:4781 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751946AbZEMNA4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2009 09:00:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@suse.de
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>

Fix this build error:
.../comedi_test.c:82: error: field timer has incomplete type
.../comedi_test.c: In function waveform_ai_interrupt:
.../comedi_test.c:188: error: implicit declaration of function mod_timer
.../comedi_test.c:188: error: jiffies undeclared (first use in this function)

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/staging/comedi/drivers/comedi_test.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/comedi/drivers/comedi_test.c b/drivers/staging/comedi/drivers/comedi_test.c
index 93ed1a0..9b8cf62 100644
--- a/drivers/staging/comedi/drivers/comedi_test.c
+++ b/drivers/staging/comedi/drivers/comedi_test.c
@@ -55,6 +55,7 @@ zero volts).
 #include <asm/div64.h>
 
 #include "comedi_fc.h"
+#include <linux/timer.h>
 
 /* Board descriptions */
 struct waveform_board {
-- 
1.6.3
