From: Theodore Tso <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the ext4 tree with Linus tree
Date: Thu, 17 Sep 2009 09:22:43 -0400
Message-ID: <20090917132243.GB24438@mit.edu>
References: <20090917115653.2e3b6b49.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from thunk.org ([69.25.196.29]:37675 "EHLO thunker.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751447AbZIQNWp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Sep 2009 09:22:45 -0400
Content-Disposition: inline
In-Reply-To: <20090917115653.2e3b6b49.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>

On Thu, Sep 17, 2009 at 11:56:53AM +1000, Stephen Rothwell wrote:
> Hi Theodore,
> 
> Today's linux-next merge of the ext4 tree got a conflict in
> include/trace/events/ext4.h between commit
> 1fe06ad89255c211fe100d7f690d10b161398df8 ("writeback: get rid of
> wbc->for_writepages") from Linus tree and commits
> b3107b75b479ff8f0a8aba9cdb38ec13284ce7eb ("ext4: Fix spelling typo in the
> trace format for trace_ext4_da_writepages()") from the ext4 tree.
> 
> I fixed it up (see below) and can carry the fix for a while.

Thanks, this is in a patch series which I'm preparing to push to
Linus, so I've fixed it up on my end.

						- Ted
