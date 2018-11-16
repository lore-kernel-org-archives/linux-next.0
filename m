From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 15 Nov 2018 19:21:45 -0700
Message-ID: <a16e526d-c0a0-50cf-702f-f9495c469b54@kernel.dk>
References: <20181116131919.781539f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116131919.781539f7@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On 11/15/18 7:19 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   block/blk.h
> 
> between commit:
> 
>   1adfc5e4136f ("block: make sure discard bio is aligned with logical block size")
> 
> from Linus' tree (precedes v4.20-rc2) and commit:
> 
>   079076b3416e ("block: remove deadline __deadline manipulation helpers")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen, there's a few coming up. Come Sunday I'll pull in
-rc3 and resolve these. Not just for that, but also to ensure that
my -next branch has some important fixes from this series.

-- 
Jens Axboe
