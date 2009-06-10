From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build warning
Date: Wed, 10 Jun 2009 15:13:03 +1000
Message-ID: <20090610151303.b7d020b5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__10_Jun_2009_15_13_03_+1000_XZZ0nC2SRRzUOP6M"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756687AbZFJFNb@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__10_Jun_2009_15_13_03_+1000_XZZ0nC2SRRzUOP6M
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

drivers/char/tty_ioctl.c: In function 'tty_mode_ioctl':
drivers/char/tty_ioctl.c:950: warning: unused variable 'ktermx'

Introduced by commit 726c4346f5be00e0e48149ebe81026dcc3c9578e
("tty-mutex-untangle").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__10_Jun_2009_15_13_03_+1000_XZZ0nC2SRRzUOP6M
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEARECAAYFAkovQN8ACgkQjjKRsyhoI8x31QCff8jq9d2+AtDqgLIgHi37rByH
c7kAl0HuW4J6nZvJ+zYxXfNGjohaDwQ=
=/mkI
-----END PGP SIGNATURE-----

--Signature=_Wed__10_Jun_2009_15_13_03_+1000_XZZ0nC2SRRzUOP6M--
