From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the phy tree
Date: Tue, 4 Jun 2019 00:02:55 +1000
Message-ID: <20190604000255.38c084e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.k/a7L63NBkov+bwl0D_R_N"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: linux-next.vger.kernel.org

--Sig_/.k/a7L63NBkov+bwl0D_R_N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3ddc3f3057ff ("phy: renesas: rcar-gen2: Fix memory leak at error paths")

Fixes tag

  Fixes: 1233f59f745 ("phy: Renesas R-Car Gen2 PHY driver")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/.k/a7L63NBkov+bwl0D_R_N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz1KI8ACgkQAVBC80lX
0GwVdgf6AgnZzXI0Tsoy83ah8JTi/GgbIvsitDcjcKwY/pblvYx2aL1VMtFOP+m+
NtIZdRxwH6Sn6msGEeq5JEst2chVWWqDRAbzPm3ANT7rH88meORasAgPLLP0HzDv
f1kenI5bDjti/eC2PUch6Rdpn5Ey7qAUXYJmJFEo0Nz72lSQUUSwBuHoX+r6UQAS
H3GExOPpMO05u1vh2ZJ2s7HLQsQcVXT5Cj/uptPTJxqzvdjPDGizS2C9Y38eQqc9
fBR4FuZzAalPOytImTLWOiqb2jyUbCb/MIUAFMPDoNZ4vnk/3xRsj42NZZ5R1/pm
J+Z5ghCs3rEyzVuPx52gYhulUv5LLw==
=AcrJ
-----END PGP SIGNATURE-----

--Sig_/.k/a7L63NBkov+bwl0D_R_N--
