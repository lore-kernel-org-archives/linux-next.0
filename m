From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: triage for April 19, 2012
Date: Sat, 26 May 2012 11:39:06 +0200
Message-ID: <CAMuHMdUAdrP-upvC4svws1trG=o0-g_wLq-kwbmziWVvh-NoMQ@mail.gmail.com>
References: <20120420020013.GA19964@windriver.com>
	<CAMuHMdUUgysVqz226jhK42nvYNaX7yvexpqRjOPx0QpvzUwVXg@mail.gmail.com>
	<4FC002C9.1040301@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:59023 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751887Ab2EZJjJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 26 May 2012 05:39:09 -0400
In-Reply-To: <4FC002C9.1040301@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Avi Kivity <avi@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Paul,

On Sat, May 26, 2012 at 12:08 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> On 12-05-25 04:59 PM, Geert Uytterhoeven wrote:
>> On Fri, Apr 20, 2012 at 4:00 AM, Paul Gortmaker
>> <paul.gortmaker@windriver.com> wrote:
>>> The parisc got borked by some kvm header shuffle it seems?
>>> Now complaining about "file 'asm-generic/kvm_para.h' is not exporte=
d"
>>> [ http://kisskb.ellerman.id.au/kisskb/buildresult/6137786/ ]
>>
>> Not only parisc.
>>
>> This breakage has now entered mainline:
>>
>> parisc deconfig http://kisskb.ellerman.id.au/kisskb/buildresult/6365=
677/
>> m68k allmodconfig: http://kisskb.ellerman.id.au/kisskb/buildresult/6=
365681/
>
> See also this thread:
>
> http://www.spinics.net/lists/kvm/msg72785.html

I saw it. But it doesn't contain a fix for this, does it?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
