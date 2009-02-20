From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for February 20
Date: Fri, 20 Feb 2009 17:32:06 +0100
Message-ID: <200902201732.06203.bzolnier@gmail.com>
References: <20090220201224.3f32ae24.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f161.google.com ([209.85.218.161]:65213 "EHLO
	mail-bw0-f161.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751752AbZBTQaa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Feb 2009 11:30:30 -0500
In-Reply-To: <20090220201224.3f32ae24.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Friday 20 February 2009, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090219:

I've just noticed stall patch version in ide tree so if you're
using ide this patch is also necessary (fixes hang on boot):

--- linux-next/drivers/ide/ide-iops.c	2009-02-20 18:00:28.000000000 +0100
+++ linux-2.6.git/drivers/ide/ide-iops.c	2009-02-19 18:31:04.000000000 +0100
@@ -468,9 +468,9 @@
 	unsigned long flags;
 
 	spin_lock_irqsave(&hwif->lock, flags);
-	if ((drive->atapi_flags & IDE_AFLAG_DRQ_INTERRUPT) &&
-	    (cmd->protocol == ATAPI_PROT_DMA ||
-	     cmd->protocol == ATAPI_PROT_PIO))
+	if ((cmd->protocol != ATAPI_PROT_DMA &&
+	     cmd->protocol != ATAPI_PROT_PIO) ||
+	    (drive->atapi_flags & IDE_AFLAG_DRQ_INTERRUPT))
 		__ide_set_handler(drive, handler, timeout);
 	hwif->tp_ops->exec_command(hwif, cmd->tf.command);
 	/*
