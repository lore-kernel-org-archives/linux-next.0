From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the spi tree with the pm tree
Date: Mon, 4 Sep 2017 14:56:06 +1000
Message-ID: <20170904145606.218d9d7a@canb.auug.org.au>
References: <20170817132308.090d4b88@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36071 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750951AbdIDE4I (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Sep 2017 00:56:08 -0400
In-Reply-To: <20170817132308.090d4b88@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, Suniel Mahesh <sunil.m@techveda.org>, Karthik Tummala <karthik@techveda.org>

Hi all,

On Thu, 17 Aug 2017 13:23:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the spi tree got a conflict in:
> 
>   drivers/spi/spi.c
> 
> between commit:
> 
>   8a2e487e6fc1 ("spi: Use Apple device properties in absence of ACPI resources")
> 
> from the pm tree and commit:
> 
>   9b61e302210e ("spi: Pick spi bus number from Linux idr or spi alias")
> 
> from the spi tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/spi/spi.c
> index 7d920ea19957,43cb8b98e953..000000000000
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@@ -40,7 -40,7 +40,8 @@@
>   #include <linux/ioport.h>
>   #include <linux/acpi.h>
>   #include <linux/highmem.h>
>  +#include <linux/platform_data/x86/apple.h>
> + #include <linux/idr.h>
>   
>   #define CREATE_TRACE_POINTS
>   #include <trace/events/spi.h>

Just a reminder that this conflict still exists.

-- 
Cheers,
Stephen Rothwell
