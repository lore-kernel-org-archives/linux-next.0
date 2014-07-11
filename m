From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tty.current tree
Date: Fri, 11 Jul 2014 11:21:08 +1000
Message-ID: <20140711112108.7631911b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PKO45VwQAhZvFnBhKmzQb6O"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Hurley <peter@hurleysoftware.com>
List-Id: linux-next.vger.kernel.org

--Sig_/PKO45VwQAhZvFnBhKmzQb6O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the tty.current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from drivers/tty/serial/imx.c:42:0:
drivers/tty/serial/imx.c: In function 'imx_start_tx':
drivers/tty/serial/imx.c:570:27: error: request for member 'state' in somet=
hing not a structure or union
  if (uart_circ_empty(&port.state->xmit))
                           ^
include/linux/serial_core.h:336:34: note: in definition of macro 'uart_circ=
_empty'
 #define uart_circ_empty(circ)  ((circ)->head =3D=3D (circ)->tail)
                                  ^
drivers/tty/serial/imx.c:570:27: error: request for member 'state' in somet=
hing not a structure or union
  if (uart_circ_empty(&port.state->xmit))
                           ^
include/linux/serial_core.h:336:50: note: in definition of macro 'uart_circ=
_empty'
 #define uart_circ_empty(circ)  ((circ)->head =3D=3D (circ)->tail)
                                                  ^

Caused by commit c557d392fbf5 ("serial: Test for no tx data on tx
restart").  That can't have been build tested :-(

I have used the tty.current tree from next-20140710 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/PKO45VwQAhZvFnBhKmzQb6O
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJTvzwNAAoJEMDTa8Ir7ZwVBVQQAIzisRUHynHNZ1M5N9gjO9SY
0IMgieocJJgNwYliOlD5LFeAkBcHmjtaPsUegiaVgx1kk2Pba/7izE/ISNrrhfTr
9JbIPu6thh2s1lOa+nSOPCACyGk2+VtaDPLK7rd80znjGjEclGLYAxB+JkFnx+DO
5snC0h3MirqBEtngDuoeyZJwxrOz4r0koFa3BB2OatNa5eAHjrnxWLLJVYEhIq3W
hfwnIDaBtUDDmnYYi2FpURVvMYixPaGYIpk90OUFYYfkYeF9C/ZfcXhp7bGPAcsn
3aKF3wgy522SHLVhYM4ZGppb4woFVo3sdW1+NHgTG5nrzyMBY6zP7QFCcYaqH8YY
KKIl8nMcuCwucIQjgageF5nC+UFymawkoyQd9yVB7+QGLP+tmlMoSCXKeW98Xej8
QkoCzkQzAdlU/yoBkSkKUVDXA1bdLfazQZqeKkVa2Q4DZqdhmw0enfBli0inDRSt
h8mrG8yrztFYANy67wEUWgM0J61OT2S4zYH8gBb03VNTmVBLHg6qadkhw+LCR6yI
7MWQrFThysPgPZOxAB4fPS0iF1i2blskIsstm7B3/BY0v5xQ1YuFQ5VKAo6kxz47
OaycfejJcFTbOE7i2GnMQVsWkZumj3fvzgvmsLvePNslqGFlYQd1jRWoNNIdjTXJ
pk28vtNDA9du85iGHPhI
=bkLI
-----END PGP SIGNATURE-----

--Sig_/PKO45VwQAhZvFnBhKmzQb6O--
