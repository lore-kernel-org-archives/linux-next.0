Return-Path: <SRS0=nOQ/=7C=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07C2C433E0
	for <linux-next@archiver.kernel.org>; Wed, 20 May 2020 14:58:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B72AE207C4
	for <linux-next@archiver.kernel.org>; Wed, 20 May 2020 14:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589986727;
	bh=Qpny8o0lc7Mp2YhXM/sWaZyeS1tB/MGC4Nfns6hApNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MvuEbr/SEdID+G2aRGCnEOMbvMmjw5H1Uk2OJgKsIRb6tlR7P913uSO2+/ytwB6a6
	 53ntbq5Lf5jPtLRFeKk/iAg/Fu8HUv667cp2RH/12L6jY68rxKe0ZJiBIbZT10IgMs
	 iuTdZkrOjyXoDhMgm8cZ1gFOi17RcoO0Ikii/6Ys=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgETO6r (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 20 May 2020 10:58:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:45668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgETO6r (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 May 2020 10:58:47 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B3962072C;
        Wed, 20 May 2020 14:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589986726;
        bh=Qpny8o0lc7Mp2YhXM/sWaZyeS1tB/MGC4Nfns6hApNI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tU+T7PWyla3XoePm+yF4LKSCA1bIgebJsCbhS0H4IBIhtnBPnljXsszffSkIvX8a/
         eLFkaGpV9u2B5mH1YEakcj39jNXQSJgM4Z2tWnxr5I0jrs+6mZeM4H2Z7OwdY6XHtU
         q6nwwdTusnT3nYwNqBQ8tJazwIbzLvXvJo6G6gVQ=
Date:   Wed, 20 May 2020 22:58:43 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20200520145842.GA9249@dragon>
References: <20200520202115.5409186e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520202115.5409186e@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 20, 2020 at 08:21:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   089795766399 ("arm64: dts: ls1028a: sl28: keep switch port names consistent")
> 
> is missing a Signed-off-by from its committer.

Fixed.  Thanks Stephen!

Shawn
