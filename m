From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Tue, 22 Dec 2015 07:57:17 +0100
Message-ID: <87h9jbezsi.fsf@belgarion.home>
References: <20151222164210.170ec46c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151222164210.170ec46c@canb.auug.org.au> (Stephen Rothwell's
	message of "Tue, 22 Dec 2015 16:42:10 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Linus,
>
> After merging the gpio tree, today's linux-next build (lots without
> CONFIG_OF) failed like this:
>
> drivers/gpio/gpio-pxa.c: In function 'pxa_gpio_probe':
> drivers/gpio/gpio-pxa.c:648:12: error: 'pxa_irq_domain_ops' undeclared (first use in this function)
>
> Caused by commit
>
>   384ca3c6a28d ("gpio: pxa: change the interrupt management")
>
> The reference to pxa_irq_domain_ops was moved out of the protection of
> CONFIG_OF ...
>
> Discovered after the release.

Hi Stephen,

The fix has been sent in http://www.spinics.net/lists/kernel/msg2147774.html but
did not reach Linus's next tree yet probably.

Cheers.

-- 
Robert
