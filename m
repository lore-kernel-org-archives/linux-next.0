From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: linux-next: Tree for Jul 21
Date: Thu, 29 Sep 2016 16:22:58 -0700
Message-ID: <CALCETrUKDXsMWOrkn-_qp3L=19Wc2DUHzL=mhu7Ch_wz6KrjSw@mail.gmail.com>
References: <20160721165631.6508756a@canb.auug.org.au> <CAP=VYLoa6C1uFtuqEhqTw6fdjGrNhFCQyUv3FNNkOWH2m2kTDw@mail.gmail.com>
 <20160929193442.GA16617@gate.crashing.org> <20160930091456.0aacbbef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ua0-f169.google.com ([209.85.217.169]:35365 "EHLO
        mail-ua0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934954AbcI2XXT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Sep 2016 19:23:19 -0400
Received: by mail-ua0-f169.google.com with SMTP id q42so79936670uaq.2
        for <linux-next@vger.kernel.org>; Thu, 29 Sep 2016 16:23:19 -0700 (PDT)
In-Reply-To: <20160930091456.0aacbbef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Segher Boessenkool <segher@kernel.crashing.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>

On Thu, Sep 29, 2016 at 4:14 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Segher,
>
> [Adding more cc's]
>
> On Thu, 29 Sep 2016 14:34:42 -0500 Segher Boessenkool <segher@kernel.crashing.org> wrote:
>>
>> On Thu, Jul 21, 2016 at 07:52:43PM -0400, Paul Gortmaker wrote:
>> > A new i386-allmodconfig fail showed up relating to VDSO:
>> >
>> > I tried to reproduce it locally with x86-64 build host and could
>> > not, so I wonder if it is a missing HOSTCC vs. CC since next
>> > coverage is power host...
>> >
>> >   VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
>> > Error: input is not a shared object
>> > make[4]: *** [arch/x86/entry/vdso/vdso-image-32.c] Error 1
>> > make[3]: *** [arch/x86/entry/vdso] Error 2
>> > make[2]: *** [arch/x86/entry] Error 2
>>
>> This is caused by building on a BE (better-endian) host.  See patch.
>>
>>
>> Segher
>>
>>
>> ===
>> From 7f098efa4d184ab1216c6cf8214c44a3abe50a14 Mon Sep 17 00:00:00 2001
>> Message-Id: <7f098efa4d184ab1216c6cf8214c44a3abe50a14.1475177310.git.segher@kernel.crashing.org>
>> From: Segher Boessenkool <segher@kernel.crashing.org>
>> Date: Thu, 29 Sep 2016 11:51:00 +0000
>> Subject: [PATCH] x86: Fix building on BE
>>
>> We need to call GET_LE to read hdr->e_type.
>>
>
> Fixes: 57f90c3dfc75 ("x86/vdso: Error out if the vDSO isn't a valid DSO")
>
>> Signed-off-by: Segher Boessenkool <segher@kernel.crashing.org>
>
> 57f90c3dfc75 was merged as part of the last merge window, so this is a
> fix for Linus' tree.
>
>> ---
>>  arch/x86/entry/vdso/vdso2c.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/entry/vdso/vdso2c.h b/arch/x86/entry/vdso/vdso2c.h
>> index 4f74119..3dab75f 100644
>> --- a/arch/x86/entry/vdso/vdso2c.h
>> +++ b/arch/x86/entry/vdso/vdso2c.h
>> @@ -22,7 +22,7 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
>>
>>       ELF(Phdr) *pt = (ELF(Phdr) *)(raw_addr + GET_LE(&hdr->e_phoff));
>>
>> -     if (hdr->e_type != ET_DYN)
>> +     if (GET_LE(&hdr->e_type) != ET_DYN)
>>               fail("input is not a shared object\n");

Whoops!

Acked-by: Andy Lutomirski <luto@kernel.org>

>>
>>       /* Walk the segment table. */
>> --
>> 1.9.3
>
> --
> Cheers,
> Stephen Rothwell



-- 
Andy Lutomirski
AMA Capital Management, LLC
