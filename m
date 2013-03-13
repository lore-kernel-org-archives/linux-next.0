From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] workqueue: missing idr_preload_end() in
 worker_pool_assign_id()
Date: Wed, 13 Mar 2013 10:57:45 -0700
Message-ID: <20130313175745.GA22267@htj.dyndns.org>
References: <1363197092-4832-1-git-send-email-artem.savkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-da0-f41.google.com ([209.85.210.41]:59555 "EHLO
	mail-da0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933043Ab3CMR5y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Mar 2013 13:57:54 -0400
Content-Disposition: inline
In-Reply-To: <1363197092-4832-1-git-send-email-artem.savkov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Savkov <artem.savkov@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, viakernel.org@htj.dyndns.org, linux-next@vger.kernel.org

(cc'ing Stephen and linux-next)

Hello, Artem.

On Wed, Mar 13, 2013 at 09:51:32PM +0400, Artem Savkov wrote:
> Added missing idr_preload_end() call in worker_pool_assign_id().
> Without it preemption stays disabled resulting in lots of "scheduling while
> atomic" BUGs during boot.
...
> Introduced in "workqueue: convert to idr_alloc()"

That patch doesn't use idr_preload().  It looks like the issue is
introduced during linux-next merge of wq/for-3.10 and idr patches in
-mm.  Stephen, can you please add idr_preload_end() to the merge
patch?

Once the idr patches land in Linus' tree, I'll resolve the conflict
from wq tree side.

Thanks.

-- 
tejun
