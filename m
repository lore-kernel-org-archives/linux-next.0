From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 27 Feb 2017 08:28:47 +0000
Message-ID: <30439.1488184127@warthog.procyon.org.uk>
References: <20170227111057.5691f927@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170227111057.5691f927@canb.auug.org.au>
Content-ID: <30438.1488184127.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the vfs tree got a conflict in:
> 
>   fs/proc/base.c
> 
> between commit:
> 
>   68eb94f16227 ("proc: Better ownership of files for non-dumpable tasks in user namespaces")
> 
> from Linus' tree and commit:
> 
>   caffc373c573 ("statx: Add a system call to make enhanced file info available")
> 
> from the vfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc fs/proc/base.c
> index b8f06273353e,b5a5d3cab358..000000000000
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@@ -1724,11 -1711,13 +1724,12 @@@ out_unlock
>   	return NULL;
>   }
>   
> - int pid_getattr(struct vfsmount *mnt, struct dentry *dentry, struct kstat *stat)
> + int pid_getattr(const struct path *path, struct kstat *stat,
> + 		u32 request_mask, unsigned int query_flags)
>   {
> - 	struct inode *inode = d_inode(dentry);
> + 	struct inode *inode = d_inode(path->dentry);
>   	struct task_struct *task;
> - 	struct pid_namespace *pid = dentry->d_sb->s_fs_info;
>  -	const struct cred *cred;
> + 	struct pid_namespace *pid = path->dentry->d_sb->s_fs_info;
>   
>   	generic_fillattr(inode, stat);
>   

Reviewed-by: David Howells <dhowells@redhat.com>
