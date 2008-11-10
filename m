From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: warning from build
Date: Mon, 10 Nov 2008 15:25:46 +1100
Message-ID: <20081110152546.0d13a794.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__10_Nov_2008_15_25_46_+1100_d8sn6D70jftSJqb7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54165 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752474AbYKJE0C (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 Nov 2008 23:26:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Anirban Chakraborty <anirban.chakraborty@qlogic.com>, linux-next@vger.kernel.org

--Signature=_Mon__10_Nov_2008_15_25_46_+1100_d8sn6D70jftSJqb7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

The current linux-next build (x86_64 allmodconfig) produces this warning:

drivers/scsi/qla2xxx/qla_os.c: In function 'qla2x00_probe_one':
drivers/scsi/qla2xxx/qla_os.c:1582: warning: 'mem_only' is used uninitializ=
ed in this function

Caused by commit 00aeec5c93a80145cfa939bb9c9e244b207cb48c ("[SCSI]
qla2xxx: Code changes for qla data structure refactoring") which removed
the initialisation of mem_only.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__10_Nov_2008_15_25_46_+1100_d8sn6D70jftSJqb7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkXt8oACgkQjjKRsyhoI8wxDACfbt/1Jzlm0HY501FvAGqGaY7p
RLMAn35cGvKNuUH/LWbu7IzejJ0/TgkW
=vPCe
-----END PGP SIGNATURE-----

--Signature=_Mon__10_Nov_2008_15_25_46_+1100_d8sn6D70jftSJqb7--
