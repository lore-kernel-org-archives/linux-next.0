From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Date: Thu, 5 Jun 2014 11:42:46 +0800
Message-ID: <20140605034246.GA21317@localhost>
References: <20140605002012.GA10446@localhost>
 <20140604210016.4766adba@gandalf.local.home>
 <20140605010353.GA13193@localhost>
 <20140604211202.0eb5d147@gandalf.local.home>
 <20140605013300.GA13341@localhost>
 <20140604213932.5a48112d@gandalf.local.home>
 <20140605021457.GA19061@localhost>
 <20140604223624.6d338b5b@gandalf.local.home>
 <20140605030334.GA20774@localhost>
 <20140604231351.0ef391cd@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:49000 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750944AbaFEDnJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2014 23:43:09 -0400
Content-Disposition: inline
In-Reply-To: <20140604231351.0ef391cd@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 04, 2014 at 11:13:51PM -0400, Steven Rostedt wrote:
> On Thu, 5 Jun 2014 11:03:34 +0800
> Fengguang Wu <fengguang.wu@intel.com> wrote:
> 
> > On Wed, Jun 04, 2014 at 10:36:24PM -0400, Steven Rostedt wrote:
> > > On Thu, 5 Jun 2014 10:14:57 +0800
> > > Fengguang Wu <fengguang.wu@intel.com> wrote:
> > > 
> > > > > I wonder if the "(Red Hat)" part is causing an issue. Can you send
> > > > > directly to my email "rostedt@goodmis.org" and strip the name part?
> > > > 
> > > > OK. I've committed the change. Let's see how well it will work.
> > > 
> > > OK, I never received an error message for my buggy commit I posted
> > > before you did this change. I fixed the buggy commit and added another
> > > bug. I'll now wait again to see if I get notified.
> > 
> > FYI, we got two error reports
> > 
> > [trace:test-wu-bot 28/29] kernel/trace/trace.c:6683:1: error: expected '; ' before '}' token
> > [trace:test-wu-bot 29/29] kernel/trace/trace.c:6701:9: error: 'x' undeclared
> > 
> > in
> > 
> > https://lists.01.org/pipermail/kbuild-all/2014-June/004839.html
> > https://lists.01.org/pipermail/kbuild-all/2014-June/004840.html
> > 
> 
> And I received no emails :-(

Those 2 emails has

        To: Steven Rostedt <rostedt@goodmis.org>

in the header.

> I wonder why it's failing. What changed since March? I can't think of
> anything on my end.

It could be changes in one of the SMTP servers. Who knows. The
simplest workaround may be to have another email address to receive
all reports to you.

Thanks,
Fengguang
