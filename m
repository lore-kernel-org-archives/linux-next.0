From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: block tree build failure
Date: Sat, 5 Dec 2009 09:49:34 +1100
Message-ID: <20091205094934.eefdddf4.sfr@canb.auug.org.au>
References: <20091204143612.f30db275.sfr@canb.auug.org.au>
	<20091204074341.GH8742@kernel.dk>
	<20091204135422.GZ8742@kernel.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__5_Dec_2009_09_49_34_+1100_0qiK8Z_vqwZ+og0X"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50853 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751444AbZLDWte (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Dec 2009 17:49:34 -0500
In-Reply-To: <20091204135422.GZ8742@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>

--Signature=_Sat__5_Dec_2009_09_49_34_+1100_0qiK8Z_vqwZ+og0X
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Fri, 4 Dec 2009 14:54:22 +0100 Jens Axboe <jens.axboe@oracle.com> wrote:
>
> I pushed out the quick fix, just disallowing cfq=3Dm and blk cgroup in
> Kconfig. So it should work now.

Great, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__5_Dec_2009_09_49_34_+1100_0qiK8Z_vqwZ+og0X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksZkf4ACgkQjjKRsyhoI8xlcQCgkdn51TtvHLKUv019VIlGrUIH
RbEAnjV/zNdaKfxcFEN8zp3cTnt+oj/O
=3V3F
-----END PGP SIGNATURE-----

--Signature=_Sat__5_Dec_2009_09_49_34_+1100_0qiK8Z_vqwZ+og0X--
