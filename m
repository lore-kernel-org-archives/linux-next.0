From: Greg KH <gregkh@suse.de>
Subject: Re: Problem with tty changes in linux-next
Date: Tue, 6 Jul 2010 08:14:54 -0700
Message-ID: <20100706151454.GB12444@suse.de>
References: <20100706130403.GD3991@pengutronix.de>
 <201007061623.48363.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41278 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752131Ab0GFPQA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jul 2010 11:16:00 -0400
Content-Disposition: inline
In-Reply-To: <201007061623.48363.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Luotao Fu <l.fu@pengutronix.de>, Alan Cox <alan@linux.intel.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Frederic Weisbecker <fweisbec@gmail.com>

On Tue, Jul 06, 2010 at 04:23:48PM +0200, Arnd Bergmann wrote:
> > 2. A more serious problem is that printing kernel message no more works
> > after running into userspace.
> > ....
> > Freeing init memory: 100K
> > 3sy||_|_|
> > phyCORE login:
> > ....
> > The boot message between init and login sheel is printed only
> > partly. The cursor jumps back and forward. It seems that part the
> > special characters like new line etc. are cutted away so that the
> > printout is shown in such a funny manner. After a tty is spawned, every
> > thing works just well. I can log in onto the system and it seems to work
> > so far. I bisected the kernel and identified eventually
> > fb11bee14186af87ee6abb833cf1a2a6be59c65b as the
> > first bad commit. The actual problem should be, however,
> > 36c621d82b956ff6ff72273f848af53e6c581aba, where tty_port_block_til_ready()
> > is introduced. Seems to me that there are locking problems. I
> > unfortunately don't have any insights of tty layer to tell where the
> > exact problem is.
> 
> I'm sorry you had to bisect this. I did the same bisect and already
> submitted a patch for this, which probably got stuck in Greg's inbox
> while he was preparing the stable releases. I can't find the patch
> in the archives now, which could also mean that it never left my local
> machine.
> 
> I have the patch on a different machine, but will resend it to Greg
> when I get there to make sure it doesn't get lost.

It's in my todo queue, sorry, I spent last week on the 5 stable kernel
releases, I should get to this today and push it into the next
linux-next release.

thanks,

greg k-h
