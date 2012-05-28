From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: triage for April 19, 2012
Date: Mon, 28 May 2012 22:16:11 +0200
Message-ID: <CAMuHMdWPgA46=hp+gVR9Je9rjO7-x0AXRtUdpS_TqfP5kEtQSg@mail.gmail.com>
References: <20120420020013.GA19964@windriver.com>
	<CAPM=9tzcAW=zhMcS4daBEeFyh5TffcYud8Lo-ooA6zuoeT-yjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:48042 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755032Ab2E1UQN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 May 2012 16:16:13 -0400
In-Reply-To: <CAPM=9tzcAW=zhMcS4daBEeFyh5TffcYud8Lo-ooA6zuoeT-yjQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 28, 2012 at 4:56 PM, Dave Airlie <airlied@gmail.com> wrote:
> On Fri, Apr 20, 2012 at 3:00 AM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> The "undefined reference to `vga_default_device'" stuff appears to
>> still be unresolved, as it was in the Apr 19 fails still. =C2=A0 =C2=
=A0 :-(
>> [ https://lkml.org/lkml/2012/4/18/157 ]
>>
>
> Can you say what arch/logs had this fail in it?
>
> If its only m68k then hopefully Geert merges his patch to fix it.

I never saw this happen on m68k.

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
