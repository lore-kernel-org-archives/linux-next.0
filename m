From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree with the ext3 tree
Date: Tue, 12 Jun 2018 09:53:09 +1000
Message-ID: <20180612095309.26f5c6f4@canb.auug.org.au>
References: <20180601115619.73a8f966@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H.vnieOUtcD4tVOrK6c+=fS"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180601115619.73a8f966@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Jan Kara <jack@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>, Adam Manzanares <adam.manzanares@wdc.com>
List-Id: linux-next.vger.kernel.org

--Sig_/H.vnieOUtcD4tVOrK6c+=fS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 1 Jun 2018 11:56:19 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the vfs tree got a conflict in:
>=20
>   include/linux/fs.h
>=20
> between commit:
>=20
>   29aca8b3f7cd ("fsnotify: introduce prototype struct fsnotify_obj")
>=20
> from the ext3 tree and commit:
>=20
>   d9a08a9e616b ("fs: Add aio iopriority support")
>=20
> from the vfs tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc include/linux/fs.h
> index d1f3d572349f,482563fe549c..000000000000
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@@ -36,7 -36,7 +36,8 @@@
>   #include <linux/delayed_call.h>
>   #include <linux/uuid.h>
>   #include <linux/errseq.h>
>  +#include <linux/fsnotify_obj.h>
> + #include <linux/ioprio.h>
>  =20
>   #include <asm/byteorder.h>
>   #include <uapi/linux/fs.h>
> @@@ -1717,9 -1713,10 +1719,11 @@@ struct file_operations=20
>   	int (*iterate) (struct file *, struct dir_context *);
>   	int (*iterate_shared) (struct file *, struct dir_context *);
>   	__poll_t (*poll) (struct file *, struct poll_table_struct *);
> + 	struct wait_queue_head * (*get_poll_head)(struct file *, __poll_t);
> + 	__poll_t (*poll_mask) (struct file *, __poll_t);
>   	long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
>   	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
>  +	int (*pre_mmap) (struct file *, unsigned long, unsigned long);
>   	int (*mmap) (struct file *, struct vm_area_struct *);
>   	unsigned long mmap_supported_flags;
>   	int (*open) (struct inode *, struct file *);

This is now a conflict between the ext3 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/H.vnieOUtcD4tVOrK6c+=fS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsfC2UACgkQAVBC80lX
0Gx3vwf+NSX9TcByitTc4R/1JSKK4rObCnlVuCb5/8Lgd6gtUGMKWP1/w1eyURdG
MBBKr3/q19RDIJFLl424yIQGT7ghzq+0Xqe/jynBy09bOTqHufzdtvV0/8zVlGYE
OCwbtxnw5ZV4fa7jaP7oTz4nCjKI43P7J9pRil0dqhT4D64DicaXRjK8bw4JObq3
nzlGbdjmW+bsQ8cyRaRo15CNnSzHdIm2YM/E9SW7xdUAlajDTdvdKtCmx1bUVVWN
LTXXpPHDgLjy6q3XDiR3cexhGs07GMdOgvQkVwYDe0eEhZ6EJXJWtsu8srzIFfVs
CiaIwB7GGa7aokH/fMtwyqyq/YQ7hg==
=pnSW
-----END PGP SIGNATURE-----

--Sig_/H.vnieOUtcD4tVOrK6c+=fS--
