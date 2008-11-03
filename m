From: Mark Brown <broonie@sirena.org.uk>
Subject: Re: [PATCH 1/1] [ALSA] SOC: Fix setting codec register with debugfs filesystem merge error
Date: Mon, 3 Nov 2008 19:58:26 +0000
Message-ID: <E6CA23EC-A08D-449B-B5D2-4035BA8CC7F4@sirena.org.uk>
References: <s5h63n7wz51.wl%tiwai@suse.de> <1225740127-30042-1-git-send-email-troy.kisky@boundarydevices.com> (sfid-20081103_192221_255640_19C1D083)
Mime-Version: 1.0 (iPhone Mail 5F136)
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:2058 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbYKCT60 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 14:58:26 -0500
In-Reply-To: <1225740127-30042-1-git-send-email-troy.kisky@boundarydevices.com> (sfid-20081103_192221_255640_19C1D083)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: "tiwai@suse.de" <tiwai@suse.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Troy Kisky <troy.kisky@boundarydevices.com>

On 3 Nov 2008, at 19:22, Troy Kisky <troy.kisky@boundarydevices.com>  
wrote:

> Call device_create_file only once in snd_soc_dapm_sys_add function.
>
> Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

>
>
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 7bf3c40..0fecbb4 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -822,14 +822,8 @@ static DEVICE_ATTR(dapm_widget, 0444,  
> dapm_widget_show, NULL);
>
> int snd_soc_dapm_sys_add(struct device *dev)
> {
> -    int ret;
> -
>    if (!dapm_status)
>        return 0;
> -
> -    ret = device_create_file(dev, &dev_attr_dapm_widget);
> -    if (ret != 0)
> -        return ret;
>    return device_create_file(dev, &dev_attr_dapm_widget);
> }
>
> -- 
> 1.5.4.3
>
>
