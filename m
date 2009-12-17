From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: rr tree build failure
Date: Fri, 18 Dec 2009 09:05:38 +1100
Message-ID: <20091218090538.19ab3b4e.sfr@canb.auug.org.au>
References: <20091211122648.8b305b52.sfr@canb.auug.org.au>
	<20091214153528.e29f33a6.sfr@canb.auug.org.au>
	<200912151422.29906.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Dec_2009_09_05_38_+1100_XwLg=UfNTQ2jybBN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57816 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1763300AbZLQWFo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Dec 2009 17:05:44 -0500
In-Reply-To: <200912151422.29906.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>

--Signature=_Fri__18_Dec_2009_09_05_38_+1100_XwLg=UfNTQ2jybBN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Tue, 15 Dec 2009 14:22:29 +1030 Rusty Russell <rusty@rustcorp.com.au> wr=
ote:
>
> On Mon, 14 Dec 2009 03:05:28 pm Stephen Rothwell wrote:
> >=20
> > On Fri, 11 Dec 2009 12:26:48 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > >
> > > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > >=20
> > > arch/x86/kernel/cpu/cpufreq/powernow-k8.c: In function 'powernowk8_ta=
rget':
> > > arch/x86/kernel/cpu/cpufreq/powernow-k8.c:1139: error: implicit decla=
ration of function 'tsk_cpumask'
> > > arch/x86/kernel/cpu/cpufreq/powernow-k8.c:1139: warning: passing argu=
ment 2 of 'cpumask_copy' makes pointer from integer without a cast
> > > include/linux/cpumask.h:466: note: expected 'const struct cpumask *' =
but argument is of type 'int'
> > >=20
> > > Caused by commit 9dd4c5ab546fcac98cfb9ca24ed5cc1bf7f08334
> > > ("cpumask:tsk_cpus_allowed-not-tsk_cpumask") from the rr tree interac=
ting
> > > with commit b8cbe7e82ec8b55d7bbdde66fc69e788fde00dc6 ("[CPUFREQ] cpum=
ask:
> > > don't put a cpumask on the stack in x86...cpufreq/powernow-k8.c") from
> > > the cpufreq tree.
> >=20
> > The cpufreq patch above is now in Linus' tree, so You should add the
> > patch below to your tree (or squash it into the affected patch).
>=20
> Thanks, done and rebased.

But not exported/uploaded ... :-(
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Dec_2009_09_05_38_+1100_XwLg=UfNTQ2jybBN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksqqzIACgkQjjKRsyhoI8ytdACePfcu+xydbxJnYHxwwVFUHcuu
YdcAn28O6uVKND8qBrVuSXxNofswaJop
=b8ca
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Dec_2009_09_05_38_+1100_XwLg=UfNTQ2jybBN--
