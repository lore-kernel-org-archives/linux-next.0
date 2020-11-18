Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42844C64E69
	for <linux-next@archiver.kernel.org>; Wed, 18 Nov 2020 20:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7162246C5
	for <linux-next@archiver.kernel.org>; Wed, 18 Nov 2020 20:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sG9llzjw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgKRUio (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 18 Nov 2020 15:38:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:51210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgKRUio (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 15:38:44 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82BEC246C8;
        Wed, 18 Nov 2020 20:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605731920;
        bh=O9c7An1kFM6IXX8FlFyXPILzfnRRePmppBASLK4UFSQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sG9llzjww01u0/kMiTPEgIPTeIF6L1+F/MZA3pjC0Gh0RyD5st4baMZpsrhA7tuEZ
         /rcFwGjQVdULp5+DfBMba+FFDszcLEvnlHW2rJwOrYHktRINxD2kjzm7nV7TNhYl3i
         mEpY/AzYLpVSlQfRtC6wfGuHzD7VLASuMY/oQesA=
Date:   Wed, 18 Nov 2020 14:38:40 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the gpio tree with the kspp-gustavo
 tree
Message-ID: <20201118203840.GB15147@embeddedor>
References: <20201118142445.461d3792@canb.auug.org.au>
 <CACRpkdahE38tamkVZLx+m3nkE_dDfaN-u7gEwH48BEnf1BvsFg@mail.gmail.com>
 <CAHp75VevuYCZVPw8HHcaoGdHBvXxHTNnujbf2BUyBECmFHZFDQ@mail.gmail.com>
 <CAHp75Vcuxc1Ypo6GV_a2hACWPFqg4m8mZr8mLHD=LgWpLLEWMg@mail.gmail.com>
 <20201118110057.GA30719@embeddedor>
 <20201118141537.GU4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118141537.GU4077@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 18, 2020 at 04:15:37PM +0200, Andy Shevchenko wrote:
> No problem, thanks for taking care of this.
> 
> As Linus mentioned, please send a formal patch he will include in his tree.
> (I have noticed that there are two drivers in the same change, I recommend
>  to split, so should be two separated patches)

Sure thing. I will do so. :)

Thanks
--
Gustavo
