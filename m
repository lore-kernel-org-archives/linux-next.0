From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree with the overlayfs
 tree
Date: Tue, 5 Jun 2018 10:19:38 +1000
Message-ID: <20180605101938.2788323e@canb.auug.org.au>
References: <20180529113025.0eb4b16d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3PDq.+gSfu/fyHtx.zi9dBt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180529113025.0eb4b16d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zev Weiss <zev@bewilderbeest.net>
List-Id: linux-next.vger.kernel.org

--Sig_/3PDq.+gSfu/fyHtx.zi9dBt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 29 May 2018 11:30:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the vfs tree got a conflict in:
>=20
>   fs/read_write.c
>=20
> between commit:
>=20
>   63ea46a359b2 ("vfs: dedupe: extract helper for a single dedup")
>=20
> from the overlayfs tree and commit:
>=20
>   227627114799 ("fs: avoid fdput() after failed fdget() in vfs_dedupe_fil=
e_range()")
>=20
> from the vfs tree.
>=20
> I can't see how to easily fix up this conflict, so I effectively dropped
> the vfs tree change.
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
> diff --cc fs/read_write.c
> index 4d61375a0de4,e83bd9744b5d..000000000000
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@@ -2055,21 -2021,46 +2055,20 @@@ int vfs_dedupe_file_range(struct file *
>  =20
>   		if (info->reserved) {
>   			info->status =3D -EINVAL;
>  -		} else if (!(is_admin || (dst_file->f_mode & FMODE_WRITE))) {
>  -			info->status =3D -EINVAL;
>  -		} else if (file->f_path.mnt !=3D dst_file->f_path.mnt) {
>  -			info->status =3D -EXDEV;
>  -		} else if (S_ISDIR(dst->i_mode)) {
>  -			info->status =3D -EISDIR;
>  -		} else if (dst_file->f_op->dedupe_file_range =3D=3D NULL) {
>  -			info->status =3D -EINVAL;
>  -		} else {
>  -			deduped =3D dst_file->f_op->dedupe_file_range(file, off,
>  -							len, dst_file,
>  -							info->dest_offset);
>  -			if (deduped =3D=3D -EBADE)
>  -				info->status =3D FILE_DEDUPE_RANGE_DIFFERS;
>  -			else if (deduped < 0)
>  -				info->status =3D deduped;
>  -			else
>  -				info->bytes_deduped +=3D deduped;
>  +			goto next_loop;
>   		}
>  =20
>  -next_file:
>  -		mnt_drop_write_file(dst_file);
>  -next_fdput:
>  -		fdput(dst_fd);
>  +		deduped =3D vfs_dedupe_file_range_one(file, off, dst_file,
>  +						    info->dest_offset, len);
>  +		if (deduped =3D=3D -EBADE)
>  +			info->status =3D FILE_DEDUPE_RANGE_DIFFERS;
>  +		else if (deduped < 0)
>  +			info->status =3D deduped;
>  +		else
>  +			info->bytes_deduped +=3D deduped;
>  +
>   next_loop:
>  +		fdput(dst_fd);
> -=20
>   		if (fatal_signal_pending(current))
>   			goto out;
>   	}

This is now a conflict between the overlayfs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3PDq.+gSfu/fyHtx.zi9dBt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsV1xoACgkQAVBC80lX
0GzHeAgAodf/NkFmeHgIU2udwIQxOFWOZ7n9weDPFX2+74ecLImVFfBz+LlDlrFm
ybxTNT6X0pBLU7NnX21nShZvSzmRmR8KDUY00X2SwQbjaI/WVFGH6mBUc2Ln/oOV
1bEt/W2/k/E7hzv4h3AGjUGZ9MNFXt15PLrl88+SJ0rQOXz5ybttkNqC/u/zOhH4
CUdfvukFyosvFH56syVpy0D9EI9SGylxGDnjqckM/7oHpjMo1brhsFWZFiBrHiJv
pldvnHE3+F91GxxIRaSgBBHHyI0dIS42gl6rtyHV9y4gv6k49BTR2Pfmd5rB8Ofi
ESRgkxqBODgdb7ZAhaxiFdKgtN4r2g==
=JAQ1
-----END PGP SIGNATURE-----

--Sig_/3PDq.+gSfu/fyHtx.zi9dBt--
