From: Anton Vorontsov <cbouatmailru@gmail.com>
Subject: Re: linux-next: build failure after merge of the battery tree
Date: Mon, 9 Jan 2012 17:10:37 +0400
Message-ID: <20120109131037.GA26091@oksana.dev.rtsoft.ru>
References: <C3AE124F08223B42BC95AEB82F0F6CED1FDB2C78@KCHJEXMB02.kpit.com>
 <1326097770.3542.14.camel@dhruva>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:44190 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753714Ab2AINKn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Jan 2012 08:10:43 -0500
Received: by eaad14 with SMTP id d14so2002223eaa.19
        for <linux-next@vger.kernel.org>; Mon, 09 Jan 2012 05:10:41 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1326097770.3542.14.camel@dhruva>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ashish Jangam <ashish.jangam@kpitcummins.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Mon, Jan 09, 2012 at 01:59:29PM +0530, Ashish Jangam wrote:
> > Hi Anton,
> > 
> > After merging the battery tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/power/da9052-battery.c: In function 'da9052_bat_read_volt':
> > drivers/power/da9052-battery.c:293:2: error: implicit declaration of function 'da9052_adc_manual_read' [-Werror=implicit-function-declaration]
> > drivers/power/da9052-battery.c: In function 'da9052_bat_check_presence':
> > drivers/power/da9052-battery.c:306:2: error: implicit declaration of function 'da9052_adc_read_temp' [-Werror=implicit-function-declaration]
> > drivers/power/da9052-battery.c: In function 'da9052_determine_vc_tbl_index':
> > drivers/power/da9052-battery.c:348:1: warning: control reaches end of non-void function [-Wreturn-type]
> > cc1: some warnings being treated as errors
> > 
> > Caused by commit ded7fc7b0550 ("power_supply: Add DA9052 battery driver").
> > 
> > The commit message says "This driver depends on DA9052 MFD core dirver for definitions and methods".  That core is presumably still pending inclusion.

Well, it is in the MFD tree already, otherwise allmodconfig would not
be able to select this driver.

> > I have used the battery tree from next-20120104 for today.
> This patch depends upon Da9052/53 MFD core and also on one of its incremental patch for ADC that got these functions definitions. Below is that patch.
> We had already posted this patch.
> 
> Signed-off-by: David Dajun Chen <dchen@diasemi.com>
> Signed-off-by: Ashish Jangam <ashish.jangam@kpitcummins.com>
> ---

So, this patch should go via MFD tree asap. Otherwise, I'll have to
disable this driver by making it depend on 'broken' in Kconfig.

Thanks,

-- 
Anton Vorontsov
Email: cbouatmailru@gmail.com
