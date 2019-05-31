From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] firmware_loader: fix build without sysctl
Date: Fri, 31 May 2019 11:32:16 +1000
Message-ID: <20190531113216.796bb933@canb.auug.org.au>
References: <20190531012649.31797-1-mcroce@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TPqHE_Oa=ZmOD5cJXg/Xd=E"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531012649.31797-1-mcroce@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matteo Croce <mcroce@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/TPqHE_Oa=ZmOD5cJXg/Xd=E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Just cc'ing Andrew who is currently carrying the patch that this fixes.]

On Fri, 31 May 2019 03:26:49 +0200 Matteo Croce <mcroce@redhat.com> wrote:
>
> firmware_config_table has references to the sysctl code which
> triggers a build failure when CONFIG_PROC_SYSCTL is not set:
>=20
>     ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x30): undef=
ined reference to `sysctl_vals'
>     ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x38): undef=
ined reference to `sysctl_vals'
>     ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x70): undef=
ined reference to `sysctl_vals'
>     ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x78): undef=
ined reference to `sysctl_vals'
>=20
> Put the firmware_config_table struct under #ifdef CONFIG_PROC_SYSCTL.
>=20
> Fixes: 6a33853c5773 ("proc/sysctl: add shared variables for range check")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Matteo Croce <mcroce@redhat.com>
> ---
>  drivers/base/firmware_loader/fallback_table.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/base/firmware_loader/fallback_table.c b/drivers/base=
/firmware_loader/fallback_table.c
> index 58d4a1263480..18d646777fb9 100644
> --- a/drivers/base/firmware_loader/fallback_table.c
> +++ b/drivers/base/firmware_loader/fallback_table.c
> @@ -23,6 +23,8 @@ struct firmware_fallback_config fw_fallback_config =3D {
>  };
>  EXPORT_SYMBOL_GPL(fw_fallback_config);
> =20
> +#ifdef CONFIG_PROC_SYSCTL
> +
>  struct ctl_table firmware_config_table[] =3D {
>  	{
>  		.procname	=3D "force_sysfs_fallback",
> @@ -45,3 +47,5 @@ struct ctl_table firmware_config_table[] =3D {
>  	{ }
>  };
>  EXPORT_SYMBOL_GPL(firmware_config_table);
> +
> +#endif
> --=20
> 2.21.0
>=20

--=20
Cheers,
Stephen Rothwell

--Sig_/TPqHE_Oa=ZmOD5cJXg/Xd=E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwhCAACgkQAVBC80lX
0Gw0qQf/evM65VBHkhgx3KVeMRBmdSccZ9FHYEeofJFXMPJwh2vm4AEAws/PYLRH
RL529NygtdmzuK6f/+GKNvbRVXWR2KA2/iBxPFvQOq1aAQDeomLVGrgIXTApy/5D
44ddPNZaVDLToM894A+DKetLxq8p1+ir9KAa+ZEM5EbZbd34vWJkC8u0HtMscmFW
zyvpA8d2YBZ+okjdI89AHFbhYnD7x81+ukkNxTkU3Xiy6syyuit5c/JIjHDzTP4a
nlHygjsJjVXusYBJVHS+HU2hN6s6+NCVtFCaLeIdp8SJvki/OXsvJuZPMZuxVbgk
pzZDpKGs3wSJxfyOqvyZET0wdWNyOg==
=MEoS
-----END PGP SIGNATURE-----

--Sig_/TPqHE_Oa=ZmOD5cJXg/Xd=E--
