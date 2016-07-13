From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the akpm-current tree with the block
 tree
Date: Wed, 13 Jul 2016 09:31:08 -0700
Message-ID: <57866CCC.20707@kernel.dk>
References: <20160713161448.7cedd072@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160713161448.7cedd072@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.com>, Keith Busch <keith.busch@intel.com>
List-Id: linux-next.vger.kernel.org

On 07/12/2016 11:14 PM, Stephen Rothwell wrote:
> Hi Andrew,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>    drivers/nvme/host/core.c
>
> between commit:
>
>    f80ec966c19b ("nvme: Limit command retries")
>
> from the block tree and commit:
>
>    8cc07e463b0c ("NVMe: don't allocate unused nvme_major")
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Usually I'm not that picky with trivial stuff going through other trees, 
but with the amount of churn we have in NVMe, it really should go 
through the block tree.

-- 
Jens Axboe
