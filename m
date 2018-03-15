From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the tty tree
Date: Thu, 15 Mar 2018 17:43:31 +1100
Message-ID: <20180315174331.6c7b600b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ackI8q0np7VJh5Tz=d1M9Fd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bich HEMON <bich.hemon@st.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ackI8q0np7VJh5Tz=d1M9Fd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the tty tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

drivers/tty/serial/stm32-usart.c:155:12: warning: 'stm32_init_rs485' define=
d but not used [-Wunused-function]
 static int stm32_init_rs485(struct uart_port *port,
            ^~~~~~~~~~~~~~~~
drivers/tty/serial/stm32-usart.c:100:12: warning: 'stm32_config_rs485' defi=
ned but not used [-Wunused-function]
 static int stm32_config_rs485(struct uart_port *port,
            ^~~~~~~~~~~~~~~~~~

Introduced by commit

  1bcda09d2910 ("serial: stm32: add support for RS485 hardware control mode=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/ackI8q0np7VJh5Tz=d1M9Fd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqqFhMACgkQAVBC80lX
0Gy5GQf+N67+p6m6motxVAYn91y0eWQ3EIr6wcl6n+k2/4arhfqBOILx0/culEBV
J9dHeuhd3YWe4g745vssGANmBSHuaYlhuyAd9XtyOIEE7nv9vOnvX880+IZOJAye
VaEUmisNAjr58DwdDBW6+OOrJbGaEwZ4C6SF4z9d9XrJX5qms74QmI8DgPKMJSHJ
NB4ywHpZ9MmU0jc5YH2/l1bHbBvQ7fMgJX+dT2FVmbSScnXLUvevXHiRyaC8oG10
HsenwdL6p54325YwwAXm7Y5RcHZoEPxMxaqAKuo3xTB/B76baVMn68+GxrJ6p88c
yJpBmIryzOgNLHE7OeeQmfly4tVwqw==
=4ShK
-----END PGP SIGNATURE-----

--Sig_/ackI8q0np7VJh5Tz=d1M9Fd--
