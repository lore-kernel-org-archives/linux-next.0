From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Tue, 22 Dec 2015 10:08:58 +0100
Message-ID: <CACRpkdaXd7nJYpix_nztF6iuSuKYb9H4FMgRr9NcxFRp+vEyzw@mail.gmail.com>
References: <20151222164210.170ec46c@canb.auug.org.au>
	<87h9jbezsi.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34634 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754061AbbLVJI7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Dec 2015 04:08:59 -0500
Received: by mail-oi0-f53.google.com with SMTP id o124so104944966oia.1
        for <linux-next@vger.kernel.org>; Tue, 22 Dec 2015 01:08:59 -0800 (PST)
In-Reply-To: <87h9jbezsi.fsf@belgarion.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Dec 22, 2015 at 7:57 AM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>
>> Hi Linus,
>>
>> After merging the gpio tree, today's linux-next build (lots without
>> CONFIG_OF) failed like this:
>>
>> drivers/gpio/gpio-pxa.c: In function 'pxa_gpio_probe':
>> drivers/gpio/gpio-pxa.c:648:12: error: 'pxa_irq_domain_ops' undeclared (first use in this function)
>>
>> Caused by commit
>>
>>   384ca3c6a28d ("gpio: pxa: change the interrupt management")
>>
>> The reference to pxa_irq_domain_ops was moved out of the protection of
>> CONFIG_OF ...
>>
>> Discovered after the release.
>
> Hi Stephen,
>
> The fix has been sent in http://www.spinics.net/lists/kernel/msg2147774.html but
> did not reach Linus's next tree yet probably.

Sorry, I'll pick it now-ish...

Yours,
Linus Walleij
