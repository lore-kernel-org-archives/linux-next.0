From: Thomas Renninger <trenn@suse.de>
Subject: Re: linux-next: cpufreq tree build failure
Date: Thu, 5 Feb 2009 21:57:44 +0100
Message-ID: <200902052157.45344.trenn@suse.de>
References: <20090205185420.38214a06.sfr@canb.auug.org.au> <200902051047.56609.trenn@suse.de> <20090205174536.GA6358@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns2.suse.de ([195.135.220.15]:54730 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751584AbZBEU5l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 15:57:41 -0500
In-Reply-To: <20090205174536.GA6358@redhat.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Thursday 05 February 2009 06:45:36 pm Dave Jones wrote:
> On Thu, Feb 05, 2009 at 10:47:56AM +0100, Thomas Renninger wrote:
>  > On Thursday 05 February 2009 08:54:20 Stephen Rothwell wrote:
>  > > Hi Dave,
>  > >
>  > > Today's linux-next build (powerpc allyesconfig) failed like this:
>  > >
>  > > drivers/cpufreq/cpufreq_conservative.o: In function
>  > > `minimum_sampling_rate': (.opd+0x30): multiple definition of
>  > > `minimum_sampling_rate'
>  > > drivers/cpufreq/cpufreq_ondemand.o:(.opd+0x18): first defined here
>  > > drivers/cpufreq/cpufreq_conservative.o: In function
>  > > `minimum_sampling_rate': drivers/cpufreq/cpufreq_conservative.c:64:
>  > > multiple definition of
>  >
>  > `.minimum_sampling_rate'
>  >
>  > > drivers/cpufreq/cpufreq_ondemand.o:drivers/cpufreq/cpufreq_ondemand.c:
>  > >62:
>  >
>  > first defined here
>  >
>  > > Caused by commit f935195b8a341d7ffdf600dd98a657f2f09b7908 ("[CPUFREQ]
>  > > ondemand/conservative: sanitize sampling_rate restrictions").
>  > >
>  > > I have reverted that commit for today.
>  >
>  > Dave, I have found another minor issue and will send you three patches.
>  > Two cleanups and the third fixing this one as on top patch.
>  >
>  > Decide yourself what way is best to add things (revert and re-add or
>  > just add the three I post).
>  > The problem of the on top approach could be that if this is merged
>  > to linux next you could have a non-building condition if you compile in
>
> I added the 'static's directly to the patches, and regenerated the tree
> on kernel.org
> For other stuff, unless it's a build-fix, send an incremental diff ?
Yes, will do so.
But if possible, I'd like to wait for Ingo's
printk_once function popping up in linux-next.
How frequently are linux-next patches pulled back into the cpufreq tree?
Anyway, I am going to look at your tree in a week or two and send
something then. It's only about a cleaned up message in broken BIOS case,
that should not hurt in linux-next for a while.

Thank you both,

    Thomas
