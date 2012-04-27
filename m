From: David Rientjes <rientjes@google.com>
Subject: Re: inux-next: Tree for Apr 27 (uml + mm/memcontrol.c)
Date: Fri, 27 Apr 2012 16:52:39 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1204271649180.12255@chino.kir.corp.google.com>
References: <20120427161146.95422142968526faaff615d4@canb.auug.org.au> <4F9ABF9C.2070707@xenotime.net> <alpine.DEB.2.00.1204271141040.28516@chino.kir.corp.google.com> <20120427132343.fbb443b9.akpm@linux-foundation.org> <alpine.DEB.2.00.1204271420350.4631@chino.kir.corp.google.com>
 <20120427143646.8209627e.akpm@linux-foundation.org> <alpine.DEB.2.00.1204271611500.10429@chino.kir.corp.google.com> <20120427162459.322d145a.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44922 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757790Ab2D0Xwm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Apr 2012 19:52:42 -0400
Received: by iadi9 with SMTP id i9so1654567iad.19
        for <linux-next@vger.kernel.org>; Fri, 27 Apr 2012 16:52:42 -0700 (PDT)
In-Reply-To: <20120427162459.322d145a.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

On Fri, 27 Apr 2012, Andrew Morton wrote:

> > > Minor matter: that's non-responsive to my suggestion.
> > > 
> > 
> > If it's moved to a new cgroup then we can just go back to the original 
> > point that I made as was trying to avoid: adding #ifdefs all over 
> > mm/memcontrol.c in a dozen or so places.  A mm/hugetlbcg.c would only be 
> > built, natually, when we have "depends on HUGETLB_PAGE" and 
> > linux/hugetlb.h takes care of the rest (setting HUGE_MAX_HSTATE for archs 
> > that don't define it themselves, in other words only one hugepage size).
> 
> And if it isn't moved to a new cgroup then your
> memcg-add-hugetlb-extension-fix.patch is suboptimal.  Why is this so
> hard?
> 

It _should_ be moved to a new cgroup: there's no reason why someone should 
need to enable memcg (and incur ~1% of metadata overhead that comes with 
it) if they just want to seperate a global hugepage pool amongst a set of 
tasks.  Perhaps Aneesh has a reasoning behind this, I dunno.

And yes, memcg-add-hugetlb-extension-fix.patch is a build fix for the 
linux-next breakage.  If it's seperated out to mm/hugetlbcg.c, this is all 
irrelevant.  I'd like to determine the direction of this feature before 
proposing any fixes for build breakage.  In other words, if 
memcg-add-hugetlb-extension.patch is rewritten then 
memcg-add-hugetlb-extension-fix.patch is useless.
