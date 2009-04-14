From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: arm tree build failure
Date: Tue, 14 Apr 2009 17:48:14 +1000
Message-ID: <20090414174814.ab274d04.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Apr_2009_17_48_14_+1000_M2mwXbBVBDtofgpJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33426 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751744AbZDNHs3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2009 03:48:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__14_Apr_2009_17_48_14_+1000_M2mwXbBVBDtofgpJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

Today's linux-next build (arm em_x270_defconfig) failed like this:

arch/arm/kernel/sys_oabi-compat.c: In function 'sys_oabi_epoll_wait':
arch/arm/kernel/sys_oabi-compat.c:288: error: implicit declaration of funct=
ion 'kmalloc'
arch/arm/kernel/sys_oabi-compat.c:288: error: 'GFP_KERNEL' undeclared (firs=
t use in this function)
arch/arm/kernel/sys_oabi-compat.c:288: warning: assignment makes pointer fr=
om integer without a cast
arch/arm/kernel/sys_oabi-compat.c:301: error: implicit declaration of funct=
ion 'kfree'
arch/arm/kernel/sys_oabi-compat.c: In function 'sys_oabi_semtimedop':
arch/arm/kernel/sys_oabi-compat.c:324: error: 'GFP_KERNEL' undeclared (firs=
t use in this function)
arch/arm/kernel/sys_oabi-compat.c:324: warning: assignment makes pointer fr=
om integer without a cast
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Apr_2009_17_48_14_+1000_M2mwXbBVBDtofgpJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknkP74ACgkQjjKRsyhoI8wuDgCfSI14MbgWQHhsm58Lyns91TF5
HpMAmwSFfTIs9ZwAV5ECFJGDp89xgOtf
=Ujec
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Apr_2009_17_48_14_+1000_M2mwXbBVBDtofgpJ--
