From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: linux-next: manual merge of the mtd tree with Linus' tree
Date: Tue, 29 Jan 2019 15:12:09 +0100
Message-ID: <20190129151209.16bf37f4@bbrezillon>
References: <20190129111700.7d50e369@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129111700.7d50e369@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Brian Norris <computersforpeace@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: linux-next.vger.kernel.org

On Tue, 29 Jan 2019 11:17:00 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the mtd tree got a conflict in:
> 
>   drivers/mtd/mtdpart.c
> 
> between commit:
> 
>   2b6f0090a333 ("mtd: Check add_mtd_device() ret code")
> 
> from Linus' tree and commit:
> 
>   2c24c9af0f38 ("mtd: rework partitions handling")

I dropped this patch for now. I'll merge -rc2 before applying them next
time.

Thanks for the report.

Boris
