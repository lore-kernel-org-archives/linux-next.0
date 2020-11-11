Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03293C56201
	for <linux-next@archiver.kernel.org>; Wed, 11 Nov 2020 07:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB114207D3
	for <linux-next@archiver.kernel.org>; Wed, 11 Nov 2020 07:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgKKHVQ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-next@archiver.kernel.org>);
        Wed, 11 Nov 2020 02:21:16 -0500
Received: from muru.com ([72.249.23.125]:48044 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbgKKHVO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Nov 2020 02:21:14 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 406FA8126;
        Wed, 11 Nov 2020 07:21:21 +0000 (UTC)
Date:   Wed, 11 Nov 2020 09:21:11 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the omap-fixes tree
Message-ID: <20201111072111.GP26857@atomide.com>
References: <20201111081613.0f2ce62a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201111081613.0f2ce62a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [201110 21:16]:
> Hi all,
> 
> In commit
> 
>   e4b5575da267 ("ARM: OMAP2+: Manage MPU state properly for omap_enter_idle_coupled()")
> 
> Fixes tag
> 
>   Fixes: 8ca5ee624b4c ("ARM: OMAP2+: Restore MPU power domain if cpu_cluster_pm_enter() fails")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meeant
> 
> Fixes: 8f04aea048d5 ("ARM: OMAP2+: Restore MPU power domain if cpu_cluster_pm_enter() fails")

Thanks for catching it, will fix!

Tony

