From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Thu, 30 Nov 2017 08:29:40 +0000
Message-ID: <20171130082940.5mzslaxv53dlu3t2@dell>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171130030543.1071-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:37756 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752077AbdK3I3o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Nov 2017 03:29:44 -0500
Received: by mail-wm0-f66.google.com with SMTP id f140so10715103wmd.2
        for <linux-next@vger.kernel.org>; Thu, 30 Nov 2017 00:29:43 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171130030543.1071-1-bjorn.andersson@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>

On Wed, 29 Nov 2017, Bjorn Andersson wrote:

> The pointer returned by of_device_get_match_data() doesn't have the same
> size as u32 on 64-bit architectures, causing issues when compile testing
> the driver on such platform. Make ledtype unsigned long instead, to
> solve this problem.
> 
> Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/leds/leds-pm8058.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Hi Bjorn,

(Nice to see you) :)

I'm going to apply this *before* Linus' fix.

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
