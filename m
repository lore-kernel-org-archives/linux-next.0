From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the m68k tree
Date: Tue, 27 May 2014 08:30:34 -0700
Message-ID: <20140527153034.GA20250@kroah.com>
References: <20140527165337.5c7d4fa4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36355 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751831AbaE0P1E (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2014 11:27:04 -0400
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 1BD5821269
	for <linux-next@vger.kernel.org>; Tue, 27 May 2014 11:27:00 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140527165337.5c7d4fa4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Finn Thain <fthain@telegraphics.com.au>, Rob Herring <robh@kernel.org>

On Tue, May 27, 2014 at 04:53:37PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> Documentation/kernel-parameters.txt between commit d5ebf7cc86a7 ("m68k:
> Multi-platform EARLY_PRINTK") from the m68k tree and commit
> 0d3c673e7881 ("tty/serial: pl011: add generic earlycon support") from
> the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).  Thanks Geert for the heads up.

Looks good, thanks.

greg k-h
