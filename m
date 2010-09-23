From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the slab tree
Date: Thu, 23 Sep 2010 11:46:34 +0200
Message-ID: <4C9B21FA.4050504@kernel.org>
References: <20100923134414.7aa7f696.sfr@canb.auug.org.au> <AANLkTim=uZuC1gt6qL7+KMdgnnx4e4Hh2Zs=SdjJXv5W@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:59929 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752092Ab0IWJsA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Sep 2010 05:48:00 -0400
In-Reply-To: <AANLkTim=uZuC1gt6qL7+KMdgnnx4e4Hh2Zs=SdjJXv5W@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>

On 09/23/2010 11:33 AM, Pekka Enberg wrote:
> On Thu, Sep 23, 2010 at 6:44 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Today's linux-next merge of the tip tree got a conflict in
>> include/linux/percpu.h between commit
>> 6fc80ef491b981f59233beaf6aeaccc0c947031d ("percpu: use percpu allocator
>> on UP too") from the slab tree and commit
>> 8b8e2ec1eeca7f6941bc81cefc9663018d6ceb57 ("percpu: Add {get,put}
>> _cpu_ptr") from the tip tree.
>>
>> Just context changes.  I fixed it up (see below) and can carry the fix as
>> necessary.
> 
> Why are we seeing a merge conflict here? I cherry-picked patches from
> Tejun's for-next branch but didn't modify them.

That's a different one coming from the perf tree.  get_cpu_ptr() is
only used by perf at this point so it got routed through there, so the
conflict.  Nothing to worry about.

Thanks.

-- 
tejun
