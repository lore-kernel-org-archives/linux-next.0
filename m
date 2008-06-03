From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: conflicts in rr merge
Date: Tue, 3 Jun 2008 14:28:29 +1000
Message-ID: <20080603142829.8831d1e9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__3_Jun_2008_14_28_29_+1000_dkGUVRtv.+Bp2DKj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34908 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751063AbYFCE2f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Jun 2008 00:28:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__3_Jun_2008_14_28_29_+1000_dkGUVRtv.+Bp2DKj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

We also got conflicts in drivers/s390/kvm/kvm_virtio.c and
drivers/virtio/virtio.c which are caused by patches being merged
upstream.  I assume that "virtio:bus_id-should-contain-virtio-name" and
"virtio:common-index-counters" need to be removed from the rr tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__3_Jun_2008_14_28_29_+1000_dkGUVRtv.+Bp2DKj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIRMhxTgG2atn1QN8RAlj9AJ4i2v5Q7rfkJjiPWQigJDsb7QY9KQCgkaYg
mBbHPt+3rwWAkhXef+KiF/E=
=UWBq
-----END PGP SIGNATURE-----

--Signature=_Tue__3_Jun_2008_14_28_29_+1000_dkGUVRtv.+Bp2DKj--
