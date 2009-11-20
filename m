From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: infiniband tree build failure
Date: Fri, 20 Nov 2009 11:34:09 +1100
Message-ID: <20091120113409.1dcdc2b4.sfr@canb.auug.org.au>
References: <20091120110342.5128b8f8.sfr@canb.auug.org.au>
	<ada1vju6oa6.fsf@roland-alpha.cisco.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Nov_2009_11_34_09_+1100_HbPrqHbqqwydI+MM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49786 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757921AbZKTAeK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Nov 2009 19:34:10 -0500
In-Reply-To: <ada1vju6oa6.fsf@roland-alpha.cisco.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>
Cc: sean.hefty@intel.com, general@lists.openfabrics.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__20_Nov_2009_11_34_09_+1100_HbPrqHbqqwydI+MM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roland, Sean,

On Thu, 19 Nov 2009 16:19:29 -0800 Roland Dreier <rdreier@cisco.com> wrote:
>
>=20
>  > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>  >=20
>  > ERROR: ".__ipv6_addr_type" [drivers/infiniband/core/rdma_cm.ko] undefi=
ned!
>  >=20
>  > I have used the version of the infiniband tree from next-20091119 for
>  > today.
>=20
> Sorry, will track it down.  Sean this probably came from your patches,
> any idea off the top of your head?

Big hint:  IPV6 is not enabled in this config.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Nov_2009_11_34_09_+1100_HbPrqHbqqwydI+MM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksF5AEACgkQjjKRsyhoI8xFqQCgpknf1lbJycFpZC1Yycylug6i
4JAAnA8jI7BFO7kH87KkNfdm7ZYvQdJu
=kga6
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Nov_2009_11_34_09_+1100_HbPrqHbqqwydI+MM--
