From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Tue, 2 Sep 2008 16:06:55 +1000
Message-ID: <20080902160655.6baf1965.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46218 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752181AbYIBGHD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Sep 2008 02:07:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Ananth N Mavinakayanahalli <ananth@in.ibm.com>, Tejun Heo <tj@kernel.org>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
lib/Kconfig.debug between commits
94a97a3018e55a27d1c29e011b3c38fee01a967f ("Move backtrace selftests to
tests/") and 0f6add4bafdbff7a822e37dec0436e2392864d9a ("Move lkdtm to
tests/") from the tests tree and the three commits dealing with
CONFIG_DEBUG_BLOCK_EXT_DEVT from the block tree.

Just overlapping adds/removes.  I fixed it up (see below) and can carry
the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc lib/Kconfig.debug
index f62c706,2a50e95..0000000
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@@ -572,6 -624,44 +572,28 @@@ config RCU_CPU_STAL
  
  	  Say N if you are unsure.
  
+ config DEBUG_BLOCK_EXT_DEVT
+         bool "Force extended block device numbers and spread them"
+ 	depends on DEBUG_KERNEL
+ 	depends on BLOCK
+ 	default n
+ 	help
+ 	  Conventionally, block device numbers are allocated from
+ 	  predetermined contiguous area.  However, extended block area
+ 	  may introduce non-contiguous block device numbers.  This
+ 	  option forces most block device numbers to be allocated from
+ 	  the extended space and spreads them to discover kernel or
+ 	  userland code paths which assume predetermined contiguous
+ 	  device number allocation.
+ 
+ 	  Note that turning on this debug option shuffles all the
+ 	  device numbers for all IDE and SCSI devices including libata
+ 	  ones, so root partition specified using device number
+ 	  directly (via rdev or root=MAJ:MIN) won't work anymore.
+ 	  Textual device names (root=/dev/sdXn) will continue to work.
+ 
+ 	  Say N if you are unsure.
+ 
 -config LKDTM
 -	tristate "Linux Kernel Dump Test Tool Module"
 -	depends on DEBUG_KERNEL
 -	depends on KPROBES
 -	depends on BLOCK
 -	default n
 -	help
 -	This module enables testing of the different dumping mechanisms by
 -	inducing system failures at predefined crash points.
 -	If you don't need it: say N
 -	Choose M here to compile this code as a module. The module will be
 -	called lkdtm.
 -
 -	Documentation on how to use the module can be found in
 -	drivers/misc/lkdtm.c
 -
  config FAULT_INJECTION
  	bool "Fault-injection framework"
  	depends on DEBUG_KERNEL
