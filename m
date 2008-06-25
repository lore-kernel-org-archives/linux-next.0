From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Thu, 26 Jun 2008 00:24:55 +1000
Message-ID: <20080626002455.410c18de.sfr@canb.auug.org.au>
References: <20080625142034.59b343c7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Jun_2008_00_24_55_+1000_6ZgD_lhW.1FNYP/p"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48299 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758061AbYFYOZJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 10:25:09 -0400
In-Reply-To: <20080625142034.59b343c7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Bob Moore <robert.moore@intel.com>, Yinghai Lu <yhlu.kernel@gmail.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Thu__26_Jun_2008_00_24_55_+1000_6ZgD_lhW.1FNYP/p
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Jun 2008 14:20:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the acpi tree got a conflict in
> arch/x86/kernel/srat_32.c between commit
> 9920a004626a2dc2980693d634e4000f086cb283 ("x86: use acpi_numa_init to
> parse on 32-bit numa") from the  tree and commit
                                  ^
x86

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Jun_2008_00_24_55_+1000_6ZgD_lhW.1FNYP/p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhiVTcACgkQTgG2atn1QN9GzACglWqRYbM7+51APhx0fsjfHZ/Y
eYsAoIy4yWsnHORnkmqbAzh3Hs2LH/jA
=Pa08
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Jun_2008_00_24_55_+1000_6ZgD_lhW.1FNYP/p--
