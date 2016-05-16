From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the f2fs tree with the ext4 tree
Date: Mon, 16 May 2016 19:55:39 -0400
Message-ID: <20160516235539.GR7799@thunk.org>
References: <20160509093646.68d7cf57@canb.auug.org.au>
 <20160509171503.GA810@jaegeuk.gateway>
 <20160516213028.GO7799@thunk.org>
 <20160516222241.GA40269@jaegeuk.gateway>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:60124 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750792AbcEPXzs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 May 2016 19:55:48 -0400
Content-Disposition: inline
In-Reply-To: <20160516222241.GA40269@jaegeuk.gateway>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daeho Jeong <daeho.jeong@samsung.com>

On Mon, May 16, 2016 at 03:22:41PM -0700, Jaegeuk Kim wrote:
> > Sorry, I just ran out of time to try to verify that the patch wouldn't
> > break anything, and given that we're going to need to wait for
> > "fscrypto/f2fs: allow fs-specific key prefix for fs encryption" to go
> > upstream.
> 
> Agreed. IIUC, let me push the fscrypto/f2fs patch to v4.7 first?

Right --- that's in linux-next already, right?  And currently it's a
combined fscrypto/f2fs patch, which is why I suspect letting it go
into v4.7 first makes sense.  I'll make sure the ext4 move to
fs/crypto will be one of the first development patches for 4.8 (modulo
any urgent bug fixes that need to go into 4.7 final first).

> I have no planned patch right now, and of course, it must have no problem for
> you to treat with further patches.
> Also, let me take a look at any missing part again, regarding to your concerns.

I'm sure there may be some missing pieces around using file system
level crypto for the desktop / server use case.  Some of them are in
how we handle removable thumb drives, for example.

There are definitely some missing pieces about how to handle removable
SD cards for Android, as well, including some kernel-side patches that
are currently living in the unstable portion of the ext4 patch queue.
We never got the design, implementation and kernel<->userspace API's
fully baked, so that's not going upstream any time soon, but all of
this means that we will need to figure out what's the best way to
develop, test, and push fs/crypto changes in the long term.  This may
mean a new git tree with shared maintenance, as one way that we could
do things.

       		       	       	       	     - Ted
