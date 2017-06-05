From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the tty tree
Date: Mon, 5 Jun 2017 08:50:03 +0200
Message-ID: <20170605065003.GG14680@kroah.com>
References: <20170605145749.4d6df5cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50851 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751297AbdFEGuG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Jun 2017 02:50:06 -0400
Content-Disposition: inline
In-Reply-To: <20170605145749.4d6df5cd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Okash Khawaja <okash.khawaja@gmail.com>, Alan Cox <alan@llwyncelyn.cymru>

On Mon, Jun 05, 2017 at 02:57:49PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   include/uapi/linux/tty.h
> 
> between commit:
> 
>   8a8dabf2dd68 ("tty: handle the case where we cannot restore a line discipline")
> 
> from the tty tree and commit:
> 
>   1ab92da32e37 ("staging: speakup: add tty-based comms functions")
> 
> from the staging tree.
> 
> I fixed it up (I used the tty tree version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

I'm the maintainer of both, I knew this would happen and made it so it
was obvious what version to take :)

thanks,

greg k-h
