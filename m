From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: Signed-off-bys missing for commits in the block
        tree
Date: Wed, 30 Aug 2017 19:09:36 +0200
Message-ID: <20170830170936.GA3925@lst.de>
References: <20170831030647.19c22478@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:50776 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751333AbdH3RJi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Aug 2017 13:09:38 -0400
Content-Disposition: inline
In-Reply-To: <20170831030647.19c22478@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Arnav Dawn <a.dawn@samsung.com>, Guan Junxiong <guanjunxiong@huawei.com>, Max Gurtovoy <maxg@mellanox.com>, James Smart <james.smart@broadcom.com>, Martin Wilck <mwilck@suse.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, Roland Kammerer <roland.kammerer@linbit.com>

On Thu, Aug 31, 2017 at 03:06:47AM +1000, Stephen Rothwell wrote:
> Commits
> 
>   b6dccf7fae43 ("nvme: add support for FW activation without reset")
>   62346eaeb2f1 ("nvme: define NVME_NSID_ALL")
>   9b483da15dd0 ("nvme-fabrics: log a warning if hostid is invalid")
>   ad4e05b24c42 ("nvme: add symbolic constants for CC identifiers")
>   60b43f627a71 ("nvme: rename AMS symbolic constants to fit specification")
>   5533d42480d6 ("nvme-fc: Reattach to localports on re-registration")
>   48fa362b6c3f ("nvmet-fc: simplify sg list handling")
>   01f33c336e2d ("string.h: add memcpy_and_pad()")
>   17c39d053a46 ("nvmet: use memcpy_and_pad for identify sn/fr")
>   a7b7c7a105a5 ("nvme-rdma: Use unlikely macro in the fast path")
>   5228b3280b9b ("nvme: fix uninitialized prp2 value on small transfers")
>   07fbd32a6b21 ("nvme: honor RTD3 Entry Latency for shutdowns")
> 
> are missing a Signed-off-bys from their committers.

They all have singnoffs from the original committer.  It's just
that we team-maintain the tree and had a rebase.

Are we supposed to add another Signoff just for the rebase?
