From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Mon, 17 Dec 2018 12:36:45 +1100
Message-ID: <20181217123645.42a20fe5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/s=EaVckg9P7Zmf7rCq4zdV0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/s=EaVckg9P7Zmf7rCq4zdV0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from net/core/dev.c:148:
net/core/dev.c: In function 'napi_gro_complete':
net/core/dev.c:5364:26: error: 'inet_gro_complete' undeclared (first use in=
 this function); did you mean 'eth_gro_complete'?
       ipv6_gro_complete, inet_gro_complete,
                          ^~~~~~~~~~~~~~~~~
include/linux/indirect_call_wrapper.h:32:41: note: in definition of macro '=
INDIRECT_CALL_2'
 #define INDIRECT_CALL_2(f, name, ...) f(__VA_ARGS__)
                                         ^~~~~~~~~~~

and on ....

Caused by commit

  aaa5d90b395a ("net: use indirect call wrappers at GRO network layer")

inet_gro_complete() is declared in include/net/inet_comon.h which is
not directly included in net/core/dev.c.

I have used the net-next tree from next-20181214 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/s=EaVckg9P7Zmf7rCq4zdV0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwW/a0ACgkQAVBC80lX
0Gw64Af9HyQT8f8aIe1lmDy05kk3qwbejdAIXwmJh1Xw173EzceuvagX7OuXnYqX
6b8hXsf4h9ldDl/doUnicY4YTZZHiwak/NEE8rVmEhTU+PfnZ1qsQ3wP5XqT20I0
1PWHwEusWInGrzebADxrjexZwXn0H2FVv3DTTHd0zcV8auIZTJAWPuNrMeUzSKeT
76umWywR7dE7AeBUWUQtThLvf5VmDokcNWFDk/ShKP3h3Hj4+G3XiRNUMGgl6bbK
cRMcZeQ/15kLHdf0CxN3vPv6H1K7QBZEm0bxManwKkcbNhS98bu2ApZ9/UVu3jg8
GMlQgywVAQC+dL3YUmq86jMc+RFIXA==
=LG2H
-----END PGP SIGNATURE-----

--Sig_/s=EaVckg9P7Zmf7rCq4zdV0--
