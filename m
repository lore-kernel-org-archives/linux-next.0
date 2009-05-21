From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [PATCH] Staging: comedi: comedidev should include delay.h
Date: Thu, 21 May 2009 09:09:53 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.0905210907440.3475@localhost.localdomain>
References: <1242911193-30469-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:41845 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752380AbZEUNLR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2009 09:11:17 -0400
In-Reply-To: <1242911193-30469-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: gregkh@suse.de, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Thu, 21 May 2009, Alexander Beregalov wrote:

> Fix many build errors like this:
> comedi/drivers/adq12b.c:328: error: implicit declaration of function 'udelay'
>
> The same for aio_aio12_8.c, dmm32at.c and others.
>
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---
>  drivers/staging/comedi/comedidev.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/staging/comedi/comedidev.h b/drivers/staging/comedi/comedidev.h
> index 7a1ccde..3d0e80c 100644
> --- a/drivers/staging/comedi/comedidev.h
> +++ b/drivers/staging/comedi/comedidev.h
> @@ -38,6 +38,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/uaccess.h>
>  #include <linux/io.h>
> +#include <linux/delay.h>
>
>  #include "comedi.h"

  not sure it's worth noting but the header comedidev.h currently
resides in the comedi directory itself, while the source file rt.c
contains:

#include <linux/comedidev.h>

which doesn't seem right.  and that local comedidev.h header file
contains the comment:

/*
    include/linux/comedidev.h

as if it *were* really under include/linux.  perhaps someone would
like to clarify that.  just an observation.

rday
--
========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Linked In:                             http://www.linkedin.com/in/rpjday
Twitter:                                       http://twitter.com/rpjday
========================================================================
