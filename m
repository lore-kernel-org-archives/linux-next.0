From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the vfs tree with the  tree
Date: Mon, 25 May 2009 00:07:47 +0200
Message-ID: <20090524220747.GA12433@lst.de>
References: <20090522112326.9eafa340.sfr@canb.auug.org.au> <20090524220336.GF6471@nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:58761 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758683AbZEXWIB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 May 2009 18:08:01 -0400
Content-Disposition: inline
In-Reply-To: <20090524220336.GF6471@nowhere>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On Mon, May 25, 2009 at 12:03:38AM +0200, Frederic Weisbecker wrote:
> > + 	if (s->s_dirt)
> > + 		reiserfs_write_super(s);
> 
> 
> 
> But this part seems to solve another conflict, right?
> I'm not sure about it.

Yes, different one.  Previously the VFS called ->write_super just before
->put_super.  Now any left over writeback needs to be dealt with by
the filesystem.  For now I have added a call to the write_super method
to all filesystems, but most likely this can be removed later after
an audit by someone who knows the filesystem.
