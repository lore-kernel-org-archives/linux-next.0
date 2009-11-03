From: Eric Paris <eparis@redhat.com>
Subject: Re: [-next regression] lockdep? tracing? BUG: unable to handle
 kernel paging request at
Date: Tue, 03 Nov 2009 12:00:17 -0500
Message-ID: <1257267617.2891.107.camel@dhcp231-106.rdu.redhat.com>
References: <1257263296.2891.97.camel@dhcp231-106.rdu.redhat.com>
	 <1257264170.26028.3340.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45906 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752413AbZKCRA3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Nov 2009 12:00:29 -0500
In-Reply-To: <1257264170.26028.3340.camel@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rostedt@goodmis.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, zhaolei@cn.fujitsu.com, mingo@elte.hu, lizf@cn.fujitsu.com, Peter Zijlstra <a.p.zijlstra@chello.nl>

On Tue, 2009-11-03 at 11:02 -0500, Steven Rostedt wrote:
> [ Added Peter Zijlstra ]
> 
> On Tue, 2009-11-03 at 10:48 -0500, Eric Paris wrote:
> > Linux-next from Oct 30 did not have this problem.  Linux next from
> > yesterday (and today) I always hit this on boot.
> 
> Could you also give the SHA1 of Linux-next, as well as the config you
> used.

False alarm, apparently this is due to a patch that I added.  Odd part
is, I don't touch anything even remotely close to this section of code.
I'm at a bit of a lose, but apply my patch, boom, revert, works.

I'll figure it out eventually I guess.

-Eric
