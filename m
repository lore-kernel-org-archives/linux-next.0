Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9E5C5519F
	for <linux-next@archiver.kernel.org>; Sun, 22 Nov 2020 17:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 543AB20781
	for <linux-next@archiver.kernel.org>; Sun, 22 Nov 2020 17:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYKpoIE7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgKVRvC (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 22 Nov 2020 12:51:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:36308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727876AbgKVRvC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Nov 2020 12:51:02 -0500
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3FC2E2076B;
        Sun, 22 Nov 2020 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606067462;
        bh=jl7eqTq8COCKjC695W1Mi06rGlb+q4dPU0PtfqBNIGM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=fYKpoIE7//jcRPy+IDxHh1WmousPQ88rQeEzs9dXWGt8dj4FmXPshBo4CX/bo4+m9
         RgrgN8XPG+B9vHHB//QIdgpEsYEeQ+CnnagWcT9tOm0aWejIFbqgP+sBzlUBj3wFPS
         qtfaGHYTOxLKhtQdEQtbl4I8q3x8RjFw4FrOgV8I=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 08E5E3522638; Sun, 22 Nov 2020 09:51:02 -0800 (PST)
Date:   Sun, 22 Nov 2020 09:51:02 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20201122175101.GY1437@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201122210810.7024172e@canb.auug.org.au>
 <20201122210913.078ccc61@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201122210913.078ccc61@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Nov 22, 2020 at 09:09:13PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Sun, 22 Nov 2020 21:08:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Commit
> > 
> >   ca3bd09a3a49 ("rcu: Allow rcu_irq_enter_check_tick() from NMI")
> > 
> > is missing a Signed-off-by from its author.
> 
> Please ignore this bit.
> dd

But good catch on the other one, will fix!

							Thanx, Paul
