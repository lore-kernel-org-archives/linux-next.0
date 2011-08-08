From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the i7300_edac tree with Linus' tree
Date: Mon, 8 Aug 2011 13:48:08 +1000
Message-ID: <20110808134808.263962c573bcffac2e28a003@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43993 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753725Ab1HHDsO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Aug 2011 23:48:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <borislav.petkov@amd.com>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>

Hi Mauro,

Today's linux-next merge of the i7300_edac tree got a conflict in
arch/x86/kernel/cpu/mcheck/mce.c between commit b77e70bf3535 ("x86, mce:
Replace MCE_SELF_VECTOR by irq_work") from Linus' tree and commit
cd90cc84c6bf ("i7core_edac: Drop the edac_mce facility") from the
i7300_edac tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kernel/cpu/mcheck/mce.c
index 08363b0,9c03d98..0000000
--- a/arch/x86/kernel/cpu/mcheck/mce.c
+++ b/arch/x86/kernel/cpu/mcheck/mce.c
@@@ -36,10 -37,12 +36,9 @@@
  #include <linux/fs.h>
  #include <linux/mm.h>
  #include <linux/debugfs.h>
- #include <linux/edac_mce.h>
 +#include <linux/irq_work.h>
  
  #include <asm/processor.h>
 -#include <asm/hw_irq.h>
 -#include <asm/apic.h>
 -#include <asm/idle.h>
 -#include <asm/ipi.h>
  #include <asm/mce.h>
  #include <asm/msr.h>
  
