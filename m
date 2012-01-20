From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: Linux 3.3-1 out - merge window closed
Date: Fri, 20 Jan 2012 12:41:43 -0500
Message-ID: <20120120174143.GA15673@home.goodmis.org>
References: <CA+55aFwWEhobGDzkuRoXaS37y3tMU41ExhiR+vCa68cUNRehKg@mail.gmail.com>
 <20120120151452.2fe57bb87218f575e8909caf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:57730 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754921Ab2ATRlp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Jan 2012 12:41:45 -0500
Content-Disposition: inline
In-Reply-To: <20120120151452.2fe57bb87218f575e8909caf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On Fri, Jan 20, 2012 at 03:14:52PM +1100, Stephen Rothwell wrote:
> 
> This leaves 1174 commits (13%) in v3.3-rc1 that were not in next-20120106
> for some reason (not too bad really, I guess).  Some will clearly be bug
> fixes, of course.  Some will be quilt trees (probably rebased before
> being sent to Linus).  Some will be patches that depend on work by others.

Well, 19 of those were ktest patches. Although it's not something we
need to worry about, as it's just a script for users to test their
kernels and not something that would conflict with others. I'll send out
that email to get ktest included into linux-next regardless.

Thanks!

-- Steve
