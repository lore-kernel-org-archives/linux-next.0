From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: duplicate patches in the kspp and kbuild trees
Date: Wed, 27 Jul 2016 09:52:16 +0200
Message-ID: <57986830.50709@suse.cz>
References: <20160614094019.14fac372@canb.auug.org.au>
 <CAGXu5jLh7gXMcdU=F0qWc1S61YX-QmfQHpUfb+sxkQLUXu1Hqw@mail.gmail.com>
 <CAGXu5jJK25pMi1kG2vUfWkZkDBxCVeLUVs61a=m8qmHDTjPg9g@mail.gmail.com>
 <20160614143203.220d0722@canb.auug.org.au> <57600036.8040900@suse.cz>
 <20160615001311.13db4b92@canb.auug.org.au>
 <CAGXu5jJO1v0SKt58TPjW2P8ZibW+1=iCV9pmmnM4bvj1NoQRXg@mail.gmail.com>
 <5797E1EA.8070605@suse.cz>
 <CAGXu5jLX3Z5dR8Wgf__RC6mptaHsVsizU-st4CDX+3LNaX+o6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36479 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751339AbcG0HwT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jul 2016 03:52:19 -0400
In-Reply-To: <CAGXu5jLX3Z5dR8Wgf__RC6mptaHsVsizU-st4CDX+3LNaX+o6A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>

On 2016-07-27 01:09, Kees Cook wrote:
> On Tue, Jul 26, 2016 at 3:19 PM, Michal Marek <mmarek@suse.cz> wrote:
>> Dne 14.6.2016 v 18:39 Kees Cook napsal(a):
>>> On Tue, Jun 14, 2016 at 7:13 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>> Hi Michal,
>>>>
>>>> On Tue, 14 Jun 2016 15:01:42 +0200 Michal Marek <mmarek@suse.cz> wrote:
>>>>>
>>>>> I won't :). Kees, are you going to keep the patch in your tree and send
>>>>> it to Linus once kbuild is in? Or shall I take it (which would
>>>>> temporarily result in another duplication...).
>>>>
>>>> Or Kees could send you a pull request ...
>>>
>>> My head hurts. :) How about this: since a pull request would (I think)
>>> end up pulling the other unrelated kspp patches, how about you take
>>> the patch into kbuild, and once it's there, I'll just remove it from
>>> my tree (since it's on top).
>>
>> Sorry, I forgot about this one. It's cherry-picked onto my kbuild branch
>> now.
> 
> Okay, no worries. I've removed it from my tree and merged your
> kbuild/for-next branch into my for-next/kspp branch.
> 
> Let me know once you've sent the kbuild/for-next pull request, and I
> can follow it up with the the entropy plugin pull request.

I actually send the individual branches of kbuild.git: "kbuild",
"kconfig" and "misc". for-next is just a convenience for linux-next
integration.

Michal
