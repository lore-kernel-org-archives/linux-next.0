From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: build warning after merge of the device-mapper tree
Date: Tue, 19 Feb 2019 22:35:39 -0500
Message-ID: <20190220033539.GA17586@redhat.com>
References: <20190220131555.15317a39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190220131555.15317a39@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 19 2019 at  9:15pm -0500,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the device-mapper tree, today's linux-next build
> (powerpc_ppc64_defconfig) produced this warning:
> 
> In file included from include/linux/blkdev.h:21,
>                  from include/linux/blk-mq.h:5,
>                  from drivers/md/dm-core.h:14,
>                  from drivers/md/dm.c:8:
> drivers/md/dm.c: In function 'dec_pending':
> include/linux/bio.h:626:15: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   bio->bi_next = bl->head;
>   ~~~~~~~~~~~~~^~~~~~~~~~
> drivers/md/dm.c:930:14: note: 'bio' was declared here
>   struct bio *bio;
>               ^~~
> 
> Introduced by commit
> 
>   58c66b86cfe7 ("dm: improve noclone_endio() to support multipath target")

Thanks, I've fixed it up.

Mike
