Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92241C38A02
	for <linux-next@archiver.kernel.org>; Mon, 31 Oct 2022 10:31:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiJaKb3 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 31 Oct 2022 06:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiJaKbQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Oct 2022 06:31:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FA1DFCE;
        Mon, 31 Oct 2022 03:31:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5F8B56112F;
        Mon, 31 Oct 2022 10:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8A4C433D7;
        Mon, 31 Oct 2022 10:31:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="X8gaf4A4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1667212272;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IlOd7xgy7E5r6ifMOYBNBCNYfKpunC4K0/VttogcNR0=;
        b=X8gaf4A49LJ7uYJwtTL/3k0qmty03o3y7J63k0GLszf2rPwaukBbtsKvsyz8bKBHyiOrSU
        DDzkNR6YOvXyaietyHVUo4fgJkMkaX3A0uIuujcq/jN+1Pvom87AeSrnAurBglzAb93hIo
        /1E+GwsTJIV+whD6aGzubaVwzmOh/nU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4c52aed8 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Mon, 31 Oct 2022 10:31:12 +0000 (UTC)
Date:   Mon, 31 Oct 2022 11:31:10 +0100
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Theodore Ts'o <tytso@mit.edu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <Y1+j7jOV8fYMGXiD@zx2c4.com>
References: <20221031170956.2cdf101a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221031170956.2cdf101a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 31, 2022 at 05:09:56PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the random tree, today's linux-next build (arm64 defconfig)
> failed like this:
> 
> arch/arm64/kernel/pi/kaslr_early.c: In function 'kaslr_early_init':
> arch/arm64/kernel/pi/kaslr_early.c:97:22: error: implicit declaration of function '__early_cpu_has_rndr' [-Werror=implicit-function-declaration]
>    97 |                 if (!__early_cpu_has_rndr() ||
>       |                      ^~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> 
> Caused by commit
> 
>   70ae866ab6b3 ("random: remove early archrandom abstraction")
> 
> I have used the ramdom tree from next-20221028 for today.

Thanks, sorted.

Jason
