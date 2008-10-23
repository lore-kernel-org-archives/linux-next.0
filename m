From: "=?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?=" <fweisbec@gmail.com>
Subject: Re: linux-next: kernel/trace/trace.c:658: error:
Date: Thu, 23 Oct 2008 17:33:26 +0200
Message-ID: <c62985530810230833j5b9dd02atae2682a7962d4476@mail.gmail.com>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
	 <20081023121145.GB27984@x200.localdomain>
	 <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com>
	 <c62985530810230615s3252a54ao6488e763d72dc939@mail.gmail.com>
	 <49008D12.5090204@gmail.com>
	 <Pine.LNX.4.64.0810231635440.18978@anakin>
	 <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com>
	 <Pine.LNX.4.64.0810231727430.18978@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f16.google.com ([209.85.217.16]:53516 "EHLO
	mail-gx0-f16.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752738AbYJWPdd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 11:33:33 -0400
Received: by gxk9 with SMTP id 9so4270gxk.13
        for <linux-next@vger.kernel.org>; Thu, 23 Oct 2008 08:33:29 -0700 (PDT)
In-Reply-To: <Pine.LNX.4.64.0810231727430.18978@anakin>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

2008/10/23 Geert Uytterhoeven <geert@linux-m68k.org>:
> On Thu, 23 Oct 2008, Fr=E9d=E9ric Weisbecker wrote:
>> 2008/10/23 Geert Uytterhoeven <geert@linux-m68k.org>:
>> > If kernel/trace/trace.c calls irqs_disabled_flags(), it should inc=
lude
>> > the include that defines irqs_disabled_flags(). You should not add=
 it to
>> > some other random include.
>> >
>> > It's also happening on m68k:
>> > http://kisskb.ellerman.id.au/kisskb/buildresult/50641/
>>
>> The fact is that other archs include this header into their
>> asm/system.h. It seems that's because
>> they need some non-traced irq_save/restore .
>> I wanted to stay in the same approach because future use of
>> raw_local_irq could be used elsewhere
>> and seem to work perfectly whithout adding special headers on most
>> arch. But there will be some
>> bug report for each future use of these functions for alpha.... (and
>> even m68k as it seems).
>>
>> What do you think? Should I let this patch as is or send a new one
>> (and one other for m68k).
>
> kernel/trace/trace.c needs to include at least <linux/irqflags.h>, as
> that's where irqs_disabled_flags() is defined.
>
> If there are still other issues with the raw_local_irq(), IMHO they s=
hould be
> fixed separately.
>
> Hmm, what's this doing in <linux/irqflags.h>:
> | #ifdef CONFIG_TRACE_IRQFLAGS_SUPPORT
> | ...
> | #endif          /* CONFIG_X86 */
>                     ^^^^^^^^^^
>

Ok, I will send a patch to correct in this way.

Thanks.
