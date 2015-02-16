From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Feb 16
Date: Mon, 16 Feb 2015 09:12:13 -0800
Message-ID: <20150216171213.GA2804@roeck-us.net>
References: <20120216164144.35e98f5ee8f1b1f545406309@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54225 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752955AbbBPRM1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Feb 2015 12:12:27 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YNPDe-001NCF-VH
	for linux-next@vger.kernel.org; Mon, 16 Feb 2015 17:12:27 +0000
Content-Disposition: inline
In-Reply-To: <20120216164144.35e98f5ee8f1b1f545406309@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, baspeters93@gmail.com

On Thu, Feb 16, 2012 at 04:41:44PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20120215:
> 
> The net-net tree gained conflicts against the net and wireless trees.
> 
> The fbdev tree gained a build failure for which I reverted a commit.
> 
> I reverted a commit from the rr tree that causes build failures on some
> PowerPC builds.
> 
> The oprofile tree lost its conflict.
> 
> The staging tree gained a build failure so I used the version from
> next-20120215.
> 
> The akpm tree gained a conflict against the wireless tree.  I also
> reverted a patch that caused boot failures on (at least) some PowerPC
> servers.
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" as mentioned in the FAQ on the wiki
> (see below).
> 
---
[ Trying again, this time hopefully replying to the correct e-mail.
  Sorry for the earlier noise. ]

---

Today's tree has a number of new mips related build errors.

Building mips:defconfig ... failed
Building mips:allmodconfig ... failed

Error log:
In file included from ./arch/mips/include/asm/sgiarcs.h:16:0,
                 from ./arch/mips/include/asm/sgialib.h:15,
		 from arch/mips/sgi-ip22/ip22-mc.c:16:
./arch/mips/include/asm/fw/arc/types.h:18:15: error: expected identifier or '(' before '.' token
(more of those)

In file included from ./arch/mips/include/asm/sgialib.h:15:0,
                 from arch/mips/sgi-ip22/ip22-mc.c:16:
./arch/mips/include/asm/sgiarcs.h:89:2: error: unknown type name '_PULONG'
./arch/mips/include/asm/sgiarcs.h:188:2: error: expected specifier-qualifier-list before '.' token
./arch/mips/include/asm/sgiarcs.h:252:2: error: unknown type name '_PLONG'
(more of those)

In file included from arch/mips/sgi-ip22/ip22-mc.c:16:0:
./arch/mips/include/asm/sgialib.h:20:8: error: expected identifier or '(' before '.' token
(more or those)

---
Bisect points to commit 9119e8276d ("MIPS: asm: hazards: Add MIPSR6
definitions"). Looking into the patch, I wonder if the following is correct.

-#if defined(CONFIG_CPU_MIPSR2) && !defined(CONFIG_CPU_CAVIUM_OCTEON)
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6) && !defined(CONFIG_CPU_CAVIUM_OCTEON)

This change appears to be missing a ( ) around the first two defined()
statements. Fixing that doesn't resolve the problem, though. Reverting
the patch doesn't fix the problem either, so something else must be wrong.

-----------------
Building mips:cavium_octeon_defconfig ... failed

Error log:
arch/mips/kernel/branch.c: In function '__compute_return_epc_for_insn':
arch/mips/kernel/branch.c:785:2: error: duplicate case value
arch/mips/kernel/branch.c:753:2: error: previously used here
arch/mips/kernel/branch.c:808:2: error: duplicate case value
arch/mips/kernel/branch.c:769:2: error: previously used here
arch/mips/kernel/branch.c:818:2: error: duplicate case value
arch/mips/kernel/branch.c:761:2: error: previously used here
arch/mips/kernel/branch.c:826:2: error: duplicate case value
arch/mips/kernel/branch.c:776:2: error: previously used here

----
Bisect points to commit 2f1da3620ff2 ("MIPS: Emulate the new MIPS R6 branch
compact (BC) instruction"). Looking into the code, the patch quite obviously
conflicts with cavium support.

Guenter
