From: Petr Mladek <pmladek@suse.com>
Subject: Re: linux-next: manual merge of the jc_docs tree with the printk tree
Date: Fri, 22 Dec 2017 12:08:54 +0100
Message-ID: <20171222110854.fdxehxx3dbxq7vep@pathway.suse.cz>
References: <20171222104530.70bef8ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40605 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750786AbdLVLI4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Dec 2017 06:08:56 -0500
Content-Disposition: inline
In-Reply-To: <20171222104530.70bef8ac@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, "Tobin C. Harding" <me@tobin.cc>

Hi Jonathan,

On Fri 2017-12-22 10:45:30, Stephen Rothwell wrote:
> Hi Jonathan,
> 
> Today's linux-next merge of the jc_docs tree got a conflict in:
> 
>   Documentation/core-api/printk-formats.rst
> 
> between commit:
> 
>   d7c6075efa6c ("symbol lookup: introduce dereference_symbol_descriptor()")
> 
> from the printk tree and commit:
> 
>   b3ed23213eab ("doc: convert printk-formats.txt to rst")
> 
> from the jc_docs tree.
> 
> I fixed it up (I think, see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

I guess that you have experience with these problems so you probably
know how to handle this the best way.

Anyway, the printk.git stuff is targeting kernel-4.16. I have no
problem to take the document conversion via printk.git tree.
We could do it also the other way. But note that the conflicting
change in printk.git is part of a patchset (8 patches).

Best Regards,
Petr

PS: I will stay out of computers next week, so I probably
won't be able to do anything about this until January 2, 2018.
