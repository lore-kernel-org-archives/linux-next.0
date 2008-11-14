From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Fri, 14 Nov 2008 15:20:54 +1100
Message-ID: <20081114152054.e448fde8.sfr@canb.auug.org.au>
References: <20081114151317.8ab89475.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__14_Nov_2008_15_20_54_+1100_KVIenqsiFBc97vu6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59393 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750984AbYKNEVG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 23:21:06 -0500
In-Reply-To: <20081114151317.8ab89475.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Wang Chen <wangchen@cn.fujitsu.com>, "David S. Miller" <davem@davemloft.net>, Mark McLoughlin <markmc@redhat.com>

--Signature=_Fri__14_Nov_2008_15_20_54_+1100_KVIenqsiFBc97vu6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty, Dave,

On Fri, 14 Nov 2008 15:13:17 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I fixed it up (see below) and can carry the fix.  However, netdev_priv()
> should be being used in the rr tree as it already exists in Linus' tree
> and is used elsewhere in virtio_net.c.

I guess the way forward (easiest for me :-)) is for Rusty's tree to use
netdev_priv() in that one last place in virtio_net.c and for Dave to
apply a patch to his tree that reverts just the virtio_net.c part of the
conflicting commit.

I think that will remove any conflict between the trees.  Thoughts?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__14_Nov_2008_15_20_54_+1100_KVIenqsiFBc97vu6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkc/KYACgkQjjKRsyhoI8zJUQCeISOYhjI2KTxQ1iXuuwywfO25
EIsAoJsTE+eEiIeFmMVE8w0SHKBo/iBb
=TbtY
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Nov_2008_15_20_54_+1100_KVIenqsiFBc97vu6--
