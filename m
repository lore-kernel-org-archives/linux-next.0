From: Alex Williamson <alex.williamson@hp.com>
Subject: Re: linux-next: upstream tree build warnings
Date: Thu, 23 Apr 2009 10:46:37 -0600
Message-ID: <1240505197.9646.517.camel@2710p.home>
References: <20090423163847.200f227e.sfr@canb.auug.org.au>
	 <20090423.002403.74400050.davem@davemloft.net>
	 <20090423215533.157df0e0.sfr@canb.auug.org.au>
	 <20090423225108.600a6e8e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g4t0016.houston.hp.com ([15.201.24.19]:21519 "EHLO
	g4t0016.houston.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755937AbZDWQrT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2009 12:47:19 -0400
In-Reply-To: <20090423225108.600a6e8e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, rusty@rustcorp.com.au, linux-kernel@vger.kernel.org

On Thu, 2009-04-23 at 22:51 +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> On Thu, 23 Apr 2009 21:55:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > The callers came in throught commit
> > 0bde95690d65653e420d04856c5d5783155c747c ("virtio_net: Add support for
> > VLAN filtering in the hypervisor") which I assume came in throught the
> > net tree (it has you SOB on it). Committed Feb 5, 2009, went into Linus'
> > tree before 2.6.30-rc1.
> > 
> > scatterlist.h hasn't changed since July, 2008.
> 
> In other words, I think the bug has always been there and just never hit
> (yet).

Hmm, I can't seem to get the warning on an x86_64 allyesconfig build
with gcc-4.4.0.  Did all the archs other than powerpc miss this warning?
Thanks,

Alex
