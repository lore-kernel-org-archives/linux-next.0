From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: duplicate patches in the kspp and kbuild trees
Date: Wed, 27 Jul 2016 00:19:22 +0200
Message-ID: <5797E1EA.8070605@suse.cz>
References: <20160614094019.14fac372@canb.auug.org.au>
 <CAGXu5jLh7gXMcdU=F0qWc1S61YX-QmfQHpUfb+sxkQLUXu1Hqw@mail.gmail.com>
 <CAGXu5jJK25pMi1kG2vUfWkZkDBxCVeLUVs61a=m8qmHDTjPg9g@mail.gmail.com>
 <20160614143203.220d0722@canb.auug.org.au> <57600036.8040900@suse.cz>
 <20160615001311.13db4b92@canb.auug.org.au>
 <CAGXu5jJO1v0SKt58TPjW2P8ZibW+1=iCV9pmmnM4bvj1NoQRXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52860 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756073AbcGZWTe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Jul 2016 18:19:34 -0400
In-Reply-To: <CAGXu5jJO1v0SKt58TPjW2P8ZibW+1=iCV9pmmnM4bvj1NoQRXg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>

Dne 14.6.2016 v 18:39 Kees Cook napsal(a):
> On Tue, Jun 14, 2016 at 7:13 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Michal,
>>
>> On Tue, 14 Jun 2016 15:01:42 +0200 Michal Marek <mmarek@suse.cz> wrote:
>>>
>>> I won't :). Kees, are you going to keep the patch in your tree and send
>>> it to Linus once kbuild is in? Or shall I take it (which would
>>> temporarily result in another duplication...).
>>
>> Or Kees could send you a pull request ...
> 
> My head hurts. :) How about this: since a pull request would (I think)
> end up pulling the other unrelated kspp patches, how about you take
> the patch into kbuild, and once it's there, I'll just remove it from
> my tree (since it's on top).

Sorry, I forgot about this one. It's cherry-picked onto my kbuild branch
now.

Michal
