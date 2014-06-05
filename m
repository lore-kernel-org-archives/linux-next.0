From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Date: Thu, 5 Jun 2014 10:50:33 +0800
Message-ID: <20140605025033.GC20455@localhost>
References: <20140604160921.4f4e69c4@canb.auug.org.au>
 <20140604122612.366e2874@gandalf.local.home>
 <20140605002012.GA10446@localhost>
 <20140604210016.4766adba@gandalf.local.home>
 <20140605010353.GA13193@localhost>
 <20140604211202.0eb5d147@gandalf.local.home>
 <20140605013300.GA13341@localhost>
 <20140604213932.5a48112d@gandalf.local.home>
 <20140605021457.GA19061@localhost>
 <20140604223624.6d338b5b@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:16635 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751010AbaFECuh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2014 22:50:37 -0400
Content-Disposition: inline
In-Reply-To: <20140604223624.6d338b5b@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 04, 2014 at 10:36:24PM -0400, Steven Rostedt wrote:
> On Thu, 5 Jun 2014 10:14:57 +0800
> Fengguang Wu <fengguang.wu@intel.com> wrote:
> 
> > > I wonder if the "(Red Hat)" part is causing an issue. Can you send
> > > directly to my email "rostedt@goodmis.org" and strip the name part?
> > 
> > OK. I've committed the change. Let's see how well it will work.
> 
> OK, I never received an error message for my buggy commit I posted
> before you did this change. I fixed the buggy commit and added another
> bug. I'll now wait again to see if I get notified.

Sorry we got something wrong and your first bad commit is not tested.
The new one is being tested now.

Thanks,
Fengguang
