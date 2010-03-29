From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 14/17] input: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:42 +0900
Message-ID: <1269885165-18617-15-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:57101 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755387Ab0C2RxC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 13:53:02 -0400
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/char/sysrq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/sysrq.c b/drivers/char/sysrq.c
index 532c56c..593562d 100644
--- a/drivers/char/sysrq.c
+++ b/drivers/char/sysrq.c
@@ -41,7 +41,7 @@
 #include <linux/hrtimer.h>
 #include <linux/oom.h>
 #include <linux/input.h>
-#include <linux/gfp.h>
+#include <linux/slab.h>
 
 #include <asm/ptrace.h>
 #include <asm/irq_regs.h>
-- 
1.6.4.2
