From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the kbuild tree
Date: Thu, 1 Jul 2010 14:05:26 +1000
Message-ID: <20100701140526.1f20f906.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43607 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750718Ab0GAEFd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Jul 2010 00:05:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amerigo Wang <amwang@redhat.com>, Michal Marek <mmarek@suse.cz>

Hi all,

Today's linux-next merge of the tip tree got a conflict in Makefile
between commit 01ab17887f4cdcb8bb5a5d1bc3b160d186e6e99b ("Makefile: "make
kernelrelease" should show the correct full kernel version") from the
kbuild tree and commit 8e5564e6c7554902301543e731354ad2ad58ae53 ("perf
tools: Make target to generate self contained source tarball") from the
tip tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Makefile
index c0581a9,f6c206a..0000000
--- a/Makefile
+++ b/Makefile
@@@ -412,9 -412,9 +412,9 @@@ endi
  # of make so .config is not included in this case either (for *config).
  
  no-dot-config-targets := clean mrproper distclean \
 -			 cscope TAGS tags help %docs check% \
 +			 cscope TAGS tags help %docs check% coccicheck \
  			 include/linux/version.h headers_% \
- 			 kernelversion
 -			 kernelrelease kernelversion %src-pkg
++			 kernelversion %src-pkg
  
  config-targets := 0
  mixed-targets  := 0
