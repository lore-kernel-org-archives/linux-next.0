From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rcu tree
Date: Fri, 27 Feb 2015 13:18:56 +1100
Message-ID: <20150227131856.31dcc340@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EiSw19pVQw9v.Q5XjjPmj2r"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45675 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752986AbbB0CTF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Feb 2015 21:19:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/EiSw19pVQw9v.Q5XjjPmj2r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

After merging the rcu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

arch/x86/xen/smp.c: In function 'xen_cpu_up':
arch/x86/xen/smp.c:460:6: error: 'err' undeclared (first use in this functi=
on)
  if (err)
      ^

Caused by commit b92c23b083d6 ("x86: Use common
outgoing-CPU-notification code").

I have used the rcu tree from next-20150226 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/EiSw19pVQw9v.Q5XjjPmj2r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU79QVAAoJEMDTa8Ir7ZwVHfsP/0P4tp5/OKKHK9Kkqv3P3gLK
fc7gkWiSifdo8dz3MvmsWJN0kkQu9+G+X1KYehBtFRy08XP5Eg4u4W6MnBIBD125
2in9NEx4gdZ+qqLNqsSL9BmeRDHUSYFpGKYPQDaYRn7x+cC2mpn0TXN8aDiVCbU5
q65ndLhfNRSBwgsdke/w1u28W1aPltVhUz5FEBIORkwFQ1KriXtLqntjHdQ+LVE/
2pbMJTlXLNRvz/YESGEjPQo1Nw80A6VYT+bkxxma3Vi9XZoNnrWW1UeKhHicCfJY
qQFO2WOBr9PVvf3v3QdszDlUZR6Y5M/TLw4bXBX7ualc762/05cJOWv4kJTJa4C6
A3zpV4TqR4+SVrUL2XBvT7z2pWGg4TgZfmfaAoA+cpP7p4j2BwkUbCc41kEOpzc8
WKmz7wf3gEgUWC4HVFbkd3C23cZDBkWT2O/bO6NNCkpzivNoM5bAjR5l+akQGle8
9Lfj0JeUe6A5+djjnSQUND3sn5bX7OjgtvlEo0K2P9lnPAShgybIGDJLqFQZ95Wg
YZd7zcEJgt6/piOtbSW7ZwPmTTgwFBq1Y2aI29BWlceai8++IdCCckmeRzAfbiGy
HrXrK6+e7QqE88fSGmNYCxSntdRe0t6OOwZHE2DpDdFDpttFppXdWun2+61C7v1h
cj85qQDafVnGfI1iXvs4
=twrj
-----END PGP SIGNATURE-----

--Sig_/EiSw19pVQw9v.Q5XjjPmj2r--
