From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build failure
Date: Fri, 9 Oct 2009 18:50:50 +1100
Message-ID: <20091009185050.7dfce1b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__9_Oct_2009_18_50_50_+1100_+ZIEh.nDH1ijL8yY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53073 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753006AbZJIHvf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 9 Oct 2009 03:51:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Jeff Garzik <jgarzik@redhat.com>

--Signature=_Fri__9_Oct_2009_18_50_50_+1100_+ZIEh.nDH1ijL8yY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/ata/ahci.c: In function 'ahci_gtf_filter_workaround':
drivers/ata/ahci.c:2927: error: 'struct ata_device' has no member named 'gt=
f_filter'

Caused by commit f80ae7e45a0e03da188494c6e947a5c8b0cdfb4a ("ahci: filter
FPDMA non-zero offset enable for Aspire 3810T") from Linus' tree.

gtf_filter only exists in struct ata_device when CONFIG_ATA_ACPI is set
(which it isn't on PowerPC).

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__9_Oct_2009_18_50_50_+1100_+ZIEh.nDH1ijL8yY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrO61oACgkQjjKRsyhoI8yIfwCgqZ20FRFXWwFTeffraIjmWbTf
1tMAnRoGfuW//gfILSQU0LD49s0YbxxJ
=bbBJ
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Oct_2009_18_50_50_+1100_+ZIEh.nDH1ijL8yY--
