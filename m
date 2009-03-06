From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree with the tip-core
 tree
Date: Fri, 6 Mar 2009 18:17:04 +1100
Message-ID: <20090306181704.f78b2a32.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51208 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751345AbZCFHRJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 02:17:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in
kernel/module.c between commit fbf59bc9d74d1fb30b8e0630743aff2806eafcea
("percpu: implement new dynamic percpu allocator") from the tip-core tree
and commit 6649b74fa7cb64421fce4f3cd4c40b3aa6f3208d ("kmemleak: Add
modules support") from the kmemleak tree.

Juts overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/module.c
index 6e7621d,92b60e7..0000000
--- a/kernel/module.c
+++ b/kernel/module.c
@@@ -51,7 -51,7 +51,8 @@@
  #include <linux/tracepoint.h>
  #include <linux/ftrace.h>
  #include <linux/async.h>
 +#include <linux/percpu.h>
+ #include <linux/kmemleak.h>
  
  #if 0
  #define DEBUGP printk
