From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build warning in Linus' tree
Date: Thu, 27 Oct 2016 16:25:31 -0700
Message-ID: <CA+55aFx-miZYam_v+09KncMMRe4SRtEAJyR=d=4qjm7qq8eNVA@mail.gmail.com>
References: <20161028092920.4d84f8f1@canb.auug.org.au> <CA+55aFztZ1VuMhmx0_DX3ubrFNKcLTcW0OqDLRfxa0g2AeGY-w@mail.gmail.com>
 <CA+55aFwDL2_Ecuei4tYLH34RDmOba_COfr5JajasvYXA++yUgA@mail.gmail.com> <CAG_fn=WCvtf7yvj7JT5ahA21+P3F0Q==fqhS4e-3B=oRuPnVrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33768 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034145AbcJ0XZd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Oct 2016 19:25:33 -0400
In-Reply-To: <CAG_fn=WCvtf7yvj7JT5ahA21+P3F0Q==fqhS4e-3B=oRuPnVrA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Potapenko <glider@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry Vyukov <dvyukov@google.com>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Oct 27, 2016 at 4:05 PM, Alexander Potapenko <glider@google.com> wrote:
>
> Maybe we could just reverse the MEMORY_HOTPLUG->!KASAN dependency to
> make it KASAN->!MEMORY_HOTPLUG?

Yes, that was my initial approach too, but then I decided that I'd
rather build-test both together anyway. Since I can. So that just gets
me the best of both worlds.

We've had issues like this before, and "make allmodconfig" will never
enable _everything_ (ie you always have to make some choices that will
disable other cases, if only for reasons like SLUB-vs-SLAB etc).

But in general the more coverage I get from build testing (without
having to do lots and lots of builds - that's what the build farms are
for after I have pushed things out), the better.

             Linus
