From: Hugh Dickins <hughd@google.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 21 Apr 2016 02:46:17 -0700 (PDT)
Message-ID: <alpine.LSU.2.11.1604210227050.5287@eggly.anvils>
References: <20160421160016.3221533d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:36053 "EHLO
	mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751571AbcDUJq0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2016 05:46:26 -0400
Received: by mail-qk0-f182.google.com with SMTP id x7so23459993qkd.3
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2016 02:46:26 -0700 (PDT)
In-Reply-To: <20160421160016.3221533d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hugh Dickins <hughd@google.com>

On Thu, 21 Apr 2016, Stephen Rothwell wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> mm/built-in.o: In function `handle_mm_fault':
> frame_vector.c:(.text+0x29628): undefined reference to `do_huge_pmd_anonymous_page'
> 
> (Ignore the "frame_vector.c" above it is obviously incorrect.)
> 
> Probably caused by commit
> 
>   747220c26dd0 ("huge tmpfs: add shmem_pmd_fault()")
> 
> [Andrew: I added this patch from Hugh today ... see other emails]

Many thanks for trying to include those...

> 
> The condition protecting the call to do_huge_pmd_anonymous_page()
> in __handle_mm_fault() has becom more complicated and so the call
> has presumably no longer been removed by the compiler for the
> !CONFIG_TRANSPARENT_HUGEPAGE case.
> 
> I have reverted that commit for today.

... and sorry for wasting your time again, with unfamiliar optimizer
failures.  Best ignore patches from me, until I've got into cross-
compiling with your environment.  Not this week.

Reverting just that shmem_pmd_fault() commit does leave linux-next
with lots of huge tmpfs patches in, but unable to do huge mappings
of tmpfs (but the DAX COW support that I'd broken restored).

Not worth rushing you another build fix to enable it: Andrew will be
reverting the whole series from his tree in the coming days, to make
way for some zone/node changes from Mel which it was obstructing.

Hugh
