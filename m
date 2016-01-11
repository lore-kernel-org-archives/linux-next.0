From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 11 Jan 2016 12:39:34 +0100
Message-ID: <20160111113934.GA9810@gmail.com>
References: <20151231221529.1b997dce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33774 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757704AbcAKLji (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Jan 2016 06:39:38 -0500
Content-Disposition: inline
In-Reply-To: <20151231221529.1b997dce@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnaldo Carvalho de Melo <acme@infradead.org>, Jiri Olsa <jolsa@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>


[Cc:-ed perf tooling guys as well.]

* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (perf)
> failed like this:
> 
> In file included from /home/sfr/next/next/tools/include/linux/list.h:5:0,
>                  from arch/../util/map.h:6,
>                  from arch/../util/event.h:8,
>                  from arch/../util/debug.h:7,
>                  from arch/common.c:4:
> /home/sfr/next/next/tools/include/linux/../../../include/linux/list.h: In function 'list_force_poison':
> /home/sfr/next/next/tools/include/linux/../../../include/linux/list.h:123:56: error: unused parameter 'entry' [-Werror=unused-parameter]
>  static inline void list_force_poison(struct list_head *entry)
>                                                         ^
> 
> and many more like that.
> 
> Caused by commit
> 
>   a471eb786598 ("mm, dax, pmem: introduce {get|put}_dev_pagemap() for dax-gup")
> 
> I just left the perf build broken for today.

So I think it's time to create a tooling copy of list.h as well, to decouple 
tooling and kernel side uses of list.h.

We could do the same trick as with tools/lib/rbtree.c and 
tools/include/linux/rbtree.h: create a copy, and use 'diff' during tools build to 
generate a (non-fatal) warning if the two versions diverge.

This makes sure that tooling always syncs up with kernel side changes - without 
creating hard build failure dependencies.

Thanks,

	Ingo
