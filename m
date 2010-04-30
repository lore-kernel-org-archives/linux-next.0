From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (usb tree
 related)
Date: Fri, 30 Apr 2010 16:05:55 +1000
Message-ID: <20100430160555.d58bd9aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__30_Apr_2010_16_05_55_+1000_s7wkyK8WnIp0hcN1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heikki Krogerus <ext-heikki.krogerus@nokia.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__30_Apr_2010_16_05_55_+1000_s7wkyK8WnIp0hcN1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/usb/otg/twl4030-usb.c: In function 'twl4030_usb_set_bits':
drivers/usb/otg/twl4030-usb.c:238: error: implicit declaration of function =
'ULPI_SET'
drivers/usb/otg/twl4030-usb.c: In function 'twl4030_usb_clear_bits':
drivers/usb/otg/twl4030-usb.c:244: error: implicit declaration of function =
'ULPI_CLR'
drivers/usb/otg/twl4030-usb.c: In function 'twl4030_usb_set_mode':
drivers/usb/otg/twl4030-usb.c:303: error: 'ULPI_IFC_CTRL' undeclared (first=
 use in this function)
drivers/usb/otg/twl4030-usb.c:304: error: 'ULPI_IFC_CTRL_CARKITMODE' undecl=
ared (first use in this function)
drivers/usb/otg/twl4030-usb.c:306: error: 'ULPI_FUNC_CTRL' undeclared (firs=
t use in this function)
drivers/usb/otg/twl4030-usb.c:307: error: 'ULPI_FUNC_CTRL_XCVRSEL_MASK' und=
eclared (first use in this function)
drivers/usb/otg/twl4030-usb.c:308: error: 'ULPI_FUNC_CTRL_OPMODE_MASK' unde=
clared (first use in this function)

Caused by commit 57983872ff14cba23d6404a40c89e52063c94854 ("usb: otg:
twl4030: use the global ULPI register definitions").  I have reverted
that commit for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__30_Apr_2010_16_05_55_+1000_s7wkyK8WnIp0hcN1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvac0MACgkQjjKRsyhoI8w8VgCeJzMCgVZDkDpFqaXcU6Eg0cbh
qFYAnRcxsiqRQ6adSRlFSxybZTw9sY/A
=fG9L
-----END PGP SIGNATURE-----

--Signature=_Fri__30_Apr_2010_16_05_55_+1000_s7wkyK8WnIp0hcN1--
