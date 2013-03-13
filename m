From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] workqueue: missing idr_preload_end() in worker_pool_assign_id()
Date: Wed, 13 Mar 2013 14:55:24 -0700
Message-ID: <CAOS58YOEF3USJYQqmBWE4kXxhti0awfbPdQntMvHSW4zy5k0dg@mail.gmail.com>
References: <1363197092-4832-1-git-send-email-artem.savkov@gmail.com>
	<20130313175745.GA22267@htj.dyndns.org>
	<20130314085136.13358830385003e4263ec1f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:62587 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932701Ab3CMVz0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Mar 2013 17:55:26 -0400
In-Reply-To: <20130314085136.13358830385003e4263ec1f4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Artem Savkov <artem.savkov@gmail.com>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, viakernel.org@htj.dyndns.org, linux-next@vger.kernel.org

Hello,

On Wed, Mar 13, 2013 at 2:51 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> That patch doesn't use idr_preload().  It looks like the issue is
>> introduced during linux-next merge of wq/for-3.10 and idr patches in
>> -mm.  Stephen, can you please add idr_preload_end() to the merge
>> patch?
>
> Oops, sorry about that.  I assume it needs to be added just after the
> spin_unlock_irq() but still inside the loop?

Yeap. Andrew already has the change, I think.

>> Once the idr patches land in Linus' tree, I'll resolve the conflict
>> from wq tree side.
>
> Or you could do what Linus prefers and just tell him how to resolve the
> conflict and thereby avoid a back merge or rebase (or provide him with a
> separate branch that does the back merge with resolution in addition to
> the unmerged branch to pull).

That part of code is gonna see more changes and I don't wanna build on
top of the deprecated interface, so the back-pull is actually
justified - wq tree actually wants the receive the particular change
to build on top.

Thanks.

-- 
tejun
