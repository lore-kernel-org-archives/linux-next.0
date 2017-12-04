From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Mon, 4 Dec 2017 09:39:53 +0000
Message-ID: <20171204093953.iwhew4w7wgzm6b3q@dell>
References: <20171204141956.5b90bc18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:35336 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752550AbdLDJj5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Dec 2017 04:39:57 -0500
Received: by mail-wr0-f193.google.com with SMTP id g53so16498898wra.2
        for <linux-next@vger.kernel.org>; Mon, 04 Dec 2017 01:39:56 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171204141956.5b90bc18@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rui Feng <rui_feng@realsil.com.cn>, Daniel Bristot de Oliveira <bristot@redhat.com>, Perry Yuan <perry_yuan@dell.com>

On Mon, 04 Dec 2017, Stephen Rothwell wrote:

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

Thanks Stephen.

Although I'm not sure how to apply this manually without scissors.

Might have to do so manually.

> ---
>  drivers/misc/cardreader/rts5260.c  | 4 ++--
>  drivers/misc/cardreader/rtsx_pcr.c | 4 ++--
>  drivers/misc/cardreader/rtsx_pcr.h | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/misc/cardreader/rts5260.c b/drivers/misc/cardreader/rts5260.c
> index 3b308640282d..07cb93abf685 100644
> --- a/drivers/misc/cardreader/rts5260.c
> +++ b/drivers/misc/cardreader/rts5260.c
> @@ -426,9 +426,9 @@ void rts5260_process_ocp(struct rtsx_pcr *pcr)
>  	rtsx_pci_get_ocpstat(pcr, &pcr->ocp_stat);
>  	rts5260_get_ocpstat2(pcr, &pcr->ocp_stat2);
>  	if (pcr->card_exist & SD_EXIST)
> -		sd_power_off_card3v3(pcr);
> +		rtsx_sd_power_off_card3v3(pcr);
>  	else if (pcr->card_exist & MS_EXIST)
> -		ms_power_off_card3v3(pcr);
> +		rtsx_ms_power_off_card3v3(pcr);
>  
>  	if (!(pcr->card_exist & MS_EXIST) && !(pcr->card_exist & SD_EXIST)) {
>  		if ((pcr->ocp_stat & (SD_OC_NOW | SD_OC_EVER |
> diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
> index 99adc67bbf73..5345170fc57b 100644
> --- a/drivers/misc/cardreader/rtsx_pcr.c
> +++ b/drivers/misc/cardreader/rtsx_pcr.c
> @@ -1208,7 +1208,7 @@ void rtsx_pci_clear_ocpstat(struct rtsx_pcr *pcr)
>  	}
>  }
>  
> -int sd_power_off_card3v3(struct rtsx_pcr *pcr)
> +int rtsx_sd_power_off_card3v3(struct rtsx_pcr *pcr)
>  {
>  	rtsx_pci_write_register(pcr, CARD_CLK_EN, SD_CLK_EN |
>  		MS_CLK_EN | SD40_CLK_EN, 0);
> @@ -1223,7 +1223,7 @@ int sd_power_off_card3v3(struct rtsx_pcr *pcr)
>  	return 0;
>  }
>  
> -int ms_power_off_card3v3(struct rtsx_pcr *pcr)
> +int rtsx_ms_power_off_card3v3(struct rtsx_pcr *pcr)
>  {
>  	rtsx_pci_write_register(pcr, CARD_CLK_EN, SD_CLK_EN |
>  		MS_CLK_EN | SD40_CLK_EN, 0);
> diff --git a/drivers/misc/cardreader/rtsx_pcr.h b/drivers/misc/cardreader/rtsx_pcr.h
> index c544e35d0154..6ea1655db0bb 100644
> --- a/drivers/misc/cardreader/rtsx_pcr.h
> +++ b/drivers/misc/cardreader/rtsx_pcr.h
> @@ -107,7 +107,7 @@ void rtsx_pci_disable_ocp(struct rtsx_pcr *pcr);
>  void rtsx_pci_enable_ocp(struct rtsx_pcr *pcr);
>  int rtsx_pci_get_ocpstat(struct rtsx_pcr *pcr, u8 *val);
>  void rtsx_pci_clear_ocpstat(struct rtsx_pcr *pcr);
> -int sd_power_off_card3v3(struct rtsx_pcr *pcr);
> -int ms_power_off_card3v3(struct rtsx_pcr *pcr);
> +int rtsx_sd_power_off_card3v3(struct rtsx_pcr *pcr);
> +int rtsx_ms_power_off_card3v3(struct rtsx_pcr *pcr);
>  
>  #endif

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
