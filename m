From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci tree build failure
Date: Wed, 7 Oct 2009 12:38:21 +1100
Message-ID: <20091007123821.043465c6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__7_Oct_2009_12_38_21_+1100_PZKP670RRusRXtA."
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933869AbZJGBjI@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__7_Oct_2009_12_38_21_+1100_PZKP670RRusRXtA.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "pci_set_cacheline_size" [drivers/pcmcia/pcmcia_core.ko] undefined!

Caused by commit 018bc96e8e27bfcafec9357ff370bf51241a7ea7 ("pccard:
configure CLS on attach") which neglected to EXPORT_SYMBOL
pci_set_cacheline_size.

I have used the version of the pci tree from next-20091006 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__7_Oct_2009_12_38_21_+1100_PZKP670RRusRXtA.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrL8Q0ACgkQjjKRsyhoI8x81ACfSwL+80+AfzH5EA+Ka+DNXOT2
+rwAnRe7tXmfpu7GW7e29/kWAK8Xlr/H
=cmtg
-----END PGP SIGNATURE-----

--Signature=_Wed__7_Oct_2009_12_38_21_+1100_PZKP670RRusRXtA.--
