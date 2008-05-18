From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Fwd: Re: [PATCH] kprobes: fix compilation break due to
 kprobe_mutex
Date: Sun, 18 May 2008 13:49:33 +1000
Message-ID: <20080518134933.fe57718a.sfr@canb.auug.org.au>
References: <20080517114244.GB30141@flint.arm.linux.org.uk>
	<20080517220204.d78fdce2.sfr@canb.auug.org.au>
	<20080517133527.GC30141@flint.arm.linux.org.uk>
	<20080517235926.5133252f.sfr@canb.auug.org.au>
	<20080518022010.56a8bf46.sfr@canb.auug.org.au>
	<20080517190855.GC13933@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__18_May_2008_13_49_33_+1000_o07v4nyL0Vou5UlV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42661 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751800AbYERDtm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 17 May 2008 23:49:42 -0400
In-Reply-To: <20080517190855.GC13933@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Sun__18_May_2008_13_49_33_+1000_o07v4nyL0Vou5UlV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Sat, 17 May 2008 20:08:55 +0100 Russell King - ARM Linux <linux@arm.linu=
x.org.uk> wrote:
>
> If I'm reading this right, it's taking you about 3.5 hours to build the
> set?

Not really, I added them in several goes and the build scripts have
significant pauses between passes.  It also takes some time to mirror out
the results between passes.  Tomorrow's build should be more
representative.

> spitz_defconfig - trivial fix (I'll push that with my upcoming set)
> magican_defconfig - ditto
> omap*_defconfig - hopefully my recent merge of fixes from Tony Lindgren
>  should resolve this.
> eseries_pxa_defconfig - looks like a botched defconfig file ;(
> corgi_defconfig - tried to get the person concerned to submit a trivial
>  patch but wants to introduce some infrastructure instead
> clps7500_defconfig - you may as well disable, I'll probably eventually
>  remove this platform.
>
> Lastly, collie_defconfig seems to be broken as a result of 5025/1 -
> which claims to be a "fix" patch but is actually a "break" patch. ;(

I'll disable clps7500_defconfig and leave the rest for now.  Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__18_May_2008_13_49_33_+1000_o07v4nyL0Vou5UlV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIL6dSTgG2atn1QN8RAps3AKCQgDPObtr7ISalfNMxiPKF/d8UyACePdib
V6DT/xkz6mRGg4nqrl9DoT0=
=YHvd
-----END PGP SIGNATURE-----

--Signature=_Sun__18_May_2008_13_49_33_+1000_o07v4nyL0Vou5UlV--
