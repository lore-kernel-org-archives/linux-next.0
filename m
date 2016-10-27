From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build warning in Linus' tree
Date: Thu, 27 Oct 2016 15:48:37 -0700
Message-ID: <CA+55aFztZ1VuMhmx0_DX3ubrFNKcLTcW0OqDLRfxa0g2AeGY-w@mail.gmail.com>
References: <20161028092920.4d84f8f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34650 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942804AbcJ0Wsj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Oct 2016 18:48:39 -0400
In-Reply-To: <20161028092920.4d84f8f1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Oct 27, 2016 at 3:29 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Building your tree, today's linux-next build (powerpc ppc64_defconfig)
> produced this warning:
>
> mm/memory_hotplug.c: In function 'try_offline_node':
> mm/memory_hotplug.c:2120:6: warning: unused variable 'i' [-Wunused-variable]
>  int i;
>      ^
>
> Introduced by commit
>
>   9dcb8b685fc3 ("mm: remove per-zone hashtable of bitlock waitqueues")

Strange. I wonder why I didn't see that warning. Not with
allmodconfig, and not with my normal build.

[ Looks around ]

Hmm. Apparently "allmodconfig" doesn't actually enable memory hotplug.
And the reason is that allmodconfig enables KASAN, which then disables
MEMORY_HOTPLUG.

I wonder if we should make KASAN depend on !COMPILE_TEST, because it
does seem to disable a lot of build-time testing.

Oh well. I'll remove the stupid unused variable, thanks for the heads-up.

          Linus
