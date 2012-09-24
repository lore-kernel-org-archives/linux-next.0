From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: manual merge of the arm-soc tree with the l2-mtd
 tree
Date: Mon, 24 Sep 2012 11:50:02 -0400
Message-ID: <20120924155002.GP5469@titan.lakedaemon.net>
References: <20120924193934.76d4feafb689b265ff49c5c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-04-ewr.mailhop.org ([204.13.248.74]:37835 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755956Ab2IXPuJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Sep 2012 11:50:09 -0400
Content-Disposition: inline
In-Reply-To: <20120924193934.76d4feafb689b265ff49c5c3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>

On Mon, Sep 24, 2012 at 07:39:34PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/mtd/nand/orion_nand.c between commit 11a3910e730e ("mtd:
> orion_nand: remove <mach/hardware.h> include") from the l2-mtd tree and
> commit c02cecb92ed4 ("ARM: orion: move platform_data definitions") from
> the arm-soc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

The change below is correct, thanks.

thx,

Jason.

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/mtd/nand/orion_nand.c
> index 9ee436d,131b58a..0000000
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@@ -21,7 -21,8 +21,7 @@@
>   #include <linux/err.h>
>   #include <asm/io.h>
>   #include <asm/sizes.h>
> - #include <plat/orion_nand.h>
>  -#include <mach/hardware.h>
> + #include <linux/platform_data/mtd-orion_nand.h>
>   
>   static void orion_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>   {



> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
