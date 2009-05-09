From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: linux-next: manual merge of the vfs tree with the  tree
Date: Sat, 09 May 2009 18:58:23 +0200
Message-ID: <E1M2psV-0005bN-I0@pomaz-ex.szeredi.hu>
References: <20090508144457.c88fc3dc.sfr@canb.auug.org.au> <E1M2QJl-00035r-E2@pomaz-ex.szeredi.hu> <20090508175027.GC8633@ZenIV.linux.org.uk>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fxip-0047f.externet.hu ([88.209.222.127]:58072 "EHLO
	pomaz-ex.szeredi.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921AbZEIQ6l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 9 May 2009 12:58:41 -0400
In-reply-to: <20090508175027.GC8633@ZenIV.linux.org.uk> (message from Al Viro
	on Fri, 8 May 2009 18:50:27 +0100)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: viro@ZenIV.linux.org.uk
Cc: miklos@szeredi.hu, sfr@canb.auug.org.au, linux-next@vger.kernel.org, hch@lst.de, tj@kernel.org

On Fri, 8 May 2009, Al Viro wrote:
> > Al, would it make sense to merge the fuse tree into the vfs tree at
> > some point to fix the conflict permanently?
> 
> Hmm...  Doable, of course, but I really wonder if that's the right
> way to deal with this one.  The thing is, looking at the current VFS
> tree I see very few places where FUSE gets called with BKL (essentially,
> ->get_sb(), ->remount_fs()) and ->...ioctl()).  ->remount_fs() is absolutely
> locking-agnostic there and ->get_sb(), ->put_super() and ->umount_begin()
> are all serialized per superblock.  And for data structures that are
> not per-superblock FUSE doesn't rely on BKL in any of those, AFAICT.

That's correct.

> If you can ACK that, we could simply leave FUSE out of all the "push
> BKL down into get_sb/umount_begin/put_super/remount_fs" series.

Okay.

Thanks,
Miklos
