From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Sat, 23 Feb 2019 09:52:07 -0800
Message-ID: <20190223175207.GC4722@wrath>
References: <20190224011925.6db87446@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190224011925.6db87446@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Feb 24, 2019 at 01:19:25AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   9bfe33ba29d0 ("x86/CPU: Add Icelake model number")
> 
> is missing a Signed-off-by from its committer.
> 

Hi Stephen,

Apologies if I've asked you this before... I didn't find it after some
searching.

We should be catching errors like this before they hit next. First,
there is no reason we can't catch them - unlike the integration failures
only next can catch. Second, once they are in next, there is no "right"
way to fix them.  Either rebase or send the bad patch to mainline - both
are bad. Don't get me wrong, I'm glad next catches them.... but I'd like
to get to the point where it doesn't trigger on our subsystem :-)

Are your patch mechanics tests available for us to integrate into our
commit and prepublication checks?

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
