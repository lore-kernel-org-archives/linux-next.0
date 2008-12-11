From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: linux-next: manual merge of the nommu tree
Date: Thu, 11 Dec 2008 16:42:49 +0900
Message-ID: <20081211074248.GA11314@linux-sh.org>
References: <20081211182530.924d4af6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mta23.gyao.ne.jp ([125.63.38.249]:13008 "EHLO mx.gate01.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751811AbYLKHos (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 02:44:48 -0500
Content-Disposition: inline
In-Reply-To: <20081211182530.924d4af6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org, Christoph Lameter <cl@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>

On Thu, Dec 11, 2008 at 06:25:30PM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the nommu tree got a conflict in
> Documentation/sysctl/vm.txt between commit
> cb8fc7a88a0069ebdab220180bf9b45e568f0ba9 ("slub: Trigger defragmentation
> from memory reclaim") from the slab tree and commit
> 1a5d96d0151ce2ec77bf08498751fe8d9365c95f ("NOMMU: Make mmap allocation
> page trimming behaviour configurable.") from the nommu tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix as necessary.

I suppose this is what happens when everyone has the same bright idea of
appending to the end of the file. Though I am surprised that there was
contention in Documentation/ of all places. Thanks for fixing this up.
