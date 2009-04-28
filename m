From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: linux-next: voltage tree build failure
Date: Tue, 28 Apr 2009 12:08:37 +0100
Message-ID: <1240916917.14165.117.camel@vega.slimlogic.co.uk>
References: <20090428162444.f7ee93f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from slimlogic.co.uk ([89.16.172.20]:34774 "EHLO slimlogic.co.uk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755556AbZD1LfD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Apr 2009 07:35:03 -0400
In-Reply-To: <20090428162444.f7ee93f3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Rapoport <mike@compulab.co.il>

On Tue, 2009-04-28 at 16:24 +1000, Stephen Rothwell wrote:
> Hi Liam,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/regulator/userspace-consumer.c:43: error: conflicting types for 'show_state'
> include/linux/sched.h:273: note: previous definition of 'show_state' was here
> 
> Caused by commit 5defa2bce704ca4151cfe24e4297aa7797cafd22 ("regulator:
> add userspace-consumer driver") which I have reverted for today.

Sorry about this. I've now fixed in voltage next by renaming with a reg_
prefix. Fwiw - I did test build for ARM and all was OK yesterday. I
guess I need to build allyesconfig too.

Thanks

Liam 
