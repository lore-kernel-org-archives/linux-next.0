From: Hiroyuki Kamezawa <kamezawa.hiroyuki@gmail.com>
Subject: Re: inux-next: Tree for Apr 27 (uml + mm/memcontrol.c)
Date: Thu, 3 May 2012 19:30:37 +0900
Message-ID: <CABEgKgqWo=b=o7PwOLc=QqCWXQxUaYvMX99GP9cR_Y-RoTEW3g@mail.gmail.com>
References: <20120427161146.95422142968526faaff615d4@canb.auug.org.au>
	<4F9ABF9C.2070707@xenotime.net>
	<alpine.DEB.2.00.1204271141040.28516@chino.kir.corp.google.com>
	<20120427132343.fbb443b9.akpm@linux-foundation.org>
	<alpine.DEB.2.00.1204271420350.4631@chino.kir.corp.google.com>
	<20120427143646.8209627e.akpm@linux-foundation.org>
	<87fwbnag6u.fsf@skywalker.in.ibm.com>
	<alpine.DEB.2.00.1205030208120.21476@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:38408 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752801Ab2ECKai convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 May 2012 06:30:38 -0400
In-Reply-To: <alpine.DEB.2.00.1205030208120.21476@chino.kir.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

On Thu, May 3, 2012 at 6:13 PM, David Rientjes <rientjes@google.com> wr=
ote:
> On Sat, 28 Apr 2012, Aneesh Kumar K.V wrote:
>
>> My first version was to do it as a seperate controller
>>
>> http://thread.gmane.org/gmane.linux.kernel.mm/73826
>>
>> But the feedback I received was to do it as a part of memcg extensio=
n,
>> because what the controller is limiting is memory albeit a different
>> type. AFAIU there is also this goal of avoiding controller prolifera=
tion.
>>
>
> Maybe Kame can speak up if he feels strongly about this, but I really
> think it should be its own controller in its own file (which would
> obviously make this discussion irrelevant since mm/hugetlbcg.c would =
be
> dependent on your own config symbol). =A0I don't feel like this is th=
e same
> as kmem since its not a global resource like hugetlb pages are.
>
> Hugetlb pages can either be allocated statically on the command line =
at
> boot or dynamically via sysfs and they are globally available to whoe=
ver
> mmaps them through hugetlbfs. =A0I see a real benefit from being able=
 to
> limit the number of hugepages in the global pool to a set of tasks so=
 they
> can't overuse what has been statically or dynamically allocated. =A0A=
nd that
> ability should be available, in my opinion, without having to enable
> memcg, the page_cgroup metadata overhead that comes along with it, an=
d the
> performance impact in using it. =A0I also think it would be wise to s=
eperate
> it out into its own file at the source level so things like this don'=
t
> arise in the future.
>
> What do you think? =A0Kame?

I think hugetlb should be handled under memcg.

1. I think Hugetlb is memory.

2. The characteristics of hugetlb usage you pointed out is
characteristics comes from
   "current" implementation.
    Yes, it's now unreclaimable and should be allocated by hands of
admin. But,
    considering recent improvements, memory-defrag, CMA, it can be less
    hard-to-use thing by updating implementation and on-demand allocati=
on
    can be allowed.

3. If overhead is the problem, and it's better to disable memcg,
    Please show numbers with HPC apps. I didn't think memcg has very
bad overhead
    with Bull's presentation in collaboration summit, this April.

4. I guess a user who uses hugetlbfs will use usual memory at the same =
time.
    Having 2 hierarchy for memory and hugetlb will bring him a confusio=
n.

Thanks,
-Kame
