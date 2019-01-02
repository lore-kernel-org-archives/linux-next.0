From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the f2fs tree with the fscrypt tree
Date: Wed, 2 Jan 2019 11:26:10 +1100
Message-ID: <20190102112610.3bc5fb97@canb.auug.org.au>
References: <20181211101322.438946fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oSPUQt/zVrd5X9qD0buRkfQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211101322.438946fe@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chandan Rajendra <chandan@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/oSPUQt/zVrd5X9qD0buRkfQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 11 Dec 2018 10:13:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the f2fs tree got a conflict in:
>=20
>   fs/f2fs/dir.c
>=20
> between commit:
>=20
>   848a010287e6 ("f2fs: use IS_ENCRYPTED() to check encryption status")
>=20
> from the fscrypt tree and commit:
>=20
>   4e240d1bab1e ("f2fs: check memory boundary by insane namelen")
>=20
> from the f2fs tree.
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
> diff --cc fs/f2fs/dir.c
> index cf9e2564388d,c0c845da12fa..000000000000
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@@ -808,7 -808,18 +808,18 @@@ int f2fs_fill_dentries(struct dir_conte
>   		de_name.name =3D d->filename[bit_pos];
>   		de_name.len =3D le16_to_cpu(de->name_len);
>  =20
> + 		/* check memory boundary before moving forward */
> + 		bit_pos +=3D GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
> + 		if (unlikely(bit_pos > d->max)) {
> + 			f2fs_msg(sbi->sb, KERN_WARNING,
> + 				"%s: corrupted namelen=3D%d, run fsck to fix.",
> + 				__func__, le16_to_cpu(de->name_len));
> + 			set_sbi_flag(sbi, SBI_NEED_FSCK);
> + 			err =3D -EINVAL;
> + 			goto out;
> + 		}
> +=20
>  -		if (f2fs_encrypted_inode(d->inode)) {
>  +		if (IS_ENCRYPTED(d->inode)) {
>   			int save_len =3D fstr->len;
>  =20
>   			err =3D fscrypt_fname_disk_to_usr(d->inode,

This is now a conflict between the fscrypt tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/oSPUQt/zVrd5X9qD0buRkfQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwsBSIACgkQAVBC80lX
0GyzVwf+LbzKgJ/S30mYe9TrC/Jlp3kD3VDfsUFtXLaK1WOs1mDfkDuU7bQDmPr8
F/l6TFyuA9OKkSZpu/bYBuwwE/5Q+FdoFnT1yvTOUbh/XBL9RXKPyPrkab8jikna
eP5VHiphKCgUsrbQFYAHv6HxGPc1S/P/g78neJ1zCBSN0qGPpNFdbzmygmL602t2
YRUdDvXRcZGIuZkzsHbO6uEW3QrPIw2FAV+4iAq8ZLksWBDEJPlHljE9hwgU/0vK
2juzugF5+P0n4YjmukNCFClH2H4h6TNEQDzAVm8aZ1UjoXTBcIzE1vQ3DDeafyHF
rV+runCJJvBAn2jknx5T/NO/g/XLnw==
=N6wc
-----END PGP SIGNATURE-----

--Sig_/oSPUQt/zVrd5X9qD0buRkfQ--
