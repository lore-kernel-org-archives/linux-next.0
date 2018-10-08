From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: linux-next: build warning after merge of the nand tree
Date: Mon, 8 Oct 2018 09:53:34 +0200
Message-ID: <20181008095334.6850f033@xps13>
References: <20181008113842.4bfc8cf9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008113842.4bfc8cf9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> wrote on Mon, 8 Oct 2018
11:38:42 +1100:

> Hi Boris,

Boris is still there but I'm in charge of the NAND tree these days (and
the one to blame too for this one :) ).

> 
> After merging the nand tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/mtd/nand/raw/nand_toshiba.c: In function 'toshiba_nand_read_page_benand':
> drivers/mtd/nand/raw/nand_toshiba.c:54:19: warning: unused variable 'mtd' [-Wunused-variable]
>   struct mtd_info *mtd = nand_to_mtd(chip);
>                    ^~~
> drivers/mtd/nand/raw/nand_toshiba.c: In function 'toshiba_nand_read_subpage_benand':
> drivers/mtd/nand/raw/nand_toshiba.c:68:19: warning: unused variable 'mtd' [-Wunused-variable]
>   struct mtd_info *mtd = nand_to_mtd(chip);
>                    ^~~
> 
> Introduced by commit
> 
>   fe8b76ec9886 ("mtd: rawnand: toshiba: Pass a single nand_chip object to the status helper")

Thanks for the warning, I'll correct it for tomorrow.

Kind regards,
Miquèl
