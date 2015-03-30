From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with the arm-soc tree
Date: Tue, 31 Mar 2015 10:21:22 +1100
Message-ID: <20150331102122.34db1c6e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZGD2x1VzVAkV.aOkaLJmCaD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Zhizhou Zhang <zhizhou.zhang@spreadtrum.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ZGD2x1VzVAkV.aOkaLJmCaD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in
arch/arm64/configs/defconfig between commit c4bb799588f6 ("arm64: Add
support for Spreadtrum's Sharkl64 Platform in Kconfig and defconfig")
from the arm-soc tree and commit 475bfd3d67fa ("arm64: defconfig:
updates for 4.1") from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm64/configs/defconfig
index f3c8619f8fe1,e07896c819ef..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -31,9 -31,12 +31,13 @@@ CONFIG_MODULES=3D
  CONFIG_MODULE_UNLOAD=3Dy
  # CONFIG_BLK_DEV_BSG is not set
  # CONFIG_IOSCHED_DEADLINE is not set
+ CONFIG_ARCH_EXYNOS7=3Dy
  CONFIG_ARCH_FSL_LS2085A=3Dy
  CONFIG_ARCH_MEDIATEK=3Dy
 +CONFIG_ARCH_SPRD=3Dy
+ CONFIG_ARCH_SEATTLE=3Dy
+ CONFIG_ARCH_TEGRA=3Dy
+ CONFIG_ARCH_TEGRA_132_SOC=3Dy
  CONFIG_ARCH_THUNDER=3Dy
  CONFIG_ARCH_VEXPRESS=3Dy
  CONFIG_ARCH_XGENE=3Dy

--Sig_/ZGD2x1VzVAkV.aOkaLJmCaD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGdp4AAoJEMDTa8Ir7ZwVV9gP/1O6oZ7Hf8vLUl3qzeVR5fzW
Q+LXPSxmv3tX/JG/4wpjZvkru/eUnRYu28FbN9ztIIjOoiPoAYFYhmkpKDfqntZI
5B7olZmKtynq5xcy2Ns6tIpU3d1dSTiMrRwWc3qmsm6kBMRUNX71217HH3xKzT04
ly2rrjveKT8W7f1TPKpudDTWoekY9XA9LEsKLNWstAgbycW6B4Vluj5AKxqosgx9
Gt6W+ehAj0QswDNxftV4Ie+PWf+2IAuA6kg0LCUEvjNcoS7YGqoBfGXpyzf8FrS8
qEtvXKOaXIW7jfThJaJu3GcMJXdBUWBt4SgXPJQvJkyb3SxFeozZJIlr02F78zOl
ECI/jcaCw1az/GLx7AAyH1jxDqoWj3gDC6tswIBCHTdGBhdAz28xbteBAHqQRCm0
71zM5+F1xhTheTmkSDFiaia4HjCGH08oUf74hKx2Y4SsiBH8Omp2BFEJx3OtExDD
8nmT2YJZVzokG4ORRM4+pqiAsHG1OHgXgOetrfxhG/PFbQ0W5YJ+vF49jg6QdOMG
mjb0KS3jTYJn7/hedfP/i5ISVivBRYupEOmSK3Eg1z1PH83OyJdIfQ5NZI20ruua
fGr/a1RlObijdpZKblpuIkFImbGdKOycEdY3JViXTnfEPg5Rdp49gw/A9YSduZqQ
LWDF4vgVhYSWdLtV0e/f
=12OG
-----END PGP SIGNATURE-----

--Sig_/ZGD2x1VzVAkV.aOkaLJmCaD--
