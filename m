From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the xen-two tree
Date: Sat, 16 Feb 2013 21:11:12 +0100
Message-ID: <11850955.SHqxVBsJqI@vostro.rjw.lan>
References: <20130215154551.d11e9d376d30d32b9673e6cc@canb.auug.org.au> <2185970.g9YrD945My@vostro.rjw.lan> <20130216015200.1e58bec1aff05592ac2ae98f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hydra.sisk.pl ([212.160.235.94]:38733 "EHLO hydra.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754188Ab3BPUEm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 16 Feb 2013 15:04:42 -0500
In-Reply-To: <20130216015200.1e58bec1aff05592ac2ae98f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Liu Jinsong <jinsong.liu@intel.com>

On Saturday, February 16, 2013 01:52:00 AM Stephen Rothwell wrote:
> Hi Rafael,

Hi,

> On Fri, 15 Feb 2013 15:53:34 +0100 "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
> >
> > On Saturday, February 16, 2013 12:50:14 AM Stephen Rothwell wrote:
> > > 
> > > On Fri, 15 Feb 2013 08:26:24 -0500 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com> wrote:
> > > >
> > > > Thank you. I keep on forgetting - but would it be OK for me to take this
> > > > patch in my tree? Or should I not since this is a new functionality that
> > > > Rafael is going to introduce in v3.9?
> > > 
> > > It is an API change in the pm tree that is not yet in Linus' tree.
> > > 
> > > > And if so, perhaps I should tack it on in my tree, once Rafael does a git
> > > > pull to Linus? Or just point Linus to this git commit?
> > > 
> > > You should point Linus at this patch if the pm tree is merged first, or
> > > Rafael should do the same if the reverse happens.
> > 
> > Alternatively, Konrad can pull the acpi-scan branch containing the changes
> > in question from my tree into his tree and rebase the new material on top
> > of that.
> 
> Or pull the acpi-scan branch into his tree and use my conflict resolution
> in the resulting merge thus requiring no rebasing.  However, Linus likes
> to see such interactions, so it can be left up to when the latter of the
> two tress is merged by Linus.

Well, I'm afraid this won't be sufficient this time, because of this commit in
my tree (which is not on the acpi-scan branch):

commit 3757b94802fb65d8f696597a74053cf21738da0b
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Date:   Wed Feb 13 14:36:47 2013 +0100

    ACPI / hotplug: Fix concurrency issues and memory leaks

after which acpi_bus_scan() and acpi_bus_trim() have to be run under
acpi_scan_lock (new in my tree as well).

Moreover, I think that the introduction of ACPI-based CPU hotplug into Xen
and this point would be premature, because we need to rework the original
ACPI-based CPU hotplug and quite frankly it shouldn't call acpi_bus_scan()
directly at all.

Konrad?

Thanks,
Rafael

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
