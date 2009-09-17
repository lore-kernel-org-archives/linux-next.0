From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] edac: need to export cpu_llc_id
Date: Thu, 17 Sep 2009 10:35:13 +1000
Message-ID: <20090917103513.9a42bdbf.sfr@canb.auug.org.au>
References: <20090916093935.6bc2c91f.sfr@canb.auug.org.au>
	<20090916044151.GB5767@aftab>
	<20090917014901.1011949d.sfr@canb.auug.org.au>
	<20090916160420.GA12585@aftab>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Sep_2009_10_35_13_+1000_QVSrMQEPrlDXi4X8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37593 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752453AbZIQAfS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Sep 2009 20:35:18 -0400
In-Reply-To: <20090916160420.GA12585@aftab>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <borislav.petkov@amd.com>
Cc: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Thu__17_Sep_2009_10_35_13_+1000_QVSrMQEPrlDXi4X8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Wed, 16 Sep 2009 18:04:20 +0200 Borislav Petkov <borislav.petkov@amd.com=
> wrote:
>
> By the way, fix is already underway to Linus so you might just wait
> a while before applying it to your linux-next mix and pull it from
> upstream instead.

Since Linus hasn't merged your tree yet, I have cherry-picked that one
commit from your tree into my "fixes" tree for today.  I will drop it
when Linus takes your tree.

Thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Sep_2009_10_35_13_+1000_QVSrMQEPrlDXi4X8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkqxhEEACgkQjjKRsyhoI8wjYwCfSUVNG0SXFK7UL/aoRWrVdR7x
zCIAnjy8FU8KoyNbfnhbBMWEXewX7kt5
=yW0+
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Sep_2009_10_35_13_+1000_QVSrMQEPrlDXi4X8--
