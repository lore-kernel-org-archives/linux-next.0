From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 12:56:31 +0100
Message-ID: <20080701125631.3deab583@lxorguk.ukuu.org.uk>
References: <20080701211003.8ecd7d3b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:41060 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751727AbYGAMO1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 08:14:27 -0400
In-Reply-To: <20080701211003.8ecd7d3b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg KH <greg@kroah.com>

On Tue, 1 Jul 2008 21:10:03 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/usb/gadget/serial.c between commit
> d4013f65e6b7be39e93845c280482e3f1d7894f0 ("usb gadget: use new serial
> core") from the usb tree and commit
> e806c01e6c8cacf955620105398902698ec3d933 ("79-tty-break-errorhandler")
> from the ttydev tree.
> 
> The former patch removes the code modified by the latter.  I have used
> the version from the usb tree.

Patch updated to drop that change from the diff
