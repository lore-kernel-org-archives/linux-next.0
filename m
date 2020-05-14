Return-Path: <SRS0=h0B2=64=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52458C433E0
	for <linux-next@archiver.kernel.org>; Thu, 14 May 2020 23:01:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D20E20727
	for <linux-next@archiver.kernel.org>; Thu, 14 May 2020 23:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589497310;
	bh=9kHzGR4jtnM8QfaNtmUWcGtyiqSfnVbHpG4mWG8KhHU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:List-ID:
	 From;
	b=tN7Tm9u8DsdeWnEy6edjdbKHwjwzgWVOeUxOzO+0IFXfdcp64q7zlwiURlB3k5sXb
	 Foh8rV249n+9ha4lda7bfD2qV7GQW0BmJxxlMU9hX9ZiDwwMGrE5QvMTTI0uQ8qAUe
	 f3iwIhz03PH8UQRJmMKWWK1sIaQPgmeazugAZ/Gs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbgENXBt (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 14 May 2020 19:01:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:55036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728953AbgENXBt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 19:01:49 -0400
Received: from paulmck-ThinkPad-P72.home (unknown [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 276122065C;
        Thu, 14 May 2020 23:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589497309;
        bh=9kHzGR4jtnM8QfaNtmUWcGtyiqSfnVbHpG4mWG8KhHU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=gPYgukViCCO+gbLgaxQMkEm7SEL/q0SnBWoMpU0sopgK9FcjdgAWu6PL54dNWmx+L
         fKkxb2HJGsgOOk16lgVtHBuKK1BeNST4gsk/EvujA5w49kHG515KoiyYyjJ5QPiQPq
         FZMDlByG1pjtSt9B0fk6f6j6edNOHBILeMYoQOIs=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 9A2C235229C6; Thu, 14 May 2020 16:01:48 -0700 (PDT)
Date:   Thu, 14 May 2020 16:01:48 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the rcu tree
Message-ID: <20200514230148.GB2869@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200515084317.7deae61a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515084317.7deae61a@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 15, 2020 at 08:43:17AM +1000, Stephen Rothwell wrote:
> Hi all,
> Commits
> 
>   b2998782ded4 ("Documentation/litmus-tests: Clarify about the RCU pre-initialization test")
>   663f9202eb8a ("Documentation/litmus-tests: Merge atomic's README into top-level one")
>   f5eff20366f6 ("tools/memory-model: Fix reference to litmus test in recipes.txt")
> 
> are missing a Signed-off-by from their committer.

I knew I was forgetting something...  Will fix, and thank you!!!

							Thanx, Paul
