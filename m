Return-Path: <SRS0=dTEO=DW=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730C3C433E7
	for <linux-next@archiver.kernel.org>; Thu, 15 Oct 2020 09:52:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EF4D206CA
	for <linux-next@archiver.kernel.org>; Thu, 15 Oct 2020 09:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BMB+E6U+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730816AbgJOJwq (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 15 Oct 2020 05:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbgJOJwp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 05:52:45 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5722C061755;
        Thu, 15 Oct 2020 02:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ChnsDW8RwOz+V4Lui6+w7vUUoPHqiMUgHcTcHpDBqRQ=; b=BMB+E6U++dgutmPA3qPWMcBBfJ
        zVUmVqKmG02zDpFDN37KOTvG87NCwLcFA6PVxtZZuul/kVQS/n8UziTC9YGdjEfzrmEFbjsswhNEW
        ZEXjc5zqSBOrL8XGaYnBc6Ftx/O5QgdWUNKjxvZ2zzWGlU/bGz/6kvbHJWjckG2ce82CgmXCpW7Sm
        ACBjJo5d6Cav+gA8JTKeyVu8a7s9UpwMJ/xAozLQbOiSGPyJ9Q4xRg1XapOrpTc/vyouv/ByC3Y/a
        Ste5VOj4eNisWZqpZ6DrKWKS/w2o5aeSpKtfiIRnE75iOPbcmMGskkeUAnfkq2jn0wuP39rLOpKPG
        vI5t7XUw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSzw3-0006Jw-J2; Thu, 15 Oct 2020 09:52:35 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3419B300DAE;
        Thu, 15 Oct 2020 11:52:35 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 21F8620325EC4; Thu, 15 Oct 2020 11:52:35 +0200 (CEST)
Date:   Thu, 15 Oct 2020 11:52:35 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201015095235.GT2651@hirez.programming.kicks-ass.net>
References: <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
 <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
 <20201014183405.GA27666@paulmck-ThinkPad-P72>
 <20201014215319.GF2974@worktop.programming.kicks-ass.net>
 <20201014221152.GS3249@paulmck-ThinkPad-P72>
 <20201014223954.GH2594@hirez.programming.kicks-ass.net>
 <20201014235553.GU3249@paulmck-ThinkPad-P72>
 <20201015034128.GA10260@paulmck-ThinkPad-P72>
 <20201015094926.GY2611@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015094926.GY2611@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 15, 2020 at 11:49:26AM +0200, Peter Zijlstra wrote:
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -1764,8 +1764,7 @@ static bool rcu_gp_init(void)
>  		smp_mb(); // Pair with barriers used when updating ->ofl_seq to odd values.
>  		firstseq = READ_ONCE(rnp->ofl_seq);
>  		if (firstseq & 0x1)
> -			while (firstseq == smp_load_acquire(&rnp->ofl_seq))
> -				schedule_timeout_idle(1);  // Can't wake unless RCU is watching.
> +			smp_cond_load_relaxed(&rnp->ofl_seq, VAL == firstseq);

My bad, that should be: VAL != firstseq.

>  		smp_mb(); // Pair with barriers used when updating ->ofl_seq to even values.
>  		raw_spin_lock(&rcu_state.ofl_lock);
>  		raw_spin_lock_irq_rcu_node(rnp);
