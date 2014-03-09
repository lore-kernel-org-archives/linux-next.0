From: Mark Brown <broonie@kernel.org>
Subject: linux-next: build failure after merge of the arm-soc tree
Date: Sun, 9 Mar 2014 11:41:34 +0000
Message-ID: <20140309114134.502cdcae7e6a97db684d6b15@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9035146313581930458=="
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
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--===============9035146313581930458==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__9_Mar_2014_11_41_34_+0000_BIEAkRtpn+kZ3kQj"

--Signature=_Sun__9_Mar_2014_11_41_34_+0000_BIEAkRtpn+kZ3kQj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (20140309)
failed for multi_v7_defconfig like this:

ERROR (phandle_references): Reference to non-existent node or label "sysmgr"

ERROR (phandle_references): Reference to non-existent node or label "sysmgr"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/socfpga_arria5_socdk.dtb] Error 2
make[2]: *** Waiting for unfinished jobs....
ERROR (phandle_references): Reference to non-existent node or label "sysmgr"

ERROR (phandle_references): Reference to non-existent node or label "sysmgr"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/socfpga_cyclone5_sockit.dtb] Error 2
ERROR (phandle_references): Reference to non-existent node or label "sysmgr"

ERROR (phandle_references): Reference to non-existent node or label "sysmgr"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/socfpga_cyclone5_socdk.dtb] Error 2
make[1]: *** [dtbs] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [sub-make] Error 2
Build failed

I have tried using the tree from Friday instead but see following mail.

--Signature=_Sun__9_Mar_2014_11_41_34_+0000_BIEAkRtpn+kZ3kQj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTHFNuAAoJELSic+t+oim9AAQP/R0vD7+OrjVtA9GEwA+2whdF
UucbEV1dMZSvJCSItYyLvbkzr3SksrTrNNhQhtz25+rllR595N2qfOJIxjnp0X6h
PYFmxrxSay6u4rZMzoZUums6BJUPUKmdxJx5hiXpOh3VZCmEgW5UDjXJzEmWM9hP
TGdRvc2XDo/wBlZlRGptdOFCy+PVm/HCzRlGtCy22BmBdLpJUeJy7xfy1sHQUtOR
yHrOzw72l4PAPPUQqx2Tms1dSe+duXX5PL/YKNnIGGlaTr3bD7J0XcepCm5boyDH
x4dXjAQUChG/ohRzlt/ol5CVnq4vvB8cvYHKEWcyYcm0lIi5tIoaGzS37wpENtLk
yAKF8kA5ei2YWK7VQSOoWewKtPnnl21/ydMyOKLWtAOrW1BCjhtJxQ53VGexi+ha
xiGugr05+148J54SUkVDYVsDWDxcqcK9yBlKMcxK2IhvSIdYSCzkE0jfbLQanecO
rT5wiM2TDlcIDLgv4Qeil96lRRlS+bAzmemJZAjXwz/zueh/+aFyt2xPfsg2oNBv
z9i52Pmr5PqgAGl0/PeFpKy+CZzXBibgcQvpy8RSdpyft7/xwup1Q0NZ0es8mo9j
lQ/UhTKe84n3FJdu6UgZt88sSJKUgqkmV2hbMHrAMQLgG+NoXmyyzbzHT+u7uj9r
bv0uVmsxW0jlDA77SbsY
=wSGW
-----END PGP SIGNATURE-----

--Signature=_Sun__9_Mar_2014_11_41_34_+0000_BIEAkRtpn+kZ3kQj--


--===============9035146313581930458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9035146313581930458==--
