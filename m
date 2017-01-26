From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the akpm-current tree with the userns tree
Date: Thu, 26 Jan 2017 13:59:23 +1300
Message-ID: <871svqeivo.fsf@xmission.com>
References: <20170125160835.1b94db55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170125160835.1b94db55@canb.auug.org.au> (Stephen Rothwell's
        message of "Wed, 25 Jan 2017 16:08:35 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksa Sarai <asarai@suse.de>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   fs/proc/base.c
>
> between commit:
>
>   68eb94f16227 ("proc: Better ownership of files for non-dumpable tasks in user namespaces")
>
> from the userns tree and commit:
>
>   d15d29b5352f ("procfs: change the owner of non-dumpable and writeable files")
>
> from the akpm-current tree.
>
> I *think* that the former supercedes the latter?

Sort of.  After a long conversation it turns out what they are trying to
do is orthogonal.

The first (mine) is handling the case of non-dumpable tasks in user
namespaces.

The second by Aleksa Sarai is trying to trying to relax the permission
checks in proc so that non-dumpable is not as strict, to sort out some
runC issues where they are having challenges coding themselves into a
corner.  In the case of /proc/self I think there may be a case but in
general relaxing the permission checks in proc gives me the Heebie
Jeebies.

Andrew do you see merit in Aleksa's patch that I don't?  Otherwise can
you remove it from your tree?

> I fixed it up (I just used the former) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Stephen thank you for pointing this out.

Eric
