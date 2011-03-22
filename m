From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Tue, 22 Mar 2011 04:54:21 -0300
Message-ID: <4D8855AD.8040804@infradead.org>
References: <20110322121409.f4bb8a4e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:37899 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755053Ab1CVHy0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Mar 2011 03:54:26 -0400
In-Reply-To: <20110322121409.f4bb8a4e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Em 21-03-2011 22:14, Stephen Rothwell escreveu:
> Hi Mauro,
> 
> After merging the v4l-dvb tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/media/media-devnode.c:40:28: error: linux/smp_lock.h: No such file or directory

It got removed by this commit: 4ba8216cd90560bc402f52076f64d8546e8aefcb.

There's no reason for the header to be there at media-devnode.c, as it doesn't use
BKL.

> 
> Caused by commit cb3c186e31be ("[media] media: Media device node
> support").  The BKL is no more ...
> 
> Why is a patch with Author date 2009-12-09 turning up in linux-next today?

Because the Media Controller stuff is under development since 2008, but it took a long
time to be mature enough to be merged.

> 
> I have used the v4l-dvb tree from next-20110321 for today.
> 

The fix patch is as simple as the enclosed one. I'm folding it together with the
original changeset (cb3c186e31be), in order to avoid bisect issues.

Thanks!
Mauro

-

commit 1941c46894a60f4c5365fdcce9258f86d3691ae3
Author: Mauro Carvalho Chehab <mchehab@redhat.com>
Date:   Tue Mar 22 04:43:47 2011 -0300

    [media] media-devnode: Don't include linux/smp_lock.h
    
    drivers/media/media-devnode.c:40:28: error: linux/smp_lock.h: No such file or directory
    
    Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>

diff --git a/drivers/media/media-devnode.c b/drivers/media/media-devnode.c
index 5509984..af5263c 100644
--- a/drivers/media/media-devnode.c
+++ b/drivers/media/media-devnode.c
@@ -37,7 +37,6 @@
 #include <linux/kmod.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
-#include <linux/smp_lock.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
