From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 17 (pinctrl-single.c)
Date: Fri, 18 Oct 2013 16:41:33 -0700
Message-ID: <5261C72D.1090302@infradead.org>
References: <20131018003847.GH2443@sirena.org.uk> <5261792C.7030203@infradead.org> <CACRpkdaz22N8-9Rg8vR=KGOEL5P6sZm6Hh5PT4Uq381+QmPs7g@mail.gmail.com> <20131018233951.GU15154@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:32977 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757482Ab3JRXli (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Oct 2013 19:41:38 -0400
In-Reply-To: <20131018233951.GU15154@atomide.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "pinctl-single.c" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 10/18/13 16:39, Tony Lindgren wrote:
> * Linus Walleij <linus.walleij@linaro.org> [131018 12:43]:
>> On Fri, Oct 18, 2013 at 8:08 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
>>> On 10/17/13 17:38, Mark Brown wrote:
>>>> Hi all,
>>>>
>>>> I've uploaded today's linux-next tree to the master branch of the
>>>> repository below:
>>>>
>>>>         git://gitorious.org/thierryreding/linux-next.git
>>>>
>>>> A next-20131017 tag is also provided for convenience.
>>>>
>>>> One new conflict today but otherwise uneventful.  x86_64 allmodconfigs
>>>> build after each merge but no other build tests were done.
>>>
>>> on i386:
>>>
>>> drivers/pinctrl/pinctrl-single.c: In function 'pcs_irqdomain_map':
>>> drivers/pinctrl/pinctrl-single.c:1750:2: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
>>> drivers/pinctrl/pinctrl-single.c:1750:21: error: 'IRQF_VALID' undeclared (first use in this function)
>>> drivers/pinctrl/pinctrl-single.c:1750:34: error: 'IRQF_PROBE' undeclared (first use in this function)
>>
>> Hmmmm this looks like Tony's baby and the offending patch is
>> not in the pinctrl tree, I bet he'll have a fix for it in no time.
> 
> Ouch sorry about that. I'll send a pull request for the
> following fix ASAP. Build tested with Randy's randconfig.
> 
> Regards,
> 
> Tony
> 
> 8< ------------------------
> From: Tony Lindgren <tony@atomide.com>
> Date: Fri, 18 Oct 2013 16:20:05 -0700
> Subject: [PATCH] pinctrl: single: Fix build when not built on ARM
> 
> Looks like we need a little bit of arch specific handling
> with the generic IRQ. Fix the issue with an ifdef the
> same way as other drivers do.
> 
> ARM needs things set to IRQF_VALID, which also then sets
> noprobe. Others seem to use just irq_set_noprobe().
> 
> Otherwise we can get:
> 
> drivers/pinctrl/pinctrl-single.c: In function 'pcs_irqdomain_map':
> drivers/pinctrl/pinctrl-single.c:1750:2: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]

Did you address this error?  I don't see a fix for it...

Thanks.

> drivers/pinctrl/pinctrl-single.c:1750:21: error: 'IRQF_VALID' undeclared (first use in this function)
> drivers/pinctrl/pinctrl-single.c:1750:34: error: 'IRQF_PROBE' undeclared (first use in this function)
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -1743,7 +1743,12 @@ static int pcs_irqdomain_map(struct irq_domain *d, unsigned int irq,
>  	irq_set_chip_data(irq, pcs_soc);
>  	irq_set_chip_and_handler(irq, &pcs->chip,
>  				 handle_level_irq);
> -	set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
> +
> +#ifdef CONFIG_ARM
> +	set_irq_flags(irq, IRQF_VALID);
> +#else
> +	irq_set_noprobe(irq);
> +#endif
>  
>  	return 0;
>  }
> --


-- 
~Randy
