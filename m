From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Date: Thu, 22 Mar 2012 15:33:06 +1100
Message-ID: <20120322153306.904d471b973e0c9f7f38aa38@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__22_Mar_2012_15_33_06_+1100_jfkLdFlux=q4sqvo"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:46991 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751283Ab2CVEdQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Mar 2012 00:33:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>, Azael Avalos <coproscefalo@gmail.com>

--Signature=_Thu__22_Mar_2012_15_33_06_+1100_jfkLdFlux=q4sqvo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/platform/x86/toshiba_acpi.c: In function 'toshiba_acpi_i8042_filter=
':
drivers/platform/x86/toshiba_acpi.c:877:30: error: dereferencing pointer to=
 incomplete type

Caused by commit b2a7ad1dd939 ("toshiba_acpi: Support alternate hotkey
interfaces").

Please at least build test this! :-(

I have used the drivers-x86 from next-20120320 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__22_Mar_2012_15_33_06_+1100_jfkLdFlux=q4sqvo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPaquCAAoJEECxmPOUX5FECQwP/R8oIVUn7x60UAoIy0bg4iB8
3TqpQDEEvOUBNyzsdlurQl6gSondfiLdNsqJAOpxoj7pOIMEEa7GQ4+AJWX1e9fZ
E70xhaubzqVglZs9fHPFKY8FSN+bPg3BtHTcOdUQMM2viiiZ4oZ6E0giCjKmuW7F
LP8Phsca9lFfB9a8qjmDSYOUMgWW1pyrJv5UxKNrUkfyzCGhmgSQB4T0wBl+mv1N
fMf9sCWqeqHkxm+RW9RZtYLXIeROfqa09KY4CB+QgejV42q5rGew+/UA5Vto7PtS
qWQYbvPqYe6/NFw2WfCVCpXpPz4jKxL99gJkQ+uIbz4eBhCG0pb+sRhMx9zftBr8
CnjPUJPIVwy6iM3Ejzlrq7Rro/7BUuauSua3dIRQ+eqMnl1TXcYXXEmlEq040w5U
PLjb3ePl57iiftapqztaki3bZvjJeBfqI3w12+p2nMcl3t/ctjDcZSSbZ7shWoXp
8Tsm+iGL7SNoBIVGra9gea1f5UzCWk7InNON8C9tiH+iStJQiBBx08LNsPUM+XYz
OHu0Wgl17BX6HAlEJBkc07MdvdRhNQw6uWWrIKs4LFXG7ybcPZLNzWc1HhDWTKyH
T14WFLGa/pUAY5XXsk+/xVGfF1zwN3Q1N3zWcKWTXB9mEPcGPyyAMJV+3kFpH17c
gyxg90zHOwWUY+XdkDS9
=DPqv
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Mar_2012_15_33_06_+1100_jfkLdFlux=q4sqvo--
