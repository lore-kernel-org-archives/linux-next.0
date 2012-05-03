From: Hiroyuki Kamezawa <kamezawa.hiroyuki@gmail.com>
Subject: Re: inux-next: Tree for Apr 27 (uml + mm/memcontrol.c)
Date: Fri, 4 May 2012 08:17:11 +0900
Message-ID: <CABEgKgoNaWtoNN_DOH+KTg7VHYDxVCyekcUC3TBfA313TR0jCw@mail.gmail.com>
References: <20120427161146.95422142968526faaff615d4@canb.auug.org.au>
	<4F9ABF9C.2070707@xenotime.net>
	<alpine.DEB.2.00.1204271141040.28516@chino.kir.corp.google.com>
	<20120427132343.fbb443b9.akpm@linux-foundation.org>
	<alpine.DEB.2.00.1204271420350.4631@chino.kir.corp.google.com>
	<20120427143646.8209627e.akpm@linux-foundation.org>
	<87fwbnag6u.fsf@skywalker.in.ibm.com>
	<alpine.DEB.2.00.1205030208120.21476@chino.kir.corp.google.com>
	<CABEgKgqWo=b=o7PwOLc=QqCWXQxUaYvMX99GP9cR_Y-RoTEW3g@mail.gmail.com>
	<alpine.DEB.2.00.1205031343300.1631@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1205031343300.1631@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Rientjes <rientjes@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, May 4, 2012 at 5:56 AM, David Rientjes <rientjes@google.com> wr=
ote:
> On Thu, 3 May 2012, Hiroyuki Kamezawa wrote:
>
>> I think hugetlb should be handled under memcg.

>> 2. The characteristics of hugetlb usage you pointed out is
>> characteristics comes from
>> =A0 =A0"current" implementation.
>> =A0 =A0 Yes, it's now unreclaimable and should be allocated by hands=
 of
>> admin. But,
>> =A0 =A0 considering recent improvements, memory-defrag, CMA, it can =
be less
>> =A0 =A0 hard-to-use thing by updating implementation and on-demand a=
llocation
>> =A0 =A0 can be allowed.
>>
>
> You're describing transparent hugepages which are already supported b=
y
> memcg specifically because they are transparent.

THP just handles hugepages whose size is equal to pgd size. So, hugetlb
is something more than that, it has various sizes.

>=A0I haven't seen any
> proposals on how to change hugetlb when it comes to preallocation and
> mmaping the memory because it would break the API with userspace.
> Userspace packages like hugeadm are actually used in a wide variety o=
f
> places.
>

I just said if users doesn't need to set sysctl, it's more useful. I go=
t similar
claims from users with IPC max params ;) I answerd set it unlimited...


>> 3. If overhead is the problem, and it's better to disable memcg,
>> =A0 =A0 Please show numbers with HPC apps. I didn't think memcg has =
very
>> bad overhead
>> =A0 =A0 with Bull's presentation in collaboration summit, this April=
=2E
>>
>
> Is this a claim that memory-intensive workloads will have the exact s=
ame
> performance with and without memcg enabled?

I wrote that I don't get any report that memcg is too slow and need to =
be fixed.

I think, in general, once memory is allocated, application will run
faster if it never
free memory. So, good application frees memory in batch when it can do.=
 Because
memcg just adds overheads to memory allocation and unmapping, runtime o=
verhead
tend to be small.
My target number when I started to join memcg developments was 2-3% ove=
rheads.

> Even if there's the slightest performance degradation, these are what
> users of hugetlb are concerned with already. =A0They use hugetlb for
> performance and it would be a shame for it to regress because you hav=
e to
> enable memcg.
>

I think such people don't limit any usages....any kinds of
virtualization/resource controls has 0 overheads.

>> 4. I guess a user who uses hugetlbfs will use usual memory at the sa=
me time.
>> =A0 =A0 Having 2 hierarchy for memory and hugetlb will bring him a c=
onfusion.
>>
>
> Cgroups is moving to a single hierarchy for simplification, this isn'=
t the
> only example of where this is currently suboptimal and it would be
> disappointing to solidify hugetlb control as part of memcg because of=
 this
> current limitation that will be addressed by generic cgroups developm=
ent.
>
> Folks, once these things are merged they become an API that can't eas=
ily
> be shifted around and seperated out later. =A0The decision now is eit=
her to
> join hugetlb control with memcg forever when they act in very differe=
nt
> ways or to seperate them so they can be used and configured individua=
lly.

How do other guys think ? Tejun ?

Thanks,
-Kame
