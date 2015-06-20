From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with Linus' tree
Date: Sat, 20 Jun 2015 22:38:55 +1000
Message-ID: <20150620223855.6b83124c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/B7xkGfrBwWJ2JVQmhNsBMG2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Jens Axboe <axboe@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/B7xkGfrBwWJ2JVQmhNsBMG2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  drivers/block/Kconfig

between commit:

  b6f2098fb708 ("block: pmem: Add dependency on HAS_IOMEM")

from Linus' tree and commit:

  1ffe3c5dc311 ("libnvdimm, pmem: move pmem to drivers/nvdimm/")

from the nvdimm tree.

I fixed it up (the latter incorporated the change from the former)
and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/B7xkGfrBwWJ2JVQmhNsBMG2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhV7lAAoJEMDTa8Ir7ZwVnBUP/RngiFL7uq78+0XvLpubOAvt
XPnQ9euHqZdAmPquoL4LtlPvGTBzOHIDKrpG1+H8MAx4x5Qg1gSWN4DBSPASJabh
mlfGg208aBjGde/axV4UUUZNbRE0Gr1TnwDZbLp518wAxftMDhiinmwNonMG+aLv
y2pHxpGgkU2OYvVlfL38UngXKhxicN9WWYVMnUgO09nYkLakheFHwww9lA5mn2y0
O8+cqK3/wubtXeXLP+FT/BJ7JQkLsNDz5AID+zU5YItjEcDtUfVMLUwV24jeqNK+
IgRg4/rdpV/K1PiXqKWgdNS6jdaBhEgdBWhGbiYWfDvfr7Svo6IHTHEQV9OKLfkJ
7szYDYV4khGOoNpwN2kyY4keWPfTNVVZe5ai3xrGFAVbmv0mHxymDfr0yKUfnj3u
45HVoUyom09QUMKun3F+LweHbx8MfFl4zIVS1YYLcO0tvaByURcPs2EOXUa/aY/2
3cgKhUbOyrkZItSnNbjb8iZbs2+EG6sfTNTOl3adkd0y4cqaKBacx750xF6EM4Yh
IP2BL6ppHR8yYPaYqcCBgsHL0b5xbRTxEhzPOaVEEfIVaya9NCS9BmoAP728WseD
7wYyRROVDMbiD02JdAXG4EtXnOCsqu8FanLUy4yFqdEzpxgyrcPCYbHP7iZFlhfy
EmBOzJ0xonoXMDFqypcM
=IndM
-----END PGP SIGNATURE-----

--Sig_/B7xkGfrBwWJ2JVQmhNsBMG2--
