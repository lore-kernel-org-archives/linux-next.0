From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nvdimm tree
Date: Fri, 3 Nov 2017 18:19:48 +1100
Message-ID: <20171103181948.046d2668@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752099AbdKCHTu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Nov 2017 03:19:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>

Hi Dan,

After merging the nvdimm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from arch/powerpc/kernel/asm-offsets.c:22:0:
include/linux/mman.h: In function 'calc_vm_flag_bits':
include/linux/mman.h:109:48: warning: division by zero [-Wdiv-by-zero]
   ((bit1) <= (bit2) ? ((x) & (bit1)) * ((bit2) / (bit1)) \
                                                ^
include/linux/mman.h:133:9: note: in expansion of macro '_calc_vm_trans'
         _calc_vm_trans(flags, MAP_SYNC,      VM_SYNC      );
         ^
cc1: all warnings being treated as errors

and more like these ...

Caused by commit

  ebd0722a382c ("mm: Define MAP_SYNC and VM_SYNC flags")

Not all architectures use asm-generic/mman.h

I have used the nvdimm tree from next-20171102 for today.

-- 
Cheers,
Stephen Rothwell
