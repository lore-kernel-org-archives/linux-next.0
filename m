From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: md tree build failure
Date: Wed, 11 Mar 2009 16:27:18 +1100
Message-ID: <20090311162718.36292b71.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_Mar_2009_16_27_18_+1100_h7ntFzvaxECXHMBn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51144 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751293AbZCKF10 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2009 01:27:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>

--Signature=_Wed__11_Mar_2009_16_27_18_+1100_h7ntFzvaxECXHMBn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "raid6_empty_zero_page" [drivers/md/raid456.ko] undefined!
ERROR: "raid6_empty_zero_page" [crypto/async_tx/async_pq.ko] undefined!

Maybe caused by commit 4739d067d35c26093f4ba29a716ce9d60c36dc53
("md/raid5: move raid6 data processing to raid6_pq.ko")?

I have merged the version of the md tree from next-20090306 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__11_Mar_2009_16_27_18_+1100_h7ntFzvaxECXHMBn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm3S7YACgkQjjKRsyhoI8w6mQCghPgiYFTkr7aaJV3pNO8KF2Ew
3KAAn14m1s8y4CeFCnnNKbHS6VdSldmW
=tOdH
-----END PGP SIGNATURE-----

--Signature=_Wed__11_Mar_2009_16_27_18_+1100_h7ntFzvaxECXHMBn--
