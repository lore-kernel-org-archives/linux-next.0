From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: manual merge of the akpm-current tree with the ext3
 tree
Date: Tue, 27 Feb 2018 10:36:15 +0100
Message-ID: <20180227093615.rjdlert2bd5smurb@quack2.suse.cz>
References: <20180227141153.417a520e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180227141153.417a520e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shakeel Butt <shakeelb@google.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen!

On Tue 27-02-18 14:11:53, Stephen Rothwell wrote:
> Today's linux-next merge of the akpm-current tree got conflicts in:
> 
>   fs/notify/fanotify/fanotify.c
>   fs/notify/fanotify/fanotify.h
>   fs/notify/fanotify/fanotify_user.c
>   fs/notify/inotify/inotify_fsnotify.c
> 
> between commits:
> 
>   1e301852d657 ("fanotify: Avoid lost events due to ENOMEM for unlimited queues")
>   b900420e4109 ("fsnotify: Let userspace know about lost events due to ENOMEM")
> 
> from the ext3 tree and commit:
> 
>   d519ceef2ad6 ("fs: fsnotify: account fsnotify metadata to kmemcg")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below - I simplified the obvious resolution a bit) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Thanks for the conflict resolution. It looks good!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
