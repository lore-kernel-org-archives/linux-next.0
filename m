From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: x86/driver-core merge failure
Date: Mon, 19 May 2008 18:35:51 +0200
Message-ID: <20080519163551.GB19882@elte.hu>
References: <20080519113328.c98700c4.sfr@canb.auug.org.au> <200805191623.07902.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:34362 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751187AbYESQgK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 12:36:10 -0400
Content-Disposition: inline
In-Reply-To: <200805191623.07902.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org


* Rafael J. Wysocki <rjw@sisk.pl> wrote:

> On Monday, 19 of May 2008, Stephen Rothwell wrote:
> > Hi Greg, Ingo,
> > 
> > Today's linux-next merge of the x86 tree got a conflict in 
> > kernel/power/main.c between commit 
> > 7c6e17af5dfa9e70e1eb32981f3f608ef1d0eca5 ("PM: Introduce new top 
> > level suspend and hibernation callbacks") from the driver-core tree 
> > and commit 338e075309d960eb91cc8540f69b9cb5b2967d3e ("sleepy linux 
> > self-test") from the x86 tree.  The former added a parameter to 
> > device_resume() while the latter put a 
> > suspend_test_start()/suspend_test_finish() pair around the 
> > device_resume() call in the error path of 
> > suspend_devices_and_enter(). It is a trivial fixup.
> 
> Okay, but I think the "sleepy linux self-test" patch should be 
> updated.

do you have time to have a look? It's in the 'tip/scratch' branch of 
-tip:

   http://people.redhat.com/mingo/tip.git/README

commit:

| commit 338e075309d960eb91cc8540f69b9cb5b2967d3e
| Author: David Brownell <david-b@pacbell.net>
| Date:   Fri May 16 10:12:36 2008 +0200
|
|     sleepy linux self-test

it was included in linux-next by mistake - but while we are at it it 
might make sense to make it work properly?

	Ingo
