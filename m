From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Fri, 18 Jul 2014 12:57:32 -0700
Message-ID: <CALCETrXs4fdKDA1C4ts3qzgbB6PrmCZZyK3R4cBLaO9RbBp0YA@mail.gmail.com>
References: <20140718150005.73db8eb9@canb.auug.org.au> <53C97287.5020509@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:44018 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755035AbaGRT5x (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jul 2014 15:57:53 -0400
Received: by mail-la0-f43.google.com with SMTP id hr17so3261978lab.30
        for <linux-next@vger.kernel.org>; Fri, 18 Jul 2014 12:57:52 -0700 (PDT)
In-Reply-To: <53C97287.5020509@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

On Fri, Jul 18, 2014 at 12:16 PM, H. Peter Anvin <hpa@zytor.com> wrote:
> On 07/17/2014 10:00 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the tip tree, today's linux-next build (x86_64
>> allmodconfig) produced these warnings:
>>
>> In file included from arch/x86/vdso/vdso2c.c:161:0:
>> arch/x86/vdso/vdso2c.c: In function 'main':
>> arch/x86/vdso/vdso2c.h:118:6: warning: assuming signed overflow
>> does not occur when assuming that (X + c) < X is always false
>> [-Wstrict-overflow] In file included from
>> arch/x86/vdso/vdso2c.c:165:0: arch/x86/vdso/vdso2c.h:118:6:
>> warning: assuming signed overflow does not occur when assuming that
>> (X + c) < X is always false [-Wstrict-overflow]
>>
>> Probably introduced by commit e6577a7ce99a ("x86, vdso: Move the
>> vvar area before the vdso text").
>>
>
> This seems toxic.
>
> I always wonder if we shouldn't use -fwrapv for the kernel...

This particular warning is IMO in a particularly dumb category: GCC
optimizes some code and then warns about a construct that wasn't there
in the original code.  In this case, I think it unrolled a loop and
discovered that one iteration contained a test that was always true.
Big deal.

(OTOH, the code in question was buggy, but not all for the reason that
GCC thought it was.)

--Andy

>
>         -hpa
>



-- 
Andy Lutomirski
AMA Capital Management, LLC
