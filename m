From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with Linus' tree
Date: Tue, 25 Oct 2011 14:02:57 +0200
Message-ID: <20111025120257.GA12558@kroah.com>
References: <20111025191217.31638338379ac498fda051fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5.smtp.messagingengine.com ([66.111.4.29]:58109 "EHLO
	out5.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756496Ab1JYMHD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Oct 2011 08:07:03 -0400
Content-Disposition: inline
In-Reply-To: <20111025191217.31638338379ac498fda051fb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>

On Tue, Oct 25, 2011 at 07:12:17PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/8250_pci.c between commit dacacc3e794c
> ("serial/8250_pci: delete duplicate data definition") from Linus' tree
> and commit 64d91cfaade2 ("8250_pci: Fix kernel panic when pch_uart is
> disabled") from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks, the fix is correct.

greg k-h
