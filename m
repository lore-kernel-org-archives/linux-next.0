Return-Path: <SRS0=31GW=CX=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD31C43461
	for <linux-next@archiver.kernel.org>; Mon, 14 Sep 2020 09:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8263E206F4
	for <linux-next@archiver.kernel.org>; Mon, 14 Sep 2020 09:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsPFWXjg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgINJur (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 14 Sep 2020 05:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgINJuq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2020 05:50:46 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911F3C06174A;
        Mon, 14 Sep 2020 02:50:45 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d4so4617159wmd.5;
        Mon, 14 Sep 2020 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=39+aLqzsKe9E8WUELDyvU1HZQFoPFaHNV9XTWYnYyTs=;
        b=QsPFWXjgQY0T+rZY1hKi8oqJxeAsgVc4z3lyyGzqMaz5Du5tbJpAC6IvmZFJ1fQd3x
         5GEO9lco51vWzirwtFfGKs7JsM8w9USWgfcfZug0lRx9kalabPTXrdNU6/MhSZB0+hyJ
         IJEmElaNC7UCWPlAJ0jsxJ38F1zB7j638ncUMnSuSfOKLkm2cp7Be0D26nJXKcBvjj0N
         s+7Xn2O7J5TZmB3kCba6PxvzhMneMy5NEY8V20mqpwPk6+Cd+HiJqBUgw6GR5q8Eiz0d
         AaQ2RNERvf5x8DRlWFobit1W6kfv+9nL3+lvTd0BBNfY2C993557u+pQFPfJcmLHjnnq
         zJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=39+aLqzsKe9E8WUELDyvU1HZQFoPFaHNV9XTWYnYyTs=;
        b=fcdH9GnVeO8hSqJq1gUjdgi346Dv7Iqv3+/B6kW/YIJ+ugH4acRFjcY8QZ56S9NjGZ
         aEYy9gkfPCT9hS2+J5/fQk1uhX1VH8a2atcVCNYVlE8HS/WWA24AZHDN9xlg8eTpErpw
         qmKuwOLmfJLN1Kdb9dNz6XMPQfl/95KJrF0M5E0xVr0I5XRf0HhRa0KH08oDEYIJM9EZ
         5wbcvgO90Abnh03DaIXpBeBX1M261L1VqeX23SZml3YWDWvu4IDA5rhHq3OBJS8D4psp
         e12Qgf0nVggqxXLnoKe4sWAGdfxiwY5d5i5cLI3nxlrWeAxP/UJTtVLgz70ooSwTh2HG
         WFPw==
X-Gm-Message-State: AOAM531l1Vbplr+wMnMQeQAKVy/xGEpZoM5vA4UBcwqbBzzZtFECMggc
        5FZh+sFHqhhctxo1kiRGXWc=
X-Google-Smtp-Source: ABdhPJz95OKEtf3KC3Kt1pnNr2PEtBzz2R34KFO0+4dV2b/km0LkmM4pZD1xnFRnQtYnmMxNGs29Sg==
X-Received: by 2002:a1c:9697:: with SMTP id y145mr13982629wmd.174.1600077044331;
        Mon, 14 Sep 2020 02:50:44 -0700 (PDT)
Received: from medion (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id m185sm19291307wmf.5.2020.09.14.02.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 02:50:43 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
X-Google-Original-From: Alex Dewar <alex.dewar@gmx.co.uk>
Date:   Mon, 14 Sep 2020 10:50:41 +0100
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nand tree
Message-ID: <20200914095041.phuv6q7rl4nsdxnw@medion>
References: <20200914114552.5030ef1e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914114552.5030ef1e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 14, 2020 at 11:45:52AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the nand tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/mtd/nand/onenand/onenand_omap2.c:27:10: fatal error: asm/mach/flash.h: No such file or directory
>    27 | #include <asm/mach/flash.h>
>       |          ^~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   26e1a8efc63d ("mtd: onenand: omap2: Allow for compile-testing on !ARM")
> 
> I have reverted that commit for today.

Gah, sorry :(. I definitely *tried* to build test it, but I must have
messed up and built the wrong tree or something.

Apologies,
Alex

> 
> -- 
> Cheers,
> Stephen Rothwell


