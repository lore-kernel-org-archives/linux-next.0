From: Rajendra Nayak <rnayak@ti.com>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Thu, 24 Nov 2011 13:01:28 +0530
Message-ID: <4ECDF2D0.2050505@ti.com>
References: <20111124141046.fdb4b9b923d850b0686924c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog103.obsmtp.com ([74.125.149.71]:42691 "EHLO
	na3sys009aog103.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750900Ab1KXHbi (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Nov 2011 02:31:38 -0500
In-Reply-To: <20111124141046.fdb4b9b923d850b0686924c3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>

On Thursday 24 November 2011 08:40 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the regulator tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/regulator/gpio-regulator.c: In function 'gpio_regulator_probe':
> drivers/regulator/gpio-regulator.c:287:8: error: too few arguments to function 'regulator_register'
> include/linux/regulator/driver.h:215:23: note: declared here

Thanks Stephen, I just posted a patch to fix this on the regulator
for-next.
https://lkml.org/lkml/2011/11/24/29

>
>
> Caused by commit 2c043bcbf287 ("regulator: pass additional of_node to
> regulator_register()").
>
> drivers/regulator/gpio-regulator.c was added in commit 3f0292ae8bb1
> ("regulator: Add driver for gpio-controlled regulators") which was
> included in Linus' tree before v3.2-rc1.
>
> I have used the regulator tree from next-20111123 for today.
