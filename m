From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ceph tree with Linus' tree
Date: Sun, 22 Jul 2012 09:16:16 +1000
Message-ID: <20120722091616.3b543b935ad1febeedc3e79f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Sun__22_Jul_2012_09_16_16_+1000_QlFtgz=XX1pyGj_+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:59197 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751396Ab2GUXQ2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 21 Jul 2012 19:16:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sage Weil <sage@newdream.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <elder@inktank.com>

--Signature=_Sun__22_Jul_2012_09_16_16_+1000_QlFtgz=XX1pyGj_+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sage,

Today's linux-next merge of the ceph tree got a conflict in
net/ceph/messenger.c between commit 5bdca4e0768d ("libceph: fix messenger
retry") from Linus' tree and commit e22004235a90 ("libceph: rename
kvec_reset and kvec_add functions") from the ceph tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc net/ceph/messenger.c
index 10255e8,23073cf..0000000
--- a/net/ceph/messenger.c
+++ b/net/ceph/messenger.c
@@@ -1450,11 -1530,11 +1530,11 @@@ static int process_connect(struct ceph_
  		 * If we sent a smaller connect_seq than the peer has, try
  		 * again with a larger value.
  		 */
 -		dout("process_connect got RETRY my seq =3D %u, peer_seq =3D %u\n",
 +		dout("process_connect got RETRY_SESSION my seq %u, peer %u\n",
  		     le32_to_cpu(con->out_connect.connect_seq),
 -		     le32_to_cpu(con->in_connect.connect_seq));
 -		con->connect_seq =3D le32_to_cpu(con->in_connect.connect_seq);
 +		     le32_to_cpu(con->in_reply.connect_seq));
 +		con->connect_seq =3D le32_to_cpu(con->in_reply.connect_seq);
- 		ceph_con_out_kvec_reset(con);
+ 		con_out_kvec_reset(con);
  		ret =3D prepare_write_connect(con);
  		if (ret < 0)
  			return ret;
@@@ -1468,10 -1548,10 +1548,10 @@@
  		 */
  		dout("process_connect got RETRY_GLOBAL my %u peer_gseq %u\n",
  		     con->peer_global_seq,
 -		     le32_to_cpu(con->in_connect.global_seq));
 +		     le32_to_cpu(con->in_reply.global_seq));
  		get_global_seq(con->msgr,
 -			       le32_to_cpu(con->in_connect.global_seq));
 +			       le32_to_cpu(con->in_reply.global_seq));
- 		ceph_con_out_kvec_reset(con);
+ 		con_out_kvec_reset(con);
  		ret =3D prepare_write_connect(con);
  		if (ret < 0)
  			return ret;

--Signature=_Sun__22_Jul_2012_09_16_16_+1000_QlFtgz=XX1pyGj_+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQCzhAAAoJEECxmPOUX5FEhxAP/0Qr6zeoEEIDn9sfy8+ieyYu
+oQEAQiiUFA/zzj5v02Rjmd7bfYueWocTCE1nBOqwNV3pBMyjdmi3hSY+/Nrl7m3
vsDar2/8E8NNV5H8QPDl/MFN2PmZp/CKnn70dhU6epDBxk28GPkDa0kxi/aLRfL9
xijeIIvR/G5BOgfUvt/4sRAQaEtMmT+QI5CfMB9DsbFStX8lNOaPK9yI++ZGzjSx
Bi9uG5IBvz/75nOzGuPxDuzi7Pfl0W/dJmMKn1sjsGuhK+W1k36ZotnSpuN1YBlJ
6qwbp0rhh/uizCZECLjgRgSgoGhKG6KtNMuN3wKMSv4xtpwBDXSxy/gUXf8ec4yb
/pRIubEr7Yi0eNi1C5TbbLn3mMZcJtgtgAm+HevWprXhFNi/H2iLP8RD1pkhRrY1
HwVO+DOc8W0Px2sPBOeygGKBOGZe8avXJh7ObaBrBUUJbG+4Kdo6AYRuDfsu0MT3
uCjSw1LD1FTCIRq5H4CkbWx5Z4bHeFMrcC0fBeMDMN6Uv5Gu4oLpQYP96eLDgswT
VgWJUwmVtPkIlSsjZjWyE+arizPcpRDFQ9aI6vbDF8BBNLvEDqQ8qvCVxan8OLKT
QgPXsyZT3BjomPWLxbmjWYsaDwSBEvlI2vI6RPPBgNEczGCq0za7eObYhWBIrRrl
8nrkLtriMxbK5Dgbx9eW
=WUTA
-----END PGP SIGNATURE-----

--Signature=_Sun__22_Jul_2012_09_16_16_+1000_QlFtgz=XX1pyGj_+--
