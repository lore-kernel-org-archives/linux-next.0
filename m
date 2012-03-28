From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in em-x270.c
Date: Wed, 28 Mar 2012 23:37:37 +0800
Message-ID: <CAN1soZy7jB_H0meVyh_H8nmbaSDmiDpjBYi_WO=pmjYzEf9r6Q@mail.gmail.com>
References: <CAP=VYLp-weNj35OHtmZ6pf5-t7OUxWREeu8r5sSOLhFYu0CppQ@mail.gmail.com>
	<1331244366-6147-1-git-send-email-paul.gortmaker@windriver.com>
	<4F732C97.2030804@compulab.co.il>
	<20120328152743.GW3232@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:51496 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754734Ab2C1Phh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Mar 2012 11:37:37 -0400
Received: by vcqp1 with SMTP id p1so790847vcq.19
        for <linux-next@vger.kernel.org>; Wed, 28 Mar 2012 08:37:37 -0700 (PDT)
In-Reply-To: <20120328152743.GW3232@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Igor Grinberg <grinberg@compulab.co.il>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

On Wed, Mar 28, 2012 at 11:27 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Mar 28, 2012 at 05:21:59PM +0200, Igor Grinberg wrote:
>> On 03/09/12 00:06, Paul Gortmaker wrote:
>
>> > +REGULATOR_CONSUMER(ldo3, "reg-userspace-consumer", "vcc gps");
>
>> If you make this:
>> REGULATOR_CONSUMER(ldo3, NULL, "vcc gps");
>
>> > +REGULATOR_CONSUMER(ldo19, "reg-userspace-consumer", "vcc gprs");
>>
>> and this:
>> REGULATOR_CONSUMER(ldo19, NULL, "vcc gprs");
>
> These don't look like good fixes, you should be specifying the
> dev_name() for the consumer device? =A0Presumably it's two separate
> consumers and should be .0 and .1 or something?

Paul,

Could you do a quick update on dev_name() according to Mark's comment?

-REGULATOR_CONSUMER(ldo10, &pxa_device_mci.dev, "vcc sdio");
+REGULAOTR_CONSUMER(ldo10, dev_name(&pxa_device_mci.dev), "vcc sdio");

Best Regards
Haojian
