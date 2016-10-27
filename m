From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build warning in Linus' tree
Date: Thu, 27 Oct 2016 16:01:22 -0700
Message-ID: <CA+55aFwDL2_Ecuei4tYLH34RDmOba_COfr5JajasvYXA++yUgA@mail.gmail.com>
References: <20161028092920.4d84f8f1@canb.auug.org.au> <CA+55aFztZ1VuMhmx0_DX3ubrFNKcLTcW0OqDLRfxa0g2AeGY-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34223 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034178AbcJ0XBX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Oct 2016 19:01:23 -0400
In-Reply-To: <CA+55aFztZ1VuMhmx0_DX3ubrFNKcLTcW0OqDLRfxa0g2AeGY-w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Oct 27, 2016 at 3:48 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I wonder if we should make KASAN depend on !COMPILE_TEST, because it
> does seem to disable a lot of build-time testing.

Actually, we should probably just make the MEMORY_HOTPLUG dependency be

        depends on COMPILE_TEST || !KASAN

since the memory-hotplug code should still *build* with KASAN, it just
doesn't work. That's exactly what the COMPILE_TEST config option is
there for - to get build coverage even for things that aren't
necessarily sane to run.

I'll do that, to get my build coverage up. I really expected my
allmodconfig builds to verify that I had removed the per-zone
waitqueue code completely, and I'm happy that the breakage was
apparently limited to that unused variable..

In the meantime, thanks for noticing and letting me know.

            Linus
