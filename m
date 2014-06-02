From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: linux-next: build failure after merge of the mmc tree
Date: Mon, 2 Jun 2014 11:31:55 +0200
Message-ID: <CAPDyKFqp=quWV17MGZfvgZA-J_KPsWkza184+bjez_MQpOx6Xg@mail.gmail.com>
References: <20140530132324.757076ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f47.google.com ([209.85.216.47]:33596 "EHLO
	mail-qa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753007AbaFBJb4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Jun 2014 05:31:56 -0400
Received: by mail-qa0-f47.google.com with SMTP id s7so2279634qap.6
        for <linux-next@vger.kernel.org>; Mon, 02 Jun 2014 02:31:55 -0700 (PDT)
In-Reply-To: <20140530132324.757076ca@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Ball <chris@printf.net>, Mike Turquette <mturquette@linaro.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?David_Lanzend=C3=B6rfer?= <david.lanzendoerfer@o2s.ch>, Stephen Rothwell <sfr@canb.auug.org.au>, Hans de Goede <hdegoede@redhat.com>

On 30 May 2014 05:23, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Chris,
>
> After merging the mmc tree, today's linux-next build (arm multi_v7_defconfig)
> failed like this:
>
> drivers/mmc/host/sunxi-mmc.c:25:29: fatal error: linux/clk/sunxi.h: No such file or directory
>
> Caused by commit 19b7f796c375 ("mmc: sunxi: Add driver for SD/MMC hosts
> found on Allwinner sunxi SoCs").  Something has changed to turn on
> CONFIG_ARCH_SUNXI in the arm multi_v7_defconfig build since yesterday.
>
> linux/clk/sunxi.h is created by a commit in the clk tree
> (git://git.linaro.org/people/mturquette/linux.git#clk-next) which I
> don't include in linux-next until much later than the mmc tree.
>
> I have reverted that commit for today.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au

Hi Mike, Chris,

So, the proper thing would be to let Mike to carry the above patch
though his clk tree instead.

Could we arrange that?

Kind regards
Ulf Hansson
