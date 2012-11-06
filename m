From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the arm tree
Date: Tue, 6 Nov 2012 09:17:49 +0100
Message-ID: <20121106081749.GB24564@kroah.com>
References: <20121106145332.5fd40abf0d74f8239156f75e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45920 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753866Ab2KFIRk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Nov 2012 03:17:40 -0500
Content-Disposition: inline
In-Reply-To: <20121106145332.5fd40abf0d74f8239156f75e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shubhrajyoti D <shubhrajyoti@ti.com>, Russell King <rmk@arm.linux.org.uk>

On Tue, Nov 06, 2012 at 02:53:32PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/omap-serial.c between commit d864c03bfce2 ("SERIAL:
> omap: remove setting of EFR SCD bit") from the arm tree and commit
> 7ba897d77ce2 ("serial: omap: Remove the default setting of special
> character") from the tty tree.
> 
> I fixed it up (using the version from the arm tree) and can carry the fix
> as necessary (no action is required).

That sounds fine, thanks.

greg k-h
