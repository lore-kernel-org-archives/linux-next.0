From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build warning in Linus' tree
Date: Sat, 29 Oct 2016 23:29:32 +0200
Message-ID: <CAMuHMdVSqTkockvOBChTfGt9PJBZiEqDiUAAcCSas2x9t6mD_g@mail.gmail.com>
References: <20161028092920.4d84f8f1@canb.auug.org.au> <CA+55aFztZ1VuMhmx0_DX3ubrFNKcLTcW0OqDLRfxa0g2AeGY-w@mail.gmail.com>
 <CA+55aFwDL2_Ecuei4tYLH34RDmOba_COfr5JajasvYXA++yUgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwDL2_Ecuei4tYLH34RDmOba_COfr5JajasvYXA++yUgA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Linus,

On Fri, Oct 28, 2016 at 1:01 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Oct 27, 2016 at 3:48 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> I wonder if we should make KASAN depend on !COMPILE_TEST, because it
>> does seem to disable a lot of build-time testing.
>
> Actually, we should probably just make the MEMORY_HOTPLUG dependency be
>
>         depends on COMPILE_TEST || !KASAN
>
> since the memory-hotplug code should still *build* with KASAN, it just
> doesn't work. That's exactly what the COMPILE_TEST config option is
> there for - to get build coverage even for things that aren't
> necessarily sane to run.

In what way does it not work? Does it crash?
People do run COMPILE_TEST=y/allmodconfig kernels.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
