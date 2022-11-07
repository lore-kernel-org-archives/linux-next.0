Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43B5C433FE
	for <linux-next@archiver.kernel.org>; Mon,  7 Nov 2022 05:02:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiKGFCT (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 7 Nov 2022 00:02:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiKGFCS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Nov 2022 00:02:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716EC26D2;
        Sun,  6 Nov 2022 21:02:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2C6F3B80DBB;
        Mon,  7 Nov 2022 05:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE5CC433D6;
        Mon,  7 Nov 2022 05:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667797334;
        bh=2aiJHArwsupxkp1IsuKbI6DmVORpLnjh1xSSGylUQ4U=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=idPmHuoZsj0NP1+z0T7FuC1wOLNYOgVR1P/Ngxv/XmTFNAsgEsq67hHpH6ftDpi7c
         wwxTszTcA6XcTd0mp5BRpotqbXvwKU2jFm2hL9+AvlZvFap5zkoP6pw2DkkAoRysK+
         r7ArF8dzFk0PoBxW2nWyTwD3WkRtXR/mjPlzIda4uugRqqaLntaeEcmpjvWIXsJphA
         Hh5MtzZ4jvrUGHUdvFZLAPOd7PN2P2TD/TCdvB/+G9J/hr9FQdX1p6rNWiV892+Y9B
         jwcHjLggT4M2s6HHNzCsYhWcpKtZE1fKTsCmgAS+xtB7ixw/CIyZyePcujB7OFbulr
         RDZ0fbegNUvsA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id F174C5C196D; Sun,  6 Nov 2022 21:02:12 -0800 (PST)
Date:   Sun, 6 Nov 2022 21:02:12 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rcu tree
Message-ID: <20221107050212.GG28461@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20221107142641.527396ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107142641.527396ea@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 07, 2022 at 02:26:41PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/RCU/rcubarrier.rst:205: WARNING: Literal block ends without a blank line; unexpected unindent.
> 
> Introduced by commit
> 
>   21c2e3909721 ("doc: Update rcubarrier.rst")

Huh.  I guess that numbered code samples are not supposed to have more
than nine lines?  Ah well, easy to fix by going back to left-justified
numbers.  I was wondering about that!

Apologies for the hassle!

							Thanx, Paul
