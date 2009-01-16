From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tree build failure
Date: Fri, 16 Jan 2009 22:53:42 +1100
Message-ID: <20090116225342.83891680.sfr@canb.auug.org.au>
References: <20090116163745.93f4e075.sfr@canb.auug.org.au>
	<20090116105324.GA13765@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__16_Jan_2009_22_53_42_+1100__/QV9+IMeQ2bkv.W"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47919 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1762481AbZAPLx4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Jan 2009 06:53:56 -0500
In-Reply-To: <20090116105324.GA13765@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>

--Signature=_Fri__16_Jan_2009_22_53_42_+1100__/QV9+IMeQ2bkv.W
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Fri, 16 Jan 2009 11:53:24 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Today's linux-next build (powerpc allnoconfig) failed like this:
> >=20
> > In file included from kernel/sched.c:1703:
> > kernel/sched_fair.c: In function 'adaptive_gran':
> > kernel/sched_fair.c:1324: error: 'struct sched_entity' has no member na=
med 'avg_wakeup'
> >=20
> > Caused by commit e52fb7c097238d34f4d8e2a596f8a3f85b0c0565
> > ("sched: prefer wakers") from the sched tree.
>=20
> that commit builds just fine on x86 and on powerpc as well.

The build was an allnoconfig build, so CONFIG_SCHEDSTATS was not set.

> Also, at commit e52fb7c097238d34f4d8e2a596f8a3f85b0c0565 there's no=20
> 'sched_entity' use on line 1324 of kernel/sched_fair.c. Could you tell me=
=20
> the exact commit ID you got the build failure under?

Commit b88402a67e74222061d2f24aef90ee58d2a3f080 "Merge commit
'kmemleak/kmemleak'" (what you get if you remove the last two commits
form today's linux-next).

At that point, kernel/sched_fair.c contains (from line 1320):

static unsigned long
adaptive_gran(struct sched_entity *curr, struct sched_entity *se)
{
	u64 this_run =3D curr->sum_exec_runtime - curr->prev_sum_exec_runtime;
	u64 expected_wakeup =3D 2*se->avg_wakeup * cfs_rq_of(se)->nr_running;
	u64 gran =3D 0;

	if (this_run < expected_wakeup)
		gran =3D expected_wakeup - this_run;

	return min_t(s64, gran, sysctl_sched_wakeup_granularity);
}

That function was added by commit
e52fb7c097238d34f4d8e2a596f8a3f85b0c0565.  Also, at that commit, stuct
sched_entity (in sched.h) looks like this:

struct sched_entity {
	.
	.

	u64			last_wakeup;
	u64			avg_overlap;

#ifdef CONFIG_SCHEDSTATS
	u64			wait_start;
	u64			wait_max;
	.
	.

	u64			start_runtime;
	u64			avg_wakeup;

	.
	.
	u64			nr_wakeups_passive;
	u64			nr_wakeups_idle;
#endif

	.
	.
};

The two fields "start_runtime" and "avg_wakeup" were added by the
previous commit 831451ac4e44d3a20b581ce726ef1d1144373f7d "sched:
introduce avg_wakeup" but according to Peter's email, they were added in
the wrong place.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__16_Jan_2009_22_53_42_+1100__/QV9+IMeQ2bkv.W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklwdUYACgkQjjKRsyhoI8xcUACfaZ7TEXQdLudX5tm/uq3YERcb
uv0AoLtA82IvmTCKXnJpiWIdg034LiAL
=d/px
-----END PGP SIGNATURE-----

--Signature=_Fri__16_Jan_2009_22_53_42_+1100__/QV9+IMeQ2bkv.W--
