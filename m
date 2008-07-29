From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] add iommu_num_pages helper function
Date: Tue, 29 Jul 2008 22:45:56 +1000
Message-ID: <20080729224556.bcdf582a.sfr@canb.auug.org.au>
References: <20080729.031005.203132019.davem@davemloft.net>
	<20080729192834M.fujita.tomonori@lab.ntt.co.jp>
	<20080729103146.GA32407@elte.hu>
	<20080729.033342.21049184.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__29_Jul_2008_22_45_56_+1000_RZbBp/BXQfb/x1HK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47411 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751214AbYG2MqJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2008 08:46:09 -0400
In-Reply-To: <20080729.033342.21049184.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: mingo@elte.hu, fujita.tomonori@lab.ntt.co.jp, joerg.roedel@amd.com, mingo@redhat.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, bhavna.sarathy@amd.com, robert.richter@amd.com, torvalds@linux-foundation.org, akpm@linux-foundation.org, jbarnes@virtuousgeek.org, linux-next@vger.kernel.org

--Signature=_Tue__29_Jul_2008_22_45_56_+1000_RZbBp/BXQfb/x1HK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Jul 2008 03:33:42 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> From: Ingo Molnar <mingo@elte.hu>
> Date: Tue, 29 Jul 2008 12:31:46 +0200
>=20
> > i've queued up your quick fix in tip/x86/urgent to resolve the immediat=
e=20
> > -git build breakage. The wider patch can then be done on top of that,=20
> > without being rushed. Any objections to this approach?
>=20
> I do not object :-)

Neither do I. :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__29_Jul_2008_22_45_56_+1000_RZbBp/BXQfb/x1HK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiPEQQACgkQjjKRsyhoI8xNZwCfY3P7QCLB6HRFLuc/V0PStl/u
xNgAn0UdWxTaWsI8nU+hRiYwh+txTdTg
=ftIL
-----END PGP SIGNATURE-----

--Signature=_Tue__29_Jul_2008_22_45_56_+1000_RZbBp/BXQfb/x1HK--
