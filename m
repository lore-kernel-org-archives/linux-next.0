From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Tue, 10 Jul 2018 16:04:55 +0100
Message-ID: <20180710150455.GK30522@ZenIV.linux.org.uk>
References: <20180710101736.32d6cc6c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180710101736.32d6cc6c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 10, 2018 at 10:17:36AM +1000, Stephen Rothwell wrote:
> --- a/fs/open.c
> +++ b/fs/open.c
> @@@ -731,7 -732,6 +721,7 @@@ static int do_dentry_open(struct file *
>   	static const struct file_operations empty_fops = {};
>   	int error;
>   
> - 	WARN_ON(f->f_mode & ~FMODE_NOACCOUNT);
> ++	WARN_ON(f->f_mode & ~ (FMODE_NOACCOUNT | FMODE_CREATED));
>   	f->f_mode |= OPEN_FMODE(f->f_flags) | FMODE_LSEEK |
>   				FMODE_PREAD | FMODE_PWRITE;

That part is sane

>  +/**
>  + * path_open() - Open an inode by a particular name.
>  + * @path: The name of the file.
>  + * @flags: The O_ flags used to open this file.
>  + * @inode: The inode to open.
>  + * @cred: The task's credentials used when opening this file.
>  + *
>  + * Context: Process context.
>  + * Return: A pointer to a struct file or an IS_ERR pointer.  Cannot return NULL.
>  + */
>  +struct file *path_open(const struct path *path, int flags, struct inode *inode,
>  +		       const struct cred *cred, bool account)
>  +{
>  +	struct file *file;
>  +	int error;
>  +
>  +	file = __get_empty_filp(account);
>  +	if (IS_ERR(file))
>  +		return file;
>   
>  +	file->f_flags = flags;
>   	file->f_path = *path;
>  -	return do_dentry_open(file, d_backing_inode(dentry), NULL, cred);
>  +	error = do_dentry_open(file, inode, NULL, cred);
>  +	if (error) {
> - 		put_filp(file);
> ++		if (file->f_mode & FMODE_OPENED)
> ++			fput(file);
> ++		else
> ++			put_filp(file);
>  +		return ERR_PTR(error);
>  +	}
>  +
> - 	error = open_check_o_direct(file);
> - 	if (error) {
> - 		fput(file);
> - 		file = ERR_PTR(error);
> - 	}
> - 
>  +	return file;
>   }
>  +EXPORT_SYMBOL(path_open);

First of all, I'm still not at all convinced that this "noaccount" thing is
sane, especially since path_open() is exported.  But that aside, __get_empty_filp()
needs to be shot, just for the name and calling conventions alone.

It gets a bullshit argument (bool account) *AND* does not get the argument it
does need.  Note that the first thing get_empty_filp() (now __get...) does
is
        const struct cred *cred = current_cred();
followed by
        f->f_cred = get_cred(cred);

Now look at path_open().  What happens to the cred argument it gets?  It goes
to do_dentry_open(), where it gets passed to security_file_open() and not
used by anything else.  In security_file_open() we have it passed to
	ret = call_int_hook(file_open, 0, file, cred);
and there are three instances of ->file_open() - apparmor, selinux and tomoyo.
The last one ignores cred entirely; the other two do checks based on it,
but *all* of them leave file->f_cred as it was.

This is not a new crap.  It had been inherited from dentry_open(), which got it
from "CRED: Pass credentials through dentry_open()" back in 2008.  Note that
	* among the callers of dentry_open() (20) and vfs_open() (2 more)
only these
fs/cachefiles/rdwr.c:913:       file = dentry_open(&path, O_RDWR | O_LARGEFILE, cache->cache_cred);
security/apparmor/file.c:695:   devnull = dentry_open(&aa_null, O_RDWR, cred);
security/selinux/hooks.c:2628:  devnull = dentry_open(&selinux_null, O_RDWR, cred);
get cred != current_cred().  Which helps masking the issue, but makes the
decision to add that argument (instead of a separate helper) rather dubious.
	* overlayfs itself appears to *have* run into the problem, judging
by
        old_cred = ovl_override_creds(inode->i_sb);
        realfile = path_open(&file->f_path, file->f_flags | O_NOATIME,
                             realinode, current_cred(), false);
        revert_creds(old_cred);
in there.

Folks, if you have to go to that kind of contortions, why not do it right?
	* add static __alloc_file(cred), which would get cred pointer (and not
use current_cred() internally), allocated a file (without bothering with
nr_files) and returned it
	* have alloc_empty_file(cred) that would do the song and dance
with nr_files (and used __alloc_file() internally).
	* use that as a replacement for get_empty_filp() - path_openat() would
*probably* use current_cred() for argument, alloc_file() definitely would and
dentry_open() would pass its cred argument.
	* in internal.h, static inline alloc_empty_file_noaccount(cred) would
use __alloc_file() and set FMODE_NOACCOUNT in case of success.
	* do_dentry_open() loses the fucking cred argument - it should be in
file->f_cred.
	* vfs_open() goes away - in your branch it's absolutely pointless.
	* path_open() loses its 'account' argument - it's always false.
Uses alloc_empty_file_noaccount() to allocate the sucker.  And for fsck
sake, pass it the creds you want to use rather than playing that kind of
games with override/revert.
