From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 31 Dec 2015 22:15:29 +1100
Message-ID: <20151231221529.1b997dce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47422 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751715AbbLaLPd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2015 06:15:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (perf)
failed like this:

In file included from /home/sfr/next/next/tools/include/linux/list.h:5:0,
                 from arch/../util/map.h:6,
                 from arch/../util/event.h:8,
                 from arch/../util/debug.h:7,
                 from arch/common.c:4:
/home/sfr/next/next/tools/include/linux/../../../include/linux/list.h: In function 'list_force_poison':
/home/sfr/next/next/tools/include/linux/../../../include/linux/list.h:123:56: error: unused parameter 'entry' [-Werror=unused-parameter]
 static inline void list_force_poison(struct list_head *entry)
                                                        ^

and many more like that.

Caused by commit

  a471eb786598 ("mm, dax, pmem: introduce {get|put}_dev_pagemap() for dax-gup")

I just left the perf build broken for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
