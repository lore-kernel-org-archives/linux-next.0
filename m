From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: build failure after merge of the userns tree
Date: Fri, 08 Nov 2013 15:15:17 -0800
Message-ID: <87r4aqscxm.fsf@xmission.com>
References: <20131108180759.12dab53816900b1b58c1ea1b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out03.mta.xmission.com ([166.70.13.233]:46069 "EHLO
	out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757800Ab3KHXP3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Nov 2013 18:15:29 -0500
In-Reply-To: <20131108180759.12dab53816900b1b58c1ea1b@canb.auug.org.au>
	(Stephen Rothwell's message of "Fri, 8 Nov 2013 18:07:59 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> After merging the userns tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> fs/namespace.c: In function 'detach_mounts':
> fs/namespace.c:1340:2: error: implicit declaration of function 'br_write_lock' [-Werror=implicit-function-declaration]
>   br_write_lock(&vfsmount_lock);
>   ^
> fs/namespace.c:1340:17: error: 'vfsmount_lock' undeclared (first use in this function)
>   br_write_lock(&vfsmount_lock);
>                  ^
> fs/namespace.c:1340:17: note: each undeclared identifier is reported only once for each function it appears in
> fs/namespace.c:1345:2: error: implicit declaration of function 'br_write_unlock' [-Werror=implicit-function-declaration]
>   br_write_unlock(&vfsmount_lock);
>   ^
>
> Caused by the interaction between commit d7e58b8abc4f ("vfs: Add a
> function to lazily unmount all mounts from any dentry. v3") from the
> userns tree and commit 84550b9356af ("RCU'd vfsmounts") from the vfs tree.
>
> I don't know how to fix this up, so I have just dropped the userns tree
> for today.  I only dropped that tree because it was the latter of the two
> conflicting trees.

Yeah.  Al has somethng cooking where he renamed the lock.

It looks like this just needs the trivial change:
s/br_write_lock(&vfsmount_lock)/lock_mount_hash()/
s/br_write_unlock(&vfsmount_lock)/unlock_mount_hash()/

Certainly that is all it needed when I closely inspected an earlier
version of Al's changes.  He changed the name of the lock and I just
happen to be using it.  In this case I don't think any of the semantics
have changed.

Eric
