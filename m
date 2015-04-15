From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/2] Tentative fix for the divide-by-zero on
 score/paris/..
Date: Wed, 15 Apr 2015 14:32:52 -0700
Message-ID: <20150415213252.GA16054@roeck-us.net>
References: <20150414165000.GA19434@roeck-us.net>
 <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
 <552E6722.1080507@roeck-us.net>
 <20150415211956.GA6703@chrystal.uk.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150415211956.GA6703@chrystal.uk.oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 15, 2015 at 11:19:56PM +0200, Quentin Casasnovas wrote:
> On Wed, Apr 15, 2015 at 06:26:58AM -0700, Guenter Roeck wrote:
> > On 04/15/2015 01:54 AM, Quentin Casasnovas wrote:
> > > The following two patches might (hopefully) fix the build breakage on score
> > > and some other architectures.  I've checked the new __ex_table checker
> > > still works on x86-64 with them (it still detects an entry pointing to
> > > .altinstr_rplacement) and they should apply cleanly on top of Rusty's
> > > module-next branch.
> > >
> > > Thanks to Guenter for the bug analysis and sorry again for the breakage.
> > >
> > > Let me know if this makes things better..
> > >
> > 
> > the crash is fixed, but now I get
> > 
> > FATAL: The relocation at __ex_table+0x4 references
> > section "" which is not executable, IOW
> > the kernel will fault if it ever tries to
> > jump to it.  Something is seriously wrong
> > and should be fixed.
> > 
> > for parisc:defconfig,
> > 
> > FATAL: The relocation at __ex_table+0x634 references
> > section "__ex_table" which is not executable, IOW
> > the kernel will fault if it ever tries to
> > jump to it.  Something is seriously wrong
> > and should be fixed.
> > 
> > for score:allnoconfig, and
> > 
> > FATAL: The relocation at __ex_table+0x8 references
> > section "" which is not executable, IOW
> > it is not possible for the kernel to fault
> > at that address.  Something is seriously wrong
> > and should be fixed.
> > 
> > for mn10300:defconfig.
> > 
> > While I agree that those should get fixed (if they are real problems,
> > especially the ones for parisc and mn10300), I don't think it is
> > a good idea to fail the build because of it.
> > 
> > Note that I did find the problem in the score build; that was a real bug.
> > I don't know what may be wrong with the others.
> > 
> 
> The attached patch fixes the build failures on parisc and mn10300 on my
> defconfig build and should apply cleanly on top of the previous two.
> 
Hi Quentin,

I'll try to test the patch tonight.

> I'm not able to download the score cross toolchain for the moment but will
> do tomorrow. Guenter, may I ask if there were any other problems than the
> one you fixed in string.S there?
> 
No, that was the only problem. Let me know if you can find a score toolchain -
otherwise I'll make a copy of mine available.

Thanks,
Guenter
