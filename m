From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Tue, 31 Jul 2018 08:59:57 -0600
Message-ID: <847d1024-7e9d-65e2-356e-6fc3ffbece1e@kernel.dk>
References: <20180731130700.3ff50dce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180731130700.3ff50dce@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Max Gurtovoy <maxg@mellanox.com>
List-Id: linux-next.vger.kernel.org

On 7/30/18 9:07 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/scsi/sd.o: In function `sd_done':
> sd.c:(.text+0x1050): undefined reference to `t10_pi_complete'
> 
> Presuably caused by commit
> 
>   10c41ddd6132 ("block: move dif_prepare/dif_complete functions to block layer")
> 
> # CONFIG_BLK_DEV_INTEGRITY is not set
> CONFIG_BLK_DEV_SD=y
> 
> I have used the block tree from next-20180730 for today.

Thanks, I fixed it up just now, next one should be fine again.

-- 
Jens Axboe
