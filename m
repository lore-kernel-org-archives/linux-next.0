From: Borislav Petkov <bp@alien8.de>
Subject: Re: [tip:sched/core] sched/core: Add debugging code to catch missing
 update_rq_clock() calls
Date: Fri, 3 Feb 2017 14:04:46 +0100
Message-ID: <20170203130446.hpq4hb5b5j5vvhwm@pd.tnic>
References: <20160921133813.31976-8-matt@codeblueprint.co.uk>
 <tip-cb42c9a3ebbbb23448c3f9a25417fae6309b1a92@git.kernel.org>
 <87tw8gutp6.fsf@concordia.ellerman.id.au>
 <20170130213435.GM31613@codeblueprint.co.uk>
 <33118425-8548-475A-8DED-9A2424C0BCCC@linux.vnet.ibm.com>
 <1485863317.4498.2.camel@gmx.de>
 <CAOxpaSW_GnndoxLBPtyTrqPJ9XOWvgXOQNDf8D+6OohWeObn5Q@mail.gmail.com>
 <20170202155506.GX6515@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:40180 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751958AbdBCNFL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Feb 2017 08:05:11 -0500
Content-Disposition: inline
In-Reply-To: <20170202155506.GX6515@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ross Zwisler <zwisler@gmail.com>, Mike Galbraith <efault@gmx.de>, Sachin Sant <sachinp@linux.vnet.ibm.com>, Matt Fleming <matt@codeblueprint.co.uk>, Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, Feb 02, 2017 at 04:55:06PM +0100, Peter Zijlstra wrote:
> On Tue, Jan 31, 2017 at 10:22:47AM -0700, Ross Zwisler wrote:
> > On Tue, Jan 31, 2017 at 4:48 AM, Mike Galbraith <efault@gmx.de> wrote:
> > > On Tue, 2017-01-31 at 16:30 +0530, Sachin Sant wrote:
> 
> 
> Could some of you test this? It seems to cure things in my (very)
> limited testing.

Tested-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
