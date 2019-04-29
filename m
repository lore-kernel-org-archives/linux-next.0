From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the arm-soc tree
Date: Tue, 30 Apr 2019 09:28:39 +1000
Message-ID: <20190430092839.767e5bf8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3958380164888748823=="
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
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============3958380164888748823==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Cr.CHQ3_ggx8N8O/fzy9HBX"; protocol="application/pgp-signature"

--Sig_/Cr.CHQ3_ggx8N8O/fzy9HBX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build
(x86_64 allmodconfig) produced this warning:

drivers/clocksource/timer-ixp4xx.c:78:20: warning: 'ixp4xx_read_sched_clock=
' defined but not used [-Wunused-function]
 static u64 notrace ixp4xx_read_sched_clock(void)
                    ^~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  13e0b4059b98 ("clocksource/drivers/ixp4xx: Add driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/Cr.CHQ3_ggx8N8O/fzy9HBX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzHiKcACgkQAVBC80lX
0Gze3AgAkfB+yWpYTkkBBg7gDbQVQDIskULEnUsU1p1GnnLuTYZNRUDde5MWc+bf
izxQ2Mpz0wWhhBMr/SDNjlcW0ssv6BOnF7L8hv6tyejN6evx4Brq9GVk9ThELILC
nwOh0nRsW1VXcFvllKFIp1KzeQPOrb+JgNKcvJVWbnWadwzVchdjORh3q6gNWysw
zd059M2SD85pPHvZzFfYF39jRTgmtMLp43PDt9cU5b79EPAmXogowTRHTLDr0WKS
ULIg6VXf2/dnFI2qSBE2aqVrvz4D2LgRnp11ldtWdHHldIPOeFG8rIV85+pndUWW
FhOxJOCsdcZYgYXFPPy8xNPl5EK+fQ==
=tCZt
-----END PGP SIGNATURE-----

--Sig_/Cr.CHQ3_ggx8N8O/fzy9HBX--


--===============3958380164888748823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3958380164888748823==--
