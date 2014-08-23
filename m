From: Mark Brown <broonie@kernel.org>
Subject: arm64 audit build failures in -next
Date: Sat, 23 Aug 2014 10:50:43 -0500
Message-ID: <20140823155043.GM24407@sirena.org.uk>
References: <E1XLCyO-0007E5-P1@cassiel.sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Gt+ay4QFgFrjOKz/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57157 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751091AbaHWPvi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 23 Aug 2014 11:51:38 -0400
Content-Disposition: inline
In-Reply-To: <E1XLCyO-0007E5-P1@cassiel.sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>, Richard Guy Briggs <rgb@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-audit@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org


--Gt+ay4QFgFrjOKz/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 23, 2014 at 04:11:20PM +0100, Build bot for Mark Brown wrote:

> 	arm64-allmodconfig
> ../arch/arm64/kernel/ptrace.c:1120:3: error: too many arguments to function 'audit_syscall_entry'

This has now been broken in -next for about a month with a fix available
and since the merge window the arm64 audit support is in mainline so the
fix can be directly applied without cross tree issues (the audit changes
didn't get sent during the merge window).  Catalin and Will have also
indicated that they want to remove the workaround that's in -next
currently to allow defconfig to build which would make the situation
even more pressing.

Do we have any idea when it will be possible to get a fix into -next?

--Gt+ay4QFgFrjOKz/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT+LhQAAoJELSic+t+oim91+EQAIqult6mipANqlrS5paY1w4j
RgdWOHKo/0zBAueBQBu7O+2SXklGF9FdY9+NEV/WN+hk1FQ/z9QI2vzSoy23tN2o
5pXimr9lgqv1uQBQdgbCGAVglizU3gtH09oyXHsd4BFinGO32RTWNmSc+UAJ1Vsj
gSrEZsbvc3sHvjG2C20Xet4LZUIb+GtJAqiTqXndD854+1fd6VGy4tS0pK+PnPyc
KVyNWDBXUWx/9X4HtOPO2/qSIbMMFoD8NEj1eqT0IE8KIR3FmPpuvUnoTxmf91Gx
MMIfDhI3OC68JjFvP+GrJOo8ZiSIHYk5MAKYwz+TfnrcgtGmrdGnbAlAUMA1Kirt
c8tL7wCawu7H9NTeVDKc0uxwDbet1ZLRNBS92G5e220rOMTC8gVO4bRHz36GjeyP
S7+4w1kh+0q2B8v+FwO3rY9XOysCXf0E4V77yaEyJ+QUT8ycHQQtwP6kP0cQn6v9
ZsNWjGrssH+QzkwOjJwUEOvpPZ/HHNxLsJ5BP5sQddmLJzw3yasa+MIhvf93fYqk
SMUOvKiQyQr5TDNRZ63x612jjlmKGanHZqWwRI+w+tUAhYJXBKvRND0N7UHZqvgT
2BzYr1pZrlpTjbOq2isIHABJxda7NbhsfgPcs1ID0sjpYKfruHz5hQPDTaszdspl
hPeWYlO4obttPDW3/r0h
=2ex2
-----END PGP SIGNATURE-----

--Gt+ay4QFgFrjOKz/--
