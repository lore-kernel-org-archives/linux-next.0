From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [PATCH]:Fix warnings from drivers/i2c/i2c-core.c
Date: Sat, 29 Aug 2009 13:31:25 +0200
Message-ID: <20090829133125.1ecebfb3@hyperion.delvare>
References: <1249977226.2400.13.camel@HunTEr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bamako.nerim.net ([62.4.17.28]:50889 "EHLO bamako.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752204AbZH2Lb0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 29 Aug 2009 07:31:26 -0400
In-Reply-To: <1249977226.2400.13.camel@HunTEr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: vibi_sreenivasan@cms.com
Cc: linux-next@vger.kernel.org, "Ben Dooks (embedded platforms)" <ben-linux@fluff.org>

Hi Vibi,

On Tue, 11 Aug 2009 13:23:46 +0530, vibi sreenivasan wrote:
> 
> Fix Following Warnings
> 
> drivers/i2c/i2c-core.c:234: warning: initialization from incompatible pointer type
> drivers/i2c/i2c-core.c:537: warning: initialization from incompatible pointer type

Thanks for reporting. Please add the linux-i2c list in Cc next time too.

> Signed-off-by: vibi sreenivasan, CMS COMPUTERS LTD, INDIA <vibi_sreenivasan@cms.com>

Signed-off-by lines should only include developer names, not companies
names nor countries.

> ---
>  drivers/i2c/i2c-core.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
> index eeb9ae5..8d80fce 100644
> --- a/drivers/i2c/i2c-core.c
> +++ b/drivers/i2c/i2c-core.c
> @@ -214,7 +214,7 @@ static struct attribute_group i2c_dev_attr_group = {
>         .attrs          = i2c_dev_attrs,
>  };
>  
> -static struct attribute_group *i2c_dev_attr_groups[] = {
> +static const struct attribute_group *i2c_dev_attr_groups[] = {
>         &i2c_dev_attr_group,
>         NULL
>  };
> @@ -528,7 +528,7 @@ static struct attribute_group i2c_adapter_attr_group = {
>         .attrs          = i2c_adapter_attrs,
>  };
>  
> -static struct attribute_group *i2c_adapter_attr_groups[] = {
> +static const struct attribute_group *i2c_adapter_attr_groups[] = {
>         &i2c_adapter_attr_group,
>         NULL
>  };

Patch was corrupted by your e-mail client, I wasn't able to apply it.
Please check your configuration for next time.

Anyway, as these warnings are introduced by patches which have not been
committed yet, I will update these patches rather than adding the fixes
as a separate patch.

-- 
Jean Delvare
