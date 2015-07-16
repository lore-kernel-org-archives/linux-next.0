From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: next-20150716 build: 4 failures 88 warnings (next-20150716)
Date: Thu, 16 Jul 2015 14:29:24 -0700
Message-ID: <20150716142924.2c00bc4c3407e8d0a7918ad7@linux-foundation.org>
References: <E1ZFg2R-0001bO-R5@optimist>
	<20150716134152.GJ4039@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:35176 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755632AbbGPV30 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2015 17:29:26 -0400
In-Reply-To: <20150716134152.GJ4039@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Toshi Kani <toshi.kani@hp.com>, Matthew Wilcox <willy@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 16 Jul 2015 14:41:52 +0100 Mark Brown <broonie@kernel.org> wrote:

> On Thu, Jul 16, 2015 at 11:05:11AM +0100, Build bot for Mark Brown wrote:
> 
> Today's linux-next fails to build an arm64 allnoconfig due to "mm: make
> GUP handle pfn mapping unless FOLL_GET is requested" which causes:
> 
> > 	arm64-allnoconfig
> > ../mm/gup.c:51:4: error: implicit declaration of function 'update_mmu_cache' [-Werror=implicit-function-declaration]
> 
> The update_mmu_cache() function is defined unconditionally in
> asm/tlbflush.h so there is presumably some path of conditional
> inclusions which causes it not to get declared in an allnoconfig - I
> didn't chase that down yet.

I did te obvious:

--- a/mm/gup.c~mm-make-gup-handle-pfn-mapping-unless-foll_get-is-requested-fix
+++ a/mm/gup.c
@@ -12,7 +12,9 @@
 #include <linux/sched.h>
 #include <linux/rwsem.h>
 #include <linux/hugetlb.h>
+
 #include <asm/pgtable.h>
+#include <asm/tlbflush.h>
 
 #include "internal.h"
 

I don't have arm64 toolchain here, but it fixed the error on arm and
that's what mm/memory.c does.
