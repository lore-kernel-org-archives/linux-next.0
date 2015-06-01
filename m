From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with Linus'
 tree
Date: Mon, 1 Jun 2015 21:05:40 +1000
Message-ID: <20150601210540.6ed03c8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BVe0UGtF0_OJ8q8DPLkZ2nO"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51871 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751081AbbFALFt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 07:05:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

--Sig_/BVe0UGtF0_OJ8q8DPLkZ2nO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in
drivers/target/target_core_pr.c between commit d588cf8f618d (target:
Fix se_tpg_tfo->tf_subsys regression + remove tf_subsystem"") from
Linus' tree and commits c6eec4d58f5d ("target: remove tf_subsystem
pointers") and 293f3c05b01a ("target: Convert
se_node_acl->device_list[] to RCU hlist") from the target-updates tree.

I fixed it up (again, the first of the target-updates trees patches is
a subset of the one in Linus' tree) and can carry the fix as necessary
(no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/BVe0UGtF0_OJ8q8DPLkZ2nO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbDyJAAoJEMDTa8Ir7ZwVe9cP/2fvbe4lW0cBnoGbfT3lfUHM
0uonGewLgPsY5WqxD4kkMiYIgj5pBb30rtpDgtqLAbwPWsns8kMVgjEb7p4t1lF4
dFv+W1uQ2NkNXu8Y085IBwktbCoiViHSXMpe88NnDsSUlxtrPV6XWor/1NfC+Ji3
JK81qJVjSQoy4RvXZyQxS9ZrDsdxJHTP9RntG57AvGvTkNzi/SY0udvGME0NjZrw
eDEPhw7DGfsBUuwTTGIzKbV/FPleIOeIEiMtBbwYA2yjcWiI+yofjTZGdqvhlCNi
SKgY9suCg2UptyV3jDl4rlWmG2KO7CUp6ygExt3QfNznwc/B8U6/b/pVzuJ08VwJ
EST9qFGIcjb6OZJFZYrvpZ06kPd3b2kfbX782lqpULNJqk4GzCzPwLptZllU9BU4
nRVR/t3dlyn3R5ndJ9YxGGd2sfYmOoxQu3AUq1qPB8TJGN+LbVsIJCgI6ViEO4Hy
bFqJja5hwq3IZ8JAxbs35KdcWg2Fqsdx0OJf6O2MNeHeuk1kjC7mCgNXoxgVwr8d
C+ms0p4H3Py2apOsxZong8vqtQDdTOywLugeMtX7taBCIgGJl1TuU7ELGc+6Nqh6
qi2TCzRO4OuU9abs+3B2rcfuHrReF1x1xzFsjq5wNEUET8vxP3pR4D892Wc2rtK4
W+Ud+YWWAvQotu0TzgzL
=1hXf
-----END PGP SIGNATURE-----

--Sig_/BVe0UGtF0_OJ8q8DPLkZ2nO--
