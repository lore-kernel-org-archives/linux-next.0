From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the openrisc tree
Date: Mon, 18 Jul 2011 18:56:08 +1000
Message-ID: <20110718185608.97377aa900b014aa010830a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__18_Jul_2011_18_56_08_+1000_Ld2MedcJAZznZge+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44803 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753554Ab1GRI4Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2011 04:56:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonas Bonn <jonas@southpole.se>

--Signature=_Mon__18_Jul_2011_18_56_08_+1000_Ld2MedcJAZznZge+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the scsi-post-merge tree got a conflict in
arch/x86/include/asm/delay.h between commit 10f53642f115 ("asm-generic:
move archictures to common delay.h") from the openrisc tree and commit
"With a non-constant 8-bit argument, a call to udelay() generates a
warning:" from the akpm tree.

I just dropped this patch from the akpm tree as the former commit
consolidated this code into asm-generic/delay.h (which doesn't solve the
problem).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__18_Jul_2011_18_56_08_+1000_Ld2MedcJAZznZge+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOI/UoAAoJEDMEi1NhKgbsxiIH/jyGpGvfWmtiifRS04MsH68c
Nwzn5OOudRFNr7qi9ff055y0DZ8nLrF7NX1ZkGejyIfoY6iEW0ihPyotPtHhFY70
jscCPE08yHl8ZKGEyV4fEQsZq2zexeyNpnlpwqEz6Q6Ox0x+nshxrG7aDPg3P5Fq
Dt0viYKf0K5Duit+xpAGj6whXFzeLeQY3NY8+lAcN2caTUOFQwQtQCUrnaJ7heVu
iuQ8hLDNXECHX2QyiHc5Wo+2jq727V82VXkAp1uTQoSjjjY7oz9jzvOBei+jyC0s
cBxezWkTLoJC+dt9VLUXAMa/a+EC/4iOI4rYKFzNo85ljGzDk9iOn+wmcg/9ESg=
=LDDa
-----END PGP SIGNATURE-----

--Signature=_Mon__18_Jul_2011_18_56_08_+1000_Ld2MedcJAZznZge+--
