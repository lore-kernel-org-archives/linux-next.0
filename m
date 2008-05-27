From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: m68k/semaphore build failure
Date: Tue, 27 May 2008 18:10:51 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0805271809520.4081@anakin>
References: <20080527201038.d70e23d6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from monty.telenet-ops.be ([195.130.132.56]:58192 "EHLO
	monty.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757271AbYE0QKy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 May 2008 12:10:54 -0400
In-Reply-To: <20080527201038.d70e23d6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matthew Wilcox <matthew@wil.cx>, linux-next@vger.kernel.org

On Tue, 27 May 2008, Stephen Rothwell wrote:
> Today's linux-next build (m68k multi_defconfig) failed like this:
> 
> drivers/input/keyboard/hil_kbd.c:336: error: 'PCI_VENDOR_ID_HP' undeclared (first use in this function)
> drivers/input/keyboard/hil_kbd.c:336: error: (Each undeclared identifier is reported only once
> drivers/input/keyboard/hil_kbd.c:336: error: for each function it appears in.)
> 
> This is caused by commit fd7c1a9773fd107674216b63a752f21ba6495045 ("Add
> missing semaphore.h includes") from the semaphore tree.  That commit adds
> a linux/semaphore.h include but removes the linux/pci_ids.h include.

Thx!

I'd swear I reported this to Willy the first time it appeared, but according
to my mail logs, I never did...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
