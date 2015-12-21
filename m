From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Mon, 21 Dec 2015 09:46:22 +0100
Message-ID: <CACRpkdbc5gagTOyqECF8Dbq3A469Q9itX2xrjZDhWgd2XoZH6Q@mail.gmail.com>
References: <20151216143755.67915348@canb.auug.org.au>
	<20151221160252.01e3ea76@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:36378 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750964AbbLUIqX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Dec 2015 03:46:23 -0500
Received: by mail-ob0-f178.google.com with SMTP id ba1so26871263obb.3
        for <linux-next@vger.kernel.org>; Mon, 21 Dec 2015 00:46:22 -0800 (PST)
In-Reply-To: <20151221160252.01e3ea76@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

On Mon, Dec 21, 2015 at 6:02 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Linus,
>
> On Wed, 16 Dec 2015 14:37:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the gpio tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> drivers/pinctrl/bcm/pinctrl-nsp-gpio.c: In function 'nsp_gpio_probe':
>> drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:699:4: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
>>     set_irq_flags(irq, IRQF_VALID);
>>     ^
>> drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:699:23: error: 'IRQF_VALID' undeclared (first use in this function)
>>     set_irq_flags(irq, IRQF_VALID);
>>                        ^
>>
>> Caused by commit
>>
>>   8bfcbbbcabe0 ("pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC")
>>
>> set_irq_flags was removed before v4.3-rc2 ...
>>
>> I have used the gpio tree from next-20151215 for today.
>
> I am still getting this error.

Yeah I was applying the fix to the pin control tree, never fix stuff late on
fridays... will apply the patch to the GPIO tree as well, I see no better
solution.

Yours,
Linus Walleij
