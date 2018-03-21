From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with the fuse tree
Date: Wed, 21 Mar 2018 09:02:06 -0500
Message-ID: <87zi31y1b5.fsf@xmission.com>
References: <20180321172658.45b892a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321172658.45b892a3@canb.auug.org.au> (Stephen Rothwell's
        message of "Wed, 21 Mar 2018 17:26:58 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the userns tree got a conflict in:
>
>   fs/fuse/dev.c
>
> between commits:
>
>   dbf107b2a7f3 ("fuse: Remove the buggy retranslation of pids in fuse_dev_do_read")
>   c9582eb0ff7d ("fuse: Fail all requests with invalid uids or gids")
>   8cb08329b080 ("fuse: Support fuse filesystems outside of init_user_ns")
>
> from the fuse tree and commits:
>
>   dbf107b2a7f3 ("fuse: Remove the buggy retranslation of pids in fuse_dev_do_read")
>   c9582eb0ff7d ("fuse: Fail all requests with invalid uids or gids")
>   8cb08329b080 ("fuse: Support fuse filesystems outside of init_user_ns")
>
> from the userns tree.
>
> These commits seem to have been rebased in the fuse tree on top of
>
>   3b7008b226f3 ("fuse: return -ECONNABORTED on /dev/fuse read after abort")
>
> and modified a bit.
>
> I fixed it up (I used the fuse tree version, but please come to
> some arrangement about which is correct) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

As Miklos has merged these I plan to drop these changes from my tree.

Eric
