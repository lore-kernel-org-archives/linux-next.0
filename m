From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Tue, 7 Mar 2017 17:37:09 -0800
Message-ID: <20170308013709.GZ30506@linux.vnet.ibm.com>
References: <20170119143445.6b65dc8b@canb.auug.org.au>
 <CAJzB8QEdnVG8Gy-WOSu1pWTtkeVWgBzZvGCu0nobW3M-hBhpkw@mail.gmail.com>
 <20170213132133.3795849e@canb.auug.org.au>
 <20170213043748.GA30506@linux.vnet.ibm.com>
 <20170213174324.47f1b4f5@canb.auug.org.au>
 <20170308121605.555a945d@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51715 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933150AbdCHBjA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Mar 2017 20:39:00 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v281YtpU062047
        for <linux-next@vger.kernel.org>; Tue, 7 Mar 2017 20:37:14 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 29287nrfnm-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 07 Mar 2017 20:37:13 -0500
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 7 Mar 2017 20:37:13 -0500
Content-Disposition: inline
In-Reply-To: <20170308121605.555a945d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul McKenney <paulmckrcu@gmail.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ursula Braun <ubraun@linux.vnet.ibm.com>

On Wed, Mar 08, 2017 at 12:16:05PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Mon, 13 Feb 2017 17:43:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Sun, 12 Feb 2017 20:37:48 -0800 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> > >
> > > I chickened out on that commit for this merge window, so it will come
> > > back at -rc1.  But I will cover that when I rebase to -rc1.  
> > 
> > OK, thanks.
> 
> [PATCH] smc: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
> is needed again ... maybe time to rebase?

On my list for tomorrow morning.  ;-)

							Thanx, Paul
