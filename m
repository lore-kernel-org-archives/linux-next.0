From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the arm-soc tree
Date: Mon, 16 Jul 2018 09:13:37 +1000
Message-ID: <20180716091337.6c1b2a4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2120219123421028239=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Vinod Koul <vkoul@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============2120219123421028239==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/a1F+eL1_QBQ4gCyjhndOxb="; protocol="application/pgp-signature"

--Sig_/a1F+eL1_QBQ4gCyjhndOxb=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/arm/pxa2xx-pcm-lib.c: In function '__pxa2xx_pcm_open':
sound/arm/pxa2xx-pcm-lib.c:129:6: error: 'pxad_filter_fn' undeclared (first=
 use in this function); did you mean 'dma_filter_fn'?
      pxad_filter_fn,
      ^~~~~~~~~~~~~~
      dma_filter_fn

Caused by commit

  0d0b16b8e008 ("dmaengine: pxa: make the filter function internal")

I have used the arm-soc tree from next-20180713 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/a1F+eL1_QBQ4gCyjhndOxb=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltL1SEACgkQAVBC80lX
0GzWigf/eMLNGMN+OdgLRMTlfU9xNuofVKdAb+wrlJ7YoHL1i1FVdD0My9RviQde
AugDCBGREsIdWaaU3jchA58RyWOf+NEuNAVmbWbZukJ8YH7Yf7OeWpZyS+jR8A0m
Lvg2HbwDjJ6M2lDBNLkPLFpFPbl0TAY0tn20Qawit5+ijP3WUIIH1npWSb9eEO5/
hogpQrGd/CIoNd2Gv6zLBv3HkSB9LKP8p0WQQ/xXqCovf6tco2KIFRP/kIPvEMHw
LA0ik8flj+nmFUrUF5d/wD2C9BiCG7TMHAV1QaDCurSiTChVoXx7sGJFPV0p/0dp
SeJpCaUxfTXN3X4Bsq8vf4xcXRKqoQ==
=prR7
-----END PGP SIGNATURE-----

--Sig_/a1F+eL1_QBQ4gCyjhndOxb=--


--===============2120219123421028239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2120219123421028239==--
