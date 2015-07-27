From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Crash in -next due to 'MIPS: Move FP usage checks into
 protected_{save, restore}_fp_context'
Date: Mon, 27 Jul 2015 11:17:47 -0700
Message-ID: <20150727181747.GA20077@roeck-us.net>
References: <20150715160918.GA27653@roeck-us.net>
 <20150727150652.GA1756@roeck-us.net>
 <20150727172142.GE7289@NP-P-BURTON>
 <20150727174622.GA10708@roeck-us.net>
 <20150727180442.GG7289@NP-P-BURTON>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39083 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891AbbG0SRu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2015 14:17:50 -0400
Content-Disposition: inline
In-Reply-To: <20150727180442.GG7289@NP-P-BURTON>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-next@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org

On Mon, Jul 27, 2015 at 11:04:42AM -0700, Paul Burton wrote:
> On Mon, Jul 27, 2015 at 10:46:22AM -0700, Guenter Roeck wrote:
> > On Mon, Jul 27, 2015 at 10:21:42AM -0700, Paul Burton wrote:
> > > On Mon, Jul 27, 2015 at 08:06:52AM -0700, Guenter Roeck wrote:
> > > > On Wed, Jul 15, 2015 at 09:09:18AM -0700, Guenter Roeck wrote:
> > > > > Hi,
> > > > > 
> > > > > my qemu test for mipsel crashes with next-20150715 as follows.
> > > > > 
> > > > ping ... problem is still seen as of next-20150727.
> > > 
> > > Hi Guenter,
> > > 
> > > Apologies for the delay. Could you share your affected kernel
> > > configuration & which userland you're running?
> > > 
> > > I've just tested with a malta_defconfig kernel & a buildroot based
> > > initramfs without problems, and things are also fine on my physical
> > > MIPSr6 setups. If you have any directions with which I can reproduce
> > > this problem that would be great.
> > > 
> > This is with qemu in little endian mode. Big endian works fine.
> 
> Yup, I was using little endian in both cases. malta_defconfig is little
> endian - sadly use of the el suffix is pretty inconsistent...
> 
Interesting.

> > The configuration, the script to build and run the kernel, 
> > and the root file system used are are available at
> > https://github.com/groeck/linux-build-test, in directory
> > rootfs/mipsel/. The log for the latest build failure is in
> > http://server.roeck-us.net:8010/builders/qemu-mipsel-next/builds/194/steps/qemubuildcommand/logs/stdio.
> 
> Thanks for the pointers, I'm able to reproduce it using your config and
> initramfs, and I'll dig into what's going on here.
> 
Let me know what you find. Maybe something is wrong with my configuration
or initramfs, but it is odd that I didn't see the problem earlier.

Unfortunately I don't recall where I got the configuration from.
Guess I should keep notes :-(.

Thanks,
Guenter
