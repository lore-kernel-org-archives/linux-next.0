From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: sfi tree build failure
Date: Tue, 07 Jul 2009 00:01:13 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.0907062348130.32467@localhost.localdomain>
References: <20090630171937.75f64662.sfr@canb.auug.org.au>
 <20090706161432.111a42ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173019pub.verizon.net ([206.46.173.19]:54327 "EHLO
	vms173019pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750728AbZGGEBs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2009 00:01:48 -0400
In-reply-to: <20090706161432.111a42ee.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: sfi-devel@simplefirmware.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


> On Tue, 30 Jun 2009 17:19:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > In file included from include/acpi/platform/acenv.h:141,
> >                  from include/acpi/acpi.h:56,
> >                  from include/linux/acpi.h:38,
> >                  from init/main.c:27:
> > include/acpi/platform/aclinux.h:64:22: error: asm/acpi.h: No such file or directory
...
> > I have dropped the sfi tree for today.
> 
> And the sfi tree has still not made it into linux-next as the above error
> still exists.

Sorry about breaking the PPC build, Stephen.

I screwed up in my hack attempt to support CONFIG_SFI=y && CONFIG_ACPI=n.

Let me know if you have any trouble with the latest SFI test tree.

thanks,
-Len
