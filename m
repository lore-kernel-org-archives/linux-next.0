From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the net tree with Linus' tree
Date: Wed, 14 Apr 2010 11:52:44 +1000
Message-ID: <20100414115244.f97ca080.sfr@canb.auug.org.au>
References: <20100414114556.97d7583d.sfr@canb.auug.org.au>
	<20100413.184724.112842393.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__14_Apr_2010_11_52_44_+1000_F_Z71yq=lAuUIUJ/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57236 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754456Ab0DNBwu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Apr 2010 21:52:50 -0400
In-Reply-To: <20100413.184724.112842393.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ken_kawasaki@spring.nifty.jp, jpirko@redhat.com

--Signature=_Wed__14_Apr_2010_11_52_44_+1000_F_Z71yq=lAuUIUJ/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 13 Apr 2010 18:47:24 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> Thanks a lot Stephen, I'll merge net-2.6 into net-next-2.6 to
> fix this up for you.

Thanks.

There was another conflict in drivers/net/virtio_net.c (because there is
a patch in both your tree and Linus' (via net-current)) that git did not
quite resolve correctly.  The sg_init_table() in add_recvbuf_small() was
reinserted by the automatic merge ... I removed it in my merge.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__14_Apr_2010_11_52_44_+1000_F_Z71yq=lAuUIUJ/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvFH+wACgkQjjKRsyhoI8wtTwCgiRc8wZeY8Q0o89JaXDG85IHL
S5sAn0Kxumgdg97VedVyjYQs4OtWte36
=sZDI
-----END PGP SIGNATURE-----

--Signature=_Wed__14_Apr_2010_11_52_44_+1000_F_Z71yq=lAuUIUJ/--
