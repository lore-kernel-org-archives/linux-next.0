From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: inux-next: Tree for Apr 27 (uml + mm/memcontrol.c)
Date: Fri, 27 Apr 2012 16:24:59 -0700
Message-ID: <20120427162459.322d145a.akpm@linux-foundation.org>
References: <20120427161146.95422142968526faaff615d4@canb.auug.org.au>
	<4F9ABF9C.2070707@xenotime.net>
	<alpine.DEB.2.00.1204271141040.28516@chino.kir.corp.google.com>
	<20120427132343.fbb443b9.akpm@linux-foundation.org>
	<alpine.DEB.2.00.1204271420350.4631@chino.kir.corp.google.com>
	<20120427143646.8209627e.akpm@linux-foundation.org>
	<alpine.DEB.2.00.1204271611500.10429@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:58805 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756069Ab2D0XZB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Apr 2012 19:25:01 -0400
In-Reply-To: <alpine.DEB.2.00.1204271611500.10429@chino.kir.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

On Fri, 27 Apr 2012 16:14:52 -0700 (PDT)
David Rientjes <rientjes@google.com> wrote:

> > Minor matter: that's non-responsive to my suggestion.
> > 
> 
> If it's moved to a new cgroup then we can just go back to the original 
> point that I made as was trying to avoid: adding #ifdefs all over 
> mm/memcontrol.c in a dozen or so places.  A mm/hugetlbcg.c would only be 
> built, natually, when we have "depends on HUGETLB_PAGE" and 
> linux/hugetlb.h takes care of the rest (setting HUGE_MAX_HSTATE for archs 
> that don't define it themselves, in other words only one hugepage size).

And if it isn't moved to a new cgroup then your
memcg-add-hugetlb-extension-fix.patch is suboptimal.  Why is this so
hard?
