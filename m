From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Tue, 04 Nov 2014 08:54:29 +0100
Message-ID: <1415087669.2389.7.camel@AMDC1943>
References: <20141104164005.1a45ad46@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:29035 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752336AbaKDHyd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Nov 2014 02:54:33 -0500
In-reply-to: <20141104164005.1a45ad46@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On wto, 2014-11-04 at 16:40 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mfd tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
> 
> drivers/regulator/max77686.c:432:13: warning: 'struct max77686_platform_data' declared inside parameter list
>       struct max77686_platform_data *pdata)
>              ^
> drivers/regulator/max77686.c:432:13: warning: its scope is only this definition or declaration, which is probably not what you want
> drivers/regulator/max77686.c: In function 'max77686_pmic_dt_parse_pdata':
> drivers/regulator/max77686.c:447:7: error: dereferencing pointer to incomplete type
>   pdata->num_regulators = ARRAY_SIZE(regulators);
>        ^
> drivers/regulator/max77686.c:448:42: error: dereferencing pointer to incomplete type
>   rdata = devm_kzalloc(&pdev->dev, sizeof(*rdata) *
>                                           ^
> drivers/regulator/max77686.c:449:14: error: dereferencing pointer to incomplete type
>          pdata->num_regulators, GFP_KERNEL);
>               ^
> drivers/regulator/max77686.c:455:23: error: dereferencing pointer to incomplete type
>   for (i = 0; i < pdata->num_regulators; i++) {
>                        ^
> drivers/regulator/max77686.c:460:3: error: invalid use of undefined type 'struct max77686_regulator_data'
>    rdata[i].initdata = rmatch.init_data;
>    ^
> drivers/regulator/max77686.c:460:8: error: dereferencing pointer to incomplete type
>    rdata[i].initdata = rmatch.init_data;
>         ^
> drivers/regulator/max77686.c:461:3: error: invalid use of undefined type 'struct max77686_regulator_data'
>    rdata[i].of_node = rmatch.of_node;
>    ^
> drivers/regulator/max77686.c:461:8: error: dereferencing pointer to incomplete type
>    rdata[i].of_node = rmatch.of_node;
>         ^
> drivers/regulator/max77686.c:464:7: error: dereferencing pointer to incomplete type
>   pdata->regulators = rdata;
>        ^
> 
> And so on ...
> 
> Caused by commit 9d5f4c2c748e ("mfd: max77686/802: Remove support for
> board files") from the mfd tree.
> 
> I reverted that commit for today.

The commit depends on other patches from a set which hadn't been
applied. Please drop it.

Best regards,
Krzysztof
