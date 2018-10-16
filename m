From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Tue, 16 Oct 2018 11:17:12 +1100
Message-ID: <20181016111712.33f9dc2e@canb.auug.org.au>
References: <20181003103222.6e1655cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TEftn5M8Uq_Tz9EbmG0X=IY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181003103222.6e1655cd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Daniel Rosenberg <drosen@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/TEftn5M8Uq_Tz9EbmG0X=IY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 3 Oct 2018 10:32:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> /home/sfr/next/next/fs/f2fs/super.c: In function 'f2fs_remount':
> /home/sfr/next/next/fs/f2fs/super.c:1589:16: error: 'MS_RDONLY' undeclare=
d (first use in this function); did you mean 'IS_RDONLY'?
>   if ((*flags & MS_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
>                 ^~~~~~~~~
>                 IS_RDONLY
>=20
> Caused by commit
>=20
>   dcf8001d292b ("vfs: Suppress MS_* flag defs within the kernel unless ex=
plicitly enabled")
>=20
> interacting with commit
>=20
>   f80f781514ef ("f2fs: checkpoint disabling")
>=20
> from the f2fs tree.
>=20
> I have added the following merge fix patch for today.  If it is correct,
> I assume that it could be applied to f2fs tree as the the other uses of
> MS_RDONLY have already been changed to SB_RDONLY.  (There is another
> use of MS_READONLY in this function that is already cleaned up in the
> vfs tree commit.)

Can this be applied to the f2fs tree?

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 3 Oct 2018 10:27:04 +1000
> Subject: [PATCH] f2fs: update for MS_* flags mostly going away
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/f2fs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6ed77589ff2b..b612a9e4a35e 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1586,7 +1586,7 @@ static int f2fs_remount(struct super_block *sb, int=
 *flags,
>  		goto restore_opts;
>  	}
> =20
> -	if ((*flags & MS_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
> +	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
>  		err =3D -EINVAL;
>  		f2fs_msg(sbi->sb, KERN_WARNING,
>  			"disabling checkpoint not compatible with read-only");
> --=20
> 2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/TEftn5M8Uq_Tz9EbmG0X=IY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvFLggACgkQAVBC80lX
0Gxr+Af6Am+7E3UDorrVdHgRGn5Mcozhp9qQyCdFhV419sCG6JEQ+DvsX87CdmAq
ZDr1MDKgt+Lt5jRafZgd1FDesgnGIH9mTB6d8cpl1snjjBMpX4D2lcvNN9/04nHQ
EtZhsU7+XrA3hlR/DqnQmeIhyWSQNitbftDZFTJTrw5YsXXZ7rwjX3eGbyXQxzs/
LblvZNuOjod2UDSXsojup5k+9Ur+nXPVmudEf5U0VDsJDklb/43kD8A+3VaR3oGi
H7bOCul3xDAR8mKYZYRmKP+Iu+cMyMmcKp88H4iexZSjWyd451tX5724y3RTIMwB
+3koLMQpRUKnavchWDwpCr0JL+gCig==
=yFj7
-----END PGP SIGNATURE-----

--Sig_/TEftn5M8Uq_Tz9EbmG0X=IY--
