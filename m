From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning from Linus' tree
Date: Mon, 27 Feb 2017 10:23:01 +1100
Message-ID: <20170227102301.24133c04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46559 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751221AbdBZXcz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Feb 2017 18:32:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <mawilcox@microsoft.com>, Ross Zwisler <ross.zwisler@linux.intel.com>

Hi all,

With just Linus' tree, today's linux-next build (powerpc ppc64_defconfig)
produced this warning:

fs/dax.c: In function 'dax_iomap_fault':
fs/dax.c:1462:35: warning: passing argument 2 of 'dax_iomap_pmd_fault' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
   return dax_iomap_pmd_fault(vmf, ops);
                                   ^
fs/dax.c:1439:12: note: expected 'struct iomap_ops *' but argument is of type 'const struct iomap_ops *'
 static int dax_iomap_pmd_fault(struct vm_fault *vmf, struct iomap_ops *ops)
            ^

Introduced by commit

  a2d581675d48 ("mm,fs,dax: change ->pmd_fault to ->huge_fault")

which missed fixing up the !CONFIG_FS_DAX_PMD case.

-- 
Cheers,
Stephen Rothwell
