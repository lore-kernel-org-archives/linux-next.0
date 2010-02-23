From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merging all the trees (tip tree
 related)
Date: Tue, 23 Feb 2010 17:34:36 +1100
Message-ID: <20100223173436.d0413898.sfr@canb.auug.org.au>
References: <20100223172543.61fc1d2b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__23_Feb_2010_17_34_36_+1100_mfdHasMl_y4.tubX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34420 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752448Ab0BWGeq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Feb 2010 01:34:46 -0500
In-Reply-To: <20100223172543.61fc1d2b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Mike Travis <travis@sgi.com>

--Signature=_Tue__23_Feb_2010_17_34_36_+1100_mfdHasMl_y4.tubX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Feb 2010 17:25:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging all the trees, today's linux-next build (powerpc
> ppc44x_defconfig) produced this warning:

I got this from an i386 defconfig build as well (after enabling
CONFIG_DEBUG_SECTION_MISMATCH, of course).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__23_Feb_2010_17_34_36_+1100_mfdHasMl_y4.tubX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuDdvwACgkQjjKRsyhoI8wf9ACgo28pRcWh6KwUH4c5ea3YDhfY
7SkAn2ly4SHECQfldkM/qlw60cY9+VR1
=morA
-----END PGP SIGNATURE-----

--Signature=_Tue__23_Feb_2010_17_34_36_+1100_mfdHasMl_y4.tubX--
