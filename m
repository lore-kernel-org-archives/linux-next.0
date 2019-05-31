From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] firmware_loader: fix build without sysctl
Date: Fri, 31 May 2019 11:37:21 +1000
Message-ID: <20190531113721.5057ce05@canb.auug.org.au>
References: <20190531012649.31797-1-mcroce@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YyaG.RCnm+UzpDnp7pcS2.k"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531012649.31797-1-mcroce@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matteo Croce <mcroce@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/YyaG.RCnm+UzpDnp7pcS2.k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

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

I have added this to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/YyaG.RCnm+UzpDnp7pcS2.k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwhVEACgkQAVBC80lX
0GwXtAf/S0gkgBJMzuh2Ig4QUVdg74lBXrsaAPi3F20gk7QSZnVwk+UQa8GE0prZ
ULNovrs71Kuf7/ITaDF1fT6RCzMA7wU3GV9I1z+mXJOEYC1ZnccNorh5P6nmWCk8
seXGo/UnYsNq1ysN9HYWr6rJySXrX0A4Ad7/iLX9FaVH3P3r7f8iSDVWxGmSkzoV
VOhnc7OKhnvvoLn9xAkjvh2yIFZnU47ZdOaTx/KwAu8rWHjXMMPzwpV8t445Q6UF
cxKnHqkz9sFDcdwc2KgHOgv3ZtqSL8ZPOBcAiD6F9JweUSLEkA9K02LSHma8cblO
2njQcBgiDA+TGAr4Ot9NTYLWVktQFg==
=W7pE
-----END PGP SIGNATURE-----

--Sig_/YyaG.RCnm+UzpDnp7pcS2.k--
