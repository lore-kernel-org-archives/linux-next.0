From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi tree build failure
Date: Mon, 7 Jul 2008 22:25:28 +1000
Message-ID: <20080707222528.280f0b9e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_22_25_28_+1000_ExoozYY/ENnpcRiK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38904 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753427AbYGGMZg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 08:25:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, Robert Jennings <rcj@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, benh@kernel.crashing.org

--Signature=_Mon__7_Jul_2008_22_25_28_+1000_ExoozYY/ENnpcRiK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'map_sg_data':
drivers/scsi/ibmvscsi/ibmvscsi.c:431: error: 'FW_FEATURE_CMO' undeclared (f=
irst use in this function)
drivers/scsi/ibmvscsi/ibmvscsi.c:431: error: (Each undeclared identifier is=
 reported only once
drivers/scsi/ibmvscsi/ibmvscsi.c:431: error: for each function it appears i=
n.)
drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_queuecommand':
drivers/scsi/ibmvscsi/ibmvscsi.c:750: error: 'FW_FEATURE_CMO' undeclared (f=
irst use in this function)
drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'send_mad_adapter_info':
drivers/scsi/ibmvscsi/ibmvscsi.c:864: error: 'FW_FEATURE_CMO' undeclared (f=
irst use in this function)
drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_do_host_config':
drivers/scsi/ibmvscsi/ibmvscsi.c:1412: error: 'FW_FEATURE_CMO' undeclared (=
first use in this function)
drivers/scsi/ibmvscsi/ibmvscsi.c: At top level:
drivers/scsi/ibmvscsi/ibmvscsi.c:1769: error: unknown field 'get_io_entitle=
ment' specified in initializer
drivers/scsi/ibmvscsi/ibmvscsi.c:1769: warning: missing braces around initi=
alizer
drivers/scsi/ibmvscsi/ibmvscsi.c:1769: warning: (near initialization for 'i=
bmvscsi_driver.driver')
drivers/scsi/ibmvscsi/ibmvscsi.c:1769: warning: initialization from incompa=
tible pointer type

Caused because commit 341b56db6804040aa9559e913865108424e3b18b ("[SCSI]
ibmvscsi: driver enablement for CMO"), which was 15/16 in a series, has
been merged before any of the other patches in the series.  I have
reverted that commit.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_22_25_28_+1000_ExoozYY/ENnpcRiK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhyCzgACgkQjjKRsyhoI8yojACcDVtsntcsfDNO7xbqF+W2reIG
yJ0An1et/D1PIvSpeisIrGdELm4zpv0/
=S0yo
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_22_25_28_+1000_ExoozYY/ENnpcRiK--
