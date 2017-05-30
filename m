From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: linux-next: manual merge of the nand tree with the jc_docs tree
Date: Tue, 30 May 2017 09:21:37 +0200
Message-ID: <20170530092137.2b6890be@bbrezillon>
References: <20170530113723.5b7ac9f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42305 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750821AbdE3HVu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 May 2017 03:21:50 -0400
In-Reply-To: <20170530113723.5b7ac9f1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>

Hi Stephen,

On Tue, 30 May 2017 11:37:23 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Boris,
> 
> Today's linux-next merge of the nand tree got a conflict in:
> 
>   drivers/mtd/nand/nand_base.c
> 
> between commit:
> 
>   b6f6c29454d2 ("mtd: adjust kernel-docs to avoid Sphinx/kerneldoc warnings")
> 
> from the jc_docs tree and commit:
> 
>   c79d63fd272c ("mtd: nand: Remove support for block locking/unlocking")
> 
> from the nand tree.
> 
> I fixed it up (the latter just removed the code modified by the former,
> so I did that) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

I just dropped commit c79d63fd272c from my nand/next branch. I'll queue
it for the next release.

Thanks,

Boris
