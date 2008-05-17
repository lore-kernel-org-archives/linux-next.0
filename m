From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Fwd: Re: [PATCH] kprobes: fix compilation break due to kprobe_mutex
Date: Sat, 17 May 2008 12:42:45 +0100
Message-ID: <20080517114244.GB30141@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:49992 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751635AbYEQLnF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 17 May 2008 07:43:05 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

FYI.

Presumably this hasn't been detected because linux-next isn't building
enough ARM configurations to hit one that has kprobes enabled?

----- Forwarded message from Abhishek Sagar <sagar.abhishek@gmail.com> -----

Delivery-date: Sat, 17 May 2008 12:30:06 +0100
Date: Sat, 17 May 2008 16:59:53 +0530
From: "Abhishek Sagar" <sagar.abhishek@gmail.com>
To: "Russell King - ARM Linux" <linux@arm.linux.org.uk>
Subject: Re: [PATCH] kprobes: fix compilation break due to kprobe_mutex
Cc: linux-arm-kernel@lists.arm.linux.org.uk, nico@cam.org, 
	mathieu.desnoyers@polymtl.ca

On 5/17/08, Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> The commit you refer to does not exist in mainline.

Yea, sorry. That commit is an upstream bubble in some unrelated branch
I was tracking.

Now that I look at it, the commit I'm referring to is in
git://git.kernel.org/pub/scm/linux/kernel/git/x86/linux-2.6-x86.git :
auto-sched-next. I merged all the recent kprobe related changes from
there into my local arm kprobes branch based on 2.6.26-rc2 and fired a
build for arm. That's when I encountered the kprobe build error.

> In addition, the URL you refer to above, the patch doesn't
> match the  diffstat - the patch doesn't touch kernel/kprobes.c.

Here's the updated version (series), with a proper diffstat:
http://lkml.org/lkml/2008/4/24/217

> The only thing the patch seems to be doing is removing the
> mutex.  It never adds anything.

Yes and this cleanup of kprobe_mutex usage from all the arch dependent
kprobe code needs to be done for arm too, else it'll break
compilation.

Regards,
Abhishek Sagar

----- End forwarded message -----
