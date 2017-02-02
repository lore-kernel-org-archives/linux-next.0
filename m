From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 2 Feb 2017 17:49:03 +1100
Message-ID: <20170202174903.0cc828d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56661 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750994AbdBBGtL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Feb 2017 01:49:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <mawilcox@microsoft.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig and x86_64 allmodconfig) produced this warning:

fs/ext4/file.c:279:1: warning: 'ext4_dax_huge_fault' defined but not used [-Wunused-function]
 ext4_dax_huge_fault(struct vm_fault *vmf)
 ^

Introduced by commit

  80a841811260 ("mm,fs,dax: change ->pmd_fault to ->huge_fault")

Looks like the replacement in ext4_dax_vm_ops may be incorrect?

-- 
Cheers,
Stephen Rothwell
