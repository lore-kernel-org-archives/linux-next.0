From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 14 Aug 2015 18:47:53 +1000
Message-ID: <20150814184753.26ad3ff1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49286 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753354AbbHNIrz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Aug 2015 04:47:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>

Hi Andrew,

After merging the akpm tree, today's linux-next build (sparc64 defconfig)
failed like this:

In file included from include/linux/sched.h:27:0,
                 from arch/sparc/kernel/asm-offsets.c:13:
include/linux/mm_types.h:371:22: error: 'HUGE_MAX_HSTATE' undeclared here (not in a function)
  atomic_long_t count[HUGE_MAX_HSTATE];
                      ^

Caused by commit

  04f4eaa95082 ("mm: hugetlb: proc: add HugetlbPages field to /proc/PID/status")

I have reverted that patch (and the following fix patch:

  f26cf7b29291 ("mm-hugetlb-proc-add-hugetlbpages-field-to-proc-pid-status-fix")

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
