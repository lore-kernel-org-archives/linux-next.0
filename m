From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the keystone tree with the arm-soc tree
Date: Tue, 25 Mar 2014 10:55:01 +1100
Message-ID: <20140325105501.e63fcdd78d0d604b4e5309a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6457648677019028164=="
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
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>, linux-next@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>
List-Id: linux-next.vger.kernel.org

--===============6457648677019028164==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__25_Mar_2014_10_55_01_+1100_IuY/9hO6kyanNOrR"

--Signature=_Tue__25_Mar_2014_10_55_01_+1100_IuY/9hO6kyanNOrR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Santosh,

Today's linux-next merge of the keystone tree got a conflict in
arch/arm/boot/dts/Makefile between commit ba5a37e52194 ("ARM: mvebu: Move
kirkwood DT boards into mach-mvebu") from the arm-soc tree and commit
400550ae7e77 ("ARM: dts: Build all keystone dt blobs") from the keystone
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/boot/dts/Makefile
index 94939ee0c10b,49ff796dc02e..000000000000
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@@ -82,9 -81,11 +82,12 @@@ dtb-$(CONFIG_ARCH_HIGHBANK) +=3D highbank
  	ecx-2000.dtb
  dtb-$(CONFIG_ARCH_INTEGRATOR) +=3D integratorap.dtb \
  	integratorcp.dtb
+ dtb-$(CONFIG_ARCH_KEYSTONE) +=3D k2hk-evm.dtb \
+ 	k2l-evm.dtb \
+ 	k2e-evm.dtb
 -dtb-$(CONFIG_ARCH_LPC32XX) +=3D ea3250.dtb phy3250.dtb
 -dtb-$(CONFIG_ARCH_KIRKWOOD) +=3D kirkwood-cloudbox.dtb \
 +kirkwood :=3D \
 +	kirkwood-b3.dtb \
 +	kirkwood-cloudbox.dtb \
  	kirkwood-db-88f6281.dtb \
  	kirkwood-db-88f6282.dtb \
  	kirkwood-dns320.dtb \

--Signature=_Tue__25_Mar_2014_10_55_01_+1100_IuY/9hO6kyanNOrR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTMMXZAAoJEMDTa8Ir7ZwVZBsP/RL+4nv7ZPQJc2W3/UE2XTsS
sBjeXQ+wNxMzLSFX2zpkgLZ4ubPkbNiFBfCMZJalRoKgr3AWO5T6kP+F8aIYYY6E
Jrju4PW0rkRWlw0/qzWgMOKpryT/nBuEx5sqoQlNrWs/Ww4uIP7ABugFTgZsZM6a
xZ42DkbtaN67UUhZXbHy3GwIHUHSzMQif1LZW4KHQePZwrvPjTew0RA1NBinZAMq
c4jv29bTrvkrl0Lx0YDz25oic3xZgUp/e6lAPK7wxiM+QZU1945sCSPnOqVFBJaV
zCLG+bwiL/tZNNdyk0qIMMXoHKpNeEn6oVmdviM7CdOvUg1wAkIZXO1Tx7hzvvHR
oRolNfFWNsfBMNk0KUSNmP250wQvRPKdjuQEz4f53Vf9w0wvYZYDI+8C5AR5xKN0
sF7V67XU+O71ymZmB591JYL5/tLqjQ2iGKnC1+RxqCyGxa4bYtO6LDMsrOFdGZOL
c/gbSXXEtPW8/ZCDEgPtkbqrcS6Lgm5hkNl02iAg+NHI0O655WvtRcnrIjtsmETr
FxEakoMp9YUoNX+YOKd1AIvtRrmKYwpaXHondIUPiRgbCkP/g9iQQH6wtLlOJBi5
14Au0uUf+2fAVejUdlpyoKffSmUZzQ3BKnMoLM6QHFHnxhgALkvhig8jEF1iodte
tG/GoYFgojowu4pKHtMr
=qzX6
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Mar_2014_10_55_01_+1100_IuY/9hO6kyanNOrR--


--===============6457648677019028164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6457648677019028164==--
