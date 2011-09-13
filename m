From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Temporary -rcu tree location
Date: Tue, 13 Sep 2011 09:06:45 -0700
Message-ID: <20110913160645.GA6258@linux.vnet.ibm.com>
References: <20110913000107.GA15945@linux.vnet.ibm.com>
 <alpine.LRH.2.00.1109130210090.19238@twin.jikos.cz>
 <20110913002419.GN2362@linux.vnet.ibm.com>
 <alpine.LNX.2.00.1109130242440.13109@pobox.suse.cz>
 <20110913013400.GB2313@linux.vnet.ibm.com>
 <20110913120716.1b893c483ee91d6b7f12a5b4@canb.auug.org.au>
 <20110913040647.GC2313@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e1.ny.us.ibm.com ([32.97.182.141]:55545 "EHLO e1.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755297Ab1IMQYl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Sep 2011 12:24:41 -0400
Received: from /spool/local
	by us.ibm.com with XMail ESMTP
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 13 Sep 2011 12:24:32 -0400
Content-Disposition: inline
In-Reply-To: <20110913040647.GC2313@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Sep 12, 2011 at 09:06:47PM -0700, Paul E. McKenney wrote:
> On Tue, Sep 13, 2011 at 12:07:16PM +1000, Stephen Rothwell wrote:
> > Hi Paul,
> > 
> > On Mon, 12 Sep 2011 18:34:00 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> > >
> > > > there doesn't seem to be 'rcu/next' branch, right?
> > > 
> > > No, there is not.  So the idea is to push "rcu/next" the first time,
> > > then ":rcu/next" thereafter?
> > 
> > Can't you just do a (forced) push over and over again without removing
> > the branch each time?
> 
> I will give it a try on the next update.  ;-)

OK, I pushed a small update to one of the commits, this time to branch
rcu/next, again at https://github.com/paulmckrcu/linux.

I guess that the acid test is the next time I update.  ;-)

								Thanx, Paul
