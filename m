From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [uml-devel] =?UTF-8?B?Indhcm5pbmc6IHBhc3NpbmcgYXJndW1lbnQg?=
 =?UTF-8?B?MSBvZiDigJh1bV9leGVjdmXigJkgZGlzY2FyZHMgcXVhbGlmaWVycyBmcm9t?=
 =?UTF-8?B?IHBvaW50ZXIgdGFyZ2V0IHR5cGUi?=
Date: Fri, 31 Oct 2008 09:52:08 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0810310951200.22521@anakin>
References: <804dabb00810291851xc617690wac1404176437fb84@mail.gmail.com>
 <Pine.LNX.4.64.0810300925590.4898@anakin> <20081031103820.7e81f7f1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nelson.telenet-ops.be ([195.130.133.66]:59121 "EHLO
	nelson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752875AbYJaIwL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Oct 2008 04:52:11 -0400
In-Reply-To: <20081031103820.7e81f7f1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Peter Teoh <htmldeveloper@gmail.com>, uml-devel <user-mode-linux-devel@lists.sourceforge.net>, linux-next@vger.kernel.org

On Fri, 31 Oct 2008, Stephen Rothwell wrote:
> On Thu, 30 Oct 2008 09:31:04 +0100 (CET) Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > I see there are no UML builds yet on
> > http://kisskb.ellerman.id.au/kisskb/matrix/.
> > Perhaps it would be a good idea to add them?
> 
> We would love to, but we can't figure out how to cross build an x86 based
> uml kernel on a powerpc machine.  Any hints?

Haven't tried it, but something like ARCH=um SUBARCH=x86 should work...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
