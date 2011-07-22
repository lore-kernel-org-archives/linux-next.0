From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for July 20 (overlayfs)
Date: Fri, 22 Jul 2011 13:38:59 +0200
Message-ID: <CA+icZUWKaOKk0xSMDWi5hprELjhTQgDpLwVJM6OXmAnNX3oNLg@mail.gmail.com>
References: <CA+icZUVbeLU+zCAC+8wduizn6h5FUE2qzNr0bg9t3yWNbv_6Ng@mail.gmail.com>
	<CA+icZUXf1_qWF8GdQyCVxzAp-CYgQbH8iod0oBTjhWsSZLi1_g@mail.gmail.com>
	<87y5zqfxt1.fsf@tucsk.pomaz.szeredi.hu>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:61568 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753444Ab1GVLjB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Jul 2011 07:39:01 -0400
In-Reply-To: <87y5zqfxt1.fsf@tucsk.pomaz.szeredi.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Randy Dunlap <rdunlap@xenotime.net>

On Fri, Jul 22, 2011 at 11:51 AM, Miklos Szeredi <miklos@szeredi.hu> wr=
ote:
[ ... ]
> And ->fsync is another one that will have an updated API.
>
> Miklos
>
> ---
> =C2=A0fs/overlayfs/readdir.c | =C2=A0 =C2=A05 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>
> Index: linux-2.6/fs/overlayfs/readdir.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/fs/overlayfs/readdir.c =C2=A0 =C2=A0 =C2=A0 2011-0=
7-21 17:07:52.000000000 +0200
> +++ linux-2.6/fs/overlayfs/readdir.c =C2=A0 =C2=A02011-07-21 17:10:20=
=2E000000000 +0200
> @@ -386,7 +386,8 @@ static loff_t ovl_dir_llseek(struct file
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return res;
> =C2=A0}
>
> -static int ovl_dir_fsync(struct file *file, int datasync)
> +static int ovl_dir_fsync(struct file *file, loff_t start, loff_t end=
,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0int datasync)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ovl_dir_file *od =3D file->private_=
data;
>
> @@ -400,7 +401,7 @@ static int ovl_dir_fsync(struct file *fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return PTR_ERR(od->realfile);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> - =C2=A0 =C2=A0 =C2=A0 return vfs_fsync(od->realfile, datasync);
> + =C2=A0 =C2=A0 =C2=A0 return vfs_fsync_range(od->realfile, start, en=
d, datasync);
> =C2=A0}
>
> =C2=A0static int ovl_dir_release(struct inode *inode, struct file *fi=
le)
>

OK, I see your patch is like mine due to changes in linux-next (here:
I checked with next-20110721):

commit cbc4facd43b3502f644d7f01a9a48f8bec5f3e57
"fs: push i_mutex and filemap_write_and_wait down into ->fsync() handle=
rs"

Is it possible to have a clean...

1. OverlayFS v11 against Linux-3.0
2. OverlayFS v11 against vfs-2.6.git#for-next (see [2])

- Sedat -

[1] <http://git.us.kernel.org/?p=3Dlinux/kernel/git/viro/vfs-2.6.git;a=3D=
commit;h=3Dcbc4facd43b3502f644d7f01a9a48f8bec5f3e57>
[2]  <http://git.us.kernel.org/?p=3Dlinux/kernel/git/viro/vfs-2.6.git;a=
=3Dshortlog;h=3Drefs/heads/for-next>
