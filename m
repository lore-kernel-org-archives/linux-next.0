From: Matt Fleming <matt@codeblueprint.co.uk>
Subject: Re: [tip:sched/core] sched/core: Add debugging code to catch missing
 update_rq_clock() calls
Date: Thu, 2 Feb 2017 22:01:00 +0000
Message-ID: <20170202220100.GA18235@codeblueprint.co.uk>
References: <20160921133813.31976-8-matt@codeblueprint.co.uk>
 <tip-cb42c9a3ebbbb23448c3f9a25417fae6309b1a92@git.kernel.org>
 <87tw8gutp6.fsf@concordia.ellerman.id.au>
 <20170130213435.GM31613@codeblueprint.co.uk>
 <33118425-8548-475A-8DED-9A2424C0BCCC@linux.vnet.ibm.com>
 <1485863317.4498.2.camel@gmx.de>
 <CAOxpaSW_GnndoxLBPtyTrqPJ9XOWvgXOQNDf8D+6OohWeObn5Q@mail.gmail.com>
 <20170202155506.GX6515@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37312 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751467AbdBBWBD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Feb 2017 17:01:03 -0500
Received: by mail-wm0-f42.google.com with SMTP id v77so8220253wmv.0
        for <linux-next@vger.kernel.org>; Thu, 02 Feb 2017 14:01:03 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170202155506.GX6515@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ross Zwisler <zwisler@gmail.com>, Mike Galbraith <efault@gmx.de>, Sachin Sant <sachinp@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, 02 Feb, at 04:55:06PM, Peter Zijlstra wrote:
> On Tue, Jan 31, 2017 at 10:22:47AM -0700, Ross Zwisler wrote:
> > On Tue, Jan 31, 2017 at 4:48 AM, Mike Galbraith <efault@gmx.de> wrote:
> > > On Tue, 2017-01-31 at 16:30 +0530, Sachin Sant wrote:
> 
> 
> Could some of you test this? It seems to cure things in my (very)
> limited testing.

I haven't tested it but this looks like the correct fix to me.

Reviewed-by: Matt Fleming <matt@codeblueprint.co.uk>
