From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: make headers_install broken for ARCH=m68k in 2.6.29-rc7.
Date: Thu, 12 Mar 2009 23:40:02 +0100
Message-ID: <10f740e80903121540i30fdaddr600ce21f4159530a@mail.gmail.com>
References: <200903120437.03837.rob@landley.net>
	 <20090312095854.GA9398@uranus.ravnborg.org>
	 <200903121503.37195.rob@landley.net>
	 <20090312210216.GB14205@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f178.google.com ([209.85.218.178]:48514 "EHLO
	mail-bw0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753614AbZCLWkH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2009 18:40:07 -0400
In-Reply-To: <20090312210216.GB14205@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Landley <rob@landley.net>, Sam Ravnborg <sam@ravnborg.org>, Greg Ungerer <gerg@snapgear.com>
Cc: linux-kernel@vger.kernel.org, dwmw2@infradead.org, linux-next@vger.kernel.org

On Thu, Mar 12, 2009 at 22:02, Sam Ravnborg <sam@ravnborg.org> wrote:
>>
>> And, yes, I can confirm the m68k include/asm/unistd.h from linux-nex=
t actually
>> has contents, thanks to commit 646652bded41f4c3bd375b4e03a25b42da93f=
40b
>>
>> Anyway, here's hoping the fix makes it into 2.6.29.
>
> Why not telling the m68k maintainer that you think it should go into =
2.6.29?
>
> As it stand now we will ikely see another mail from you "I already sa=
id so"
> when we ship it broken but you did not care to tell relevant people.
>
> grep -C 5 -i m68k MAINTAINES revelas this:
> M68K ARCHITECTURE
> P: =C2=A0 =C2=A0 =C2=A0Geert Uytterhoeven
> M: =C2=A0 =C2=A0 =C2=A0geert@linux-m68k.org
> P: =C2=A0 =C2=A0 =C2=A0Roman Zippel
> M: =C2=A0 =C2=A0 =C2=A0zippel@linux-m68k.org
> L: =C2=A0 =C2=A0 =C2=A0linux-m68k@lists.linux-m68k.org
> W: =C2=A0 =C2=A0 =C2=A0http://www.linux-m68k.org/
> W: =C2=A0 =C2=A0 =C2=A0http://linux-m68k-cvs.ubb.ca/
> S: =C2=A0 =C2=A0 =C2=A0Maintained
>
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sam
>

There are a few more:

param.h:#include "param_no.h"
param.h:#include "param_mm.h"
ptrace.h:#include "ptrace_no.h"
ptrace.h:#include "ptrace_mm.h"
setup.h:#include "setup_no.h"
setup.h:#include "setup_mm.h"
sigcontext.h:#include "sigcontext_no.h"
sigcontext.h:#include "sigcontext_mm.h"
siginfo.h:#include "siginfo_no.h"
siginfo.h:#include "siginfo_mm.h"
signal.h:#include "signal_no.h"
signal.h:#include "signal_mm.h"
swab.h:#include "swab_no.h"
swab.h:#include "swab_mm.h"

Rob, do these also causes problems?
Some (not all) of them are fixed in linux-next.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
