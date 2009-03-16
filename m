From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: suspend tree build failure
Date: Mon, 16 Mar 2009 20:13:19 +1100
Message-ID: <20090316201319.cbde6e4f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Mar_2009_20_13_19_+1100_4ylhoPZm_OVFN0P."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42768 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752933AbZCPJN0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 05:13:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__16_Mar_2009_20_13_19_+1100_4ylhoPZm_OVFN0P.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/built-in.o: In function `.sysdev_suspend':
(.text+0x92170): undefined reference to `.check_wakeup_irqs'

check_wakeup_irqs is defined in kernel/irq/pm.c which is only built when
CONFIG_PM_SLEEP is set (which it isn't for this build). The call to
check_wakeup_irqs was added to sysdev_suspend in commit
73263bc09332c5c8de7c60cb76b5b24e2da66b42 ("PM: Rework handling of
interrupts during suspend-resume").

I have dropped the suspend tree temporarily for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Mar_2009_20_13_19_+1100_4ylhoPZm_OVFN0P.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm+GC8ACgkQjjKRsyhoI8yRVQCaAsO7bJnvA/FCU+Zcr8s3NInZ
ykkAnRfJl3abch37A+RPgXZY80kMVdWF
=/VC7
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Mar_2009_20_13_19_+1100_4ylhoPZm_OVFN0P.--
