From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [SFI-devel] linux-next: sfi tree build warning
Date: Wed, 8 Jul 2009 17:40:47 +1000
Message-ID: <20090708174047.c8abca80.sfr@canb.auug.org.au>
References: <20090708164400.f2138d79.sfr@canb.auug.org.au>
	<20090708145740.0e5e4b07@feng-desktop>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__8_Jul_2009_17_40_47_+1000_SEZ3DYG1NowTam5s"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50849 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755668AbZGHHky (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jul 2009 03:40:54 -0400
In-Reply-To: <20090708145740.0e5e4b07@feng-desktop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Feng Tang <feng.tang@intel.com>
Cc: "sfi-devel@simplefirmware.org" <sfi-devel@simplefirmware.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

--Signature=_Wed__8_Jul_2009_17_40_47_+1000_SEZ3DYG1NowTam5s
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Feng,

On Wed, 8 Jul 2009 14:57:40 +0800 Feng Tang <feng.tang@intel.com> wrote:
>
> Thanks for the finding. Could you help to test the following quick patch?
> it should works for both x86_32 and x86_64. thanks

That patch makes the warning go away for an x86_84 allmodconfig build.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__8_Jul_2009_17_40_47_+1000_SEZ3DYG1NowTam5s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpUTX8ACgkQjjKRsyhoI8yqhACggzUotAzNmioitgVpd4+lL89v
hFYAnRZqZSalJ80x17fr5PA7LRAnw+fO
=Ehk+
-----END PGP SIGNATURE-----

--Signature=_Wed__8_Jul_2009_17_40_47_+1000_SEZ3DYG1NowTam5s--
