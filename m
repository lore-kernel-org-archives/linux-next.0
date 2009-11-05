From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] BUILD_BUG_ON: make it handle more cases
Date: Thu, 5 Nov 2009 17:38:42 +1100
Message-ID: <20091105173842.c94ba501.sfr@canb.auug.org.au>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com>
	<200910201415.34361.rusty@rustcorp.com.au>
	<20091105112020.33f02552.sfr@canb.auug.org.au>
	<200911051658.36265.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Nov_2009_17_38_42_+1100_SZeMKZxOLvyDot_C"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39188 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750965AbZKEGip (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Nov 2009 01:38:45 -0500
In-Reply-To: <200911051658.36265.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Hollis Blanchard <hollisb@us.ibm.com>, Jan Beulich <JBeulich@novell.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

--Signature=_Thu__5_Nov_2009_17_38_42_+1100_SZeMKZxOLvyDot_C
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Thu, 5 Nov 2009 16:58:36 +1030 Rusty Russell <rusty@rustcorp.com.au> wro=
te:
>
> Huh?  virtio_has_feature does:
>=20
> 	if (__builtin_constant_p(fbit))
> 		BUILD_BUG_ON(fbit >=3D 32);
> 	else
> 		BUG_ON(fbit >=3D 32);

In Linus' tree (and linux-next) it looks like this:

static inline bool virtio_has_feature(const struct virtio_device *vdev,
				      unsigned int fbit)
{
	/* Did you forget to fix assumptions on max features? */
	MAYBE_BUILD_BUG_ON(fbit >=3D 32);

	if (fbit < VIRTIO_TRANSPORT_F_START)
		virtio_check_driver_offered_feature(vdev, fbit);

	return test_bit(fbit, vdev->features);
}

> So, if it's not a constant, gcc should throw away that first branch.  If =
it
> is, it should optimize it away (and no, these are not real bugs AFAICT).

Your version above may well fix the problem.  Alternatively marking it
__always_inline way work as well.

> I did a 4.3.3 allmodconfig with this patch on 64-bit a few days back and =
all
> was fine.  Will try 4.4.0 now.

4.4 is more problematic.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Nov_2009_17_38_42_+1100_SZeMKZxOLvyDot_C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrycvIACgkQjjKRsyhoI8zEUQCguFj9rHXs225EZcpiT0uBdE7x
MjgAniNI+UanGyo+xLtXFeTHIez3L0hb
=AB2V
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Nov_2009_17_38_42_+1100_SZeMKZxOLvyDot_C--
