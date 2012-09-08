From: Christoph Lameter <cl@linux.com>
Subject: Re: ia64 dies in slab code on next-20120906
Date: Sat, 8 Sep 2012 22:27:33 +0000
Message-ID: <00000139a7febf60-4e052ab7-7e4c-442f-8c85-c13cfd189d7e-000000@email.amazonses.com>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com> <20120907112606.7d09e84c4782b748a95e1946@canb.auug.org.au> <00000139a722a761-bafedf19-81a0-4922-a522-a2bb0fbb951a-000000@email.amazonses.com>
 <CA+icZUVuC+70S_zDRpNyBNvr+83Nb3J6qyGWteTDxrkvG=BAsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a194-183.smtp-out.amazonses.com ([199.255.194.183]:22329 "EHLO
	a194-183.smtp-out.amazonses.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753375Ab2IHW1f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 8 Sep 2012 18:27:35 -0400
In-Reply-To: <CA+icZUVuC+70S_zDRpNyBNvr+83Nb3J6qyGWteTDxrkvG=BAsw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Tony Luck <tony.luck@intel.com>, linux-next@vger.kernel.org, Pekka Enberg <penberg@kernel.org>

On Sat, 8 Sep 2012, Sedat Dilek wrote:

> I have reported the breakage of Linux-Next (next-20120906)
> independently on AMD64 [1], but seem to be ignored in this thread.

Not on AMD64, so I did not see anything until Tony's post.

> Dis you test SLAB-only?
> Can you please test next time also with a SLUB config?

Tested all 3 allocators here before the release and I did not notice
anything wrong. AFAICT multiple other testers also saw no problem.

> The next day you removed "slab/common-for-cgroups" from slab/next, why?

I do not handle that tree.

> You knew that it was broken (before Tony reported IA64 boot problems)?
> On linux-mm/linux-next/LKML MLs I have not read any hints/reports
> before the one of Tony.

Tony's report was the first report that I got on this issue. There were 2
others issues for which I also submitted patches this week.

> Can you please inform people in time?

I usually post too early rather than too late. There was no delay on this
one either. Emails reflected my real time knowledge and fixes available.

> I know linux-next is highly experimental, but I use all my
> daily-builds on my system here.
> Not virtual machine - on real bare metal!

That is quite good. Thanks for your efforts.

> Feel free to add as it fixes the reported issue:
>
>      Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
>      Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

Thanks for testing. My daughter has been in the ICU since Thursday and I
had to guess that this was the right solution based on what I was able
to glean on from experiences of others with the issue. Never was able to
truly test the fix or even do a kernel build while the crisis was going
on here. She just was moved out of the ICU an hour ago so I will be
able to do more next week.
