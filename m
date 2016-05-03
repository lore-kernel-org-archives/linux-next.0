From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Tue, 3 May 2016 14:03:41 -0600
Message-ID: <5729041D.7070707@kernel.dk>
References: <20160503142552.1c5e1d83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160503142552.1c5e1d83@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On 05/02/2016 10:25 PM, Stephen Rothwell wrote:
> Hi Jens,
>
> Today's linux-next merge of the block tree got a conflict in:
>
>    drivers/nvme/host/pci.c
>
> between commit:
>
>    9bf2b972afea ("NVMe: Fix reset/remove race")
>
> from Linus' tree and commit:
>
>    bb8d261e0888 ("nvme: introduce a controller state machine")
>
> from the block tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

There's a proper fixup in my for-next now, so you should be able to drop 
this one.

-- 
Jens Axboe
