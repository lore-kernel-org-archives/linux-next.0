From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: linux-next: manual merge of the scsi tree with the block tree
Date: Mon, 15 Apr 2019 06:48:21 -0700
Message-ID: <84c02649-1eeb-3d28-6cc2-0a5d0f5f6b7d@acm.org>
References: <20190415155939.35325ef1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415155939.35325ef1@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Martin Wilck <mwilck@suse.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On 4/14/19 10:59 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the scsi tree got a conflict in:
> 
>   drivers/scsi/sd.c
> 
> between commit:
> 
>   c92e2f04b359 ("block: disk_events: introduce event flags")
> 
> from the block tree and commit:
> 
>   21e6ba3f0e02 ("scsi: sd: Rely on the driver core for asynchronous probing")
>   d16ece577bf2 ("scsi: sd: Inline sd_probe_part2()")
> 
> from the scsi tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen for having resolved this conflict. The conflict resolution
looks good to me.

Bart.
