From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: build failure after merge of the nfs tree
Date: Thu, 7 Jan 2016 19:15:47 -0500
Message-ID: <CAABAsM4Q4QEJ+609WjYAqER+r9+3BdOoTYfnvEri5p3123oYwg@mail.gmail.com>
References: <20160108111427.0b435d4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:35795 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753256AbcAHAPs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jan 2016 19:15:48 -0500
In-Reply-To: <20160108111427.0b435d4d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Coddington <bcodding@redhat.com>

Hi Stephen,

On Thu, Jan 7, 2016 at 7:14 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Trond,
>
> After merging the nfs tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> write.c:(.text+0xa60): multiple definition of `nfs_wait_atomic_killable'
> fs/nfs/inode.o:inode.c:(.text+0x20a4): first defined here
>
> Caused by commit
>
>   fa5cca9f3334 ("NFS: Use wait_on_atomic_t() for unlock after readahead")
>
> I have used the nfs tree from next-20160107 for today.
>

I just finished fixing that up. :-) Apologies for not catching it
earlier. It was an integration issue in my own tree.

Cheers
  Trond
