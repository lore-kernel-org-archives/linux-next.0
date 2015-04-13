From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Mon, 13 Apr 2015 05:40:58 -0700
Message-ID: <20150413124058.GQ23685@linux.vnet.ibm.com>
References: <20150413203917.1e7ea535@canb.auug.org.au>
 <20150413110620.GD22325@pd.tnic>
 <20150413113405.GA667@gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e34.co.us.ibm.com ([32.97.110.152]:53791 "EHLO
	e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932223AbbDMMlH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Apr 2015 08:41:07 -0400
Received: from /spool/local
	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Mon, 13 Apr 2015 06:41:06 -0600
Content-Disposition: inline
In-Reply-To: <20150413113405.GA667@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 13, 2015 at 01:34:05PM +0200, Ingo Molnar wrote:
> 
> * Borislav Petkov <bp@suse.de> wrote:
> 
> > On Mon, Apr 13, 2015 at 08:39:17PM +1000, Stephen Rothwell wrote:
> > > Hi Paul,
> > > 
> > > After merging the rcu tree, today's linux-next build (powerpc allnoconfig)
> > > failed like this:
> > > 
> > > init/main.c: In function 'rest_init':
> > > init/main.c:387:2: error: implicit declaration of function 'smpboot_thread_init' [-Werror=implicit-function-declaration]
> > >   smpboot_thread_init();
> > >   ^
> > > 
> > > Caused by commit c55f6e1f6f69 ("cpu: Defer smpboot kthread unparking
> > > until CPU known to scheduler").  The declaration in include/linux/cpu.h
> > > is protected by CONFIG_SMP, its use is not.
> > > 
> > > I have reverted that commit for today.
> > 
> > Thanks for the report Stephen, I know today is the day of b0rked
> > linux-next builds :-(
> > 
> > I think Ingo merged Paul's patch already so here's a fix ontop:
> 
> Yeah, I too triggered that build failure and fixed it locally.

What I get for immediately going to long-term testing.  The scenarios
that trigger this one were of course the last to run.  :-/

Thank you all, and apologies for the hassle!

							Thanx, Paul
