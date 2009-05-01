From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the tracing
 tree
Date: Fri, 1 May 2009 15:01:15 +1000
Message-ID: <20090501150115.ce386142.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48780 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750802AbZEAFBQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 May 2009 01:01:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Jan Blunck <jblunck@suse.de>, Andrew Morton <akpm@linux-foundation.org>

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
init/main.c between commit 02af61bb50f5d5f0322dbe5ab2a0d75808d25c7b
("tracing, kmemtrace: Separate include/trace/kmemtrace.h to kmemtrace
part and tracepoint part") from the tracing tree and commit
e6a9527dba81973b8fe7000f42c84b2ffbe98d65 ("driver-core: devtmpfs - driver
core maintained /dev tmpfs") from the driver-core tree.

Just simple overlapping additions.  I fixed it up (see below) and can
carry the fix as necessary.

[Aside:  the first I can find of this is the patch submission to LKML
within the last day ... so "posted, reviewed, unit tested"?  I assume
this has had some discussion somewhere, but Google doesn't know where.]
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc init/main.c
index cc61941,0d36b37..0000000
--- a/init/main.c
+++ b/init/main.c
@@@ -65,7 -64,7 +65,8 @@@
  #include <linux/idr.h>
  #include <linux/ftrace.h>
  #include <linux/async.h>
 +#include <linux/kmemtrace.h>
+ #include <linux/shmem_fs.h>
  #include <trace/boot.h>
  
  #include <asm/io.h>
