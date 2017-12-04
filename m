From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Mon, 4 Dec 2017 10:10:32 +0100
Message-ID: <20171204091032.GD16936@kroah.com>
References: <20171204141956.5b90bc18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:39578 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753571AbdLDJK0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Dec 2017 04:10:26 -0500
Content-Disposition: inline
In-Reply-To: <20171204141956.5b90bc18@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rui Feng <rui_feng@realsil.com.cn>, Daniel Bristot de Oliveira <bristot@redhat.com>, Perry Yuan <perry_yuan@dell.com>

On Mon, Dec 04, 2017 at 02:19:56PM +1100, Stephen Rothwell wrote:
> Hi Lee,
> 
> After merging the mfd tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/staging/rts5208/sd.o: In function `.sd_power_off_card3v3':
> (.text+0x5760): multiple definition of `.sd_power_off_card3v3'
> drivers/misc/cardreader/rtsx_pcr.o:(.text+0x4630): first defined here
> drivers/staging/rts5208/sd.o:(.opd+0x378): multiple definition of `sd_power_off_card3v3'
> drivers/misc/cardreader/rtsx_pcr.o:(.opd+0x4f8): first defined here
> drivers/staging/rts5208/ms.o: In function `.ms_power_off_card3v3':
> (.text+0x5e70): multiple definition of `.ms_power_off_card3v3'
> drivers/misc/cardreader/rtsx_pcr.o:(.text+0x46e0): first defined here
> drivers/staging/rts5208/ms.o:(.opd+0x360): multiple definition of `ms_power_off_card3v3'
> drivers/misc/cardreader/rtsx_pcr.o:(.opd+0x510): first defined here
> 
> 
> Caused by commit
> 
>   5da4e04ae480 ("misc: rtsx: Add support for RTS5260")
> 
> I added the following fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 4 Dec 2017 14:10:34 +1100
> Subject: [PATCH] misc: rtsx: fix symbol clashes
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/misc/cardreader/rts5260.c  | 4 ++--
>  drivers/misc/cardreader/rtsx_pcr.c | 4 ++--
>  drivers/misc/cardreader/rtsx_pcr.h | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
