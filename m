From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rdma tree
Date: Sat, 2 Sep 2017 09:42:54 -0700
Message-ID: <CA+55aFwhpVdMcNCVQfORYNxE=tknC=AUoTCsDasO-YdiJYYx7w@mail.gmail.com>
References: <20170901075046.557e345c@canb.auug.org.au> <78c70af4-21d0-94f2-6a2d-a832f24d23f4@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:36783 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752702AbdIBQm4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 2 Sep 2017 12:42:56 -0400
In-Reply-To: <78c70af4-21d0-94f2-6a2d-a832f24d23f4@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Kaike Wan <kaike.wan@intel.com>, Dennis Dalessandro <dennis.dalessandro@intel.com>, John Fleck <john.fleck@intel.com>

On Fri, Sep 1, 2017 at 5:06 AM, Doug Ledford <dledford@redhat.com> wrote:
> On 8/31/2017 5:50 PM, Stephen Rothwell wrote:
>> Hi Doug,
>>
>> Commit
>>
>>   4b9796b0a6fb ("IB/hfi1: Use accessor to determine ring size")
>>
>> is missing a Signed-off-by from its author.
>>
>
> What's the best way to fix this?  I can rebase, but I know Linus hates
> that.  What about git note?

We don't end up using (or forwarding) git notes, so that won't help.

Generally, the answer to missing sign-offs is "don't do that again" if
it's not something major and there isn't a _pattern_ of it happening.

In this case, it's a one-liner patch from a developer who has lots of
other sign-offs, from a company that is very aware of his work and the
GPL, and an active contributor. so it's not like it has any legal
implications.

If it was some big important patch from a more questionable source,
and we'd be worried about covering the legal side, it would be a
different issue. As it is, it falls under "mistakes happen, not a big
deal, try to avoid it in the future".

If it *was* a bigger issue and you really want to make sure that the
chain is there for new contributors etc, rebasing to fix sign-offs
ends up being the best (still bad) solution.

                      Linus
