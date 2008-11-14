From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Fri, 14 Nov 2008 15:36:25 +1100
Message-ID: <20081114153625.1ea7e841.sfr@canb.auug.org.au>
References: <20081114151317.8ab89475.sfr@canb.auug.org.au>
	<20081114152054.e448fde8.sfr@canb.auug.org.au>
	<20081113.203059.225040990.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__14_Nov_2008_15_36_25_+1100_kH9bLTsBbHQ2DG=D"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35924 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751206AbYKNEgf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 23:36:35 -0500
In-Reply-To: <20081113.203059.225040990.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: rusty@rustcorp.com.au, linux-next@vger.kernel.org, wangchen@cn.fujitsu.com, markmc@redhat.com

--Signature=_Fri__14_Nov_2008_15_36_25_+1100_kH9bLTsBbHQ2DG=D
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, 13 Nov 2008 20:30:59 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> I'm open to just about anything that doesn't involve
> rebasing my tree :)

The only issue would be if you have patches to remove/rename the netdev
priv field - they would have to be delayed until after Rusty's tree was
merged, or someone could submit a trivial patch to Linus to do that last
netdev_priv() conversion in virtio_net.c and you could both rebase/merge
that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__14_Nov_2008_15_36_25_+1100_kH9bLTsBbHQ2DG=D
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkdAEkACgkQjjKRsyhoI8xS6wCfZ8dAT+4+Om4LwQ+fcVUUG1IM
3bMAni1ylePWpjBkFamZRupoaG88DpRQ
=cYcs
-----END PGP SIGNATURE-----

--Signature=_Fri__14_Nov_2008_15_36_25_+1100_kH9bLTsBbHQ2DG=D--
