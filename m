From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Sat, 12 Sep 2015 14:34:28 +1000
Message-ID: <20150912143428.14e01ffa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56047 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751281AbbILEec (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 12 Sep 2015 00:34:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Davydov <vdavydov@parallels.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/mm.h:318:0,
                 from include/linux/highmem.h:7,
                 from include/linux/bio.h:23,
                 from include/linux/writeback.h:192,
                 from include/linux/memcontrol.h:30,
                 from include/linux/swap.h:8,
                 from include/linux/suspend.h:4,
                 from arch/x86/kernel/asm-offsets.c:12:
include/linux/page-flags.h:371:26: error: macro "TESTPAGEFLAG" requires 3 arguments, but only 2 given
 TESTPAGEFLAG(Young, young)
                          ^  
include/linux/page-flags.h:372:25: error: macro "SETPAGEFLAG" requires 3 arguments, but only 2 given
 SETPAGEFLAG(Young, young)   
                         ^   
include/linux/page-flags.h:371:1: error: unknown type name 'TESTPAGEFLAG'
 TESTPAGEFLAG(Young, young)  
 ^
include/linux/page-flags.h:373:27: error: macro "TESTCLEARFLAG" requires 3 arguments, but only 2 given
 TESTCLEARFLAG(Young, young) 
                           ^ 
include/linux/page-flags.h:373:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'TESTCLEARFLAG'
 TESTCLEARFLAG(Young, young) 
 ^
include/linux/page-flags.h:374:20: error: macro "PAGEFLAG" requires 3 arguments, but only 2 given
 PAGEFLAG(Idle, idle)
                    ^
include/linux/page-flags.h:373:1: error: unknown type name 'TESTCLEARFLAG'
 TESTCLEARFLAG(Young, young) 
 ^
In file included from include/linux/highmem.h:7:0,
                 from include/linux/bio.h:23,
                 from include/linux/writeback.h:192,
                 from include/linux/memcontrol.h:30,
                 from include/linux/swap.h:8,
                 from include/linux/suspend.h:4,
                 from arch/x86/kernel/asm-offsets.c:12:
include/linux/mm.h: In function '__compound_tail_refcounted':
include/linux/mm.h:453:2: error: implicit declaration of function 'PageAnon' [-Werror=implicit-function-declaration]
  return PageAnon(page) && !PageSlab(page) && !PageHeadHuge(page);
  ^

Caused by commit

  33c3fc71c8cf ("mm: introduce idle page tracking")

from Linus' tree interacting with commit

  3b1670dad702 ("page-flags: introduce page flags policies wrt compound pages")

from the akpm-current tree (and presumably others).

I have just dropped the akpm-current tree for today.  I am sorry I
rushed you to put out a cleaned up mmotm yesterday :-(

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
