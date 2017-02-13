From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Sun, 12 Feb 2017 20:37:48 -0800
Message-ID: <20170213043748.GA30506@linux.vnet.ibm.com>
References: <20170119143445.6b65dc8b@canb.auug.org.au>
 <CAJzB8QEdnVG8Gy-WOSu1pWTtkeVWgBzZvGCu0nobW3M-hBhpkw@mail.gmail.com>
 <20170213132133.3795849e@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46810 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751023AbdBMEhw (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Feb 2017 23:37:52 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1D4TDcE075403
        for <linux-next@vger.kernel.org>; Sun, 12 Feb 2017 23:37:51 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
        by mx0a-001b2d01.pphosted.com with ESMTP id 28hxt9ypnm-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Sun, 12 Feb 2017 23:37:51 -0500
Received: from localhost
        by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 12 Feb 2017 21:37:50 -0700
Content-Disposition: inline
In-Reply-To: <20170213132133.3795849e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul McKenney <paulmckrcu@gmail.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ursula Braun <ubraun@linux.vnet.ibm.com>

On Mon, Feb 13, 2017 at 01:21:33PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Thu, 19 Jan 2017 13:54:37 -0800 Paul McKenney <paulmckrcu@gmail.com> wrote:
> >
> > On Wed, Jan 18, 2017 at 7:34 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > Hi Paul,
> > >
> > > After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:
> > >
> > > net/smc/af_smc.c:102:16: error: 'SLAB_DESTROY_BY_RCU' undeclared here (not in a function)
> > >   .slab_flags = SLAB_DESTROY_BY_RCU,
> > >                 ^
> > >
> > > Caused by commit
> > >
> > >   c7a545924ca1 ("mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU")
> > >
> > > interacting with commit
> > >
> > >   ac7138746e14 ("smc: establish new socket family")
> > >
> > > from the net-next tree.
> > >
> > > I have applied the following merge fix patch (someone will need to
> > > remember to mention this to Linus):  
> > 
> > Thank you, Stephen!  I expect that there might be a bit more
> > bikeshedding on the name, but here is hoping...  :-/
> 
> The need for this merge fix patch has gone away today.  Is that a
> permanent situation, or will it come back?

I chickened out on that commit for this merge window, so it will come
back at -rc1.  But I will cover that when I rebase to -rc1.

							Thanx, Paul
