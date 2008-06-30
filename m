From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the bkl-removal tree
Date: Mon, 30 Jun 2008 16:51:18 -0600
Message-ID: <20080630165118.743626f3@bike.lwn.net>
References: <20080630182122.99ea9f2e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vena.lwn.net ([206.168.112.25]:51712 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932988AbYF3WvT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 18:51:19 -0400
In-Reply-To: <20080630182122.99ea9f2e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Chuck Lever <chuck.lever@oracle.com>, Trond Myklebust <trond.myklebust@fys.uio.no>

Hi Trond, Chuck,

On Mon, 30 Jun 2008 18:21:22 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the bkl-removal tree got a trivial
> conflict in fs/nfs/file.c between commit
> 69cc426fc4b7664ec69642cd9b30eabe2ec8ad4a ("NFS: Make nfs_llseek
> methods consistent") from the nfs tree and commit
> a9f88f0c4fed5d1ed6fb4a0389891d327a147130 ("Remove BKL from
> remote_llseek v2") from the bkl-removal tree.
> 
> I fixed it up and can carry it.  Or maybe you should liaise with
> Trond to put ths nfs part of the BKL removal in his tree.

So how would you like to handle this one?  The patch from Andi which
conflicts with your tree can stand alone, but it affects a few files
outside of the NFS tree.  Even so, it looks like having you snarf it
and merge it there might be the easiest way to make the pieces fit
together.

Thanks,

jon
