From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: next-2008-11-28 : can't mount UDF DVD
Date: Mon, 01 Dec 2008 20:28:02 +0100
Message-ID: <49343AC2.3010808@free.fr>
References: <20081128213620.2ec593d4.sfr@canb.auug.org.au> <49332545.5020604@free.fr> <20081201001854.GA9881@joi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp2-g19.free.fr ([212.27.42.28]:59352 "EHLO smtp2-g19.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751790AbYLAT2O (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Dec 2008 14:28:14 -0500
In-Reply-To: <20081201001854.GA9881@joi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jan Kara <jack@suse.cz>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Le 01.12.2008 01:18, Marcin Slusarz a =E9crit :
> On Mon, Dec 01, 2008 at 12:44:05AM +0100, Laurent Riffard wrote:
>> Hi,
>>
>> With next-2008-11-28, I was unable to mount an UDF-formatted DVD-RW:
>>
>> ~$ mount -oro -t udf /dev/sr0 /media/cdrom/
>> mount: Not a directory
>>
>> There was no problem with 2.6.28-rc6.
>>
>> I made a bisection:
>>
>> 33284bdf40f88160a154202510b27d983138c805 is first bad commit
>> commit 33284bdf40f88160a154202510b27d983138c805
>> Author: Marcin Slusarz <marcin.slusarz@gmail.com>
>> Date:   Sun Nov 16 20:52:19 2008 +0100
>>
>>     udf: implement mode and dmode mounting options
>>
>>     "dmode" allows overriding permissions of directories and
>>     "mode" allows overriding permissions of files.
>>
>>     Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
>>     Cc: Jan Kara <jack@suse.cz>
>>     Signed-off-by: Jan Kara <jack@suse.cz>
>>
>>
>> Indeed, with this commit, I *must* use the dmode option to mount my =
DVD:
>=20
> That's not intended behaviour... ;)
> =20
>> ~$ sudo mount -oro,dmode=3D0755 -t udf /dev/sr0 /media/cdrom/
>> ~$ grep /media/cdrom /proc/mounts=20
>> /dev/scd0 /media/cdrom udf ro,mode=3D177777,dmode=3D755,utf8 0 0
>                                      ^^^^^^
> funny (it's 65535 / (u16)-1)
>=20
[snip]
>=20
> Can you check whether attached patch fixes it?
> What architecture are you testing on?

i686, 32-bit althought CPU is "AMD Athlon(tm) 64 X2 Dual Core Processor=
 5000+ stepping 02".

~$ uname -a
Linux calimero 2.6.28-rc6-next-20081128-05108-g389b1c9 #62 SMP PREEMPT =
Mon Dec 1 19:53:55 CET 2008 i686 GNU/Linux

Current kernel is next-20081128 + reiser4 patches + your patch: it seem=
s to works well now.

=46irst test: mount with default options. It works as expected.

~$ sudo mount -oro -t udf /dev/sr0 /media/cdrom/
~$ grep /media/cdrom /proc/mounts
/dev/scd0 /media/cdrom udf ro,utf8 0 0
~$ ls -al /media/cdrom/
total 46
drwxrwxrwx  5 root    root     344 2007-12-24 18:09 .
drwxr-xr-x 12 root    root    4096 2008-12-01 20:04 ..
drwxr-x---  2 laurent laurent 7112 2008-11-30 20:14 flexbackup
drwxr-xr-x  2 root    root      40 2005-11-20 23:37 lost+found
drwxr-x--- 10 laurent laurent 4548 2005-11-25 18:18 patches
~$ ls -al /media/cdrom/flexbackup/
total 4307946
drwxr-x--- 2 laurent laurent       7112 2008-11-30 20:14 .
drwxrwxrwx 5 root    root           344 2007-12-24 18:09 ..
-rw-r----- 1 laurent laurent         44 2006-10-01 15:36 00-index-key
[...]
~$ sudo umount /dev/scd0


Second test : mount with dmode=3D0755 option. Does work as expected too=
=2E

~$ sudo mount -oro,dmode=3D0755 -t udf /dev/sr0 /media/cdrom/
~$ grep /media/cdrom /proc/mounts
/dev/scd0 /media/cdrom udf ro,dmode=3D755,utf8 0 0
~$ ls -al /media/cdrom/
total 46
drwxr-xr-x  5 root    root     344 2007-12-24 18:09 .
drwxr-xr-x 12 root    root    4096 2008-12-01 20:04 ..
drwxr-xr-x  2 laurent laurent 7112 2008-11-30 20:14 flexbackup
drwxr-xr-x  2 root    root      40 2005-11-20 23:37 lost+found
drwxr-xr-x 10 laurent laurent 4548 2005-11-25 18:18 patches
~$ ls -al /media/cdrom/flexbackup/
total 4307946
drwxr-xr-x 2 laurent laurent       7112 2008-11-30 20:14 .
drwxr-xr-x 5 root    root           344 2007-12-24 18:09 ..
-rw-r----- 1 laurent laurent         44 2006-10-01 15:36 00-index-key
[...]

Tested-by: Laurent Riffard <laurent.riffard@free.fr>

> diff --git a/fs/udf/inode.c b/fs/udf/inode.c
> index 6612a27..9eeb726 100644
> --- a/fs/udf/inode.c
> +++ b/fs/udf/inode.c
> @@ -1222,10 +1222,10 @@ static void udf_fill_inode(struct inode *inod=
e, struct buffer_head *bh)
>  	iinfo->i_lenExtents =3D inode->i_size;
> =20
>  	if (fe->icbTag.fileType !=3D ICBTAG_FILE_TYPE_DIRECTORY &&
> -			sbi->s_fmode !=3D -1)
> +			sbi->s_fmode !=3D (mode_t)-1)
>  		inode->i_mode =3D sbi->s_fmode;
>  	else if (fe->icbTag.fileType =3D=3D ICBTAG_FILE_TYPE_DIRECTORY &&
> -			sbi->s_dmode !=3D -1)
> +			sbi->s_dmode !=3D (mode_t)-1)
>  		inode->i_mode =3D sbi->s_dmode;
>  	else
>  		inode->i_mode =3D udf_convert_permissions(fe);
> diff --git a/fs/udf/super.c b/fs/udf/super.c
> index e5d121d..af8a771 100644
> --- a/fs/udf/super.c
> +++ b/fs/udf/super.c
> @@ -284,9 +284,9 @@ static int udf_show_options(struct seq_file *seq,=
 struct vfsmount *mnt)
>  		seq_printf(seq, ",gid=3D%u", sbi->s_gid);
>  	if (sbi->s_umask !=3D 0)
>  		seq_printf(seq, ",umask=3D%o", sbi->s_umask);
> -	if (sbi->s_fmode !=3D -1)
> +	if (sbi->s_fmode !=3D (mode_t)-1)
>  		seq_printf(seq, ",mode=3D%o", sbi->s_fmode);
> -	if (sbi->s_dmode !=3D -1)
> +	if (sbi->s_dmode !=3D (mode_t)-1)
>  		seq_printf(seq, ",dmode=3D%o", sbi->s_dmode);
>  	if (UDF_QUERY_FLAG(sb, UDF_FLAG_SESSION_SET))
>  		seq_printf(seq, ",session=3D%u", sbi->s_session);

Thanks
~~
laurent


=20
