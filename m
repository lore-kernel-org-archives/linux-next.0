Return-Path: <SRS0=PU4T=EL=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B5EC2D0A3
	for <linux-next@archiver.kernel.org>; Thu,  5 Nov 2020 01:57:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FFA320719
	for <linux-next@archiver.kernel.org>; Thu,  5 Nov 2020 01:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="Qwir9+Iq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729314AbgKEB5W (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 4 Nov 2020 20:57:22 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:4562 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgKEB5W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Nov 2020 20:57:22 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CRRV8213Lz8p;
        Thu,  5 Nov 2020 02:57:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1604541440; bh=CIbyBdFXt/DKXUA6SLcaasMvhtGE3yBPilLsx9MiQ1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qwir9+Iq8HbmvrLtEFkh+jxiHn/y4cilBbn8s5lFDrKRLHVv0acz4r1haQVSZm2Ip
         xW6suH2sx0sXOoukr8ZLKuw9VE9aIMGPSapwjRU22uUZ+hKaafP14gGhj5UgbuOwLQ
         br4s1QDm/Z9eS3N+2vcG4T1T/K7HXStlK/fH+lD5/GQ+r0CDC/YNvG9B8uSAnnF0GV
         XPEwapw2xXd6QEk7hQo5l+rKr8iwAULhMmyIa4CcyLkDeMHS5VfnYzOj0OndUnZPpN
         k5UIWpoesV6jHT36EnMdVzT+RWSd0GjTbPIxr/sfb+J67gOMWDDy5+PCFsSQyWRN8N
         fnuxSwRsl9oHw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Thu, 5 Nov 2020 02:57:19 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20201105015718.GD17266@qmqm.qmqm.pl>
References: <20201105014728.GC17266@qmqm.qmqm.pl>
 <20201105125027.1f4b6886@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201105125027.1f4b6886@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 05, 2020 at 12:50:27PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mfd tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/gpio/gpio-tps65910.c: In function 'tps65910_gpio_get':
> drivers/gpio/gpio-tps65910.c:31:2: error: implicit declaration of function 'tps65910_reg_read' [-Werror=implicit-function-declaration]
>    31 |  tps65910_reg_read(tps65910, TPS65910_GPIO0 + offset, &val);
>       |  ^~~~~~~~~~~~~~~~~
> drivers/gpio/gpio-tps65910.c: In function 'tps65910_gpio_set':
> drivers/gpio/gpio-tps65910.c:46:3: error: implicit declaration of function 'tps65910_reg_set_bits' [-Werror=implicit-function-declaration]
>    46 |   tps65910_reg_set_bits(tps65910, TPS65910_GPIO0 + offset,
>       |   ^~~~~~~~~~~~~~~~~~~~~
> drivers/gpio/gpio-tps65910.c:49:3: error: implicit declaration of function 'tps65910_reg_clear_bits' [-Werror=implicit-function-declaration]
>    49 |   tps65910_reg_clear_bits(tps65910, TPS65910_GPIO0 + offset,
>       |   ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   23feb2c3367c ("mfd: tps65910: Clean up after switching to regmap")
> 
> I have used the version of the mfd tree from next-20201104 for today.

Hi,

It's missing a patch for gpio part [1].

[1] https://lkml.org/lkml/2020/9/26/398

Best Regards
Micha³ Miros³aw
