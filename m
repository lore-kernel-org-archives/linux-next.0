From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: [PATCH] infiniband/hw/ipath/ipath_sdma.c , fix
 compiler warnings
Date: Thu, 22 May 2008 10:17:14 +1000
Message-ID: <20080522101714.3f2c5a82.sfr@canb.auug.org.au>
References: <48342C6C.2010502@googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__22_May_2008_10_17_14_+1000_c55k.Xbnz4g=xY=V"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38668 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754039AbYEVAR0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 May 2008 20:17:26 -0400
In-Reply-To: <48342C6C.2010502@googlemail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gabriel C <nix.or.die@googlemail.com>
Cc: rolandd@cisco.com, Linux Kernel list <linux-kernel@vger.kernel.org>, general@lists.openfabrics.org, sean.hefty@intel.com, hal.rosenstock@gmail.com, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Thu__22_May_2008_10_17_14_+1000_c55k.Xbnz4g=xY=V
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gabriel,

We appreciate the reports, thanks.

On Wed, 21 May 2008 16:06:36 +0200 Gabriel C <nix.or.die@googlemail.com> wr=
ote:
>
> On linux-next from today, allmodconfig, I see the following warnings on 6=
4bit:

What architecture are you building on?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__22_May_2008_10_17_14_+1000_c55k.Xbnz4g=xY=V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFINLuNTgG2atn1QN8RAhQoAJ4gFNHRd6D8/2dGib87vCL36bb/ZwCbBBcX
obAKgN2E9zcK2/TgRaeFneU=
=2Ljb
-----END PGP SIGNATURE-----

--Signature=_Thu__22_May_2008_10_17_14_+1000_c55k.Xbnz4g=xY=V--
