Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9EFC4338F
	for <linux-next@archiver.kernel.org>; Fri, 23 Jul 2021 02:56:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 015A760EB4
	for <linux-next@archiver.kernel.org>; Fri, 23 Jul 2021 02:56:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbhGWCQA (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 22 Jul 2021 22:16:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:49292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233222AbhGWCQA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jul 2021 22:16:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A2AD60EB1;
        Fri, 23 Jul 2021 02:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627008994;
        bh=0qejonRfIXOl8SWVLo3HVgB2UvOHe/ZYT+ExYN4oGGI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oZOEhvQI0yPateI2LMezPt8FIKG6uuWTiodvf3tcw4EHFrZunzUV6wpjZUJQ5gT0o
         qugI/lX9Ntk+G9jUsw8wFCcq17mlPjRI+SzWElrx7COWl1x2G5nMMZX4fYNnessAie
         /8zaG0HOV+WIS37U/ehSjUszYkKIS5OI4X33k8T5KiHSFqVNfQQCEnCkLin/zhTX8U
         LWOy7Um6LuCLuS+nfQVT+DP7TanUOCpblamjl7rCbwicCDAUQo8BDxsE1SzDC2hgzw
         +3+StWjuisxfAd54Cg4Z5DheJ9EAlDrYFuSAwa6S5WspowMNqTGAKy/JQKcn6pMkpi
         giUj+QoyKIX3w==
Date:   Fri, 23 Jul 2021 10:56:28 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc:     linux-next@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz
Message-ID: <20210723025627.GF28658@dragon>
References: <20210713202108.449831-1-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713202108.449831-1-oleksandr.suvorov@toradex.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 13, 2021 at 11:21:07PM +0300, Oleksandr Suvorov wrote:
> NXP and AzureWave don't recommend using SDIO bus mode 3.3V@50MHz due
> to noise affecting the wireless throughput. Colibri iMX6ULL uses only
> 3.3V signaling for Wi-Fi module AW-CM276NF.
> 
> Limit the SDIO Clock on Colibri iMX6ULL to 25MHz.
> 
> Fixes: c2e4987e0e02 ("ARM: dts: imx6ull: add Toradex Colibri iMX6ULL support")
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!
