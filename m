From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for July 28 ("copy_from_user_overflow" undefined)
Date: Fri, 29 Jul 2011 20:59:32 +0200
Message-ID: <CA+icZUV0AHKZYKNTKBisp1D+SQ6vuiMsHaM+w2QNowHA7E2xHA@mail.gmail.com>
References: <CA+icZUV7R5hqTupiuZZKWcsZ5LOBGmY6xgmMTM7W3ojJo0Sp4w@mail.gmail.com>
	<20110728160136.771e2c0a.rdunlap@xenotime.net>
	<CA+icZUXLpThpEem+DPimemYVHqSKb5NAb5h_L-rMPWsD+WJTYg@mail.gmail.com>
	<20110728220926.6d1a91f4.rdunlap@xenotime.net>
	<CA+icZUVsJNSDzBvvH810POEydpaZxJZfM8J9bD+93+4d+88D_A@mail.gmail.com>
	<CA+icZUX=qM+xhJkteXs=F_RJP+k-Tzf3+Cp4ZdeatZ0cgHegBw@mail.gmail.com>
	<4E32F2ED.4020000@codeaurora.org>
	<20110729112146.9459f48f.rdunlap@xenotime.net>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:48933 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752527Ab1G2S7d convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jul 2011 14:59:33 -0400
In-Reply-To: <20110729112146.9459f48f.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Chris Metcalf <cmetcalf@tilera.com>, Andrew Morton <akpm@linux-foundation.org>, Arjan van de Ven <arjan@linux.intel.com>, Helge Deller <deller@gmx.de>, Heiko Carstens <heiko.carstens@de.ibm.com>

On Fri, Jul 29, 2011 at 8:21 PM, Randy Dunlap <rdunlap@xenotime.net> wr=
ote:
> On Fri, 29 Jul 2011 10:50:37 -0700 Stephen Boyd wrote:
>
>> On 07/29/2011 02:45 AM, Sedat Dilek wrote:
>> > [ CCing all people from 0416 patch ]
>> >
>> > OK, here a quick review and looking for suspicious commits:
>> [snip]
>> > -- a/lib/Makefile
>> > +++ b/lib/Makefile
>> > @@ -14,6 +14,7 @@ lib-y :=3D ctype.o string.o vsprintf.o cmdline.o=
 \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proportions.o prio_heap.o rateli=
mit.o show_mem.o \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is_single_threaded.o plist.o dec=
ompress.o find_next_bit.o
>> >
>> > +lib-$(CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS) +=3D usercop=
y.o
>> > =C2=A0lib-$(CONFIG_MMU) +=3D ioremap.o
>> > =C2=A0lib-$(CONFIG_SMP) +=3D cpumask.o
>> >
>> > So, I can rebuild next-201107{27,28} with
>> > CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy and look again i=
f the
>> > build-breakage in binfmt_misc is gone.
>> >
>> > Any comments from x86 folk?
>>
>> I already noticed this and sent a fixup patch to Andrew. Looks like =
he
>> never picked it up. The real fix is to change that lib-$(CONFIG... t=
o
>> obj-$(CONFIG...
>>
>> See https://lkml.org/lkml/2011/7/6/6 for the patch.
>
> Thanks, that works.
>
> Adding Andrew to cc list.
>
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your c=
ode ***
>

I have sent out a separate patch on top of today's linux-next.
Have fun!

- Sedat -
