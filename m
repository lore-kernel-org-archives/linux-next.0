From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [next-20091231] linux-next builds fine, but panics at runtime
Date: Tue, 12 Jan 2010 12:58:33 +1100
Message-ID: <20100112125833.60597593.sfr@canb.auug.org.au>
References: <5a44caba1001111228m126d9524g1384d3518915b306@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Jan_2010_12_58_33_+1100_dSsxRDRncpg3kHAY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53710 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751243Ab0ALB6i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jan 2010 20:58:38 -0500
In-Reply-To: <5a44caba1001111228m126d9524g1384d3518915b306@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ken Lewis <kennylewis@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__12_Jan_2010_12_58_33_+1100_dSsxRDRncpg3kHAY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ken,

On Mon, 11 Jan 2010 20:28:41 +0000 Ken Lewis <kennylewis@gmail.com> wrote:
>
> I'm havng some problems testing linux-next at the moment.  I'm able to
> build each release but the kernel panics at boot.  The problem's been
> about since the start of December and I haven't managed to find what
> portion of my .config and the loophole in the build system that allow
> this to happen.  Can anyone else help me?
>=20
> Arch: x86_64
> trees built: next-20091201, next-20091215, next20091231 (among others
> which I didn't keep r ecord of).  Am building next-20100111 atm to
> test.

Have you tried building and booting (with the same config) just the
version of Linus' kernel that those next- kernel's were built on?  (Just
as a sanity check)  For next-20091231, Linus' kernel was commit
05a625486efc3209ae4d98e253dafa6ce0124385 (for example).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Jan_2010_12_58_33_+1100_dSsxRDRncpg3kHAY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktL10kACgkQjjKRsyhoI8zNFwCgoOz/tM3mGkROpWq7LWR3WVBu
9YUAoKrnaPpabaGYNLDXbNkXMgw6WBMI
=rXqo
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Jan_2010_12_58_33_+1100_dSsxRDRncpg3kHAY--
