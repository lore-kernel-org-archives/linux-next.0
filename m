From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the mips tree
Date: Fri, 18 Nov 2011 08:19:18 -0800
Message-ID: <20111118161918.GC30462@kroah.com>
References: <20111118142245.5f4156be67f6048f58595b0d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:55979 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756415Ab1KRQfv (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Nov 2011 11:35:51 -0500
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 79CE020E14
	for <linux-next@vger.kernel.org>; Fri, 18 Nov 2011 11:35:51 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111118142245.5f4156be67f6048f58595b0d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gabor Juhos <juhosg@openwrt.org>, Ralf Baechle <ralf@linux-mips.org>, Rong Wang <Rong.Wang@csr.com>

On Fri, Nov 18, 2011 at 02:22:45PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/Makefile between commit 58235d376b15 ("SERIAL: AR933X:
> Add driver for the built-in UART of the SoC") from the mips tree and
> commit 161e773cbd0c ("UART: add CSR SiRFprimaII SoC on-chip uart
> drivers") from the tty tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks fine, thanks.

greg k-h
