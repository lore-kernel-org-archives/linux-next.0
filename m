From: Ilya Dryomov <idryomov@gmail.com>
Subject: Re: Problem with tty changes in linux-next
Date: Tue, 6 Jul 2010 17:40:52 +0300
Message-ID: <20100706144052.GB8569@kwango>
References: <20100706130403.GD3991@pengutronix.de> <201007061623.48363.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:60499 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753067Ab0GFPGd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Jul 2010 11:06:33 -0400
Content-Disposition: inline
In-Reply-To: <201007061623.48363.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Luotao Fu <l.fu@pengutronix.de>, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Frederic Weisbecker <fweisbec@gmail.com>

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

I had the same issue. Here is the patch:

https://patchwork.kernel.org/patch/108700/

Thanks,

		Ilya

> 
> 	Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
