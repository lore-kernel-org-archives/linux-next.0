From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Thu, 16 Jul 2009 15:04:08 +1000
Message-ID: <20090716150408.e8b4c377.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__16_Jul_2009_15_04_08_+1000_lTsCgic5sAWz/yyV"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757477AbZGPFEP@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__16_Jul_2009_15_04_08_+1000_lTsCgic5sAWz/yyV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

In file included from drivers/serial/8250.c:37:
include/linux/serial_core.h: In function 'uart_handle_sysrq_char':
include/linux/serial_core.h:445: error: 'struct uart_port' has no member na=
med 'info'

I have used the version of the ttydev tree from next-20090713 (the last
error free one).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__16_Jul_2009_15_04_08_+1000_lTsCgic5sAWz/yyV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpetMgACgkQjjKRsyhoI8zemACgnUs+3TchLwTweYlXdEaFkZ9q
kv8AnROpQUDJLqwsHKhVTZEgXwhLlP+v
=J3bK
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Jul_2009_15_04_08_+1000_lTsCgic5sAWz/yyV--
