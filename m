From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the mips tree
Date: Mon, 2 May 2016 08:28:15 -0700
Message-ID: <20160502152815.GB27283@kroah.com>
References: <20160502155201.306e1cef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33276 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752211AbcEBP2S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2016 11:28:18 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id F321020502
	for <linux-next@vger.kernel.org>; Mon,  2 May 2016 11:28:17 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20160502155201.306e1cef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei Pistirica <andrei.pistirica@microchip.com>, Joshua Henderson <joshua.henderson@microchip.com>, Vladimir Murzin <vladimir.murzin@arm.com>

On Mon, May 02, 2016 at 03:52:01PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   drivers/tty/serial/Makefile
>   include/uapi/linux/serial_core.h
> 
> between commit:
> 
>   a484a06f7cb1 ("serial: pic32_uart: Add PIC32 UART driver")
> 
> from the mips tree and commit:
> 
>   041f031def33 ("serial: mps2-uart: add MPS2 UART driver")
> 
> from the tty tree.
> 
> I fixed it up (see below - I assume the numbers in
> uapi/linux/serial_core.h are meant to be unique?)

Yes they are, thanks.  It's a horrid old api :(

> and can carry the fix
> as necessary. This is now fixed as far as linux-next is concerned, but
> any non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Fix looks good to me, thanks.

greg k-h
