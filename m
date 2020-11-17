Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A53C64E69
	for <linux-next@archiver.kernel.org>; Tue, 17 Nov 2020 10:01:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13C3F2463F
	for <linux-next@archiver.kernel.org>; Tue, 17 Nov 2020 10:01:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0soDmTc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgKQKBB (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 17 Nov 2020 05:01:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:40640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727710AbgKQKBB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Nov 2020 05:01:01 -0500
Received: from localhost (unknown [122.171.203.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D83E222EC;
        Tue, 17 Nov 2020 10:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605607260;
        bh=v7sogJNbShm8AnTgyqZagsNUUuglJkXGDySE1FgKTp4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P0soDmTcyzuSUexCCTVhAioBvipLa32GAF0BC/6/2CtLveNCMrZ9hXAvGfSnXjR2N
         k1NkQt1mG+xgNA/xh/DZpds0sFzIdu6hIK7USclInsv8fap7+qW5K2vNMwdQbrxYkP
         LggTnAD2+LmJc+hZGufifuaurovNcu+ixWmWvo1k=
Date:   Tue, 17 Nov 2020 15:30:56 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Yejune Deng <yejune.deng@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the phy-next tree
Message-ID: <20201117100056.GF50232@vkoul-mobl>
References: <20201117134046.569d58b8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117134046.569d58b8@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Stephen,

On 17-11-20, 13:40, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the phy-next tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/soc/amlogic/meson-ee-pwrc.c: In function 'meson_ee_pwrc_init_domain':
> drivers/soc/amlogic/meson-ee-pwrc.c:416:65: error: expected ';' before 'if'
>   416 |   dom->rstc = devm_reset_control_array_get_exclusive(&pdev->dev)
>       |                                                                 ^
>       |                                                                 ;
>   417 |   if (IS_ERR(dom->rstc))
>       |   ~~                                                             
> 
> Caused by commit
> 
>   3cc8e86721ad ("phy: amlogic: Replace devm_reset_control_array_get()")
> 
> I have used the phy-next tree from next-20201116 for today.

I have reverted this commit

Thanks for the report

-- 
~Vinod
