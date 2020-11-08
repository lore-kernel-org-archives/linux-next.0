Return-Path: <SRS0=KNZe=EO=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6C8C5517A
	for <linux-next@archiver.kernel.org>; Sun,  8 Nov 2020 21:39:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 079A9221F7
	for <linux-next@archiver.kernel.org>; Sun,  8 Nov 2020 21:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=fieldses.org header.i=@fieldses.org header.b="KGaz72rN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgKHVjC (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 8 Nov 2020 16:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHVjC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2020 16:39:02 -0500
X-Greylist: delayed 565 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 08 Nov 2020 13:39:02 PST
Received: from fieldses.org (fieldses.org [IPv6:2600:3c00:e000:2f7::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B16C0613CF
        for <linux-next@vger.kernel.org>; Sun,  8 Nov 2020 13:39:02 -0800 (PST)
Received: by fieldses.org (Postfix, from userid 2815)
        id 67BBCABE; Sun,  8 Nov 2020 16:29:36 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 67BBCABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fieldses.org;
        s=default; t=1604870976;
        bh=v6brK1oFXTE0Hcdf0Q8BGXv2xv/Tnzjh3ER1PnwzzQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KGaz72rNWAs1hbtxL8goU+1C6xWZ3Jo66n3mSMGO3+4XZ5OaTrvu5V9OeEn0WF4rY
         rS08UT82VIXt9t4+erO9sQd61qNZjmXJI2hIDEV+1M1voNtMTjP/AyAdLliH7p09ak
         jmleKdngNtcUY7dY/WUVL9A3PivinkU7B1fU78PI=
Date:   Sun, 8 Nov 2020 16:29:36 -0500
From:   "J. Bruce Fields" <bfields@fieldses.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfsd tree
Message-ID: <20201108212936.GD14422@fieldses.org>
References: <20201109082032.3bf8f58d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109082032.3bf8f58d@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 09, 2020 at 08:20:32AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   bfb5aa1685d5 ("net/sunrpc: fix useless comparison in proc_do_xprt()")
> 
> is missing a Signed-off-by from its author.

I split the original patch in 2 and fixed a bug in this second patch,
but unless I hear otherwise I'll assume Dan's OK with his Signed-off-by
staying on both....

--b.
