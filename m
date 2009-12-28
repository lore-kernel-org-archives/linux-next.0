From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: slab/percpu tree build failure
Date: Mon, 28 Dec 2009 19:01:03 +1100
Message-ID: <20091228190103.afa89d66.sfr@canb.auug.org.au>
References: <20091224095848.f1586d1e.sfr@canb.auug.org.au>
	<1261986163.4641.0.camel@penberg-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__28_Dec_2009_19_01_03_+1100_/Ngapu6TrWJ/dw+v"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60483 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751380AbZL1IBK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Dec 2009 03:01:10 -0500
In-Reply-To: <1261986163.4641.0.camel@penberg-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>

--Signature=_Mon__28_Dec_2009_19_01_03_+1100_/Ngapu6TrWJ/dw+v
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

On Mon, 28 Dec 2009 09:42:43 +0200 Pekka Enberg <penberg@cs.helsinki.fi> wr=
ote:
>
> Looks good to me, thanks! I guess you should carry it in linux-next so
> that I don't need to pull percpu.git in slab.git?

That's the plan.  Thanks for the confirmation.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__28_Dec_2009_19_01_03_+1100_/Ngapu6TrWJ/dw+v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAks4Zb8ACgkQjjKRsyhoI8wMBQCfV/8Ym8WtbyzHQD0j+EGvaVnJ
WYAAnRBxEkwtL+gt01XMxOq0h+lO1D2n
=Gsbe
-----END PGP SIGNATURE-----

--Signature=_Mon__28_Dec_2009_19_01_03_+1100_/Ngapu6TrWJ/dw+v--
