From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the moduleh tree with the v4l-dvb
 tree
Date: Sun, 31 Jul 2011 04:11:39 -0400
Message-ID: <20110731081138.GK31842@windriver.com>
References: <20110729144700.d58aad0fe07e454ac7c7ece4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:61269 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752458Ab1GaIMJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 31 Jul 2011 04:12:09 -0400
Content-Disposition: inline
In-Reply-To: <20110729144700.d58aad0fe07e454ac7c7ece4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ondrej Zary <linux@rainbow-software.org>, Mauro Carvalho Chehab <mchehab@redhat.com>

[linux-next: manual merge of the moduleh tree with the v4l-dvb tree] On 29/07/2011 (Fri 14:47) Stephen Rothwell wrote:

> Hi Paul,
> 
> Today's linux-next merge of the moduleh tree got a conflict in
> sound/i2c/other/tea575x-tuner.c between commit 4522e825dbfc ("[media]
> tea575x: convert to control framework") from the v4l-dvb tree and commit
> a319a4d494d5 ("sound: Add module.h to the previously silent sound users")
> from the moduleh tree.
> 
> Just context changes.  I fixed it up (see below) anc can carry the fix as
> necessary.

Seems 4522e825dbfc is in master now, so I've done the fixup locally
and you shouldn't see this crop up again.

Thanks,
Paul.

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc sound/i2c/other/tea575x-tuner.c
> index 484a35b,c65c624..0000000
> --- a/sound/i2c/other/tea575x-tuner.c
> +++ b/sound/i2c/other/tea575x-tuner.c
> @@@ -25,8 -25,9 +25,9 @@@
>   #include <linux/init.h>
>   #include <linux/slab.h>
>   #include <linux/version.h>
> + #include <linux/module.h>
>  -#include <sound/core.h>
>  +#include <media/v4l2-dev.h>
>  +#include <media/v4l2-ioctl.h>
>   #include <sound/tea575x-tuner.h>
>   
>   MODULE_AUTHOR("Jaroslav Kysela <perex@perex.cz>");
