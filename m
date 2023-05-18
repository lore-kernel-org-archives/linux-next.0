Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FCCC7EE24
	for <linux-next@archiver.kernel.org>; Thu, 18 May 2023 04:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjEREmF (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 18 May 2023 00:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjEREmD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 May 2023 00:42:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB2C30C1;
        Wed, 17 May 2023 21:42:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C76E764CFB;
        Thu, 18 May 2023 04:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE10C4339E;
        Thu, 18 May 2023 04:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684384922;
        bh=GvuKGhLkPitaYUsBYXKtIXwHKuTiFyNYkwW0sYvMIAI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=B6kOxUCk85G21KjfIB1NsRw9B3BK3LE3I+oxT3yJPRyAnqgf6IzuIQgZJns90zJJw
         rLfnHVbRE3x8fCWhErRtU62jL/E8W/JHTzCmrFcqAwnARQwVZ2se5yyJcZYP4mjNKu
         0fiYkW53n+x0iuk11PJmKxQqnT9bKAKNcQrhAa+YwOtmolEbGHiWs22GHCB0d9J4Vf
         N+CL3WeN4ZDvQJ3L9Sn2E0hBoPTOxdXBN5MwRA0vNMdqUc31mOk3zkt/szfGUvaMiD
         W4+04s8v/eYgmEvzZRAeOa9fHlEljyoh7+05kb6QZFx9u2P/Qc9Ch3vv+7JiHcPRRY
         zYgGRH0vM85Dw==
Date:   Wed, 17 May 2023 21:42:00 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net tree
Message-ID: <20230517214200.33398f82@kernel.org>
In-Reply-To: <20230518090634.6ec6b1e1@canb.auug.org.au>
References: <20230518090634.6ec6b1e1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 18 May 2023 09:06:34 +1000 Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.lib:419: arch/arm/boot/dts/stm32f746-disco.dtb] Error 1
> Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.lib:419: arch/arm/boot/dts/stm32f769-disco.dtb] Error 1
> Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
> FATAL ERROR: Unable to parse input tree
> 
> Caused by commit
> 
>   0920ccdf41e3 ("ARM: dts: stm32: add CAN support on stm32f746")
> 
> I have used the net tree from next-20230517 for today.

Dario, Marc, can we get an immediate fix for this?
