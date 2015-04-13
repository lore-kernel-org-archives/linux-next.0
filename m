From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: build warnings after merge of the char-misc tree
Date: Mon, 13 Apr 2015 11:01:01 -0400
Message-ID: <20150413110101.2aa3c3d0@gandalf.local.home>
References: <20150413193720.56083fbf@canb.auug.org.au>
	<20150413104328.GB6390@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0134.hostedemail.com ([216.40.44.134]:39206 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753594AbbDMPBF (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 11:01:05 -0400
In-Reply-To: <20150413104328.GB6390@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>

On Mon, 13 Apr 2015 12:43:28 +0200
Greg KH <greg@kroah.com> wrote:

> > In file included from include/trace/define_trace.h:90:0,
> >                  from drivers/misc/mei/mei-trace.h:76,
> >                  from drivers/misc/mei/mei-trace.c:21:
> > include/trace/ftrace.h:28:0: note: this is the location of the previous definition
> >  #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
> >  ^
> > 
> > Introduced by commit a0a927d06d79 ("mei: me: add io register tracing")
> > interacting with commit acd388fd3af3 ("tracing: Give system name a
> > pointer") from the ftrace tree.
> > 
> > TRACE_SYSTEM_STRING should be removed from drivers/misc/mei/mei-trace.h
> > as it is not being used anywhere in the mei-trace code.
> 
> That's nice for such system-wide changes to be done at the last possible
> minute in the development cycle :(
> 

Looking at this deeper, this commit isn't a problem with the trace
system change. It is caused probably by a cut and paste from a driver
that had TRACE_SYSTEM_STRING and should not have. A simple removal of
this define should be enough to fix the issue.

-- Steve
