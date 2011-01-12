From: Len Brown <lenb@kernel.org>
Subject: Re: on builds/randconfigs (was: [PATCH -next] thermal: depends on NET)
Date: Wed, 12 Jan 2011 16:58:26 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1101121654000.19754@x980>
References: <20101213163607.0b0a7c3a.sfr@canb.auug.org.au>
 <alpine.LFD.2.02.1101121257580.18873@x980>
 <20110112131800.d64c1a86.akpm@linux-foundation.org>
 <201101122224.54330.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173019pub.verizon.net ([206.46.173.19]:62299 "EHLO
	vms173019pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756510Ab1ALV6q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Jan 2011 16:58:46 -0500
In-reply-to: <201101122224.54330.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <randy.dunlap@oracle.com>, linux-acpi@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Zhang Rui <rui.zhang@intel.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Zimny Lech <napohybelskurwysynom2010@gmail.com>

> > These unusable config combinations should be prevented via Kconfig. 
> > That prevents users from selecting them, which otherwise adds to
> > our workload and to theirs.  It also prevents false-positives
> > during our useful randconfig testing.
> 
> But it is kind of difficult to achieve IMhO.  For example, there are options
> that are only SELECTed if something else is set, but randconfig doesn't seem
> to care.

Kconfig select needs to be fixed so that it is not possible to
select something if that something's dependencies are not met.

This long standing issue is independent of randconfig,
but Randy can probably attest that a measurable portion
of the randconfig failures are due to this bug.

-Len Brown, Intel Open Source Technology Center
