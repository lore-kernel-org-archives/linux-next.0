From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the tracing
 tree
Date: Fri, 6 Mar 2009 17:27:21 +1100
Message-ID: <20090306172721.40347f41.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38873 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751199AbZCFG1Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 01:27:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
kernel/trace/ring_buffer.c between commit
a81bd80a0b0a405dc0483e2c428332d69da2c79f ("ring-buffer: use generic
version of in_nmi") from the tracing tree and commit
9b7ff384ee76ced9638ab236db588a6f13916336 ("trace: annotate bitfields in
struct ring_buffer_event") from the kmemcheck tree.

Just simple overlapping additions.  I fixed it up (see below) and can
carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/trace/ring_buffer.c
index f747364,b1f2f60..0000000
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@@ -9,7 -7,7 +9,8 @@@
  #include <linux/spinlock.h>
  #include <linux/debugfs.h>
  #include <linux/uaccess.h>
 +#include <linux/hardirq.h>
+ #include <linux/kmemcheck.h>
  #include <linux/module.h>
  #include <linux/percpu.h>
  #include <linux/mutex.h>
