From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nvdimm tree
Date: Thu, 21 Jul 2016 16:13:06 +1000
Message-ID: <20160721161306.5e51e178@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41735 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750810AbcGUGNJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jul 2016 02:13:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Dan,

After merging the nvdimm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/sysdev/axonram.c: In function 'axon_ram_direct_access':
arch/powerpc/sysdev/axonram.c:151:9: error: assignment makes pointer from integer without a cast [-Werror=int-conversion]
  *kaddr = bank->io_addr + offset;
         ^

Caused by commit

  6e9c9dda79d9 ("pmem: kill __pmem address space")

I have used the nvdimm tree from next-20160720 for today.

-- 
Cheers,
Stephen Rothwell
