From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: linux-next: Tree for July 20 (overlayfs)
Date: Fri, 22 Jul 2011 11:51:22 +0200
Message-ID: <87y5zqfxt1.fsf@tucsk.pomaz.szeredi.hu>
References: <CA+icZUVbeLU+zCAC+8wduizn6h5FUE2qzNr0bg9t3yWNbv_6Ng@mail.gmail.com>
	<CA+icZUXf1_qWF8GdQyCVxzAp-CYgQbH8iod0oBTjhWsSZLi1_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:60910 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753463Ab1GVJua (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Jul 2011 05:50:30 -0400
In-Reply-To: <CA+icZUXf1_qWF8GdQyCVxzAp-CYgQbH8iod0oBTjhWsSZLi1_g@mail.gmail.com>
	(Sedat Dilek's message of "Wed, 20 Jul 2011 21:28:29 +0200")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Randy Dunlap <rdunlap@xenotime.net>

Sedat Dilek <sedat.dilek@googlemail.com> writes:

> On Wed, Jul 20, 2011 at 8:48 PM, Sedat Dilek <sedat.dilek@googlemail.=
com> wrote:
>> Hi,
>>
>> I have here a problem with linux-next (next-20110720) and
>> overlayfs-v10 (not the latest from GIT).
>>
>> ### OVERLAYFS
>> # Patches from mszeredi/vfs.git#overlayfs.v10 (up to commit
>> 00b27467b181a27c808cef0d66860eba5f450b24)
>> # "overlay: overlay filesystem documentation"
>> # See also <http://lkml.org/lkml/2011/6/1/456>
>> # "[PATCH 0/7] overlay filesystem: request for inclusion"
>> + overlayfs-v10/overlayfs-v10.patch
>>
>> Documentation/filesystems/porting says:
>>
>> [mandatory]
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0->permission(), generic_permission() and =
->check_acl() have lost flags
>> argument; instead of passing IPERM_FLAG_RCU we add MAY_NOT_BLOCK int=
o mask.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0generic_permission() has also lost the ch=
eck_acl argument; if you want
>> non-NULL to be used for that inode, put it into ->i_op->check_acl.
>>
>> I checked with other files below fs/ and changed accordingly.
>> So, I hope the attached patch is OK (untested, uncompiled)?
>>
>> What's the status of OverlayFS anyway, will it be merged into v3.1?
>>
>> Regards,
>> - Sedat -
>>
>
> I checked again and adapted ovl_permission().
>
> [ fs/namei.c ]
> static int acl_permission_check(struct inode *inode, int mask)
>
> Here is a v2, which compiles.

Thanks, the patch looks good.

And ->fsync is another one that will have an updated API.

Miklos

---
 fs/overlayfs/readdir.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Index: linux-2.6/fs/overlayfs/readdir.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.orig/fs/overlayfs/readdir.c	2011-07-21 17:07:52.000000000=
 +0200
+++ linux-2.6/fs/overlayfs/readdir.c	2011-07-21 17:10:20.000000000 +020=
0
@@ -386,7 +386,8 @@ static loff_t ovl_dir_llseek(struct file
 	return res;
 }
=20
-static int ovl_dir_fsync(struct file *file, int datasync)
+static int ovl_dir_fsync(struct file *file, loff_t start, loff_t end,
+			 int datasync)
 {
 	struct ovl_dir_file *od =3D file->private_data;
=20
@@ -400,7 +401,7 @@ static int ovl_dir_fsync(struct file *fi
 			return PTR_ERR(od->realfile);
 	}
=20
-	return vfs_fsync(od->realfile, datasync);
+	return vfs_fsync_range(od->realfile, start, end, datasync);
 }
=20
 static int ovl_dir_release(struct inode *inode, struct file *file)
