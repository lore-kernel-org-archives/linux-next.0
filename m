From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: build warnings after merge of the char-misc tree
Date: Mon, 13 Apr 2015 10:17:00 -0400
Message-ID: <20150413101700.79374a1e@gandalf.local.home>
References: <20150413193720.56083fbf@canb.auug.org.au>
	<20150413104328.GB6390@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150413104328.GB6390@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>
List-Id: linux-next.vger.kernel.org

On Mon, 13 Apr 2015 12:43:28 +0200
Greg KH <greg@kroah.com> wrote:
 ^
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

Hmm, sorry. I'll try to figure out what happened. A lot of this was
done earlier, but I was waiting for acks an also making sure it worked,
and doing lots of iterations of testing. Unfortunately, I only tested
against what was in mainline, not what was in linux-next. I should have
done that too.


> 
> Anyway, someone from the trace subsystem wish to send me a patch for
> this?
> 

I'll download latest linux-next and take a look at the carnage. This is
something that may break builds, but is pretty straight forward that
shouldn't cause anything serious to break at run time.

-- Steve
