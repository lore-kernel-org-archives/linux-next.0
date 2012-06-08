From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] MFD: twl6040: Update Kconfig to avoid build breakage
Date: Fri, 08 Jun 2012 11:51:55 +0300
Message-ID: <4FD1BD2B.6090200@ti.com>
References: <1339137300-16546-1-git-send-email-peter.ujfalusi@ti.com> <20120608083003.GI22557@sortiz-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120608083003.GI22557@sortiz-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, t-kristo@ti.com, Randy Dunlap <rdunlap@xenotime.net>
List-Id: linux-next.vger.kernel.org

Hi Samuel,

On 06/08/2012 11:30 AM, Samuel Ortiz wrote:

> Hi Peter,
>=20
> On Fri, Jun 08, 2012 at 09:35:00AM +0300, Peter Ujfalusi wrote:
>> twl6040 needs CONFIG_IRQ_DOMAIN to compile, without this we have:
>> drivers/mfd/twl6040-irq.c: In function 'twl6040_irq_init':
>> drivers/mfd/twl6040-irq.c:164:2: error: implicit declaration of func=
tion 'irq_domain_add_legacy'
>> drivers/mfd/twl6040-irq.c:165:11: error: 'irq_domain_simple_ops' und=
eclared (first use in this function)
>> drivers/mfd/twl6040-irq.c:165:11: note: each undeclared identifier i=
s reported only once for each function it appears in
>>
>> Reported by: Randy Dunlap <rdunlap@xenotime.net>
>>
>> At the same time limit the twl6040 availability to ARM architecture =
since
>> it is unlikely that this chip is going to be used on other architect=
ures.
> Right, but you're losing a lot of the linux-next build coverage.
> With a dependency on ARM, we may have missed the above build error fo=
r
> example. Would you mind removing that dependency ?


Yes. True that we miss some coverage due to depending on ARM here. I di=
d
missed this since when I build for OMAP the IRQ_DOMAIN is selected by O=
=46,
which is selected by OMAP. Even if I use randconfig for ARM I would not
noticed this since AFAIK ARM selects IRQ_DOMAIN also...

I'll resend in a minute without the ARM dependency.

--=20
P=E9ter
