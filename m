From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Wed, 1 Apr 2015 09:08:06 +0100
Message-ID: <20150401080806.GY24899@n2100.arm.linux.org.uk>
References: <20150401000221.21961ecd@canb.auug.org.au>
 <20150331161640.GA16540@roeck-us.net>
 <20150331230749.GA6564@kroah.com>
 <551B5540.60606@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:56289 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750848AbbDAIIZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2015 04:08:25 -0400
Content-Disposition: inline
In-Reply-To: <551B5540.60606@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Mack <daniel@zonque.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>

On Tue, Mar 31, 2015 at 07:17:36PM -0700, Guenter Roeck wrote:
> On 03/31/2015 04:07 PM, Greg Kroah-Hartman wrote:
> >You need 3.17 kernel headers to have memfd_create, not much the kdbus
> >test code can do about that.  You might want to update the kernel
> >headers for these build boxes.
> >
> 
> Seems there are brand-new requirements for kernel builds. The toolchain determines
> the headers used, not the native kernel (which, FWIW, is 3.19). You might want
> to document somewhere that "allmodconfig" and possibly "allyesconfig" now only
> builds if the toolchain is based on 3.17+ kernel headers.
> 
> I think I'll just drop those allmodconfig builds instead, or find a means to drop
> the samples/kdbus builds. Sorry, my time is limited. Building toolchains costs a
> lot of time, which I simply don't have. Keep in mind that I am doing all this on
> my own spare time. You are putting a lot of burden on people doing test builds.

You _can_ avoid it by seeding those configurations.  You place the
options you want to force to a specific value in a file, and then
do:

make allmodconfig KCONFIG_ALLCONFIG=seed-config-file

So, to turn off samples:

CONFIG_SAMPLES=n

in seed-config-file.  Hence, you can still do an allmodconfig build but
without building the samples subdir.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
