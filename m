From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: ia64 dies in slab code on next-20120906
Date: Mon, 10 Sep 2012 10:28:54 +0200
Message-ID: <CA+icZUWt3nLQ4tUmoHBkL59p+9peGkzjNeYubPpyUs7U_4ejXg@mail.gmail.com>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com>
	<20120907112606.7d09e84c4782b748a95e1946@canb.auug.org.au>
	<00000139a722a761-bafedf19-81a0-4922-a522-a2bb0fbb951a-000000@email.amazonses.com>
	<20120910132416.cf70afde92399a420b74bd32@canb.auug.org.au>
	<alpine.LFD.2.02.1209100958340.2979@tux.localdomain>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:41912 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751594Ab2IJI24 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Sep 2012 04:28:56 -0400
Received: by lbbgj3 with SMTP id gj3so1005783lbb.19
        for <linux-next@vger.kernel.org>; Mon, 10 Sep 2012 01:28:55 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.02.1209100958340.2979@tux.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Lameter <cl@linux.com>, Tony Luck <tony.luck@intel.com>, linux-next@vger.kernel.org, Hugh Dickins <hughd@google.com>

On Mon, Sep 10, 2012 at 8:59 AM, Pekka Enberg <penberg@kernel.org> wrote:
> On Mon, 10 Sep 2012, Stephen Rothwell wrote:
>
>> Hi Christoph,
>>
>> On Sat, 8 Sep 2012 18:27:10 +0000 Christoph Lameter <cl@linux.com> wrote:
>> >
>> > Thanks Tony for the additional information regarding the pointer. That got
>> > me thinking about something different.
>> >
>> > Try the following fix:
>> >
>> > Subject: slub: Zero initial memory segment for kmem_cache and kmem_cache_node
>> >
>> > Earlier patches in the common set moved the zeroing of the kmem_cache structure
>> > into common code. See "Move allocation of kmem_cache into common code".
>> >
>> > The allocation for the two special structures is still done
>> > from slub specific code but no zeroing is done since the cache creation functions
>> > used to zero. This now needs to be updated so that the structures
>> > are zeroed during allocation in kmem_cache_init().
>> > Otherwise random pointer values may be followed.
>> >
>> > Signed-off-by: Christoph Lameter <cl@linux.com>
>> >
>> > Index: linux/mm/slub.c
>> > ===================================================================
>> > --- linux.orig/mm/slub.c    2012-09-08 13:21:33.523056357 -0500
>> > +++ linux/mm/slub.c 2012-09-08 13:22:12.483056947 -0500
>> > @@ -3705,7 +3705,7 @@
>> >     /* Allocate two kmem_caches from the page allocator */
>> >     kmalloc_size = ALIGN(kmem_size, cache_line_size());
>> >     order = get_order(2 * kmalloc_size);
>> > -   kmem_cache = (void *)__get_free_pages(GFP_NOWAIT, order);
>> > +   kmem_cache = (void *)__get_free_pages(GFP_NOWAIT|__GFP_ZERO, order);
>> >
>> >     /*
>> >      * Must first have the slab cache available for the allocations of the
>> >
>>
>> I have added this as a merge fix patch to linux-next today in the
>> anticipation that it will be added to the slab tree ASAP.
>
> I've applied the patch. Thanks everyone!

Hi Pekka,

Thanks for pushing this.
So, I guess you will integrate "slab/common-for-cgroups" in
tommorrow's "slab/next".

I have pulled yesterday "slab/common-for-cgroups" into Linux-Next
(next-20120907) plus fix from Christoph to see if this works OK.
The double Tested-by is OK (one is enough :-)).

Yesterday, as being on systemd (which depends on cgroups) I took the
iniative to hack a bit with its further integration in Ubuntu/precise
[1].
As usually, try to see the positives happening :-)!

Regards,
- Sedat -

[1] https://wiki.ubuntu.com/systemd#Workarounds
