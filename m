From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for July 20 (overlayfs)
Date: Fri, 22 Jul 2011 11:59:03 +0200
Message-ID: <CA+icZUWGxByaiRGSdtcoY_cdRytVvSFzahzPrdgokF7cKt8q3w@mail.gmail.com>
References: <CA+icZUVbeLU+zCAC+8wduizn6h5FUE2qzNr0bg9t3yWNbv_6Ng@mail.gmail.com>
	<CA+icZUXf1_qWF8GdQyCVxzAp-CYgQbH8iod0oBTjhWsSZLi1_g@mail.gmail.com>
	<87y5zqfxt1.fsf@tucsk.pomaz.szeredi.hu>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:40244 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753564Ab1GVJ7F convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Jul 2011 05:59:05 -0400
In-Reply-To: <87y5zqfxt1.fsf@tucsk.pomaz.szeredi.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Randy Dunlap <rdunlap@xenotime.net>

On Fri, Jul 22, 2011 at 11:51 AM, Miklos Szeredi <miklos@szeredi.hu> wr=
ote:
> Sedat Dilek <sedat.dilek@googlemail.com> writes:
>
>> On Wed, Jul 20, 2011 at 8:48 PM, Sedat Dilek <sedat.dilek@googlemail=
=2Ecom> wrote:
>>> Hi,
>>>
>>> I have here a problem with linux-next (next-20110720) and
>>> overlayfs-v10 (not the latest from GIT).
>>>
>>> ### OVERLAYFS
>>> # Patches from mszeredi/vfs.git#overlayfs.v10 (up to commit
>>> 00b27467b181a27c808cef0d66860eba5f450b24)
>>> # "overlay: overlay filesystem documentation"
>>> # See also <http://lkml.org/lkml/2011/6/1/456>
>>> # "[PATCH 0/7] overlay filesystem: request for inclusion"
>>> + overlayfs-v10/overlayfs-v10.patch
>>>
>>> Documentation/filesystems/porting says:
>>>
>>> [mandatory]
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0->permission(), generic_permission() and=
 ->check_acl() have lost flags
>>> argument; instead of passing IPERM_FLAG_RCU we add MAY_NOT_BLOCK in=
to mask.
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0generic_permission() has also lost the c=
heck_acl argument; if you want
>>> non-NULL to be used for that inode, put it into ->i_op->check_acl.
>>>
>>> I checked with other files below fs/ and changed accordingly.
>>> So, I hope the attached patch is OK (untested, uncompiled)?
>>>
>>> What's the status of OverlayFS anyway, will it be merged into v3.1?
>>>
>>> Regards,
>>> - Sedat -
>>>
>>
>> I checked again and adapted ovl_permission().
>>
>> [ fs/namei.c ]
>> static int acl_permission_check(struct inode *inode, int mask)
>>
>> Here is a v2, which compiles.
>
> Thanks, the patch looks good.
>
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

Hi Miklos,

cool, thanks.
I have renamed my patch in the meanwhile to
"ovl-Fix-ovl_permission-by-adding-MAY_NOT_BLOCK-into-mask.patch".

The change was due to...

commit d749519b444db985e40b897f73ce1898b11f997e
"->permission() sanitizing: don't pass flags to generic_permission()" [=
1].

You want me to do a clean patch or by yourself?

Can you please, do a overlayfs-v11 on top of Linux-3.0?
I hope your work will be accepted into v3.1.

Regards,
- Sedat -

[1] http://git.us.kernel.org/?p=3Dlinux/kernel/git/viro/vfs-2.6.git;a=3D=
commitdiff;h=3Dd749519b444db985e40b897f73ce1898b11f997e
