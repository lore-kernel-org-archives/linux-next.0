From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for May 30
Date: Mon, 2 Jun 2008 20:57:40 +0200
Message-ID: <20080602185740.GA18550@elte.hu>
References: <20080530181901.8268f317.sfr@canb.auug.org.au> <1212316424.3253.8.camel@dhcppc1> <20080601150710.GB27843@elte.hu> <1212428404.484430742e07d@213.133.104.17>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:55067 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751362AbYFBS7x (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Jun 2008 14:59:53 -0400
Content-Disposition: inline
In-Reply-To: <1212428404.484430742e07d@213.133.104.17>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Yinghai Lu <yhlu.kernel@gmail.com>


* Thomas Meyer <thomas@m3y3r.de> wrote:

> Zitat von Ingo Molnar <mingo@elte.hu>:
> 
> > hm, that commit is gone in latest tip - does tip/master boot fine for 
> > you? It's:
> > 
> >    http://people.redhat.com/mingo/tip.git/README
> > 
> > that commit was an interim fix that got removed meanwhile and replaced 
> > with the real fixes.
> 
> I just booted next-20080602 successfully, and the latest commit on 
> file arch/x86/kernel/setup_32.c is:
> 
> 4efc5450e19128e0c77fbfdf4a14804f5a4a1d95 (Merge branch 'x86/numa' into 
> auto-x86-next).
> 
> So yes, the original commit causing the error for me is gone.

thanks for testing it and it's great that the crash is gone!

	Ingo
