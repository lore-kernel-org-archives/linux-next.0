From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: inux-next: Tree for Apr 27 (uml + mm/memcontrol.c)
Date: Thu, 03 May 2012 19:24:00 +0530
Message-ID: <87ehr1xtdz.fsf@skywalker.in.ibm.com>
References: <20120427161146.95422142968526faaff615d4@canb.auug.org.au> <4F9ABF9C.2070707@xenotime.net> <alpine.DEB.2.00.1204271141040.28516@chino.kir.corp.google.com> <20120427132343.fbb443b9.akpm@linux-foundation.org> <alpine.DEB.2.00.1204271420350.4631@chino.kir.corp.google.com> <20120427143646.8209627e.akpm@linux-foundation.org> <87fwbnag6u.fsf@skywalker.in.ibm.com> <alpine.DEB.2.00.1205030208120.21476@chino.kir.corp.google.com>User-Agent: Notmuch/0.11.1+346~g13d19c3 (http://notmuchmail.org) Emacs/23.3.1 (x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:43773 "EHLO
	e28smtp04.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753775Ab2ECNyL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 May 2012 09:54:11 -0400
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Thu, 3 May 2012 19:24:08 +0530
In-Reply-To: <alpine.DEB.2.00.1205030208120.21476@chino.kir.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

David Rientjes <rientjes@google.com> writes:

>> My first version was to do it as a seperate controller 
>> 
>> http://thread.gmane.org/gmane.linux.kernel.mm/73826
>> 
>> But the feedback I received was to do it as a part of memcg extension,
>> because what the controller is limiting is memory albeit a different
>> type. AFAIU there is also this goal of avoiding controller proliferation.
>> 
>
> Maybe Kame can speak up if he feels strongly about this, but I really 
> think it should be its own controller in its own file (which would 
> obviously make this discussion irrelevant since mm/hugetlbcg.c would be 
> dependent on your own config symbol).  I don't feel like this is the same 
> as kmem since its not a global resource like hugetlb pages are.

> Hugetlb pages can either be allocated statically on the command line at 
> boot or dynamically via sysfs and they are globally available to whoever 
> mmaps them through hugetlbfs.  I see a real benefit from being able to 
> limit the number of hugepages in the global pool to a set of tasks so they 
> can't overuse what has been statically or dynamically allocated.  And that 
> ability should be available, in my opinion, without having to enable 
> memcg, the page_cgroup metadata overhead that comes along with it, and the 
> performance impact in using it.  I also think it would be wise to seperate 
> it out into its own file at the source level so things like this don't 
> arise in the future.

All the use cases I came across requested for limiting both memory
and hugetlb pages. They want to limit the usage of both. So for the use case
I am looking at memcg will already be enabled.

-aneesh
