From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Date: Mon, 12 Dec 2016 10:00:32 +0800
Message-ID: <CACVXFVOKiyQM4OypjV=jawshpEhwXVVLY+3=9bqS95vJDd=dbw@mail.gmail.com>
References: <20161212123140.2408fefb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34243 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753810AbcLLCAe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Dec 2016 21:00:34 -0500
In-Reply-To: <20161212123140.2408fefb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

On Mon, Dec 12, 2016 at 9:31 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Jens,
>
> Today's linux-next merge of the block tree got a conflict in:
>
>   fs/logfs/dev_bdev.c
>
> between commit:
>
>   6b4fbde3b979 ("logfs: remove from tree")
>
> from the vfs tree and commitis:
>
>   3a83f4677539 ("block: bio: pass bvec table to bio_init()")
>   739a9975468c ("fs: logfs: convert to bio_add_page() in sync_request()")
>   d4f98a89f9cd ("fs: logfs: use bio_add_page() in __bdev_writeseg()")
>   c12484367865 ("fs: logfs: use bio_add_page() in do_erase()")
>   05aea81b4bc9 ("fs: logfs: remove unnecesary check")
>
> from the block tree.
>
> I fixed it up (I removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Looks every time the logfs changes have been posted in fsdev mail list.

-- 
Ming Lei
