From: "NeilBrown" <neilb@suse.de>
Subject: Re: linux-next: manual merge of the md tree with the  tree
Date: Tue, 10 Mar 2009 17:40:20 +1100 (EST)
Message-ID: <ad338337833c61261ca27f348033e83d.squirrel@neil.brown.name>
References: <20090310163302.874a669c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38875 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751992AbZCJGk2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2009 02:40:28 -0400
In-Reply-To: <20090310163302.874a669c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Johannes Weiner <jw@emlix.com>, Dan Williams <dan.j.williams@intel.com>

On Tue, March 10, 2009 4:33 pm, Stephen Rothwell wrote:
> Hi Neil,
>
> Today's linux-next merge of the md tree got a conflict in
> include/linux/dmaengine.h between commit
> 1d93e52eb48df986a3c4d5ad8a520bf1f6837367 ("dmaengine: update kerneldoc")
> from Linus' tree and commit a23742cb3c1ca5d412dea09de452c9d173b80afd
> ("async_tx: add support for asynchronous GF multiplication") from the md
> tree.
>
> I fixed it up (see below) and can carry the fix for a while.

Thanks.
I've resolved this i my tree so you don't need to carry the fix any
further.
I suspect Dan will give an updates set of async-raid6 patches some time
in the next few days....

NeilBrown
