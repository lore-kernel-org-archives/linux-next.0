From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Sun, 29 Jan 2017 18:53:42 -0700
Message-ID: <5f2da80f-c6fe-8c45-0e56-819aae7d925c@kernel.dk>
References: <20170130124350.36a57549@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170130124350.36a57549@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On 01/29/2017 06:43 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/nvme/host/scsi.c: In function 'nvme_scsi_translate':
> drivers/nvme/host/scsi.c:2350:9: error: 'BLK_MAX_CDB' undeclared (first use in this function)
>   u8 cmd[BLK_MAX_CDB];
>          ^
> drivers/nvme/host/scsi.c:2350:9: note: each undeclared identifier is reported only once for each function it appears in
> drivers/nvme/host/scsi.c:2350:5: warning: unused variable 'cmd' [-Wunused-variable]
>   u8 cmd[BLK_MAX_CDB];
>      ^
> drivers/nvme/host/scsi.c: In function 'nvme_sg_io':
> drivers/nvme/host/scsi.c:2454:20: error: 'BLK_MAX_CDB' undeclared (first use in this function)  
>   if (hdr.cmd_len > BLK_MAX_CDB)
>                     ^
> 
> Caused by commit
> 
>   82ed4db499b8 ("block: split scsi_request out of struct request")
> 
> I have used the block tree from next-20170125 for today.

Huh, I wonder how that snuck past my allmodconfig builds, that looks
like a clear failure.


-- 
Jens Axboe
