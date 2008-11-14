From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Can you add the staging tree to -next?
Date: Fri, 14 Nov 2008 08:42:48 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811140825410.11953@anakin>
References: <20081112235600.GA27554@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from harold.telenet-ops.be ([195.130.133.65]:41681 "EHLO
	harold.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbYKNHmv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Nov 2008 02:42:51 -0500
In-Reply-To: <20081112235600.GA27554@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 12 Nov 2008, Greg KH wrote:
> I'm starting to get people sending me patches against -next for the
> drivers/staging/ tree that don't apply as -next does not include my
> quilt tree of staging patches.
> 
> Can you please pick it up?  You can put it at the end of your series,
> and the 'make allmodconfig' option disables building anything in the
> drivers/staging/ subdirectory, so it should not have any build or merge
> conflicts with anything.

Apart from the patches you receive against -next, is there any other
advantage, giving staging is disabled?

> It can be found at:
> 	http://kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/gregkh-05-staging/
> and is a quilt tree.
> 
> It will follow all the same rules as other trees, with patches only for
> the next merge window (2.6.29 right now) in it.

Except that there's much less compile-coverage, as allmodconfig doesn't enable
staging.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
