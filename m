From: Quan Nguyen <qnguyen@apm.com>
Subject: Re: next-20160309 build: 1 failures 12 warnings (next-20160309)
Date: Thu, 10 Mar 2016 19:59:19 +0700
Message-ID: <CAFopSPRq5SxuD4k4u15qYbKkiCCrDBQf+q0zvL1e18M1wbaaqQ@mail.gmail.com>
References: <E1adZjx-00089R-1L@optimist>
	<20160310083600.GO3898@sirena.org.uk>
	<56E16611.4080502@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f53.google.com ([209.85.213.53]:34194 "EHLO
	mail-vk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750924AbcCJM7a (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2016 07:59:30 -0500
Received: by mail-vk0-f53.google.com with SMTP id e185so93926004vkb.1
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2016 04:59:29 -0800 (PST)
In-Reply-To: <56E16611.4080502@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Y Vo <yvo@apm.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>

On Thu, Mar 10, 2016 at 7:18 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
> On Thursday 10 March 2016 02:06 PM, Mark Brown wrote:
>>
>> * PGP Signed by an unknown key
>>
>>
>> On Wed, Mar 09, 2016 at 08:45:09AM +0000, Build bot for Mark Brown wrote:
>>
>> Yesterday's -next fails to build on an arm64 allmodconfig due to:
>>
>>>         arm64-allmodconfig
>>> ERROR: "irq_chip_eoi_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>>> ERROR: "irq_chip_unmask_parent" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>> ERROR: "irq_chip_mask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>>> ERROR: "irq_domain_create_hierarchy" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>> ERROR: "irq_chip_set_type_parent" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>> ERROR: "irq_domain_alloc_irqs_parent" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>> ERROR: "irq_domain_set_hwirq_and_chip" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>> ERROR: "irq_domain_reset_irq_data" [drivers/gpio/gpio-xgene-sb.ko]
>>> undefined!
>>
>> I can't immediately see when this went wrong, if it was a recent
>> addition to the driver or a change in the IRQ subsystem (these functions
>> just aren't exported).  The driver doesn't immediately seem to have been
>> changed to support modular builds, it could be a dependency.
>>
>>
>
>
> I saw the patches for this issue from Matthias:
> https://lkml.org/lkml/2016/3/4/338
>

Just FYI, the other patch that proposed to export those functions is
still pending
https://lkml.org/lkml/2016/3/7/27
