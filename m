From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with the kdbus
 tree
Date: Fri, 2 Oct 2015 13:36:38 +1000
Message-ID: <20151002133638.3430e7da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in:

  samples/Makefile

between commit:

  2d41f8138508 ("kdbus: add walk-through user space example")

from the kdbus tree and commit:

  f71933438300 ("configfs: remove old API")

from the target-updates tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc samples/Makefile
index f0ad51e5b342,48001d7e23f0..000000000000
--- a/samples/Makefile
+++ b/samples/Makefile
@@@ -1,5 -1,5 +1,5 @@@
  # Makefile for Linux samples code
  
  obj-$(CONFIG_SAMPLES)	+= kobject/ kprobes/ trace_events/ livepatch/ \
 -			   hw_breakpoint/ kfifo/ kdb/ hidraw/ rpmsg/ seccomp/ \
 -			   configfs/
 +			   hw_breakpoint/ kfifo/ kdb/ kdbus/ hidraw/ rpmsg/ \
- 			   seccomp/
++			   seccomp/ configfs/
