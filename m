From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: duplicate patches in the kspp and kbuild trees
Date: Tue, 26 Jul 2016 16:09:45 -0700
Message-ID: <CAGXu5jLX3Z5dR8Wgf__RC6mptaHsVsizU-st4CDX+3LNaX+o6A@mail.gmail.com>
References: <20160614094019.14fac372@canb.auug.org.au> <CAGXu5jLh7gXMcdU=F0qWc1S61YX-QmfQHpUfb+sxkQLUXu1Hqw@mail.gmail.com>
 <CAGXu5jJK25pMi1kG2vUfWkZkDBxCVeLUVs61a=m8qmHDTjPg9g@mail.gmail.com>
 <20160614143203.220d0722@canb.auug.org.au> <57600036.8040900@suse.cz>
 <20160615001311.13db4b92@canb.auug.org.au> <CAGXu5jJO1v0SKt58TPjW2P8ZibW+1=iCV9pmmnM4bvj1NoQRXg@mail.gmail.com>
 <5797E1EA.8070605@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:34969 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757997AbcGZXJs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Jul 2016 19:09:48 -0400
Received: by mail-wm0-f44.google.com with SMTP id f65so191672081wmi.0
        for <linux-next@vger.kernel.org>; Tue, 26 Jul 2016 16:09:48 -0700 (PDT)
In-Reply-To: <5797E1EA.8070605@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>

On Tue, Jul 26, 2016 at 3:19 PM, Michal Marek <mmarek@suse.cz> wrote:
> Dne 14.6.2016 v 18:39 Kees Cook napsal(a):
>> On Tue, Jun 14, 2016 at 7:13 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> Hi Michal,
>>>
>>> On Tue, 14 Jun 2016 15:01:42 +0200 Michal Marek <mmarek@suse.cz> wrote:
>>>>
>>>> I won't :). Kees, are you going to keep the patch in your tree and send
>>>> it to Linus once kbuild is in? Or shall I take it (which would
>>>> temporarily result in another duplication...).
>>>
>>> Or Kees could send you a pull request ...
>>
>> My head hurts. :) How about this: since a pull request would (I think)
>> end up pulling the other unrelated kspp patches, how about you take
>> the patch into kbuild, and once it's there, I'll just remove it from
>> my tree (since it's on top).
>
> Sorry, I forgot about this one. It's cherry-picked onto my kbuild branch
> now.

Okay, no worries. I've removed it from my tree and merged your
kbuild/for-next branch into my for-next/kspp branch.

Let me know once you've sent the kbuild/for-next pull request, and I
can follow it up with the the entropy plugin pull request.

Thanks!

-Kees

-- 
Kees Cook
Brillo & Chrome OS Security
