From: Eric Van Hensbergen <ericvh@gmail.com>
Subject: Re: linux-next: manual merge of the vfs tree with the v9fs tree
Date: Fri, 6 Jan 2012 22:38:57 -0600
Message-ID: <CAFkjPTndww2mu16gCa9cn7V=0t0wvYgPQ1wQGz0q0B=Fk6xQbA@mail.gmail.com>
References: <20120106134658.7589dec177541808dad20eb9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:48998 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751934Ab2AGEjT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jan 2012 23:39:19 -0500
In-Reply-To: <20120106134658.7589dec177541808dad20eb9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>

What's typically the right process for me to prep the merge for Linus?
Should I pull Al's patchset and then apply mine on top of it so I can
merge your merge fix or just have my for-linus tree based on his
current working merge (which I assume has Al's by now).  Just a bit
confused because rebasing was discouraged last merge window -- but not
sure how to deal with the conflict without a rebase....

         -eric

On Thu, Jan 5, 2012 at 8:46 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi Al,
>
> Today's linux-next merge of the vfs tree got conflicts in
> fs/9p/vfs_inode.c and fs/9p/vfs_inode_dotl.c between commit 5d3851530=
d6d
> ("9p: Reduce object size with CONFIG_NET_9P_DEBUG") from the v9fs tre=
e
> and commits c2837de73e80 ("9p: don't bother with unixmode2p9mode() fo=
r
> link() and symlink()") and 3eda0de677b5 ("9p: propagate umode_t") fro=
m
> the vfs tree.
>
> I fixed it up (see below) and can carry the fix as necessary.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc fs/9p/vfs_inode.c
> index c8fe480,e0f20de..0000000
> --- a/fs/9p/vfs_inode.c
> +++ b/fs/9p/vfs_inode.c
> @@@ -127,14 -94,14 +122,14 @@@ static int p9mode2perm(struct v9fs_ses=
s
> =A0 * @rdev: major number, minor number in case of device files.
> =A0 *
> =A0 */
> - static int p9mode2unixmode(struct v9fs_session_info *v9ses,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct p9_wstat =
*stat, dev_t *rdev)
> + static umode_t p9mode2unixmode(struct v9fs_session_info *v9ses,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct p=
9_wstat *stat, dev_t *rdev)
> =A0{
> =A0 =A0 =A0 =A0int res;
> - =A0 =A0 =A0 int mode =3D stat->mode;
> + =A0 =A0 =A0 u32 mode =3D stat->mode;
>
> =A0- =A0 =A0 =A0res =3D mode & S_IALLUGO;
> =A0 =A0 =A0 =A0*rdev =3D 0;
> =A0+ =A0 =A0 =A0res =3D p9mode2perm(v9ses, stat);
>
> =A0 =A0 =A0 =A0if ((mode & P9_DMDIR) =3D=3D P9_DMDIR)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0res |=3D S_IFDIR;
> @@@ -352,8 -329,8 +346,8 @@@ int v9fs_init_inode(struct v9fs_session
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0default:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 p9_debug(P9_DEBUG_ERROR, "BAD mode 0x%x=
 S_IFMT 0x%x\n",
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0P9_DPRINTK(P9_DEBUG_ERROR, "BAD mode =
0x%hx S_IFMT 0x%x\n",
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode, mode & S_I=
=46MT);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0p9_debug(P9_DEBUG_ERROR, "BAD mode 0x%h=
x S_IFMT 0x%x\n",
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mode, mode & S_IFMT)=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto error;
> =A0 =A0 =A0 =A0}
> @@@ -375,7 -352,7 +369,7 @@@ struct inode *v9fs_get_inode(struct sup
> =A0 =A0 =A0 =A0struct inode *inode;
> =A0 =A0 =A0 =A0struct v9fs_session_info *v9ses =3D sb->s_fs_info;
>
> - =A0 =A0 =A0 p9_debug(P9_DEBUG_VFS, "super block: %p mode: %o\n", sb=
, mode);
> =A0- =A0 =A0 =A0P9_DPRINTK(P9_DEBUG_VFS, "super block: %p mode: %ho\n=
", sb, mode);
> ++ =A0 =A0 =A0p9_debug(P9_DEBUG_VFS, "super block: %p mode: %ho\n", s=
b, mode);
>
> =A0 =A0 =A0 =A0inode =3D new_inode(sb);
> =A0 =A0 =A0 =A0if (!inode) {
> @@@ -1362,10 -1333,10 +1355,10 @@@ static int v9fs_vfs_mkspecial(stru=
ct in
> =A0static int
> =A0v9fs_vfs_symlink(struct inode *dir, struct dentry *dentry, const c=
har *symname)
> =A0{
> =A0- =A0 =A0 =A0P9_DPRINTK(P9_DEBUG_VFS, " %lu,%s,%s\n", dir->i_ino,
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0dentry->d_name.name, symname);
> =A0+ =A0 =A0 =A0p9_debug(P9_DEBUG_VFS, " %lu,%s,%s\n",
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dir->i_ino, dentry->d_name.name, sym=
name);
>
> - =A0 =A0 =A0 return v9fs_vfs_mkspecial(dir, dentry, S_IFLNK, symname=
);
> + =A0 =A0 =A0 return v9fs_vfs_mkspecial(dir, dentry, P9_DMSYMLINK, sy=
mname);
> =A0}
>
> =A0/**
> @@@ -1419,14 -1391,16 +1412,16 @@@ clunk_fid
> =A0 */
>
> =A0static int
> - v9fs_vfs_mknod(struct inode *dir, struct dentry *dentry, int mode, =
dev_t rdev)
> + v9fs_vfs_mknod(struct inode *dir, struct dentry *dentry, umode_t mo=
de, dev_t rdev)
> =A0{
> + =A0 =A0 =A0 struct v9fs_session_info *v9ses =3D v9fs_inode2v9ses(di=
r);
> =A0 =A0 =A0 =A0int retval;
> =A0 =A0 =A0 =A0char *name;
> + =A0 =A0 =A0 u32 perm;
>
> - =A0 =A0 =A0 p9_debug(P9_DEBUG_VFS, " %lu,%s mode: %x MAJOR: %u MINO=
R: %u\n",
> =A0- =A0 =A0 =A0P9_DPRINTK(P9_DEBUG_VFS,
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0" %lu,%s mode: %hx MAJOR: %u MINOR: %=
u\n", dir->i_ino,
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0dentry->d_name.name, mode, MAJOR(rdev=
), MINOR(rdev));
> ++ =A0 =A0 =A0p9_debug(P9_DEBUG_VFS, " %lu,%s mode: %hx MAJOR: %u MIN=
OR: %u\n",
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dir->i_ino, dentry->d_name.name, mod=
e,
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 MAJOR(rdev), MINOR(rdev));
>
> =A0 =A0 =A0 =A0if (!new_valid_dev(rdev))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> diff --cc fs/9p/vfs_inode_dotl.c
> index 73488fb,8ef152a..0000000
> --- a/fs/9p/vfs_inode_dotl.c
> +++ b/fs/9p/vfs_inode_dotl.c
> @@@ -283,8 -283,8 +283,8 @@@ v9fs_vfs_create_dotl(struct inode *dir
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0name =3D (char *) dentry->d_name.name;
> - =A0 =A0 =A0 p9_debug(P9_DEBUG_VFS, "name:%s flags:0x%x mode:0x%x\n"=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0name, flags, omode);
> =A0- =A0 =A0 =A0P9_DPRINTK(P9_DEBUG_VFS, "v9fs_vfs_create_dotl: name:=
%s flags:0x%x "
> ++ =A0 =A0 =A0p9_debug(P9_DEBUG_VFS, "v9fs_vfs_create_dotl: name:%s f=
lags:0x%x "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "mode:0x%hx\n", name, f=
lags, omode);
>
> =A0 =A0 =A0 =A0dfid =3D v9fs_fid_lookup(dentry->d_parent);
> =A0 =A0 =A0 =A0if (IS_ERR(dfid)) {
> @@@ -810,9 -813,9 +810,9 @@@ v9fs_vfs_mknod_dotl(struct inode *dir,
> =A0 =A0 =A0 =A0struct dentry *dir_dentry;
> =A0 =A0 =A0 =A0struct posix_acl *dacl =3D NULL, *pacl =3D NULL;
>
> - =A0 =A0 =A0 p9_debug(P9_DEBUG_VFS, " %lu,%s mode: %x MAJOR: %u MINO=
R: %u\n",
> =A0- =A0 =A0 =A0P9_DPRINTK(P9_DEBUG_VFS,
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0" %lu,%s mode: %hx MAJOR: %u MINOR: %=
u\n", dir->i_ino,
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0dentry->d_name.name, omode, MAJOR(rde=
v), MINOR(rdev));
> ++ =A0 =A0 =A0p9_debug(P9_DEBUG_VFS, " %lu,%s mode: %hx MAJOR: %u MIN=
OR: %u\n",
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dir->i_ino, dentry->d_name.name, omo=
de,
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 MAJOR(rdev), MINOR(rdev));
>
> =A0 =A0 =A0 =A0if (!new_valid_dev(rdev))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
