From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the generic-ipi tree
Date: Wed, 16 Jul 2008 13:14:42 +0200
Message-ID: <20080716111441.GA15724@elte.hu>
References: <20080716194517.fc260962.sfr@canb.auug.org.au> <20080716101921.GA16688@elte.hu> <20080716202521.ea91d90d.sfr@canb.auug.org.au> <20080716104012.GA2425@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:48445 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753197AbYGPLPD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 07:15:03 -0400
Content-Disposition: inline
In-Reply-To: <20080716104012.GA2425@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org


* Ingo Molnar <mingo@elte.hu> wrote:

> > > i hope i'll be able to update the auto-*-next branches soon - a 
> > > lot of them got very empty ;-)
> > 
> > As I am hoping ...
> 
> hm, so them being stale over the merge window is a problem for you, 
> even thought the sha1's didnt change? Ok - i'll do a full integration 
> run right away to update them all to linus-very-latest. There's been 
> quite a number of nontrivial interactions.

ok, i've done the integration run of all of tip's auto-*-next branches 
and pushed out the result.

note, you might run into a conflict in arch/x86/kernel/Makefile, the 
correct final resolution is:

 ifdef CONFIG_FTRACE
 # Do not profile debug and lowlevel utilities
 CFLAGS_REMOVE_tsc.o = -pg
 CFLAGS_REMOVE_rtc.o = -pg
 CFLAGS_REMOVE_paravirt.o = -pg
 endif

	Ingo
