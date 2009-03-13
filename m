From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: make headers_install broken for ARCH=m68k in 2.6.29-rc7.
Date: Fri, 13 Mar 2009 09:33:18 +0100
Message-ID: <10f740e80903130133r130b8713v690437f0f38eb0b8@mail.gmail.com>
References: <200903120437.03837.rob@landley.net>
	 <20090312210216.GB14205@uranus.ravnborg.org>
	 <10f740e80903121540i30fdaddr600ce21f4159530a@mail.gmail.com>
	 <200903122225.04560.rob@landley.net> <49BA0599.6070206@snapgear.com>
	 <20090313082555.GA19045@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f175.google.com ([209.85.218.175]:57120 "EHLO
	mail-bw0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751757AbZCMIdW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2009 04:33:22 -0400
In-Reply-To: <20090313082555.GA19045@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Greg Ungerer <gerg@snapgear.com>, Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, dwmw2@infradead.org, linux-next@vger.kernel.org

On Fri, Mar 13, 2009 at 09:25, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Fri, Mar 13, 2009 at 05:04:57PM +1000, Greg Ungerer wrote:
>> I pretty quick time I can fix up the last couple on the above list.
>> But do we want to put all that change into 2.6.29-rc at this point?
>
> In general we do not want to have headers_check broken in mainline,

headers_check is not broken, headers_install is.

Hmm, in some sense headers_check _is_ broken, as it doesn't notice
headers_install
installs headers that refer to other headers that are not installed...

> so if this is what is required to fix it then yes.

Yep, it's a regression from 2.6.28.

Greg, I had a quick look at your signcontext.h and signal.h merge, and the MMU
part seems to be OK.

However, some of the installed headers still have checks for CONFIG_MMU:

param.h:#ifdef CONFIG_MMU
sigcontext.h:#ifndef CONFIG_MMU
sigcontext.h:#ifdef CONFIG_MMU
siginfo.h:#ifdef CONFIG_MMU
siginfo.h:#ifdef CONFIG_MMU
siginfo.h:#endif /* CONFIG_MMU */
swab.h:#elif defined(CONFIG_MMU)

so these have to be added to the generic unifdef-y list (is that
include/asm-generic/Kbuild.asm?).

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
