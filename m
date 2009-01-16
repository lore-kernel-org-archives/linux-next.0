From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build problem with nfs tree (Was: Re:
 [mmotm][PATCH] fix ia64 build error)
Date: Fri, 16 Jan 2009 13:49:30 +1100
Message-ID: <20090116134930.68e783aa.sfr@canb.auug.org.au>
References: <20090115200315.EBE3.KOSAKI.MOTOHIRO@jp.fujitsu.com>
	<20090115093514.f3f6b8ff.akpm@linux-foundation.org>
	<20090116124949.7828a559.sfr@canb.auug.org.au>
	<20090115175917.8e0ae536.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__16_Jan_2009_13_49_30_+1100_x5ylrawB2nGGw4h2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40484 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754059AbZAPCti (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jan 2009 21:49:38 -0500
In-Reply-To: <20090115175917.8e0ae536.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>, David Howells <dhowells@redhat.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, LKML <linux-kernel@vger.kernel.org>, linux-ia64 <linux-ia64@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Kyle McMartin <kyle@mcmartin.ca>, Tony Luck <tony.luck@intel.com>, Trond Myklebust <trond.myklebust@fys.uio.no>

--Signature=_Fri__16_Jan_2009_13_49_30_+1100_x5ylrawB2nGGw4h2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, 15 Jan 2009 17:59:17 -0800 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> I do most of my gitting across a DSL connection.  It makes GUIs
> painful.

Yeah, I will think on it ...

> > I have dropped the nfs tree from linux-next for today.
>=20
> Just for this buglet?  That sounds a bit savage.

There was another problem with the fscache code as well.  Also, this was
reported the day before yesterday and got no response.  Also, the other
patch that added EXPORT_SYMBOL(copy_page) "recently" was from
December, *2007* ... Also, this is 2.6.30 material and they have a long
time to fix it.

Also, it is much easier on me :-)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__16_Jan_2009_13_49_30_+1100_x5ylrawB2nGGw4h2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklv9boACgkQjjKRsyhoI8wmTQCfbN1E8/S1qFd07V3Qkk/zY6bn
tw4AoKnbdYGSA1MSIvTNc/Ug3fb2Utrl
=Q7Zq
-----END PGP SIGNATURE-----

--Signature=_Fri__16_Jan_2009_13_49_30_+1100_x5ylrawB2nGGw4h2--
