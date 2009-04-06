From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree with Linus' tree
Date: Mon, 6 Apr 2009 10:36:32 +1000
Message-ID: <20090406103632.111615c8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55479 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752069AbZDFAhJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 5 Apr 2009 20:37:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Matthew Wilcox <matthew@wil.cx>, Andrew Morton <akpm@linux-foundation.org>

Hi all,

Today's linux-next merge of the tip-core tree got a conflict in
kernel/sysctl.c between commit 8e654fba4a376f436bdfe361fc5cdbc87ac09b35
("sysctl: fix suid_dumpable and lease-break-time sysctls") from Linus'
tree and commit 9f8d979f082a3ee1b27f32b7e0811b51c3ad1d15 ("softlockup:
move 'one' to the softlockup section in sysctl.c") from the tip-core tree.

I fixed it up (see below) and can carry the fix as necessary.  This seems
to be the same fixup that is in tip/master.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/sysctl.c
index 82350f8,6d2aeff..0000000
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@@ -96,9 -98,11 +99,8 @@@ static int sixty = 60
  static int neg_one = -1;
  #endif
  
 -#if defined(CONFIG_MMU) && defined(CONFIG_FILE_LOCKING)
 -static int two = 2;
 -#endif
 -
  static int zero;
- static int one = 1;
 +static int two = 2;
  static unsigned long one_ul = 1;
  static int one_hundred = 100;
  
