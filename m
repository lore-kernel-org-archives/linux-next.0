From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the ia64 tree
Date: Wed, 16 Jul 2014 12:00:00 +1000
Message-ID: <20140716120000.3523239b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9J/5lXaP3FgQRMI5xrFXJKD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Luck <tony.luck@intel.com>
Cc: Gong Chen <gong.chen@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/9J/5lXaP3FgQRMI5xrFXJKD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ia64 tree, today's linux-next build (powerpc
ppc64_defconfig) produced these warnings (though presumably it started
yesterday):

In file included from include/ras/ras_event.h:11:0,
                 from drivers/ras/ras.c:13:
include/linux/aer.h:42:58: warning: 'struct pci_dev' declared inside parame=
ter list
 static inline int pci_enable_pcie_error_reporting(struct pci_dev *dev)
                                                          ^
include/linux/aer.h:42:58: warning: its scope is only this definition or de=
claration, which is probably not what you want
include/linux/aer.h:46:59: warning: 'struct pci_dev' declared inside parame=
ter list
 static inline int pci_disable_pcie_error_reporting(struct pci_dev *dev)
                                                           ^
include/linux/aer.h:50:65: warning: 'struct pci_dev' declared inside parame=
ter list
 static inline int pci_cleanup_aer_uncorrect_error_status(struct pci_dev *d=
ev)
                                                                 ^
include/linux/aer.h:57:14: warning: 'struct pci_dev' declared inside parame=
ter list
       struct aer_capability_regs *aer);
              ^

Introduced by commit 76ac8275f296 ("trace, RAS: Add basic RAS trace
event") and following patches.

So, presumably, aer.h either needs to include pci.h or, at least, have a

struct pci_dev;

line in it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/9J/5lXaP3FgQRMI5xrFXJKD
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJTxdylAAoJEMDTa8Ir7ZwVyCoP/jHrH9c1h9ZeimdcWRb4HbsR
FwwKHjDNoMrSQjW56+brYraaQGIItfuMOHUrwUt5x0X7yoLMiFUGbuhMqi7xIemE
UeZ4lJUYL44FIIl1hFnP3A/ppIjVLB75Fi6pkbZ2hvcGLfszZjjnFY/APTxOxTCs
nJkUOaqKDIp9r5S4elzOE/Q0D0zjhxUf/sgOgxO0VzP3cEop8KqN3z+juhwusqoW
JN7dgh/rPohs03gmfet50VQSDEVXWdJJuTfv6znRTS9m5j3COFR/PD0yK+aQeXCn
siKLy7nNHK1HdzLwJNF+POj25ArTF7nrL3+2ahJWoGDYbI8P3rWYX+AuOqs23nkt
6QJ4mSoT7WEzsaz+VhqnU2OSuPmbYLZeh9unqG0XkcaJCGwLiTLVRqS369wDKJ3H
1yRTpDQZQp2eKugFAW48f3wsAeRaK7bo5uqwnvALeJhS2JzF7lYKU7MebNxYF4yZ
Zlht5c+jNiHElpA84RF7mcIzrPJ1csBSYqZBi4ATqxtvY4D+HX0qnEKjYTXPr3LY
/u7HStJarliMK2wWXBTS8L7jz7fm6E5g0V1o4lKquNN64VE7MBtVVxhEACnVRTKR
1aAMojBul6FyGIfzcwZdz8lasB0zYpZjEKpRci6V3lBahb6sL3i5hqJWv8RcC72O
uLBmk3xiK11H8Khxjxba
=BZ4g
-----END PGP SIGNATURE-----

--Sig_/9J/5lXaP3FgQRMI5xrFXJKD--
