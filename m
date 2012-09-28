From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: Tree for Sept 28 (ext4|vfs related issues?)
Date: Fri, 28 Sep 2012 13:38:20 -0400
Message-ID: <20120928173820.GA887@thunk.org>
References: <CA+icZUVcwAXBYjafnzARN-xkGKGsPC_2Yry-SscaZ_-js-sTiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from li9-11.members.linode.com ([67.18.176.11]:52877 "EHLO
	imap.thunk.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754952Ab2I1Ri3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 28 Sep 2012 13:38:29 -0400
Content-Disposition: inline
In-Reply-To: <CA+icZUVcwAXBYjafnzARN-xkGKGsPC_2Yry-SscaZ_-js-sTiw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Fri, Sep 28, 2012 at 01:22:45PM +0200, Sedat Dilek wrote:
> 
> After switching from SLUB to SLAB I could take finally a screenshot of
> a call-trace (sorry, it's 600KiB).
> It seems to be a problem of Ext4-FS or in combination with VFS (can't
> say as I am not an FS-expert).

This is strictly speaking an ext4 bug, and it's a known problem.  It
will be fixed in the next linux-next release; my apologies for letting
this slip through....

	   	       		     	     	       - Ted
