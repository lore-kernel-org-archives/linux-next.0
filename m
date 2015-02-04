From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 05 Feb 2015 00:30:01 +0100
Message-ID: <1777022.KaV9ILjeny@vostro.rjw.lan>
References: <20150204193535.58f132c5@canb.auug.org.au> <1511573.AlfExlvQsO@vostro.rjw.lan> <CA+icZUXZz7jEN0EjHbM2vo+Vqg6iXnJrL625zuNhMNEk9FYPRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:53552 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755909AbbBDXHG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2015 18:07:06 -0500
In-Reply-To: <CA+icZUXZz7jEN0EjHbM2vo+Vqg6iXnJrL625zuNhMNEk9FYPRQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>

On Wednesday, February 04, 2015 11:46:32 PM Sedat Dilek wrote:
> On Wed, Feb 4, 2015 at 10:54 PM, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> > On Wednesday, February 04, 2015 09:18:03 PM Sedat Dilek wrote:
> >> On Wed, Feb 4, 2015 at 9:35 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >> > Hi all,
> >> >
> >> > The next release I will be making will be next-20150209 - which will
> >> > probably be after the v3.19 release.
> >> >
> >> > Changes since 20150203:
> >> >
> >> > The sound-asoc tree gained a conflict against the sound tree.
> >> >
> >> > The scsi tree gained a build failure caused by an interaction with the
> >> > driver-core tree.  I applied a merge fix patch.
> >> >
> >> > The akpm-current tree gained a build failure for which I disabled
> >> > CONFIG_KASAN.
> >> >
> >> > Non-merge commits (relative to Linus' tree): 7461
> >> >  7314 files changed, 309736 insertions(+), 172363 deletions(-)
> >> >
> >> > ----------------------------------------------------------------------------
> >> >
> >>
> >> [ CC linux-rcu | linux-pm | intel_pstate maintainers ]
> >
> > Dirk is not the maintainer of intel_pstate any more, CC: Kristen.
> >
> >> Hi,
> >>
> >> after suspend-and-resume I see the following call-trace:
> >
> > Do you see that after CPU1 offline too?
> >
> 
> NO.
> 
> After...
> 
> root# echo 0 > /sys/devices/system/cpu/cpu1/online
> 
> ...I see this:
> 
> +[  707.936668] PM: Saving platform NVS memory
> +[  707.936674] Disabling non-boot CPUs ...
> +[  707.936712] intel_pstate CPU 2 exiting
> +[  707.938024] smpboot: CPU 2 didn't die...
> +[  707.949128] intel_pstate CPU 3 exiting
> +[  707.950369] smpboot: CPU 3 didn't die...
> +[  707.966248] ACPI: Low-level resume complete
> +[  707.966302] PM: Restoring platform NVS memory
> 
> Full dmesg attached.

The dmesg doesn't match what you said above.

Anyway, that's not what I meant.  Does the CPU1 offlining alone:

# echo 0 > /sys/devices/system/cpu/cpu1/online

trigger the trace?  It should.


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
