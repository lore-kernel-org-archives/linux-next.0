From: Eric Miao <ymiao3@marvell.com>
Subject: RE: linux-next: manual merge of the sound tree with the pxa tree
Date: Mon, 9 Feb 2009 19:35:07 -0800
Message-ID: <F71A24FDAED97E4CB6D3A8E8A97D5C544138A8DA@SC-VEXCH1.marvell.com>
References: <20090210142230.07fdfe43.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from host2.marvell.com ([65.219.4.2]:47927 "EHLO maili.marvell.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752196AbZBJDfL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Feb 2009 22:35:11 -0500
In-Reply-To: <20090210142230.07fdfe43.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Takashi Iwai <tiwai@suse.de>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Philipp Zabel <philipp.zabel@gmail.com>

> Just simple context change. I fiex it up (see below) and can carry the
> fix as necessary.

Yes, this is correct. Thanks Stephen.

>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>
> diff --cc sound/soc/pxa/pxa2xx-i2s.c
> index 223de89,83b59d7..0000000
> --- a/sound/soc/pxa/pxa2xx-i2s.c
> +++ b/sound/soc/pxa/pxa2xx-i2s.c
> @@@ -24,8 -24,7 +24,7 @@@
>   #include <sound/pxa2xx-lib.h>
>
>   #include <mach/hardware.h>
>  -#include <mach/pxa-regs.h>
>  +#include <mach/dma.h>
> - #include <mach/pxa2xx-gpio.h>
>   #include <mach/audio.h>
>
>   #include "pxa2xx-pcm.h"
