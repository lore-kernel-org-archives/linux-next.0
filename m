From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Wed, 7 Dec 2016 09:46:17 +1100
Message-ID: <20161207094405.05e4e5c2@canb.auug.org.au>
References: <c7690265-1f26-ed63-48bf-0e4968e7c63c@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52951 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752186AbcLFWqT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Dec 2016 17:46:19 -0500
In-Reply-To: <c7690265-1f26-ed63-48bf-0e4968e7c63c@axentia.se>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>, linux-next@vger.kernel.org

Hi Peter,

On Tue, 6 Dec 2016 23:27:48 +0100 Peter Rosin <peda@axentia.se> wrote:
>
> The bug you are referring to is in the gpio tree, not pinctrl.
> That had me confused for a while, and is the reason I'm writing
> this. Maybe the next person need not be confused...

Part of the gpio tree has been merged into the pinctrl tree (see commit
70afa835d2d7 ("Merge branch 'thread-irq-simpler' of /home/linus/linux-gpio
into devel")), but when I merge the gpio tree later in my process, I do
not get this error.

> But when I'm writing on this topic anyway, I'll add some more
> info, in case anyone cares.
> 
> I think fix for this bug is to use gc->irq_chained_parent instead
> of gc->irq_parent, at least that changed as part of the indicated
> commit. Completely untested...
> 
> The fix for the bug in the pinctrl tree is to add a missing >
> as posted by Andrew Lunn in [1] (with a slightly broken commit
> message; two counts of s/chip-/client-/, an extra line after
> the sob and I guess the subject is no longer true).
> 
> Cheers,
> Peter
> 
> [1] http://marc.info/?l=linux-gpio&m=148088890030876&w=2

Thanks for the info ... this still needs fixing in the pinctrl tree.

P.S. Peter, your email had a bad header line:

Reply-To: 20161207083102.093fdf96@canb.auug.org.au

that should probably have been In-Reply-To ...
-- 
Cheers,
Stephen Rothwell
