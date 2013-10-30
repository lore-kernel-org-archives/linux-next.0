From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: linux-next: build failure after merge of the final tree (gpio
 tree related)
Date: Wed, 30 Oct 2013 09:56:19 +0900
Message-ID: <52705933.3060304@nvidia.com>
References: <20131029201013.cc93b7f5eca956bf6ff04e68@canb.auug.org.au> <CACRpkdZ444P-zWx99T2+=nEO13Gbub2rYpE91eW0UoRFc4kdSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4191 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751859Ab3J3A4W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2013 20:56:22 -0400
In-Reply-To: <CACRpkdZ444P-zWx99T2+=nEO13Gbub2rYpE91eW0UoRFc4kdSg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 10/29/2013 10:25 PM, Linus Walleij wrote:
> On Tue, Oct 29, 2013 at 10:10 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> I have applied the following patch for today (it should go into the gpio
>> tree if it is considered correct):
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Tue, 29 Oct 2013 20:05:12 +1100
>> Subject: [PATCH] gpiolib: include gpio/consumer.h in of_gpio.h for
>>   desc_to_gpio()
>>
>> Fixes this build error on sparc:
>>
>> In file included from drivers/spi/spi.c:33:0:
>> include/linux/of_gpio.h: In function 'of_get_named_gpio_flags':
>> include/linux/of_gpio.h:93:3: error: implicit declaration of function 'desc_to_gpio' [-Werror=implicit-function-declaration]
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>
> Patch applied, unless Alexandre has any considerations.

Nope, that include should definitely be there, actually I was convinced 
it was already...

Alex.
