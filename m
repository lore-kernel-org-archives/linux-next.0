From: Chris Ball <cjb@laptop.org>
Subject: Re: Add mmc tree to linux-next
Date: Sun, 12 Sep 2010 21:01:54 -0400
Message-ID: <m3vd6axxq5.fsf@pullcord.laptop.org>
References: <m38w392xx5.fsf@pullcord.laptop.org>
	<20100913103801.f37f445b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from void.printf.net ([89.145.121.20]:49957 "EHLO void.printf.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754065Ab0IMBAh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 12 Sep 2010 21:00:37 -0400
In-Reply-To: <20100913103801.f37f445b.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Mon, 13 Sep 2010 10:38:01 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Avi Kivity <avi@qumranet.com>, Marcelo Tosatti <mtosatti@redhat.com>

Hi Stephen,

> I have added this from today.  I note that there appears to be some
> (unrelated) kvm commits at the start of this tree ...

Thanks!  These are already in Linus' tree.  I'll rebase with a clean
history after today's -next is published.

> I don't have anything to do with test.kernel.org, sorry.  My build
> test results are reported here: http://kisskb.ellerman.id.au/linux-next

If anyone else on linux-next@ is interested in brainstorming around
setting up runtime testing of linux-next (and mainline in general)
on real hardware, feel free to reply.

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
