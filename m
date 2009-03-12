From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the  tree
Date: Thu, 12 Mar 2009 15:43:27 +1100
Message-ID: <20090312154327.70d7271b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54217 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751785AbZCLEnc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 00:43:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, Matt LaPlante <kernel1@cyberdogtech.com>

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
init/Kconfig between commit b943c460ff8556a193b28e2145b513f8b978e869
("menu: fix embedded menu snafu") from Linus' tree and commit
2622b54dff6e30d114828648e96777739b764063 ("trivial: fix typos/grammar
errors in Kconfig texts") from the trivial tree.

The former moved the text that the latter modified.  I fixed it up (see
below) and carry it for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc init/Kconfig
index 68c23f3,12b1343..0000000
--- a/init/Kconfig
+++ b/init/Kconfig
@@@ -945,21 -897,9 +945,21 @@@ config SLUB_DEBU
  	  SLUB sysfs support. /sys/slab will not exist and there will be
  	  no support for cache validation etc.
  
 +config COMPAT_BRK
 +	bool "Disable heap randomization"
 +	default y
 +	help
 +	  Randomizing heap placement makes heap exploits harder, but it
 +	  also breaks ancient binaries (including anything libc5 based).
 +	  This option changes the bootup default to heap randomization
- 	  disabled, and can be overriden runtime by setting
++	  disabled, and can be overridden at runtime by setting
 +	  /proc/sys/kernel/randomize_va_space to 2.
 +
 +	  On non-ancient distros (post-2000 ones) N is usually a safe choice.
 +
  choice
  	prompt "Choose SLAB allocator"
 -	default SLUB
 +	default SLQB
  	help
  	   This option allows to select a slab allocator.
  
