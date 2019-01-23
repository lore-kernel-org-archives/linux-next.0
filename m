From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pm tree
Date: Thu, 24 Jan 2019 10:45:47 +1100
Message-ID: <20190124104547.34632568@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7ND3.SG5kjGcQuGL11stxx="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/7ND3.SG5kjGcQuGL11stxx=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/acpi/acpi_dbg.c: In function 'acpi_aml_init':
drivers/acpi/acpi_dbg.c:774:1: warning: label 'err_exit' defined but not us=
ed [-Wunused-label]
 err_exit:
 ^~~~~~~~

Introduced by commit

  9ec6dbfbdc0a ("ACPI: no need to check return value of debugfs_create func=
tions")

--=20
Cheers,
Stephen Rothwell

--Sig_/7ND3.SG5kjGcQuGL11stxx=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxI/KsACgkQAVBC80lX
0GyzdggApYeZJ7VDpHZOESPwoU0ccwt/Unm+IzRyl7xXCoK2KuNsDtw4XMB0ddTf
f0l9YstkRInLAzwTDD0N/YEmxt5kP0PMM7QLJyzKnSHXTUV0VFPGexSFWW6+h20w
X9VZiRwBXnurh12mB0L8ZTQedk0YZL8mDHBTQvsTOg4qMfO0OBVdKIZQ8M6qOmaG
HLmbkAQYhIyUP2aWDKUpmD/j8frZe4cErXS10JR6uIYsdJY+t4wOIw/VeKQxCk91
GEX6Na1T/Xh36fUd3K8a+TmL8ydOhkSmyj/HzQuBOsbTX6LXgSwAWj+6ERg5OhhZ
VvNqP68KujsoESx7D6Sh65MkwLQOSQ==
=LxYY
-----END PGP SIGNATURE-----

--Sig_/7ND3.SG5kjGcQuGL11stxx=--
