From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Wed, 3 Jun 2015 13:33:22 +1000
Message-ID: <20150603133322.78302d08@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.0RccQCoThOoRYZi07w25YF"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37898 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751393AbbFCDd3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Jun 2015 23:33:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

--Sig_/.0RccQCoThOoRYZi07w25YF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
mm/page-writeback.c between commit 464d1387acb9 ("writeback: use |1
instead of +1 to protect against div by zero") from Linus' tree and
commit de1fff37b278 ("writeback: s/bdi/wb/ in mm/page-writeback.c")
from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/page-writeback.c
index eb59f7eea508,e1514d5b4e9b..000000000000
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@@ -802,27 -990,27 +990,27 @@@ static void wb_position_ratio(struct di
  	 * threshold, so that the occasional writes won't be blocked and active
  	 * writes can rampup the threshold quickly.
  	 */
- 	bdi_thresh =3D max(bdi_thresh, (limit - dirty) / 8);
+ 	wb_thresh =3D max(wb_thresh, (limit - dtc->dirty) / 8);
  	/*
- 	 * scale global setpoint to bdi's:
- 	 *	bdi_setpoint =3D setpoint * bdi_thresh / thresh
+ 	 * scale global setpoint to wb's:
+ 	 *	wb_setpoint =3D setpoint * wb_thresh / thresh
  	 */
- 	x =3D div_u64((u64)bdi_thresh << 16, thresh | 1);
- 	bdi_setpoint =3D setpoint * (u64)x >> 16;
 -	x =3D div_u64((u64)wb_thresh << 16, dtc->thresh + 1);
++	x =3D div_u64((u64)wb_thresh << 16, dtc->thresh | 1);
+ 	wb_setpoint =3D setpoint * (u64)x >> 16;
  	/*
- 	 * Use span=3D(8*write_bw) in single bdi case as indicated by
- 	 * (thresh - bdi_thresh ~=3D 0) and transit to bdi_thresh in JBOD case.
+ 	 * Use span=3D(8*write_bw) in single wb case as indicated by
+ 	 * (thresh - wb_thresh ~=3D 0) and transit to wb_thresh in JBOD case.
  	 *
- 	 *        bdi_thresh                    thresh - bdi_thresh
- 	 * span =3D ---------- * (8 * write_bw) + ------------------- * bdi_thre=
sh
- 	 *          thresh                            thresh
+ 	 *        wb_thresh                    thresh - wb_thresh
+ 	 * span =3D --------- * (8 * write_bw) + ------------------ * wb_thresh
+ 	 *         thresh                           thresh
  	 */
- 	span =3D (thresh - bdi_thresh + 8 * write_bw) * (u64)x >> 16;
- 	x_intercept =3D bdi_setpoint + span;
+ 	span =3D (dtc->thresh - wb_thresh + 8 * write_bw) * (u64)x >> 16;
+ 	x_intercept =3D wb_setpoint + span;
 =20
- 	if (bdi_dirty < x_intercept - span / 4) {
- 		pos_ratio =3D div64_u64(pos_ratio * (x_intercept - bdi_dirty),
- 				      (x_intercept - bdi_setpoint) | 1);
+ 	if (dtc->wb_dirty < x_intercept - span / 4) {
+ 		pos_ratio =3D div64_u64(pos_ratio * (x_intercept - dtc->wb_dirty),
 -				      x_intercept - wb_setpoint + 1);
++				      (x_intercept - wb_setpoint) | 1);
  	} else
  		pos_ratio /=3D 4;
 =20

--Sig_/.0RccQCoThOoRYZi07w25YF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbnWHAAoJEMDTa8Ir7ZwVR1sP/2iHcRLNgJmjh+2jsB9aJz3Q
fTe1QfvDafQzlJJZ01kPXTGWP2F1QT/QgGmcWc2aKumM6mBiYdtKIhkgRfRC8FVn
hOWrmJip9XfuP3e1lI9e3k7fhSflJmV/pnYepa5XzWVDLAhJ6pt09HJnPNqTvwH3
dLyN4VTl7LJikDeSFC3Mi43WZqUwJEqKaihn6FqZEwxvbl6X5meys9XKEXtB2eZp
i7RBYHQP+PCZfz0DjHu3s1NHnbD6ciZba7xhpWWI+n6vWEc2LgHjgZUV8Y8lph+Q
cIae+BQjAjcomhw0Csgs4STko8r5gErazzBJu0IaKYUDH0CBTRfGZctucyzPSTul
kyGXtJDHFoQ1x5xCXwlnemjyhPxRSNfAUNxc3hH5Q7nJhFY2vuj6M+TKBBy/YnsX
Ux6k3p9bABXD8QRbRqbOpAhtCYjrpHwxUL0q0/m6DKsZPSI/8ifIHrDniI7j/7Sw
ShmdFGmNCR+sgvucxRIJaMZxNn9m1rzQ2lnfFEZ1Lm2B14pNB+bg7fFIv5ctSoB4
XY0XIYhDAnWNlsfPKcJonmuNJPuxpBSQnjP26+RaSWu5me7R4WhiDY+MXppmQ1dd
MQY0FXbtYlZgkmRIXo/mH/ADIFHY+5o6PsEP7hiC8cmW7JrivMVEx0qq5n97Yn8t
erj+ZbrE15ods4k0e4eZ
=ifz8
-----END PGP SIGNATURE-----

--Sig_/.0RccQCoThOoRYZi07w25YF--
