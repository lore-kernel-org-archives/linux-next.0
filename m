From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Temporary -rcu tree location
Date: Mon, 12 Sep 2011 18:34:00 -0700
Message-ID: <20110913013400.GB2313@linux.vnet.ibm.com>
References: <20110913000107.GA15945@linux.vnet.ibm.com>
 <alpine.LRH.2.00.1109130210090.19238@twin.jikos.cz>
 <20110913002419.GN2362@linux.vnet.ibm.com>
 <alpine.LNX.2.00.1109130242440.13109@pobox.suse.cz>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e4.ny.us.ibm.com ([32.97.182.144]:47543 "EHLO e4.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753706Ab1IMBeF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Sep 2011 21:34:05 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1109130242440.13109@pobox.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 13, 2011 at 02:43:55AM +0200, Jiri Kosina wrote:
> On Mon, 12 Sep 2011, Paul E. McKenney wrote:
> 
> > Here is what happens when I try that:
> > 
> > 	git push github :rcu/next
> > 	Username: 
> > 	Password: 
> > 	error: unable to push to unqualified destination: rcu/next
> > 	The destination refspec neither matches an existing ref on the remote nor
> > 	begins with refs/, and we are unable to guess a prefix based on the source ref.
> > 	error: failed to push some refs to 'https://github.com/paulmckrcu/linux'
> > 
> > So what am I missing here?
> 
> Looking at 
> 
> 	https://github.com/paulmckrcu/linux/branches
> 
> there doesn't seem to be 'rcu/next' branch, right?

No, there is not.  So the idea is to push "rcu/next" the first time,
then ":rcu/next" thereafter?

							Thanx, Paul
