From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: Re: linux-next: build warning in Linus' tree
Date: Sun, 30 Oct 2016 22:05:03 +0300
Message-ID: <d65756ad-e80f-5f1b-560f-999600a41e0c@virtuozzo.com>
References: <20161028092920.4d84f8f1@canb.auug.org.au>
 <CA+55aFztZ1VuMhmx0_DX3ubrFNKcLTcW0OqDLRfxa0g2AeGY-w@mail.gmail.com>
 <CA+55aFwDL2_Ecuei4tYLH34RDmOba_COfr5JajasvYXA++yUgA@mail.gmail.com>
 <CAMuHMdVSqTkockvOBChTfGt9PJBZiEqDiUAAcCSas2x9t6mD_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVSqTkockvOBChTfGt9PJBZiEqDiUAAcCSas2x9t6mD_g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 10/30/2016 12:29 AM, Geert Uytterhoeven wrote:
> Hi Linus,
> 
> On Fri, Oct 28, 2016 at 1:01 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> On Thu, Oct 27, 2016 at 3:48 PM, Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>>>
>>> I wonder if we should make KASAN depend on !COMPILE_TEST, because it
>>> does seem to disable a lot of build-time testing.
>>
>> Actually, we should probably just make the MEMORY_HOTPLUG dependency be
>>
>>         depends on COMPILE_TEST || !KASAN
>>
>> since the memory-hotplug code should still *build* with KASAN, it just
>> doesn't work. That's exactly what the COMPILE_TEST config option is
>> there for - to get build coverage even for things that aren't
>> necessarily sane to run.
> 
> In what way does it not work? Does it crash?

It doesn't crash, it will fail to online hotpluged memory.
Originally, we didn't have build-time dependency at all.
It appeared quite recently in 1e185736d214("mm: disable CONFIG_MEMORY_HOTPLUG when KASAN is enabled")

> People do run COMPILE_TEST=y/allmodconfig kernels.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
