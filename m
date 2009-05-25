From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: manual merge of the vfs tree with the  tree
Date: Mon, 25 May 2009 19:10:56 +0200
Message-ID: <20090525171055.GA7879@nowhere>
References: <20090522112326.9eafa340.sfr@canb.auug.org.au> <20090524220336.GF6471@nowhere> <20090524220747.GA12433@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f176.google.com ([209.85.219.176]:44127 "EHLO
	mail-ew0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751681AbZEYRK7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2009 13:10:59 -0400
Content-Disposition: inline
In-Reply-To: <20090524220747.GA12433@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 25, 2009 at 12:07:47AM +0200, Christoph Hellwig wrote:
> On Mon, May 25, 2009 at 12:03:38AM +0200, Frederic Weisbecker wrote:
> > > + 	if (s->s_dirt)
> > > + 		reiserfs_write_super(s);
> > 
> > 
> > 
> > But this part seems to solve another conflict, right?
> > I'm not sure about it.
> 
> Yes, different one.  Previously the VFS called ->write_super just before
> ->put_super.  Now any left over writeback needs to be dealt with by
> the filesystem.  For now I have added a call to the write_super method
> to all filesystems, but most likely this can be removed later after
> an audit by someone who knows the filesystem.
>

Ok. Thanks for the clarification. So Stephen's fix seems to be
correct.

Thanks.
