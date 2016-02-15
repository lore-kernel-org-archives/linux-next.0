From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the mips
 tree
Date: Mon, 15 Feb 2016 16:03:53 +1100
Message-ID: <20160215160353.7a37cf95@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37613 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751916AbcBOFDz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 00:03:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>, David Daney <david.daney@cavium.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/mips/Kconfig

between commit:

  d96927dfa449 ("MIPS: Select CONFIG_HANDLE_DOMAIN_IRQ and make it work.")

from the mips tree and commit:

  29afe44a7fbe ("printk/nmi: generic solution for safe printk in NMI")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/mips/Kconfig
index e4df64c411b7,56f57816613e..000000000000
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@@ -62,7 -62,7 +62,8 @@@ config MIP
  	select HAVE_IRQ_TIME_ACCOUNTING
  	select GENERIC_TIME_VSYSCALL
  	select ARCH_CLOCKSOURCE_DATA
 +	select HANDLE_DOMAIN_IRQ
+ 	select HAVE_NMI
  
  menu "Machine selection"
  
