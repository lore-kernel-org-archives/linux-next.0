From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Wed, 15 Apr 2015 12:30:19 +1000
Message-ID: <20150415123019.069ab670@canb.auug.org.au>
References: <20150413142442.2f7107e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/db4WJ3aftpH65LtF1rD9xi0"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57743 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755574AbbDOCaZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2015 22:30:25 -0400
In-Reply-To: <20150413142442.2f7107e5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <len.brown@intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dasaratharaman Chandramouli <dasaratharaman.chandramouli@intel.com>

--Sig_/db4WJ3aftpH65LtF1rD9xi0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Len,

On Mon, 13 Apr 2015 14:24:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi Rafael,
>=20
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> In file included from arch/x86/include/asm/msr.h:131:0,
>                  from arch/x86/include/asm/processor.h:20,
>                  from arch/x86/include/asm/thread_info.h:23,
>                  from include/linux/thread_info.h:54,
>                  from arch/x86/include/asm/preempt.h:6,
>                  from include/linux/preempt.h:18,
>                  from include/linux/smp.h:55,
>                  from include/linux/kernel_stat.h:4,
>                  from drivers/cpufreq/intel_pstate.c:14:
> drivers/cpufreq/intel_pstate.c: In function 'knl_get_turbo_pstate':
> drivers/cpufreq/intel_pstate.c:622:9: error: 'MSR_NHM_TURBO_RATIO_LIMIT' =
undeclared (first use in this function)
>   rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
>          ^
> arch/x86/include/asm/paravirt.h:153:26: note: in definition of macro 'rdm=
srl'
>   val =3D paravirt_read_msr(msr, &_err); \
>                           ^
> drivers/cpufreq/intel_pstate.c:622:9: note: each undeclared identifier is=
 reported only once for each function it appears in
>   rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
>          ^
> arch/x86/include/asm/paravirt.h:153:26: note: in definition of macro 'rdm=
srl'
>   val =3D paravirt_read_msr(msr, &_err); \
>                           ^
>=20
> Caused by commit 6acfd09a439a ("tools/power turbostat: define and dump
> MSR_TURBO_RATIO_LIMIT2") interacting with commit b34ef932d79a
> ("intel_pstate: Knights Landing support").  This should have been
> resolved in commit 08fb40f3fbeb ("Merge branches 'powercap' and
> 'pm-tools'").
>=20
> I have added the following patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 13 Apr 2015 14:11:11 +1000
> Subject: [PATCH] intel_pstate: fix bad merge (MSR_NHM_TURBO_RATIO_LIMIT r=
ename)
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/cpufreq/intel_pstate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index 875154d5f60b..5ecd2689a8fc 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -619,7 +619,7 @@ static int knl_get_turbo_pstate(void)
>  	u64 value;
>  	int nont, ret;
> =20
> -	rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
> +	rdmsrl(MSR_TURBO_RATIO_LIMIT, value);
>  	nont =3D core_get_max_pstate();
>  	ret =3D (((value) >> 8) & 0xFF);
>  	if (ret <=3D nont)

This is now required after the merge of the idle tree (since the code
was removed from the pm tree).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/db4WJ3aftpH65LtF1rD9xi0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLc0/AAoJEMDTa8Ir7ZwVO6UP/0edJAmVY7xUQHJpuVfnVblI
svxbnand+aEhvmekreFgiCv9GazzV24NgMfnprNcO91knCtdQB1djpwreAuDPY1W
XdttBvgGoaX1yr6D3wsvJd/fAcl62jOsierVedSWZEixcDTiqGFGK9/Fw62fHZJA
icmX09g3T+QUJYooPd610nV62k6xgH3Fc5FFpaUnOJH6cyNhxpMk/jZl+Ox4qMBY
FCR+837YxPQyNCYAkLVEuYTjcSomw1OESyI4iEQAlVbCXr/dRs1a+Gdc6JQB3EmV
w9CtGZFuKEn83RZBXGgHMCrSW7k8teNrCsuBSLp6244W7V4pt99ygxjGVs+cZhRN
a4C/sR9SKzorqaz9MFvTVqSJ8iUxVmnIvrPoVdbwcAmxpDQ+AXHPa9Il+cmwiKTO
3j+he+pDDPjIEi78qG/LU1tRFgM7PC84GB4GB/2xCMvVtXO9ugf9+ZI+8arBroTO
YEJ+ZguThUVDIhJATJ+gu9+DBuqjxfLbOvrODUqLjiHkJ0szcVHZUJqGCuBmp+iH
GohmJr5MssjjBV5H8wjwXs8WO0TCdRehVj94ByyI3eyP7t0KK+Ck6BfSO+FjxziI
Zrzz4C1v4giI2vjeWT4I2MQzi3A3AsVvGbuFIhBak3Yw0lPF+AcoYsbGnT9eeoub
wPycY3QQGmX/cv86+Hek
=UqNS
-----END PGP SIGNATURE-----

--Sig_/db4WJ3aftpH65LtF1rD9xi0--
