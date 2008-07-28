From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc tree build failure
Date: Mon, 28 Jul 2008 20:12:14 +1000
Message-ID: <20080728201214.c775f127.sfr@canb.auug.org.au>
References: <20080728163808.55efadb1.sfr@canb.auug.org.au>
	<20080728082114.GA11366@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__28_Jul_2008_20_12_14_+1000_DQnJrJVENVsrMzu3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59242 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750728AbYG1KMZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 06:12:25 -0400
In-Reply-To: <20080728082114.GA11366@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

--Signature=_Mon__28_Jul_2008_20_12_14_+1000_DQnJrJVENVsrMzu3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Mon, 28 Jul 2008 10:21:14 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> I cannot reproduce it here...
> Can you try to delete rm -rf usr/include/ and build again.

These builds always start with a completely empty object directory.

> If it continue to happen then try to send me a "make V=3D1" output.

Its happened every build since 20080723 ... but I will try to get a V=3D1
build.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__28_Jul_2008_20_12_14_+1000_DQnJrJVENVsrMzu3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiNm34ACgkQjjKRsyhoI8wyCwCfTOf1CpcxikriR6QJlF5TxwCU
M9cAn31Vzsdy7RBivbgJNcMlP1A6C2ab
=vRWc
-----END PGP SIGNATURE-----

--Signature=_Mon__28_Jul_2008_20_12_14_+1000_DQnJrJVENVsrMzu3--
