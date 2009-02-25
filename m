From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: cpufreq tree build failure
Date: Wed, 25 Feb 2009 14:29:55 +1100
Message-ID: <20090225142955.1104d5bc.sfr@canb.auug.org.au>
References: <20090224172112.727b4043.sfr@canb.auug.org.au>
	<20090224165103.GA2998@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Feb_2009_14_29_55_+1100_z3z.PDhBRay/Idz4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47275 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754706AbZBYDaC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Feb 2009 22:30:02 -0500
In-Reply-To: <20090224165103.GA2998@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: linux-next@vger.kernel.org, Matthias-Christian Ott <ott@mirix.org>, Dominik Brodowski <linux@brodo.de>

--Signature=_Wed__25_Feb_2009_14_29_55_+1100_z3z.PDhBRay/Idz4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 24 Feb 2009 11:51:03 -0500 Dave Jones <davej@redhat.com> wrote:
>
> On Tue, Feb 24, 2009 at 05:21:12PM +1100, Stephen Rothwell wrote:
>  >=20
>  > Today's linux-next build (x86_64 allmodconfig) failed like this:
>  >=20
>  > ERROR: "recalibrate_cpu_khz" [arch/x86/kernel/cpu/cpufreq/p4-clockmod.=
ko] undefined!
>  >=20
>  > Caused by commit f20b61aa18b99d91c2a08f8863409bb8002d87fb ("[CPUFREQ] =
p4-clockmod reports wrong frequency").
>  >=20
>  > I have dropped the cpufreq tree for today.
> =20
> Odd. I fixed that up, as I noticed it when I first merged the diff.
>=20
> Can you check that your tree has this bit..
>=20
> diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
> index 2bb6a83..4f5c247 100644
> --- a/arch/x86/include/asm/timer.h
> +++ b/arch/x86/include/asm/timer.h
> @@ -11,8 +11,8 @@ unsigned long native_calibrate_tsc(void);
> =20
>  #ifdef CONFIG_X86_32
>  extern int timer_ack;
> +#endif
>  extern int recalibrate_cpu_khz(void);
> -#endif /* CONFIG_X86_32 */

It does have that bit.  It failed to build again today.

> It's possible you cloned it just before I rebased it with that fix.

There were no updates when I fetched you tree today.

Note that the error points to a modular build problem.  Maybe as
(Matthias-Christian Ott pointed out) this should not even be being built
for x86_64?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Feb_2009_14_29_55_+1100_z3z.PDhBRay/Idz4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmkuzMACgkQjjKRsyhoI8w8XwCfXEjfqilViuW3N5vLQm1vK68M
assAoIgAQgFCXezkhb/HmomlZdrHezWB
=9AXG
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Feb_2009_14_29_55_+1100_z3z.PDhBRay/Idz4--
