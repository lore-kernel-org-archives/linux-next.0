From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] staging/lustre/llite: get rid of backing_dev_info
Date: Thu, 22 Jan 2015 07:24:48 +1100
Message-ID: <20150122072448.1af839ea@canb.auug.org.au>
References: <20150121144558.79cb2056@canb.auug.org.au>
	<1421827847-8371-1-git-send-email-green@linuxhacker.ru>
	<54BFE4AC.5010609@kernel.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2sdZxFO2XtpBIPP=Ao4t_9H"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59286 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753667AbbAUUY4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2015 15:24:56 -0500
In-Reply-To: <54BFE4AC.5010609@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: green@linuxhacker.ru, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, "<linux-kernel@vger.kernel.org> Mailing List" <linux-kernel@vger.kernel.org>, Andreas Dilger <andreas.dilger@intel.com>, Christoph Hellwig <hch@lst.de>

--Sig_/2sdZxFO2XtpBIPP=Ao4t_9H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Wed, 21 Jan 2015 10:41:00 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 01/21/2015 01:10 AM, green@linuxhacker.ru wrote:
> > From: Oleg Drokin <green@linuxhacker.ru>
> >
> > With removal of backing_dev_info from struct address_space,
> > we don't need to assign it in Lustre either.
>=20
> Thanks Oleg, applied. Stephen, you should be able to drop the BROKEN=20
> lustre patch again.

Will do, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/2sdZxFO2XtpBIPP=Ao4t_9H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUwAsVAAoJEMDTa8Ir7ZwVeBoP/2CIvhy5rpOy++x9BlRt2mtI
3GVxJMN7/4Bd3B4LZnKXREArwM99WXFy3OLIt0QxtzN07tfuaEFaJtKckc50/Q1h
JMPsNovBdoj5Gr1DoZc3U975CiBULqtYdDbT2Mp1cHK2Sn9owEDFRCH3D73mOCS/
BCZEfRMOm3E75tRTUr6gyGGJLEdG2Dx8I7IbMxFyQgzh7wS0fFlrrGRFHclxpKf6
1Ci91GcyCWdMACx+jMzz0TO+juEkIUTEifdD9xDizHnO7GWSdzw4t7jl+7Nh0rGs
mRdOu3QsBjKyc+YX0aZswVQALnchIxuXR/5ecrtBntMSAZl6EkJWE6/VFidrtW9y
B2nON1Jh9KiHA9CfZ32xmIIqCgXwkjGVwzrVXwksH722QqF9Qc9Zx0YDtVUBeVyT
2UNuz/xMquhBUc1Tz/H9WyPBZYucGjdCWE+JzJkuMk/inEUqxhbq3FVFy+WSAdMf
Nlhvl8zf5ook5/D+sW++lTBeQNLAUal4trBX3++nA3wWVjSUcdnQjgnNnito/lmh
HTgjJcmRhO4zXk+60M6RaOTqJlRlQZSnDQphRr+49gUYQ6w+RPFmTeBV8KI3xTkV
KZilb5RVPRefLFDTRCozu8GpNNIfT6lD4TCDR/f5wJG22AzcDJ6/tA33R4DQQnLh
4MndE2yKVEYH4Q4Uur9+
=X2tG
-----END PGP SIGNATURE-----

--Sig_/2sdZxFO2XtpBIPP=Ao4t_9H--
