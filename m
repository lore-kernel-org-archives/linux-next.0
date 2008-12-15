From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Mon, 15 Dec 2008 17:15:25 +1100
Message-ID: <20081215171525.fc9569a9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Dec_2008_17_15_25_+1100_ZOs.YjU5a3z1jLNs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51984 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751189AbYLOGPc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 01:15:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__15_Dec_2008_17_15_25_+1100_ZOs.YjU5a3z1jLNs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got conflicts in the same files
as the rr_cpumask tree plus a few more.  Coming on top of the rr_cpumask
conflicts, it was a bit much for today, so I have dropped the rr tree.
Please see if you can sort it out a bit for tomorrow.  Or at least give
me a hint as to how to fix the conflicts.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Dec_2008_17_15_25_+1100_ZOs.YjU5a3z1jLNs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklF9f0ACgkQjjKRsyhoI8y/UgCfWtKbn+wBIxdFZXAKWWr+h1rf
BeYAoImtubgjTBvewkE8Or5Q36Lo5GjO
=VyYL
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Dec_2008_17_15_25_+1100_ZOs.YjU5a3z1jLNs--
