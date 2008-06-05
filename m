From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: frimware build failure
Date: Thu, 5 Jun 2008 18:06:51 +1000
Message-ID: <20080605180651.014cef95.sfr@canb.auug.org.au>
References: <20080605172512.e000ddc5.sfr@canb.auug.org.au>
	<1212652090.32207.159.camel@pmac.infradead.org>
	<20080605175941.5520add5.sfr@canb.auug.org.au>
	<1212653023.32207.169.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Jun_2008_18_06_51_+1000_5rIoC3VamqKoCAwD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56886 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752371AbYFEIG5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Jun 2008 04:06:57 -0400
In-Reply-To: <1212653023.32207.169.camel@pmac.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

--Signature=_Thu__5_Jun_2008_18_06_51_+1000_5rIoC3VamqKoCAwD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, 05 Jun 2008 09:03:42 +0100 David Woodhouse <dwmw2@infradead.org> wr=
ote:
>
> I did ponder using 'gcc -S' on a simple template file and then
> post-processing the output, but I figured there was just as much that
> could go wrong with that one too. At least when we emit our own asm,
> once we've finished the coverage testing on all architectures and fixed
> it all, we can have a reasonable expectation that it'll stay working.
> Post-processing the assembly output of GCC just scares me :)

Yeah, we used to do that for an initialised structure in PowerPC
iSeries - never again.  :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Jun_2008_18_06_51_+1000_5rIoC3VamqKoCAwD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhHnpsACgkQTgG2atn1QN/GpACgiETKjrg1spUOAceU8RRvu/76
o0MAnAuhkvQHyPWVAqplStZz1u3T2PQC
=zV+g
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Jun_2008_18_06_51_+1000_5rIoC3VamqKoCAwD--
