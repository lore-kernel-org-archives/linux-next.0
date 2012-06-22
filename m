From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slave-dma tree
Date: Fri, 22 Jun 2012 13:00:49 +1000
Message-ID: <20120622130049.05d18e86de1256aa980566b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__22_Jun_2012_13_00_49_+1000_eJnG3snz1Po/U6gj"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhangfei Gao <zhangfei.gao@marvell.com>, Leo Yan <leoy@marvell.com>, Qiao Zhou <zhouqiao@marvell.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__22_Jun_2012_13_00_49_+1000_eJnG3snz1Po/U6gj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/dma/mmp_tdma.c:21:27: fatal error: mach/regs-icu.h: No such file or=
 directory

Caused by commit c6da0ba8dfc8 ("dmaengine: mmp_tdma: add mmp tdma
support").

I have used the slave-dma tree from next-20120621 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__22_Jun_2012_13_00_49_+1000_eJnG3snz1Po/U6gj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJP49/hAAoJEECxmPOUX5FEyswP/j+eEexXZaNXwY+q+Ii3RJKf
iAs3vS6rzbY3LNA0amMbaLMMO2M3JymvCtoBmYeI+gkaFo0xeZtYCQCcUEjG2ygo
X4dkNFGFlVbIIILvr0sf/Uua3v2s0mHXWtPm3XR6Kg7kXPAVYNLTcJaPDSoscQQC
NZgjvjGUNb68HyLu75wrXi30A3gk4DkgJ5jkLu+f2z6j02Fumx1nJJmjrYq5J8f8
a3iPmXweLZBxQbVrZwZM5PrETgsA6DI+JgdmFTwpkpeIA9TTOmkbCtrZ/l2+RSkg
EKyD6IL80kne9+Y4z5p8f/wpXWiZ12XtTBbuixUA9petpXbCUdNO+Nnp1f50kuYz
5ICWJDIs/VcLKgXCbX8uQsd3lEOxBAjv8wzPnPY2OeTdNtAPlJjf5mdU9sTnuX9l
B4eUWUOMLiwlY7cKlyYr9H9p9NDZ/qlSuWLMcgJdbJYshrgIbeYXqIiVY/s91J80
lnGHEzZq/sw9ofG55PFgVZZiIopB8oTZBcoa6tXIR4i6++U9h7Q0yo4g3BXkIn0M
pUP58l9IQxPeG7ph55q+KaykM9sc4zhVinmQThXZp5YST5aYO3ZnGhkTfuf4zPfF
j6kpXAihA06B44mt1hu/rGybRCvq+b78xZ85Lefs74WU/HH5775vILjDeOrSbwRq
UXCWrGNQmIBAG+rvQYjs
=XDM9
-----END PGP SIGNATURE-----

--Signature=_Fri__22_Jun_2012_13_00_49_+1000_eJnG3snz1Po/U6gj--
