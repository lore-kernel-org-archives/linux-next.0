From: Greg KH <gregkh@linux-foundation.org>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Thu, 11 Oct 2018 12:37:50 +0200
Message-ID: <20181011103750.GA29735@kroah.com>
References: <20180824172053.20fa197294f51496dcec5605@kernel.org>
 <20180824204756.e787765461975cd1e27502dc@kernel.org>
 <20180824224211.2934d7c0@canb.auug.org.au>
 <20180826171058.e07f99e6e03f7497e5a46ed3@kernel.org>
 <20180828072333.36af4d5d@canb.auug.org.au>
 <20180828094341.d20d8fbcb9dca310d44df951@kernel.org>
 <f0ca0036-abe1-4252-6d30-b810dd22097d@linux.ibm.com>
 <20181011114809.5590ecb3@canb.auug.org.au>
 <d5b166d6-461c-f382-e3d2-8993b845bd5a@linux.ibm.com>
 <20181011205849.6f6645fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181011205849.6f6645fa@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Peter Oberparleiter <oberpar@linux.ibm.com>, arnd@arndb.de, Masami Hiramatsu <mhiramat@kernel.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 11, 2018 at 08:58:49PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 11 Oct 2018 09:44:36 +0200 Peter Oberparleiter <oberpar@linux.ibm.com> wrote:
> >
> > On 11.10.2018 02:48, Stephen Rothwell wrote:
> > > OK, I have been carrying this "quick fix" patch in linux-next since
> > > September 7.  Is anyone going to pick this up and send it to
> > > Greg/Linus, please?  
> > 
> > Sorry about that - I posted a modified fix at
> > 
> >   https://lkml.org/lkml/2018/9/13/367
> > 
> > but didn't get a response. I guess I should have reposted sooner. But
> > before I do that:
> > 
> > Arnd: Is this something that you can pick up or should I include someone
> > else?
> 
> It would be nice if it could go in before the v4.19 release because the
> commit that exposed the warnings went into v4.19-rc1.

I agree.  If someone could at least review/ack it, that would be great.
What tree does this normally go through?

thanks,

greg k-h
