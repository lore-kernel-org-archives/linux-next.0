From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: getting fixmap patches in linux-next
Date: Wed, 11 Dec 2013 14:01:57 -0800
Message-ID: <20131211140157.0a9c6decb597b491968c484a@linux-foundation.org>
References: <1386775505.1979.105.camel@deneb.redhat.com>
	<20131211154021.GA11208@gmail.com>
	<1386777359.1979.106.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:49911 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751262Ab3LKWB7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Dec 2013 17:01:59 -0500
In-Reply-To: <1386777359.1979.106.camel@deneb.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Salter <msalter@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, mingo <mingo@redhat.com>

On Wed, 11 Dec 2013 10:55:59 -0500 Mark Salter <msalter@redhat.com> wrote:

> On Wed, 2013-12-11 at 16:40 +0100, Ingo Molnar wrote:
> > * Mark Salter <msalter@redhat.com> wrote:
> > 
> > > Hi, I have cleanup of fixmap.h here:
> > > 
> > >  http://lkml.org/lkml/2013/11/25/474
> > > 
> > > Most of the series has been ack'd with the notable exception
> > > of the arch/x86 part. [...]
> > 
> > It didn't look controversial to me:
> > 
> >   Acked-by: Ingo Molnar <mingo@kernel.org>
> > 
> > > [...] I'd like to get this series into linux-next but I'm not sure 
> > > of the best way. I could put it in the c6x tree but it doesn't 
> > > belong there and I don't want to put the x86 patch in there without 
> > > any acks. I've cc'd Ingo thinking the tip tree may be the place it 
> > > should go.
> > 
> > I think akpm is usually collecting such generic arch and kmap patches 
> > - mind pinging him whether he'd like to take it into -mm?
> 
> Thanks, will do.

It seems that "[PATCH 03/11] arm: use generic fixmap.h" has issues?

If/when that gets resolved, please integrate all the reviewed-by's and
acked-by's and cc me on the resend?
