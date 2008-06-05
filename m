From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr merge conflict
Date: Thu, 5 Jun 2008 14:38:59 +1000
Message-ID: <20080605143859.53705782.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Jun_2008_14_38_59_+1000_.hKXaxHObdP+q5X+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56744 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751118AbYFEEjJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Jun 2008 00:39:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mark McLoughlin <markmc@redhat.com>, Jeff Garzik <jeff@garzik.org>

--Signature=_Thu__5_Jun_2008_14_38_59_+1000_.hKXaxHObdP+q5X+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's merge of the rr tree got a conflict in drivers/net/virtio_net.c
between commits 11a3a1546d0adc36485c2ad4af7ab950712df6ff ("virtio: fix
delayed xmit of packet and freeing of old packets.") and
7eb2e25112bf920bb0a4d1cca445f3d96874c25f ("virtio: fix virtio_net xmit of
freed skb bug") from the net-current tree and commits
c95d10b237db3449ccb7c8ba1675f0bd83722d19
("virtio:net-force-callback-on-empty"),
5a37649cd6d69a0ded7cf32c89107f542ea4c69b ("virtio:net-fix-last-xmit") and
a13dd9f483bd628423b2351ca757f641370c1227
("virtio:net-fix-dangling-packets") from the rr tree. (I think :-))

Some of these commits do basically the same things, but are also mixed up w=
ith
other changes to this file in the rr tree.  I used the rr tree version
but you should check that it makes sense.  This should go away once
net-current gets merged into Linus' tree and you merge (or rebase)
against that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Jun_2008_14_38_59_+1000_.hKXaxHObdP+q5X+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhHbeMACgkQTgG2atn1QN8FFACglwEi66RqeJM02kQvwyq8Xuic
eBUAnjspQPu5yL6/N0hxcLVlGRjHgshT
=PQLs
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Jun_2008_14_38_59_+1000_.hKXaxHObdP+q5X+--
