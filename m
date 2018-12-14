From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with the scsi-fixes
 tree
Date: Thu, 13 Dec 2018 21:06:47 -0700
Message-ID: <a48f78a5-901b-20be-8df0-d69770710932@kernel.dk>
References: <20181214132315.601d020f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214132315.601d020f@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On 12/13/18 7:23 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   drivers/scsi/sd.c
> 
> between commit:
> 
>   61cce6f6eece ("scsi: sd: use mempool for discard special page")
> 
> from the scsi-fixes tree and commit:
> 
>   159b2cbf59f4 ("scsi: return blk_status_t from scsi_init_io and ->init_command")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Martin, I can carry this one to avoid this conflict. Let me know!

-- 
Jens Axboe
