From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the generic-ipi tree
Date: Wed, 16 Jul 2008 12:40:12 +0200
Message-ID: <20080716104012.GA2425@elte.hu>
References: <20080716194517.fc260962.sfr@canb.auug.org.au> <20080716101921.GA16688@elte.hu> <20080716202521.ea91d90d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:58103 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751837AbYGPKkk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 06:40:40 -0400
Content-Disposition: inline
In-Reply-To: <20080716202521.ea91d90d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Wed, 16 Jul 2008 12:19:21 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > hm, generic-ipi is already in Linus's tree:
> 
> Yeah, but powerpc wasn't when I started this morning (and now is).
> 
> > i hope i'll be able to update the auto-*-next branches soon - a lot of 
> > them got very empty ;-)
> 
> As I am hoping ...

hm, so them being stale over the merge window is a problem for you, even 
thought the sha1's didnt change? Ok - i'll do a full integration run 
right away to update them all to linus-very-latest. There's been quite a 
number of nontrivial interactions.

	Ingo
