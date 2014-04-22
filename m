From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the vfs tree with Linus' and te ext4
 trees
Date: Mon, 21 Apr 2014 21:19:19 -0400
Message-ID: <20140422011918.GA9441@thunk.org>
References: <20140422110459.ab3af554dd61297c61a568c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:52674 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751236AbaDVBTW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Apr 2014 21:19:22 -0400
Content-Disposition: inline
In-Reply-To: <20140422110459.ab3af554dd61297c61a568c2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 22, 2014 at 11:04:59AM +1000, Stephen Rothwell wrote:
> 
> Today's linux-next merge of the vfs tree got a conflict in
> fs/ext4/extents.c between rebased versions of commits from Linus' and the
> ext4 trees and the same commits from the vfs tree.
> 
> I fixed it up (I just used the version from Linus' and the ext4 trees)
> and can carry the fix as necessary (no action is required).
> 
> Al, this is why I asked you about checking with Ted about his tree being
> rebased after you merged it into yours ...

Sorry, Al, I hadn't been aware you wanted to carrying some of these
changes.  I had mentioned that I was planning on carrying them in the
ext4 tree and including them for 3.15 because some of them were fixing
bugs that had been introduced in the merge window.  Since no one
objected, I thought everyone was on the same page about that plan.

	    	    	     	    - Ted
