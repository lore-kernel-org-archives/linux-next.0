From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: manual merge of the f2fs tree with the ext4 tree
Date: Mon, 16 May 2016 15:22:41 -0700
Message-ID: <20160516222241.GA40269@jaegeuk.gateway>
References: <20160509093646.68d7cf57@canb.auug.org.au>
 <20160509171503.GA810@jaegeuk.gateway>
 <20160516213028.GO7799@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:41937 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750934AbcEPWWp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 May 2016 18:22:45 -0400
Content-Disposition: inline
In-Reply-To: <20160516213028.GO7799@thunk.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daeho Jeong <daeho.jeong@samsung.com>

On Mon, May 16, 2016 at 05:30:28PM -0400, Theodore Ts'o wrote:
> On Mon, May 09, 2016 at 10:15:03AM -0700, Jaegeuk Kim wrote:
> > Hi Stephen,
> > 
> > Thank you for the notice.
> > I've been waiting for a comment about the below patch targeted to v4.7 from Ted.
> > Meanwhile, I intended to prepare -next for that patch in advance.
> > Surely, once I get a sense that I need to consider v4.8, I'll drop this patch
> > for -next right away.
> 
> Yeah, I think it would be better for me to take the ext4 "migrate into
> vfs's crypto engine" patch, and at this point, for 4.8.

Fair enough.

> Sorry, I just ran out of time to try to verify that the patch wouldn't
> break anything, and given that we're going to need to wait for
> "fscrypto/f2fs: allow fs-specific key prefix for fs encryption" to go
> upstream.

Agreed. IIUC, let me push the fscrypto/f2fs patch to v4.7 first?

> Do you have any other planned changes for the fscrypto tree planned
> for 4.8.  If not, then perhaps it will be easier if I take the pen for
> any changes needed for fs/crypto, and moving forward, we probably need
> to find ways to make changes where commits specific for fs/crypto
> should be isolated from ext4 or f2fs changes, and as much as possible
> to be backwards compatible so that as we add new features to
> fs/crypto, we don't need to synchronize changes across multiple file
> systems.

I have no planned patch right now, and of course, it must have no problem for
you to treat with further patches.
Also, let me take a look at any missing part again, regarding to your concerns.

Thanks,
