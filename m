From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the samsung tree with the arm-soc tree
Date: Mon, 24 Mar 2014 10:30:51 +1100
Message-ID: <20140324103051.59808436210b8b98f1bda0a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2528751868908908209=="
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
To: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
List-Id: linux-next.vger.kernel.org

--===============2528751868908908209==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__24_Mar_2014_10_30_51_+1100_zL..TeyR.b5jBJcj"

--Signature=_Mon__24_Mar_2014_10_30_51_+1100_zL..TeyR.b5jBJcj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kukjin,

Today's linux-next merge of the samsung tree got a conflict in
arch/arm/Kconfig.debug between commit 886545ea7d0b ("ARM: efm32: allow
uncompress debug output") from the arm-soc tree and commit 90266754801c
("ARM: SAMSUNG: use generic uncompress.h") from the samsung tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/Kconfig.debug
index e5a00d421cc4,a160744312ab..000000000000
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@@ -1167,7 -1162,7 +1167,7 @@@ config DEBUG_UNCOMPRES
  config UNCOMPRESS_INCLUDE
  	string
  	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
- 					ARCH_EXYNOS || ARCH_EFM32
 -					PLAT_SAMSUNG
++					PLAT_SAMSUNG || ARCH_EFM32
  	default "mach/uncompress.h"
 =20
  config EARLY_PRINTK

--Signature=_Mon__24_Mar_2014_10_30_51_+1100_zL..TeyR.b5jBJcj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTL260AAoJEMDTa8Ir7ZwVAlsP/jtgy/EzPH2X6sH+n9j53qeF
+R5D23VFAd3WWzdmKeW/BVifMckOKfFFJ29koeyLXqmq/Lw5JGP2a928kj0HuZvz
QHte5+kLAsRpkBHIk6bX1zwomZZGKOSFgp+aTgJOzx7+z+Q1zjX2k0hrzn2rZr6L
L28cT3rNg84EziXhYDkfJhOYXF/GW474YzTVITH+5B8GrFa/PYYcJDeNjV9VCIOO
xiNzTVua9da/UJxMPa5TKR8T5iokvEfaQ6YPRJF+mOsdl8GWc2+JgRxSnVH4I6BP
ins1K43OBc062Lvj7GYSRG5u+sMUTAkt97YXlLhLVicjssDsCk6UB/l97oN/sk/Q
koLj5UwFQJZTifH6dtgLAHgG5PDDtzCiOq/dqQVCSuBJlVKVVgt0WD4a6kpQ1q69
GcgpEflEJAg1k1XhozUcp7eoNyhHh66VU2t7BpzOaJYhSySEQ+YGXG4XOtFqXFFd
2ErDHCAoOKVvYlJkJ531XsO16J3yKHZIlfSzaZ1a3jUXXt0WVRm7h+acf8IbZ5Rc
HhXwLhXfJVJ7canQvvIvgYhroSxfp87vhq0BjHxHqyEPR75HgFa1AFI9o8CaBuw2
CBamPp5+W91jfds1KIPf6GFgDAGFrMsBo7n5lPXWoJepaf9Nsbo26v6EATMVr+VI
9eLAn64CmM54JncLFugi
=5rkL
-----END PGP SIGNATURE-----

--Signature=_Mon__24_Mar_2014_10_30_51_+1100_zL..TeyR.b5jBJcj--


--===============2528751868908908209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2528751868908908209==--
