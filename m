From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: cpufreq tree build failure
Date: Tue, 24 Feb 2009 22:45:04 -0500
Message-ID: <20090225034504.GA25446@redhat.com>
References: <20090224172112.727b4043.sfr@canb.auug.org.au> <20090224165103.GA2998@redhat.com> <20090225142955.1104d5bc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:47902 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753752AbZBYDpb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Feb 2009 22:45:31 -0500
Content-Disposition: inline
In-Reply-To: <20090225142955.1104d5bc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Matthias-Christian Ott <ott@mirix.org>, Dominik Brodowski <linux@brodo.de>

On Wed, Feb 25, 2009 at 02:29:55PM +1100, Stephen Rothwell wrote:
 > Hi Dave,
 > 
 > On Tue, 24 Feb 2009 11:51:03 -0500 Dave Jones <davej@redhat.com> wrote:
 > >
 > > On Tue, Feb 24, 2009 at 05:21:12PM +1100, Stephen Rothwell wrote:
 > >  > 
 > >  > Today's linux-next build (x86_64 allmodconfig) failed like this:
 > >  > 
 > >  > ERROR: "recalibrate_cpu_khz" [arch/x86/kernel/cpu/cpufreq/p4-clockmod.ko] undefined!
 > >  > 
 > >  > Caused by commit f20b61aa18b99d91c2a08f8863409bb8002d87fb ("[CPUFREQ] p4-clockmod reports wrong frequency").
 > >  > 
 > >  > I have dropped the cpufreq tree for today.
 > >  
 > > Odd. I fixed that up, as I noticed it when I first merged the diff.
 > > 
 > > Can you check that your tree has this bit..
 > > 
 > > diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
 > > index 2bb6a83..4f5c247 100644
 > > --- a/arch/x86/include/asm/timer.h
 > > +++ b/arch/x86/include/asm/timer.h
 > > @@ -11,8 +11,8 @@ unsigned long native_calibrate_tsc(void);
 > >  
 > >  #ifdef CONFIG_X86_32
 > >  extern int timer_ack;
 > > +#endif
 > >  extern int recalibrate_cpu_khz(void);
 > > -#endif /* CONFIG_X86_32 */
 > 
 > It does have that bit.  It failed to build again today.

oh hell, the function itself is guarded by an ifdef too.
for speed, my checking scripts only do the equivalent of building p4-clockmod.o,
so I missed this.

 > > It's possible you cloned it just before I rebased it with that fix.
 > There were no updates when I fetched you tree today.
 > 
 > Note that the error points to a modular build problem.  Maybe as
 > (Matthias-Christian Ott pointed out) this should not even be being built
 > for x86_64?

There were a bunch of 64bit Xeons made that lacked P-states.
Though using p4-clockmod as a replacement isn't a good idea, but we should
still allow it for thermal protection.
Also some of the Atoms are 64bit capable, but also lack P-states.

I'll nix the ifdefs and regenerate the tree.

thanks

	Dave

-- 
http://www.codemonkey.org.uk
