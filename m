From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the irqchip tree with the tegra tree
Date: Mon, 16 Mar 2015 14:55:08 +1100
Message-ID: <20150316145508.62cad7d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/olD9Abgbj8/QjeH4IRoNCul"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Bob Mottram <bob.mottram@codethink.co.uk>
List-Id: linux-next.vger.kernel.org

--Sig_/olD9Abgbj8/QjeH4IRoNCul
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

Today's linux-next merge of the irqchip tree got a conflict in
arch/arm/mach-tegra/irq.c between commit 0a63e1e0617f ("ARM: tegra: Fix
big-endian issue with IRQ code") from the tegra tree and commit
1a703bffd82e ("ARM: tegra: remove old LIC support") from the irqchip
tree.

I fixed it up (the latter removed the code changed by the former) and
can carry the fix as necessary (no action is required).



--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Sig_/olD9Abgbj8/QjeH4IRoNCul
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVBlQgAAoJEMDTa8Ir7ZwV0fcP/3B3DCMSLAydwe1ZGmpJ5K1T
aDZBpF9YhxXhVqBw+oKjy1vDSm1eqAdtymjcutJkRWNkp7lq7bSc3ms1S45CFe1g
VzMGsByPiW0x7NPcavB2GEG3XhdDZK58yPRejzSnb6nJLdsK4hqrVuzRn5P0HLW1
Xpw+b/Wwh6t5gQVz6odlDnalwoWg03MMU0x8gJGlf5R/prRwtgSXqPJ0zDp4JVzq
wL4t32qflWebio/lGLwVIMXyzQFxK6/+YX/x+TmZQw8mIZaLx+J3kvUMWeSrHDUj
AjYe1kbIMkPUH9v3pumguiMT0qnrBf+BOkRVZ8ESlzLm4AaMIQ3bGKtsYriy6WAd
JGAw5o9GPoL7mcy572wtGmC5NFkkoGxRdroksPQRZHd+xwT6N0GLw137CuCpmZC6
O4IhvHZt/2fwBQErtMIBEtUJ9ixmfCRAVVuLPxzs2egOtn6VQA9gmuCCuia1PieS
V3QoYnSUP+4gyB+sPVSnhEeYhDoqXp1iS1gdbLOwhhtaBlP+1iuC/GlqOsYV65uo
R6HHlREBD/u0M34Hv1qXtgXVCZGqMzaeua31FJfYdM+v1AbgN9eTsprSqcl4VzyD
YXJKh+D1vL9T8lOeS18cQAJcCSt2xymV5gIwh08RI2DacNbeA5kW/asPndU1xI1Q
832+y3ljGARQeZ/0+cax
=BGox
-----END PGP SIGNATURE-----

--Sig_/olD9Abgbj8/QjeH4IRoNCul--
