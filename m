From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: Tree for May 31
Date: Thu, 01 Jun 2017 17:03:33 +1000
Message-ID: <87wp8w2nqy.fsf@concordia.ellerman.id.au>
References: <20170531153227.7098f0a1@canb.auug.org.au> <8737bk44w8.fsf@concordia.ellerman.id.au> <20170601161315.6ec8e08e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58587 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751047AbdFAHDf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Jun 2017 03:03:35 -0400
In-Reply-To: <20170601161315.6ec8e08e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Michael,
>
> On Thu, 01 Jun 2017 16:07:51 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> 
>> > Changes since 20170530:
>> >
>> > Non-merge commits (relative to Linus' tree): 3325
>> >  3598 files changed, 135000 insertions(+), 72065 deletions(-)  
>> 
>> More or less all my powerpc boxes failed to boot this.
>
> Good timing :-)  How about the linux-next I just released.  It has had
> a few of the mm changes removed since yesterday.

Yep, the offending patch seems to have been dropped.

cheers
