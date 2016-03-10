From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: next-20160309 build: 1 failures 12 warnings (next-20160309)
Date: Thu, 10 Mar 2016 17:48:25 +0530
Message-ID: <56E16611.4080502@nvidia.com>
References: <E1adZjx-00089R-1L@optimist> <20160310083600.GO3898@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14940 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752133AbcCJMb0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2016 07:31:26 -0500
In-Reply-To: <20160310083600.GO3898@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Y Vo <yvo@apm.com>, Quan Nguyen <qnguyen@apm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, mbrugger@suse.com


On Thursday 10 March 2016 02:06 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Mar 09, 2016 at 08:45:09AM +0000, Build bot for Mark Brown wrote:
>
> Yesterday's -next fails to build on an arm64 allmodconfig due to:
>
>> 	arm64-allmodconfig
>> ERROR: "irq_chip_eoi_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>> ERROR: "irq_chip_unmask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>> ERROR: "irq_chip_mask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>> ERROR: "irq_domain_create_hierarchy" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>> ERROR: "irq_chip_set_type_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>> ERROR: "irq_domain_alloc_irqs_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>> ERROR: "irq_domain_set_hwirq_and_chip" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>> ERROR: "irq_domain_reset_irq_data" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> I can't immediately see when this went wrong, if it was a recent
> addition to the driver or a change in the IRQ subsystem (these functions
> just aren't exported).  The driver doesn't immediately seem to have been
> changed to support modular builds, it could be a dependency.
>
>


I saw the patches for this issue from Matthias:
https://lkml.org/lkml/2016/3/4/338



-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
