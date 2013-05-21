From: Wang YanQing <udknight@gmail.com>
Subject: Re: [PATCH] TTY:vt: convert remain take_over_console's users to
 do_take_over_console
Date: Wed, 22 May 2013 00:18:50 +0800
Message-ID: <20130521161849.GA11322@udknight.homenetwork>
References: <20130521051511.GA11435@udknight>
 <519B7249.2070207@hurleysoftware.com>
 <20130521144215.GA5302@udknight.homenetwork>
 <519B976A.3050708@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <519B976A.3050708@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: gregkh@linuxfoundation.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, May 21, 2013 at 11:48:58AM -0400, Peter Hurley wrote:
> On 05/21/2013 10:42 AM, Wang YanQing wrote:
> > On Tue, May 21, 2013 at 09:10:33AM -0400, Peter Hurley wrote:
> >> I would rather revert dc9641895abb which purported to delete
> >> _unneeded_ functions than have this. Obviously the functions
> >> were needed.
> >>
> >
> > Hi Peter, this series patches' goal is to reduce codes'
> > redundance and function duplication. But if we keep take_over_console,
> > then we have to rewrite it as a trivial wrapper over do_take_over_console,
> > or we have to keep bind_con_driver and register_con_driver, and this
> > will bring use codes' redundance.
> >
> > And if we rewrite take_over_console as a wrapper over
> > do_take_over_console, it is so trivial, delete it and let kernel
> > use the unified version of APIs will simplify the APIs.
> 
> Except now you're spreading the brokenness that is console_lock()
> over many more source files than the single-use case of
> do_take_over_console().

> The actual interface is take_over_console(); the _workaround_ is
> exposing do_take_over_console() for fbcon to wrap.

This _workaround_ willn't work, take_over_console will hold console_lock internal,
but do_take_over_console need caller hold console_lock, then we can't rewrite 
do_take_over_console as a wrap base on take_over_console. 

But the reverse is ok. So if we have to do it, then the actual interface 
is do_take_over_console, and the "_workaround_" is exposing take_over_console 
as a wrap base on do_take_over_console.
