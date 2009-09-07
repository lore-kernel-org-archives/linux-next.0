From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the percpu tree with Linus' tree
Date: Mon, 7 Sep 2009 20:24:20 +1000
Message-ID: <20090907202420.c0bd57e5.sfr@canb.auug.org.au>
References: <20090907182229.734c31d2.sfr@canb.auug.org.au>
	<4AA4C628.3070300@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Sep_2009_20_24_20_+1000_YAapu/.2juCV2.xC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46703 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752762AbZIGKYc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Sep 2009 06:24:32 -0400
In-Reply-To: <4AA4C628.3070300@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__7_Sep_2009_20_24_20_+1000_YAapu/.2juCV2.xC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Mon, 07 Sep 2009 17:36:56 +0900 Tejun Heo <tj@kernel.org> wrote:
>
> Stephen Rothwell wrote:
> >=20
> > I *think* the changes in the percpu tree supercede those in Linus' tree,
> > so I have used those.
>=20
> Yes, the changes in Linus's tree are backported from devel branch but
> the devel already has moved on and dropped one of the changes.  I'll
> merge Linus's tree into percpu devel branch.

Thanks for the confirmation.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Sep_2009_20_24_20_+1000_YAapu/.2juCV2.xC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqk31QACgkQjjKRsyhoI8whoQCgldR2CjSHTac+mwooRNJRRLo0
JNIAnRz/0ClSc2WOHpzYT/Z7AKeR21cR
=c9w5
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Sep_2009_20_24_20_+1000_YAapu/.2juCV2.xC--
