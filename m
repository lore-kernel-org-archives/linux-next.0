From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ubifs tree build failure
Date: Tue, 12 Aug 2008 18:42:54 +1000
Message-ID: <20080812184254.c5603b80.sfr@canb.auug.org.au>
References: <20080812162409.91834486.sfr@canb.auug.org.au>
	<48A13DB8.4090003@nokia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Aug_2008_18_42_54_+1000_e5kPNs7x_foFmCkb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38104 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751767AbYHLInD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 04:43:03 -0400
In-Reply-To: <48A13DB8.4090003@nokia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem.Bityutskiy@nokia.com
Cc: Christoph Hellwig <hch@lst.de>, linux-next@vger.kernel.org

--Signature=_Tue__12_Aug_2008_18_42_54_+1000_e5kPNs7x_foFmCkb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

On Tue, 12 Aug 2008 10:37:28 +0300 Artem Bityutskiy <Artem.Bityutskiy@nokia=
.com> wrote:
>
> I am not sure how to resolve things like this actually. I am planning to
> send ubifs-2.6.git upstream soon, so probably Christoph will be able to a=
mend
> his stuff after this. Or any other suggestion?

That is the thing to do (assuming that Linus will take your tree) as it
will push the pain back onto the one making the API change ... and (as
you say) Christoph will be able to fix it up in his patch set.

/me wonders how many more of these we will get before the next merge window=
 opens

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Aug_2008_18_42_54_+1000_e5kPNs7x_foFmCkb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkihTQ4ACgkQjjKRsyhoI8zkqwCfTKaRlOaPYat4lrkIOvelHGUH
PsEAn0Nk4PGN9Zv8Ogd74TOVM1g3lUIX
=LAAc
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Aug_2008_18_42_54_+1000_e5kPNs7x_foFmCkb--
