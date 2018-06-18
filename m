From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the overlayfs tree with the
 btrfs-kdave tree
Date: Mon, 18 Jun 2018 13:42:12 +1000
Message-ID: <20180618134212.31202019@canb.auug.org.au>
References: <20180529095250.097524cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+y3zg5iDTuMYT_4tlQ.0zby"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180529095250.097524cf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: David Sterba <dsterba@suse.cz>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Timofey Titovets <nefelim4ag@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/+y3zg5iDTuMYT_4tlQ.0zby
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 29 May 2018 09:52:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the overlayfs tree got a conflict in:
>=20
>   fs/btrfs/ioctl.c
>=20
> between commit:
>=20
>   0b4dc087e29a ("Btrfs: dedupe_file_range ioctl: remove 16MiB restriction=
")
>=20
> from the btrfs-kdave tree and commits:
>=20
>   83d499febfac ("vfs: dedpue: return loff_t")
>   7765f19ed5f9 ("vfs: dedupe: rationalize args")
>=20
> from the overlayfs tree.
>=20
> [I note the typo in the subject of commit 83d499febfac]
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
> diff --cc fs/btrfs/ioctl.c
> index 4d88d54d042d,70eac76804df..000000000000
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@@ -3637,14 -3192,20 +3637,15 @@@ out_free
>   	return ret;
>   }
>  =20
> - ssize_t btrfs_dedupe_file_range(struct file *src_file, u64 loff, u64 ol=
en,
> - 				struct file *dst_file, u64 dst_loff)
>  -#define BTRFS_MAX_DEDUPE_LEN	SZ_16M
>  -
> + loff_t btrfs_dedupe_file_range(struct file *src_file, loff_t loff,
> + 			       struct file *dst_file, loff_t dst_loff,
> + 			       loff_t olen)
>   {
>   	struct inode *src =3D file_inode(src_file);
>   	struct inode *dst =3D file_inode(dst_file);
>   	u64 bs =3D BTRFS_I(src)->root->fs_info->sb->s_blocksize;
> - 	ssize_t res;
> + 	int res;
>  =20
>  -	if (olen > BTRFS_MAX_DEDUPE_LEN)
>  -		olen =3D BTRFS_MAX_DEDUPE_LEN;
>  -
>   	if (WARN_ON_ONCE(bs < PAGE_SIZE)) {
>   		/*
>   		 * Btrfs does not support blocksize < page_size. As a

This is now a conflict between the overlayfs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+y3zg5iDTuMYT_4tlQ.0zby
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsnKhQACgkQAVBC80lX
0GzjpQgAlnXCgTzLvn2p4t+OUemvsWHNu2szRIK6C57nDkna1EgO3wW56bHpAkSq
CUiWkksQ4WjaZp2hg+9TBXIvPi6fJzqonfeU64KB9G1HB9V22OBD/fxQEeLpmSA7
2z9RPde5j5K1h40SvEHJvjh1etZAu+wFd+x5aoj+411XA5MwdjbzNbBvbNsekclf
ls44IZG8/jbGdE4bT9BDRqNZpLy5o4G3bnSwqUanYVuws+RqMq3tyMT/SwD9hPpr
26Drv7Hyl4jXZU39AU2SibC6Uq31HYbG1+F1bPF4mIjvO/zxkFkVGk2kmEqc/bCF
yYV3Uwb46bHNYc1tX9ETVm/AQXdR3A==
=2uQS
-----END PGP SIGNATURE-----

--Sig_/+y3zg5iDTuMYT_4tlQ.0zby--
