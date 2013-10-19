From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree
Date: Sat, 19 Oct 2013 16:47:08 -0700
Message-ID: <87k3h8escj.fsf@xmission.com>
References: <20131019121548.GX2443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131019121548.GX2443@sirena.org.uk> (Mark Brown's message of
	"Sat, 19 Oct 2013 13:15:48 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "Eric W. Biederman" <ebiederman@twitter.com>, Miklos Szeredi <mszeredi@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>, Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Mark Brown <broonie@kernel.org> writes:

> Today's linux-next merge of the userns tree got a conflict in
> fs/fuse/dir.c between 3c70b8eed (fuse: don't check_submounts_and_drop()
> in RCU walk) in the fuse tree and 40216baa0 (vfs: Lazily remove mounts
> on unlinked files and directories. v2) in the userns tree.
>
> I fixed it up as below and can carry as required:

The fix looks right.

However I think this conflict highlights a larger issue, as there are
several other filesystems that call check_submounts_and_drop from the
devalidate and possibly from rcu_walk today.

Miklos what problem did you run into?

Sigh.  It looks like it probably makes sense to merge
shrink_submounts_and_drop with d_invalidate, so filesystems don't even
need to think about this issue.

Eric

> diff --cc fs/fuse/dir.c
> index 0747f6e,b1cd7b7..0000000
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@@ -263,9 -259,7 +263,10 @@@ out
>   
>   invalid:
>   	ret = 0;
>  -	shrink_submounts_and_drop(entry);
>  +
> - 	if (!(flags & LOOKUP_RCU) && check_submounts_and_drop(entry) != 0)
> - 		ret = 1;
> ++	if (!(flags & LOOKUP_RCU))
> ++		shrink_submounts_and_drop(entry);
> ++
>   	goto out;
>   }
>   
