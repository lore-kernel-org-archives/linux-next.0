Return-Path: <SRS0=MvKh=DQ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120FCC433E7
	for <linux-next@archiver.kernel.org>; Fri,  9 Oct 2020 18:21:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8A8F222C3
	for <linux-next@archiver.kernel.org>; Fri,  9 Oct 2020 18:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602267711;
	bh=lZeKmEBYOFSPyXXAEhd82JvzWUbzSvGCdC+F4wT6yGk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:List-ID:
	 From;
	b=PT4XbIoH4XfhQheOLisTwxL47MoB4DXP6BZDh4leAfvq6dpXKlNnk6yXGKj4OE8v1
	 Z1RuEALDFavBShLZeGXFmwptVHoKQGisVfRIdlaGHtey/YnuteXILcjF4l4qL3o/pn
	 kFZBT8c61IKbUAsF+GVdz7RfOCVei02nYTSUcbxE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387958AbgJISVv (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 9 Oct 2020 14:21:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:60776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390337AbgJISVv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Oct 2020 14:21:51 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E9B522284;
        Fri,  9 Oct 2020 18:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602267710;
        bh=lZeKmEBYOFSPyXXAEhd82JvzWUbzSvGCdC+F4wT6yGk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZwRpWKODPUQmv/XpL7UIxEsk9FGD5WINOwMfvs7Ws3h1vhZFZyNVXqJjJehioJgJl
         pvl5a4yETlhqP9KJxgRsltYcR1QaZ+yL5xpmzpqzBG3TWXZUvw4232yYdon8nPgjuc
         t7A/AN8shitzAWTjPRoPE5LVvCNr1EVuLNKbnu+I=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 0E9CC35227D5; Fri,  9 Oct 2020 11:21:50 -0700 (PDT)
Date:   Fri, 9 Oct 2020 11:21:50 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Qian Cai <cai@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201009182150.GK29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201009135837.GD29330@paulmck-ThinkPad-P72>
 <20201009162352.GR2611@hirez.programming.kicks-ass.net>
 <e8fce9c0db7985e132262fd508a519ade656bdd8.camel@redhat.com>
 <942e0ffb37a4580982206d72404c521d72d38314.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <942e0ffb37a4580982206d72404c521d72d38314.camel@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 09, 2020 at 01:54:34PM -0400, Qian Cai wrote:
> On Fri, 2020-10-09 at 13:36 -0400, Qian Cai wrote:
> > Back to x86, we have:
> > 
> > start_secondary()
> >   smp_callin()
> >     apic_ap_setup()
> >       setup_local_APIC()
> >         printk() in certain conditions.
> > 
> > which is before smp_store_cpu_info().
> > 
> > Can't we add a rcu_cpu_starting() at the very top for each start_secondary(),
> > secondary_start_kernel(), smp_start_secondary() etc, so we don't worry about
> > any printk() later?
> 
> This is rather irony. rcu_cpu_starting() is taking a lock and then reports
> itself.
> 
> [    8.826732][    T0]  __lock_acquire.cold.76+0x2ad/0x3e0
> [    8.826732][    T0]  lock_acquire+0x1c8/0x820
> [    8.826732][    T0]  _raw_spin_lock_irqsave+0x30/0x50
> [    8.826732][    T0]  rcu_cpu_starting+0xd0/0x2c0
> [    8.826732][    T0]  start_secondary+0x10/0x2a0
> [    8.826732][    T0]  secondary_startup_64_no_verify+0xb8/0xbb

Fun!!!

There should be some way around this.  I cannot safely record the
offline-to-online transition without acquiring a lock.  I suppose
I could trick lockdep into thinking that it was a recursive lockdep
report.  Any other approaches?

						Thanx, Paul
