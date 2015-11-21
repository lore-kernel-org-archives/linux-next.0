From: Andi Kleen <ak@linux.intel.com>
Subject: Re: linux-next: clean up the kbuild tree?
Date: Fri, 20 Nov 2015 17:00:33 -0800
Message-ID: <20151121010033.GB8438@tassilo.jf.intel.com>
References: <20151115112705.0bf4f0ed@canb.auug.org.au>
 <20151115175848.GD10150@tassilo.jf.intel.com>
 <5649D3B9.7020701@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:64447 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759759AbbKUBAd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Nov 2015 20:00:33 -0500
Content-Disposition: inline
In-Reply-To: <5649D3B9.7020701@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Sorry for the delay.

On Mon, Nov 16, 2015 at 02:01:45PM +0100, Michal Marek wrote:
> Dne 15.11.2015 v 18:58 Andi Kleen napsal(a):
> > On Sun, Nov 15, 2015 at 11:27:05AM +1100, Stephen Rothwell wrote:
> >> Hi Michal,
> >>
> >> I notice that the kbuild tree (relative to Linus' tree) only contains
> >> lots of merges and these 2 commits from April 2014:
> > 
> > Really should get in that patch officially. I have a variety of users.
> > And it clearly has been tested long enough in linux-next :)
> > Michal, enough to just repost it?
> 
> So the commit in kbuild.git tree is identical to what is being tested
> out of tree? Could you nevertheless provide an updated changelog? One

Yes. I'll provide a new ChangeLog. 

> (and actually only) of Linus' objections was that it was not clear at
> all what the actual benefits for the kernel itself are. Do you have some
> benchmarks perhaps, where LTO achieves a preformance gain? 

The main users use it to shrink the kernel. I'll run some new benchmarks.

> Also, did the
> compile time impact change with gcc 5.x?

5.x is better than 4.x but it's still a slower. It's also not incremential.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only
