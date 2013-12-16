From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Mon, 16 Dec 2013 08:08:34 +0100
Message-ID: <1387177714.4280.2.camel@AMDC1943>
References: <20131216164721.79bfe996919a8ec3576867c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:17972 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751359Ab3LPHIi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Dec 2013 02:08:38 -0500
In-reply-to: <20131216164721.79bfe996919a8ec3576867c7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

Hi,

I sent a fix for this already on last Wednesday but I forgot to put you
on as recipient.
http://thread.gmane.org/gmane.linux.kernel/1612360
Fix is needed also for clock driver and on Saturday Rashika Kheria
posted similar patch.

Best regards,
Krzysztof


On Mon, 2013-12-16 at 16:47 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/regulator/s2mps11.c: In function 's2mps11_pmic_probe':
> drivers/regulator/s2mps11.c:441:23: error: 'struct sec_pmic_dev' has no member named 'regmap'
>   config.regmap = iodev->regmap;
>                        ^
> 
> Caused by commit 3e1e4a5f3a32 ("mfd/rtc: s5m: fix register updating by
> adding regmap for RTC") from Linus' tree.  Grep is your friend ...
> 
> I have added the following fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 16 Dec 2013 16:43:02 +1100
> Subject: [PATCH] mfd/rtc: fix for previous RTC fix
> 
> This updates drivers/regulator/s2mps11.c for the changes in commit
> 3e1e4a5f3a32 ("mfd/rtc: s5m: fix register updating by adding regmap
> for RTC").
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/regulator/s2mps11.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
> index 333677d68d0e..9e61922d8230 100644
> --- a/drivers/regulator/s2mps11.c
> +++ b/drivers/regulator/s2mps11.c
> @@ -438,7 +438,7 @@ common_reg:
>  	platform_set_drvdata(pdev, s2mps11);
>  
>  	config.dev = &pdev->dev;
> -	config.regmap = iodev->regmap;
> +	config.regmap = iodev->regmap_pmic;
>  	config.driver_data = s2mps11;
>  	for (i = 0; i < S2MPS11_REGULATOR_MAX; i++) {
>  		if (!reg_np) {
> -- 
> 1.8.5.1
> 
