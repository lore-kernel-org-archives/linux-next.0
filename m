From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Thu, 28 Aug 2008 16:42:57 +1000
Message-ID: <20080828164257.919e4748.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__28_Aug_2008_16_42_57_+1000_EBhOw8Vf651VR.w4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33564 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752151AbYH1GnM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 02:43:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Eugene Teo <eugeneteo@kernel.sg>, David Miller <davem@davemloft.net>

--Signature=_Thu__28_Aug_2008_16_42_57_+1000_EBhOw8Vf651VR.w4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the creds tree got a conflict in
drivers/net/wan/sbni.c between commit
f2455eb176ac87081bbfc9a44b21c7cd2bc1967e ("wan: Missing capability checks
in sbni_ioctl()") from the net-current tree and commit
f4d399d40debd14b22967153294b94087cbcf789 ("CRED: Wrap most current->e?[ug]
id and some task->e?[ug]id") from the creds tree.

The former changed all usages of current->euid to capable() checks.  I
used the version from the net-current tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__28_Aug_2008_16_42_57_+1000_EBhOw8Vf651VR.w4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki2SPEACgkQjjKRsyhoI8zqTwCfa7Sv70R+Sad0LE7bhLOgq0EO
z7YAnir+hdmuchVDimPit0qqvcpGJsyZ
=QqQq
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Aug_2008_16_42_57_+1000_EBhOw8Vf651VR.w4--
