From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Mon, 13 Apr 2015 13:34:05 +0200
Message-ID: <20150413113405.GA667@gmail.com>
References: <20150413203917.1e7ea535@canb.auug.org.au>
 <20150413110620.GD22325@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:33254 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754074AbbDMLeL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Apr 2015 07:34:11 -0400
Content-Disposition: inline
In-Reply-To: <20150413110620.GD22325@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Borislav Petkov <bp@suse.de> wrote:

> On Mon, Apr 13, 2015 at 08:39:17PM +1000, Stephen Rothwell wrote:
> > Hi Paul,
> > 
> > After merging the rcu tree, today's linux-next build (powerpc allnoconfig)
> > failed like this:
> > 
> > init/main.c: In function 'rest_init':
> > init/main.c:387:2: error: implicit declaration of function 'smpboot_thread_init' [-Werror=implicit-function-declaration]
> >   smpboot_thread_init();
> >   ^
> > 
> > Caused by commit c55f6e1f6f69 ("cpu: Defer smpboot kthread unparking
> > until CPU known to scheduler").  The declaration in include/linux/cpu.h
> > is protected by CONFIG_SMP, its use is not.
> > 
> > I have reverted that commit for today.
> 
> Thanks for the report Stephen, I know today is the day of b0rked
> linux-next builds :-(
> 
> I think Ingo merged Paul's patch already so here's a fix ontop:

Yeah, I too triggered that build failure and fixed it locally.

Thanks,

	Ingo
