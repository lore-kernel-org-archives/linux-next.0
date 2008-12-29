From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Mon, 29 Dec 2008 18:51:53 +1100
Message-ID: <20081229185153.d7386451.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_18_51_53_+1100_8ex1QXdSIjd8nqqd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50254 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750862AbYL2HwP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 02:52:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>

--Signature=_Mon__29_Dec_2008_18_51_53_+1100_8ex1QXdSIjd8nqqd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
kernel/workqueue.c between commit
6cc88bc45ce8043171089c9592da223dfab91823 ("CRED: Rename is_single_threaded
() to is_wq_single_threaded()") from the Linus' tree and commit
74356d280154b04fb6d9dae10833a6ab6203735a
("cpumask:convert-kernel_workqueue.c") from the rr tree.

I fixed it up (used the rr tree version) and can carry the fix as
necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_18_51_53_+1100_8ex1QXdSIjd8nqqd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYgZkACgkQjjKRsyhoI8xvnQCeOEspoDWDDc/ovrmU9SmYODOS
f/MAn2W3e+cZRkC+BI8EuYgAO45wzS2V
=uwNm
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_18_51_53_+1100_8ex1QXdSIjd8nqqd--
