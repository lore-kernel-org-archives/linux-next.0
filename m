From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: firmware tree build failure
Date: Tue, 22 Jul 2008 17:57:33 +1000
Message-ID: <20080722175733.d436067a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37527 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752150AbYGVH5f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 03:57:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>

Hi Dave,

Today's linux-next build () failed like this:

drivers/scsi/qlogicpti.c:55:27: qlogicpti_asm.c: No such file or directory

I applied the following patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From c64dd1dfd140eb249684d85e927c7bae6f9d5328 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Jul 2008 17:56:30 +1000
Subject: [PATCH] firmware: conversion fallout in qlogicpti.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/qlogicpti.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/qlogicpti.c b/drivers/scsi/qlogicpti.c
index 3e71436..17df63e 100644
--- a/drivers/scsi/qlogicpti.c
+++ b/drivers/scsi/qlogicpti.c
@@ -52,8 +52,6 @@
 
 #define DEFAULT_LOOP_COUNT	10000
 
-#include "qlogicpti_asm.c"
-
 static struct qlogicpti *qptichain = NULL;
 static DEFINE_SPINLOCK(qptichain_lock);
 
-- 
1.5.6.3
