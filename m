From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Mon, 16 May 2016 23:16:31 -0400
Message-ID: <20160517031631.GT7799@thunk.org>
References: <20160517102355.4be4af45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:60856 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750792AbcEQDQl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 May 2016 23:16:41 -0400
Content-Disposition: inline
In-Reply-To: <20160517102355.4be4af45@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>

On Tue, May 17, 2016 at 10:23:55AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs tree got conflicts in:
> 
>   fs/ext4/ext4.h
>   fs/ext4/indirect.c
>   fs/ext4/inode.c
> 
> between commit:
> 
>   914f82a32d02 ("ext4: refactor direct IO code")
> 
> from the ext4 tree and commit:
> 
>   c8b8e32d700f ("direct-io: eliminate the offset argument to ->direct_IO")
> 
> from the vfs tree.
> 
> I fixed it up (hopefully - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.

Thanks for the heads up.  My merge resolution was backwards from yours
(because I merged the ext4 tree into vfs tree while you apparently did
the reverse), and this resolution was complex enough that I'm waiting
for you to publish next-20160517 to make sure you came up with the
same final result of fs/ext4/inode.c (minus the f2fs's ext4 crypto
merge, which I think Jaeguk is going to be dropping from his tree, but
I don't know if that will have happened by next-20160517).

I'm kicking off a set of tests to make sure there aren't problems with
the resulting merge going beyond the purely syntactic merge
resolution.

Cheers,

							- Ted
