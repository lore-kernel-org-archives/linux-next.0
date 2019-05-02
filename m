From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clk tree
Date: Fri, 3 May 2019 09:25:11 +1000
Message-ID: <20190503092511.0054911e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gFfI+SNKNCDM.A9s2hfbtor"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/gFfI+SNKNCDM.A9s2hfbtor
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/mach-omap2/omap_hwmod.c: In function '_get_clkdm':
arch/arm/mach-omap2/omap_hwmod.c:669:35: error: 'CLK_IS_BASIC' undeclared (=
first use in this function); did you mean 'CLOCKS_MASK'?
   if (__clk_get_flags(oh->_clk) & CLK_IS_BASIC)
                                   ^~~~~~~~~~~~
                                   CLOCKS_MASK
arch/arm/mach-omap2/omap_hwmod.c:669:35: note: each undeclared identifier i=
s reported only once for each function it appears in

Caused by commit

  7c36ec8a90a8 ("clk: Remove CLK_IS_BASIC clk flag")

I have used the clk tree from next-20190502 for today.  (The above commit
does not revert cleanly.)



--=20
Cheers,
Stephen Rothwell

--Sig_/gFfI+SNKNCDM.A9s2hfbtor
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzLfFcACgkQAVBC80lX
0GyepAf/W4XM6u3R+Sg7mSYJXwVPIsHCIho/yBw2mU2uJv+bFJvV+9GK+4OYmJIM
L/cJ9Y4UEHswQuyXE+n7g6k/9C2j6WK/CkMhShzYuN0bGs+mYDWILOtRt4JYVmq0
kiZZG1puq2hKnB/znXq1h3kvXeeoYjKORcXO9pvIkmI+nyhHWgtcSgQTqi2KxSM/
paRRNMQyCtR64fQMsJaVtjCnVrah/tP5nwqk87R+6kuLCem+Z8bBKcP0rdTcXqQt
f7HFkB55msnAjzAqA50iHnfQB26E+uzt45MUMTLr9gAFMUOEOynYZUxnebq1Pvw0
dR5fQq0Mm8iDH5in036CW/thbea9/w==
=QEbq
-----END PGP SIGNATURE-----

--Sig_/gFfI+SNKNCDM.A9s2hfbtor--
