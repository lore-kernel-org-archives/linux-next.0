From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfsd/cpus4096 merge conflict
Date: Wed, 11 Jun 2008 14:40:37 +1000
Message-ID: <20080611144037.3382eaf7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_Jun_2008_14_40_37_+1000_T71xf6ejBFduObrQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52276 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751124AbYFKEkx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 00:40:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Jeff Layton <jlayton@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Wed__11_Jun_2008_14_40_37_+1000_T71xf6ejBFduObrQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Today's linux-next merge of the nfsd tree got a conflict in
net/sunrpc/svc.c between commit 3f9b48a7584851997702cdc3f58e7811b5546397
("net: Pass reference to cpumask variable in net/sunrpc/svc.c") from the
cpus4096 tree and commit 89a8922f36389cd4a284e5d7727cd792ef4544e0
("knfsd: convert knfsd to kthread API") from the nfsd tree.

It appears that the cpus4096 patch may no longer be needed as it was just
changing "set_cpus_allowed(current, oldmask)" to "set_cpus_allowed_ptr
(current, &oldmask)" in __svc_create_thread() which has been removed and
there doesn't appear to be any new calls to set_cpus_allowed added.

I could be wrong, so it is probably worth checking.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__11_Jun_2008_14_40_37_+1000_T71xf6ejBFduObrQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhPV0UACgkQTgG2atn1QN/MGgCeO4LjFbwptAk+TCgGUuAcWqcr
SNwAnjGbjHh08hSykMTTXHBmEp28m681
=L+kl
-----END PGP SIGNATURE-----

--Signature=_Wed__11_Jun_2008_14_40_37_+1000_T71xf6ejBFduObrQ--
