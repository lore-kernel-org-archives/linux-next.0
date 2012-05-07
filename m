From: Tejun Heo <tj@kernel.org>
Subject: Re: inux-next: Tree for Apr 27 (uml + mm/memcontrol.c)
Date: Mon, 7 May 2012 10:08:40 -0700
Message-ID: <20120507170840.GA19417@google.com>
References: <20120427132343.fbb443b9.akpm@linux-foundation.org>
 <alpine.DEB.2.00.1204271420350.4631@chino.kir.corp.google.com>
 <20120427143646.8209627e.akpm@linux-foundation.org>
 <87fwbnag6u.fsf@skywalker.in.ibm.com>
 <alpine.DEB.2.00.1205030208120.21476@chino.kir.corp.google.com>
 <CABEgKgqWo=b=o7PwOLc=QqCWXQxUaYvMX99GP9cR_Y-RoTEW3g@mail.gmail.com>
 <alpine.DEB.2.00.1205031343300.1631@chino.kir.corp.google.com>
 <CABEgKgoNaWtoNN_DOH+KTg7VHYDxVCyekcUC3TBfA313TR0jCw@mail.gmail.com>
 <20120504172420.GF24639@google.com>
 <20120507140103.GA4251@tiehlicka.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:51987 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756571Ab2EGRIr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 May 2012 13:08:47 -0400
Content-Disposition: inline
In-Reply-To: <20120507140103.GA4251@tiehlicka.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Hocko <mhocko@suse.cz>
Cc: Hiroyuki Kamezawa <kamezawa.hiroyuki@gmail.com>, David Rientjes <rientjes@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Johannes Weiner <hannes@cmpxchg.org>

Hello,

On Mon, May 07, 2012 at 04:01:04PM +0200, Michal Hocko wrote:
> > If someone really has to add cgroup support to hugetlbfs, I'm more
> > inclined to say let them play in their own corner unless incorporating
> > it into memcg makes it inherently better.
> 
> I would agree with you but my impression from the previous (hugetlb)
> implementation was that it is much harder to implement the charge moving
> if we do not use page_cgroup.
> Also the range tracking is rather ugly and clumsy.

Understood.  I haven't looked at the code, so my opinion was based on
the assumption that the whole thing is completely separate (in design
and implementation) from memcg as hugtlbfs is from the usual mm.  If
it's better / easier implemented together with memcg, I have no
objection to making it part of memcg.

Thanks.

-- 
tejun
