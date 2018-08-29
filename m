From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Add SoundWire tree to linux-next
Date: Thu, 30 Aug 2018 07:50:10 +1000
Message-ID: <20180830075010.05310cfd@canb.auug.org.au>
References: <20180829171133.GL2388@vkoul-mobl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.HzYarUdFFIAuJWXgA0BcmW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829171133.GL2388@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/.HzYarUdFFIAuJWXgA0BcmW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Wed, 29 Aug 2018 22:41:33 +0530 Vinod <vkoul@kernel.org> wrote:
>
> I maintain the SoundWire subsystem which get merged to Linus thru Greg's
> char-misc tree. I would now like this to be added to Linux-next and after
> the Greg's char-misc tree.
>=20
> Please include next and fixes branches of the soundwire tree located at
> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/.HzYarUdFFIAuJWXgA0BcmW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluHFRIACgkQAVBC80lX
0GxBhgf/StOCHsRDAtjCYuqnme6EHLn4g9CJ9z5TLmZ9HQRDZRIIXvQ7NSVzGUPn
Rv2etKk8Dm8UStWdXk4OnJwHZu55pUDkKFefWh5Z4ch0/5vWtmaHlZY9U4Zc4Vbf
RyYyXA3P5xbpcNvZJDoxvjGy2gj6bly1OFjNVpVeYHXBMBWrCxDmv6CzXj/4j0Qf
YQNhXYoqgoosUozi5XS3Ms5gi4HJ/gz64VRluGgJygQ8HXCweMCzw2KMFLVMM2qP
7IwLrxt8edHrc+UrENHYtinhySnS6gelXayfuKOH2uQys+yuK3cHHltk6D2BMbxh
VAewgfom2hjxtPOkWnADNLORErX81w==
=yvLQ
-----END PGP SIGNATURE-----

--Sig_/.HzYarUdFFIAuJWXgA0BcmW--
