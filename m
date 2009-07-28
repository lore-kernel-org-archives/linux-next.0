From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree with the
 usb.current tree
Date: Tue, 28 Jul 2009 13:29:11 +0100
Message-ID: <20090728132911.03ff78ea@lxorguk.ukuu.org.uk>
References: <20090728140110.7cfe7c22.sfr@canb.auug.org.au>
	<20090728112608.09a494e0@lxorguk.ukuu.org.uk>
	<200907281410.41449.oliver@neukum.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:38793 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753263AbZG1M2R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2009 08:28:17 -0400
In-Reply-To: <200907281410.41449.oliver@neukum.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oliver Neukum <oliver@neukum.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>

> As serial_open() takes the lock, resume() must not do so.
> If however, remote wakeup is used a lock must be taken
> to look at port->count reliably. As this is impossible, the patch
> implementing use of remote wakeup for the option driver
> implements a private flag for opened ports.

I need to look at the actual diff, but the combination looks completely
bogus unless I'm misreading the fixup which is possible.

The way the core serial code and most other drivers do this is to keep
track of the port ASYNC_INITIALIZED flag, which indicates (in the non USB
cases but trivially fixable for the USB cases) that the port hardware is
initialized. We now set it on an open but we don't clear it on
serial_do_down() finishing.
