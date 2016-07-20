From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Tue, 19 Jul 2016 19:57:24 -0700
Message-ID: <CALCETrUUyWLC4pC67hGUjzO_XhKf=wYSM4YZMTXyYGMtwwLUPw@mail.gmail.com>
References: <20160718203634.GF2207@kernel.org> <20160719082235.42aec856@canb.auug.org.au>
 <20160718234132.GI2207@kernel.org> <20160719102629.0a12a1a1@canb.auug.org.au>
 <20160719003906.GJ2207@kernel.org> <20160719132608.1aa2692a@canb.auug.org.au>
 <20160719125443.GL2207@kernel.org> <20160719174551.GM2207@kernel.org>
 <20160720092157.7cd8de65@canb.auug.org.au> <20160720095333.3034531c@canb.auug.org.au>
 <20160720025202.GB18962@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f50.google.com ([209.85.213.50]:35504 "EHLO
	mail-vk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753011AbcGTC5p (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Jul 2016 22:57:45 -0400
Received: by mail-vk0-f50.google.com with SMTP id w127so51124434vkh.2
        for <linux-next@vger.kernel.org>; Tue, 19 Jul 2016 19:57:44 -0700 (PDT)
In-Reply-To: <20160720025202.GB18962@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Josh Poimboeuf <jpoimboe@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 19, 2016 at 7:52 PM, Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
> Em Wed, Jul 20, 2016 at 09:53:33AM +1000, Stephen Rothwell escreveu:
>> On Wed, 20 Jul 2016 09:21:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > On Tue, 19 Jul 2016 14:45:51 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
>> > >  #if BITS_PER_LONG != __BITS_PER_LONG
>> > > +#include <linux/stringify.h>
>> > > +#pragma message "BITS_PER_LONG=" __stringify(BITS_PER_LONG)
>> > > +#pragma message "__BITS_PER_LONG=" __stringify(__BITS_PER_LONG)
>> > >  #error Inconsistent word size. Check asm/bitsperlong.h
>> > >  #endif
>
>> > I added those three lines to the file (just in yesterday's linux-next
>> > was easiest) and got this:
>
>> > /home/sfr/next/next/tools/include/asm-generic/bitsperlong.h:14:9: note: #pragma message: BITS_PER_LONG=(8 * 8)
>> >  #pragma message "BITS_PER_LONG=" __stringify(BITS_PER_LONG)
>
>> > /home/sfr/next/next/tools/include/asm-generic/bitsperlong.h:15:9: note: #pragma message: __BITS_PER_LONG=32
>> >  #pragma message "__BITS_PER_LONG=" __stringify(__BITS_PER_LONG)
>
>> > (a few times, of course)
>
>> So I applied this:
>
>> +++ b/tools/arch/x86/include/uapi/asm/bitsperlong.h
>> @@ -4,6 +4,12 @@
>>  #if defined(__x86_64__) && !defined(__ILP32__)
>>  # define __BITS_PER_LONG 64
>>  #else
>> +#ifndef __x86_64__
>> +#pragma message "__x86_64__ is not defined"
>> +#endif
>> +#ifdef __ILP32__
>> +#pragma message "__ILP32__ is defined"
>> +#endif
>>  # define __BITS_PER_LONG 32
>>  #endif
>
>> and got this:
>
>> /home/sfr/next/next/tools/arch/x86/include/uapi/asm/bitsperlong.h:8:9: note: #pragma message: __x86_64__ is not defined
>>  #pragma message "__x86_64__ is not defined"
>
> Humm, it seems that the compiler used is not the cross one, but the
> native, check if, say, __powerpc__ is defined.
>

This is still vdso2c, right?  It's a hostprog.

This stuff is utterly screwed up.  We're building a hostprog for an
x86_64 kernel cross-compiled from powerpc.  We should presumably be
pullng in powerpc's uapi headers for hostprogs because it's a *host*
prog.

--Andy

> - Arnaldo



-- 
Andy Lutomirski
AMA Capital Management, LLC
