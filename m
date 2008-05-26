From: corbet@lwn.net (Jonathan Corbet)
Subject: Re: drivers/char/dsp56k.c breakage [was: Re: linux-next: Tree for May 26]
Date: Mon, 26 May 2008 08:56:55 -0600
Message-ID: <29942.1211813815@vena.lwn.net>
References: <Pine.LNX.4.64.0805261644230.4417@anakin>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vena.lwn.net ([206.168.112.25]:45362 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754126AbYEZO44 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 May 2008 10:56:56 -0400
In-reply-to: Your message of "Mon, 26 May 2008 16:46:45 +0200."
             <Pine.LNX.4.64.0805261644230.4417@anakin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Linux/m68k <linux-m68k@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> commit	6fe28df6c14e7e02bfea6b2bebf42716176e6dff
> 
>     dsp56k: BKL pushdown
> 
>     Put explicit lock_kernel calls into dsp56k_open().
> 
> Broke the build of drivers/char/dsp56k.c by introducing a jump to a
> non-existent label

Sigh.  Sorry about that.  I've recreated the tree without that dumb
mistake.

jon

Jonathan Corbet / LWN.net / corbet@lwn.net
