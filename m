Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557EBC433EF
	for <linux-next@archiver.kernel.org>; Wed, 23 Feb 2022 17:03:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241607AbiBWREQ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 23 Feb 2022 12:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242615AbiBWREP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Feb 2022 12:04:15 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290FF4ECF4
        for <linux-next@vger.kernel.org>; Wed, 23 Feb 2022 09:03:47 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id x15so6308598wrg.8
        for <linux-next@vger.kernel.org>; Wed, 23 Feb 2022 09:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ElO9QEbGLtnu2p6W3GD9GPPjHEDjjQB7rKG2MNcXjTo=;
        b=G+xOg7T+04bMRKlVUgToQEK2c/ffsPvL110Jz+fIMvwsLWu1ybRtq+t6PQSAhLQ8j0
         7sTVUBMHyai1goZZ/dQ9gJvv7UzwsoirhukYn8nEdNtQor6B+lpLFYK+kjx6mb/3m48+
         zot+BKoAuxzx/k2KSnOKZVt+bN9NjfU6xVPMvZ9GXYygvUevYvDnNK52FFEyOIMZlKoS
         GPDtGZNklJaMuN0Bu5H1dd09/ydEP8hUyWICcbBA/x0vNLo4BdrUaLuNmZQOiH4Wubis
         1YpygnqH5Dm01r9RV4uMCizKBI6mlf7xccD8U9cbKDo6LJBJXzqSnmz7CLxzL8bdzh3t
         yf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ElO9QEbGLtnu2p6W3GD9GPPjHEDjjQB7rKG2MNcXjTo=;
        b=TO1GsjWSgcAz625d29WnNv+UGm7qeDS0kwQu9+K0jGBD9++2ass9zD3GAAGJGibj3S
         WJjrZ5FXjGJYobF/5jUVBK47xNxufXgK1QzNgu0OH1tVk25S1y1uXl3qz49KLlOqP5qz
         iMyTcK/n/kQFdStzIyFG5e/yMv9wlFe0hd1UGJ2PuwYmEcKNQP78d7rlLU5TM4/GDgiV
         acGShhzobN2Gk+idteCJKoDMvvupMnkyVurMoIHSduF/K+xyx/Siq/VONAXpKiNmau0x
         NtOPxRJmWoQEpCDuxFCfYLG1lEzQCAzNTk8LcI57kb/1OknV9mZkIvrmnJr2Uj+duMV/
         Nhdw==
X-Gm-Message-State: AOAM530mi5ztTrQjG1Z8VXaaui3I/axP4jYsoDe7tCoKQEz8KI8zcsnI
        lfPbMUE/0xCgB+P8T6/G60sjDQ==
X-Google-Smtp-Source: ABdhPJyXVCWuB+rFR5nYOFMwxEw+dZda/CgCF6/Cv/qMMYwhuOZgxxqIXnasLFlN38UTBKvwgnH9bQ==
X-Received: by 2002:a5d:65cc:0:b0:1e5:a360:cb06 with SMTP id e12-20020a5d65cc000000b001e5a360cb06mr385847wrw.713.1645635825662;
        Wed, 23 Feb 2022 09:03:45 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id x17sm69353wrv.107.2022.02.23.09.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 09:03:45 -0800 (PST)
Date:   Wed, 23 Feb 2022 17:03:43 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     broonie@kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <YhZo7xnNRKz8U1Lf@google.com>
References: <20220223165416.2359767-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220223165416.2359767-1-broonie@kernel.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 23 Feb 2022, broonie@kernel.org wrote:

> Hi all,
> 
> After merging the mfd tree, today's linux-next build (KCONFIG_NAME)
> failed like this:
> 
> /tmp/next/build/drivers/mfd/sprd-sc27xx-spi.c:255:35: error: redefinition of 'sprd_pmic_spi_ids'
>   255 | static const struct spi_device_id sprd_pmic_spi_ids[] = {
>       |                                   ^~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/mfd/sprd-sc27xx-spi.c:242:35: note: previous definition of 'sprd_pmic_spi_ids' was here
>   242 | static const struct spi_device_id sprd_pmic_spi_ids[] = {
>       |                                   ^~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   6fc90b92e9c7ef348 ("mfd: sprd: Add SPI device ID table")
> 
> I used the MFD tree from yesterday instead.

Thanks.

Will fix for tomorrow.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
