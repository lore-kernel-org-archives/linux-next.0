From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build warnings
Date: Thu, 8 Jan 2009 17:44:41 +1100
Message-ID: <20090108174441.c5fc9371.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__8_Jan_2009_17_44_41_+1100_wEHo0Rqx4oIG71J9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33156 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751584AbZAHGox (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Jan 2009 01:44:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__8_Jan_2009_17_44_41_+1100_wEHo0Rqx4oIG71J9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (sparc32 defconfig) produced these new warnings
(I think they are down to the rr tree:

kernel/workqueue.c: In function 'current_is_keventd':
kernel/workqueue.c:742: warning: unused variable 'cpu'

That I have reported before.

mm/slab.c: In function 'start_cpu_timer':
mm/slab.c:865: warning: initialization from incompatible pointer type
mm/slab.c: At top level:
mm/slab.c:686: warning: 'reap_work' defined but not used

Not sure about that one.

net/xfrm/xfrm_ipcomp.c: In function 'ipcomp_decompress':
net/xfrm/xfrm_ipcomp.c:48: warning: unused variable 'cpu'
net/xfrm/xfrm_ipcomp.c: In function 'ipcomp_compress':
net/xfrm/xfrm_ipcomp.c:142: warning: unused variable 'cpu'

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__8_Jan_2009_17_44_41_+1100_wEHo0Rqx4oIG71J9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklloNkACgkQjjKRsyhoI8zESQCcDjyyN/HEKjCSuJslXfGeJ7OZ
becAnjOhQ6XOLv/kzVRM8T3wx1aR5UaX
=zMTB
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Jan_2009_17_44_41_+1100_wEHo0Rqx4oIG71J9--
