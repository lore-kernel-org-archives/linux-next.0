From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2] gpio: devm_gpio_* support should not depend on GPIOLIB
Date: Sun, 10 Feb 2013 07:46:30 +0300
Message-ID: <CAMo8BfJ=6WbAHoCpftRHW1iMtG8robyYUEqqCG2SecixDTgC+g@mail.gmail.com>
References: <20130118140346.3f9b182aa7daa175b4f136bf@canb.auug.org.au>
	<1358495866-9329-1-git-send-email-shawn.guo@linaro.org>
	<CACRpkdZA9O6N7hmtU-6R1Ff6hW5vjD_ar9RLG1dbkd+MWyoKiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:43791 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761093Ab3BJEqb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 9 Feb 2013 23:46:31 -0500
In-Reply-To: <CACRpkdZA9O6N7hmtU-6R1Ff6hW5vjD_ar9RLG1dbkd+MWyoKiw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Shawn Guo <shawn.guo@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jan 19, 2013 at 2:33 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jan 18, 2013 at 8:57 AM, Shawn Guo <shawn.guo@linaro.org> wrote:
>
>> Some architectures (e.g. blackfin) provide gpio API without requiring
>> GPIOLIB support (ARCH_WANT_OPTIONAL_GPIOLIB).  devm_gpio_* functions
>> should also work for these architectures, since they do not really
>> depend on GPIOLIB.
>>
>> Add a new option GPIO_DEVRES (enabled by default) to control the build
>> of devres.c.  It also removes the empty version of devm_gpio_*
>> functions for !GENERIC_GPIO build from linux/gpio.h, and moves the
>> function declarations from asm-generic/gpio.h into linux/gpio.h.
>>
>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>
> OK I removed the old version of the patch and pushed this instead.

Hi,

this patch causes the following errors for xtensa defconfig build:

include/asm-generic/gpio.h:265:2: error: implicit declaration of
function '__gpio_get_value' [-Werror=implicit-function-declaration]
include/asm-generic/gpio.h:271:2: error: implicit declaration of
function '__gpio_set_value' [-Werror=implicit-function-declaration]
include/linux/gpio.h:60:90: error: redefinition of 'gpio_cansleep'
include/linux/gpio.h:62:2: error: implicit declaration of function
'__gpio_cansleep' [-Werror=implicit-function-declaration]
include/linux/gpio.h:67:2: error: implicit declaration of function
'__gpio_to_irq' [-Werror=implicit-function-declaration]
drivers/gpio/devres.c:26:2: error: implicit declaration of function
'gpio_free' [-Werror=implicit-function-declaration]
drivers/gpio/devres.c:60:2: error: implicit declaration of function
'gpio_request' [-Werror=implicit-function-declaration]
drivers/gpio/devres.c:90:2: error: implicit declaration of function
'gpio_request_one' [-Werror=implicit-function-declaration]

-- 
Thanks.
-- Max
