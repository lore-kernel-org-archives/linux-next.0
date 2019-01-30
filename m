From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Wed, 30 Jan 2019 14:45:06 +1100
Message-ID: <20190130144506.44f331f1@canb.auug.org.au>
References: <20190102150140.704c4533@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=fEq3e2IYOvKjtR5gq_.ACv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190102150140.704c4533@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/=fEq3e2IYOvKjtR5gq_.ACv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 2 Jan 2019 15:01:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the vfs tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
>=20
> fs/fs_context.c: In function 'logfc':
> fs/fs_context.c:400:3: error: implicit declaration of function 'vprintk_e=
mit'; did you mean 'dev_printk_emit'? [-Werror=3Dimplicit-function-declarat=
ion]
>    vprintk_emit(0, LOGLEVEL_WARNING, NULL, 0, fmt, va);
>    ^~~~~~~~~~~~
>    dev_printk_emit
>=20
> Caused by commit
>=20
>   e6d72ffc503f ("vfs: Implement logging through fs_context")
>=20
> # CONFIG_PRINTK is not set
>=20
> I added the following hack for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 2 Jan 2019 14:57:36 +1100
> Subject: [PATCH] vfs: work around CONFIG_PRINTK=3Dn in fs_context logging=
 code
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/fs_context.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/fs/fs_context.c b/fs/fs_context.c
> index 8728d49c7871..b0324598f573 100644
> --- a/fs/fs_context.c
> +++ b/fs/fs_context.c
> @@ -391,6 +391,7 @@ EXPORT_SYMBOL(vfs_dup_fs_context);
>   */
>  void logfc(struct fs_context *fc, const char *fmt, ...)
>  {
> +#ifdef CONFIG_PRINTK
>  	va_list va;
> =20
>  	va_start(va, fmt);
> @@ -409,6 +410,7 @@ void logfc(struct fs_context *fc, const char *fmt, ..=
.)
> =20
>  	pr_cont("\n");
>  	va_end(va);
> +#endif
>  }
>  EXPORT_SYMBOL(logfc);
> =20

Ping?
--=20
Cheers,
Stephen Rothwell

--Sig_/=fEq3e2IYOvKjtR5gq_.ACv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxRHcIACgkQAVBC80lX
0GzegQf7BgKnvVT0VgDRHQtc3Jd5CY6yUJ7utN48h7AF37daU+R/p8P5aSWbXLZB
dXz42GwlfvqzJDgBzV8jHnIZpfR9qGDX2ZH2Ix//fLNFm/bsQxvy13mD5FmJyjT5
KjlPHMLKQS09mlyqpH96p47/CRRsZHnZoooW0kxotUYyBT071znv5/cCb6wTL1Ce
bb3yZmX9iL97Che7LE/0hJGx2pj09DXMkkXDarHqRi35qDUnUuEBSzBYfGVf7zK5
B9YOGRWyBHpopMP4SGo/M6fZz1GWbC0ZsP8S6jQhJpX+uPKIXkZvh7xzHm40l9e2
PWVzwVNVs/aO8gC2cXlXFjTe/imB0Q==
=3YOA
-----END PGP SIGNATURE-----

--Sig_/=fEq3e2IYOvKjtR5gq_.ACv--
