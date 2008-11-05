From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Wed, 5 Nov 2008 15:56:20 +1100
Message-ID: <20081105155620.8da6ac84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Nov_2008_15_56_20_+1100_OLDcBmHZ.abnpmZH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43763 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754517AbYKEE4b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Nov 2008 23:56:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>

--Signature=_Wed__5_Nov_2008_15_56_20_+1100_OLDcBmHZ.abnpmZH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the creds tree got a conflict in
security/selinux/hooks.c between commit
41d9f9c524a53477467b7e0111ff3d644198f191 ("SELinux: hold tasklist_lock
and siglock while waking wait_chldexit") from security-testing tree and
commit a3338909826d32d821158a6adc43ce0a1654b31d ("CRED: Make execve()
take advantage of copy-on-write credentials") from the creds tree.

I can't see how to fix this easily, so I will have to drop the tree for
today.  Please try the merge for yourself and see if you can come up with
a solution, thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Nov_2008_15_56_20_+1100_OLDcBmHZ.abnpmZH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkRJ3QACgkQjjKRsyhoI8z7uwCfRNfLoi5Q5n7wRZ53CRnBogiL
HeIAnRK5lY6WvP36wG6L3AEzbE0WC4rt
=7N5o
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Nov_2008_15_56_20_+1100_OLDcBmHZ.abnpmZH--
