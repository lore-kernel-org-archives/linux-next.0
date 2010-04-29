From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: build failure after merge of the bkl-ioctl tree
Date: Thu, 29 Apr 2010 22:50:28 +0200
Message-ID: <20100429205026.GB5392@nowhere>
References: <20100429154947.fbacee1f.sfr@canb.auug.org.au> <alpine.LFD.2.00.1004292239320.8472@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1004292239320.8472@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: John Kacur <jkacur@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On Thu, Apr 29, 2010 at 10:40:56PM +0200, John Kacur wrote:
>=20
>=20
> On Thu, 29 Apr 2010, Stephen Rothwell wrote:
>=20
> > Hi Fr=E9d=E9ric,
> >=20
> > After merging the bkl-ioctl tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/scsi/3w-xxxx.c: In function 'tw_chrdev_ioctl':
> > drivers/scsi/3w-xxxx.c:896: error: 'inode' undeclared (first use in=
 this function)
> >=20
> > Caused by commit 5c9af160f830a68734f600fc0f90cba35e26727b ("scsi: P=
ush
> > down BKL into ioctl functions").
> >=20
> > I have used the version of the blk-ioctl tree from next-20100428 fo=
r
> > today.
>=20
> Frederic: did you miss one of my patches to fix the scsi compile prob=
lems?
>=20
> The following should have fixed the above:
>=20
> From 3605ca2d1b29511fe1c95b47c4c596f392797585 Mon Sep 17 00:00:00 200=
1
> From: John Kacur <jkacur@redhat.com>
> Date: Tue, 27 Apr 2010 10:47:43 +0200
> Subject: [PATCH 04/10] bkl: Fix missing inode tw_chrdev_ioctl due to =
bkl pushdown
> Cc: Arnd Bergmann <arnd@arndb.de>,
>     Linus Torvalds <torvalds@linux-foundation.org>,
>     Frederic Weisbecker <fweisbec@gmail.com>,
>     Jan Blunck <jblunck@gmail.com>,
>     Thomas Gleixner <tglx@linutronix.de>
>=20
> Signed-off-by: John Kacur <jkacur@redhat.com>
> ---
>  drivers/scsi/3w-xxxx.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/scsi/3w-xxxx.c b/drivers/scsi/3w-xxxx.c
> index 45a737c..2957691 100644
> --- a/drivers/scsi/3w-xxxx.c
> +++ b/drivers/scsi/3w-xxxx.c
> @@ -890,6 +890,7 @@ static long tw_chrdev_ioctl(struct file *file, un=
signed int cmd, unsigned long a
>  	unsigned long data_buffer_length_adjusted =3D 0;
>  	unsigned long *cpu_addr;
>  	long timeout;
> +	struct inode *inode =3D file->f_dentry->d_inode;
>  	TW_New_Ioctl *tw_ioctl;
>  	TW_Passthru *passthru;
>  	TW_Device_Extension *tw_dev =3D tw_device_extension_list[iminor(ino=
de)];
> --=20
> 1.6.6.1



My bad, I was really sure I integrated all of your fixes, and it even f=
ixed
by build. I probably forgot a git-add.

Will apply this one, thanks!
