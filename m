From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: Tree for Oct 17 (pinctrl-single.c)
Date: Fri, 18 Oct 2013 21:43:28 +0200
Message-ID: <CACRpkdaz22N8-9Rg8vR=KGOEL5P6sZm6Hh5PT4Uq381+QmPs7g@mail.gmail.com>
References: <20131018003847.GH2443@sirena.org.uk>
	<5261792C.7030203@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5261792C.7030203@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "pinctl-single.c" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 18, 2013 at 8:08 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 10/17/13 17:38, Mark Brown wrote:
>> Hi all,
>>
>> I've uploaded today's linux-next tree to the master branch of the
>> repository below:
>>
>>         git://gitorious.org/thierryreding/linux-next.git
>>
>> A next-20131017 tag is also provided for convenience.
>>
>> One new conflict today but otherwise uneventful.  x86_64 allmodconfigs
>> build after each merge but no other build tests were done.
>
> on i386:
>
> drivers/pinctrl/pinctrl-single.c: In function 'pcs_irqdomain_map':
> drivers/pinctrl/pinctrl-single.c:1750:2: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
> drivers/pinctrl/pinctrl-single.c:1750:21: error: 'IRQF_VALID' undeclared (first use in this function)
> drivers/pinctrl/pinctrl-single.c:1750:34: error: 'IRQF_PROBE' undeclared (first use in this function)

Hmmmm this looks like Tony's baby and the offending patch is
not in the pinctrl tree, I bet he'll have a fix for it in no time.

Yours,
Linus Walleij
