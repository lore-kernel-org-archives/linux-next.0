From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: build failure after merge of the pci-current tree
Date: Wed, 4 Jan 2012 16:11:22 -0800
Message-ID: <20120104161122.4e9d844a@jbarnes-desktop>
References: <20120105110712.2666364926458942240d6534@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/Bu87TMNeVMnqbam4quBE38Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120105110712.2666364926458942240d6534@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Bu87TMNeVMnqbam4quBE38Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Jan 2012 11:07:12 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
>=20
> After merging the pci-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> arch/x86/pci/acpi.c:81:46: error: expected '}' before ';' token
>=20
> Caused by commit 4c33d0af35ba ("PCI: Add Dell Studio 1557 to pci=3Dnocrs
> blacklist").  Please build test your tree ...
>=20
> I have used the pci-current tree from next-20120104 for today.

Arg failure of my hand merge.  Will fix now.

--=20
Jesse Barnes, Intel Open Source Technology Center

--Sig_/Bu87TMNeVMnqbam4quBE38Q
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJPBOqqAAoJEIEoDkX4Qk9hP0YP/2z5ytZKjh+Zbpj3krgn3ydM
0m+xsvfV3ZLtvv9RQpx7nygInHX5CjgEJUswtm+X2kcFHetZ1bGHO1WWhE6EI0+R
9xsUbae8vrgA59xocuiJMBcl347FeMHiznQgAORgmEqfH86FPz3YDYKOaDiYOTGi
n4dEqg6b8EwcoesAzh1EJ6sfpa+TAWSFhT0hjOnoFBzfcYAegcbTg2Z9ljiD1VMS
w5aJlQIWj8U21WycabzHxA3zpQ6Lg8iS/23wvkPEQSQmEejmXxM4DmRECLzf6eKn
GNYQCJlt55s2Dq/ulmpeijYg5IWRZdbBUPaCTOpUFjl+BTawlFp3lMPMyleBT310
cx9qTbmPq3mlYSdErfxPN2AFNikJGzNTQRa5ZcJxsTYUyD+zA8CFnJ+yRaYKnI+2
c2xgGQiVy0CFPUc/alDoyewQp0r4KE7q+QRTiGdTbS7/7SCR6eGF5/O4jxPERNVB
73dnTLd+Ra8pe1rs2N5JvGF7PJ5Yogrk91oVw5MGoeKi5EMb1gMYYVC/d3rCEEOr
ZLxi9lJoO1CF5IpDPj8mBsIgdlFDmPPaWUD7lpvixsu9S3C0HNPXlpSjR9XK/65W
EJeoNdX7uOxxUywl02cg/L8PGfb+lJRx7jqvMcm9RYpvv8uMaBc1J3E2nOh9SL9p
ayrUhG6I7YsSnaMXmrUe
=nqMv
-----END PGP SIGNATURE-----

--Sig_/Bu87TMNeVMnqbam4quBE38Q--
