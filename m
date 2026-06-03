Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBFD2FD1DA;
	Wed,  3 Jun 2026 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493560; cv=none; b=cydkujWF0pslHhGy+EXnODnOewlH29eaBLyfn2yyyA2K2vVG51j+TD4ArIJugIonps0LJDDrnNqjQiY/XX/JwQQy9KGoAyoaryp4ARjGINQFeZML+Qgl1n0q8WC2afN1vw6CCSBxVwZk1F5loza0utmTJmh/6ZoUqyXJwiSaHIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493560; c=relaxed/simple;
	bh=noPEHpdkaWixM2ky76BGWvmKD8JFrMbkN4XBGgMAz+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AMFYMOrHaAbCAKaLvVPGEG54jb6zbAdjdKgUf5/osF5uH6GFXUbunMtAKkPxQgU80t6l1YiEAI7EaxLYEGdktpsRe3+x2anmm9UfkvBK5FKLL+dWFXNjK8kzk7/B6pccIOcPh5grrqnWeIo/B+eUvXSsZ2pWLpUiSeWag/wK4hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsjA/7D+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsjA/7D+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBD01F00893;
	Wed,  3 Jun 2026 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780493559;
	bh=Qh3s8tb3BNgWlSbvXjLG1oMHOxDlfwEsuJKRcwEChmI=;
	h=Date:From:To:Cc:Subject;
	b=hsjA/7D++B8dlLPdLV2+CDD5nxyiJ8k3sJa4uVZW2YOCqXGSHPwube0EF4VH494OY
	 wyAXBkofNPFuItsl6BCR38wpwGhhrSg7B078AORIqpfJMpRDaFzvh0+lFNDs/85cRX
	 PwpI6fZgSFR65jvgRv33yeL7UZJORiTeHwyq8xrqMf2I6VTcmXW7tImF7lwMFu6a6c
	 X1BY6O4LTwwwJb+gS71yK3vEdPM2iZF6kMzCJebI99raTARNG3DSEZSUXC0Gsq4oa6
	 ipIAv5Z/K7SioXpBnzYrol1JNGQP3Ihdmw5/xHrBCdDEA5pkYKdclAvVoQdx21EMH3
	 EllJG0XgZvFqw==
Date: Wed, 3 Jun 2026 14:32:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Subject: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <aiAs8hIzpPzvCjw5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GC8jSm6KPweHtmMC"
Content-Disposition: inline


--GC8jSm6KPweHtmMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/cpufreq/cpufreq_governor.c

between commit:

  24fc5870808de ("cpufreq: governor: Fix stale prev_cpu_nice spike when ena=
bling ignore_nice_load")

=66rom the pm tree and commit:

  080b5c6d95034 ("sched/cputime: Remove superfluous and error prone kcpusta=
t_field() parameter")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/cpufreq/cpufreq_governor.c
index 8a85bd32defe7,3c4a1f9af3ae8..0000000000000
--- a/drivers/cpufreq/cpufreq_governor.c
+++ b/drivers/cpufreq/cpufreq_governor.c
@@@ -112,9 -104,9 +112,9 @@@ void gov_update_cpu_data(struct dbs_dat
 =20
  			j_cdbs->prev_cpu_idle =3D get_cpu_idle_time(j, &j_cdbs->prev_update_ti=
me,
  								  dbs_data->io_is_busy);
- 			j_cdbs->prev_cpu_nice =3D kcpustat_field(&kcpustat_cpu(j), CPUTIME_NIC=
E, j);
 -			if (dbs_data->ignore_nice_load)
 -				j_cdbs->prev_cpu_nice =3D kcpustat_field(CPUTIME_NICE, j);
++			j_cdbs->prev_cpu_nice =3D kcpustat_field(CPUTIME_NICE, j);
  		}
 +		mutex_unlock(&policy_dbs->update_mutex);
  	}
  }
  EXPORT_SYMBOL_GPL(gov_update_cpu_data);
@@@ -173,18 -164,12 +173,18 @@@ unsigned int dbs_update(struct cpufreq_
 =20
  		j_cdbs->prev_cpu_idle =3D cur_idle_time;
 =20
 -		if (ignore_nice) {
 -			u64 cur_nice =3D kcpustat_field(CPUTIME_NICE, j);
 -
 +		/*
 +		 * Always sample cur_nice and advance prev_cpu_nice, regardless
 +		 * of ignore_nice.  This keeps prev_cpu_nice current so that
 +		 * enabling ignore_nice_load via sysfs never produces a
 +		 * stale-baseline spike (the delta will be at most one sampling
 +		 * interval of accumulated nice time, not since boot).
 +		 */
- 		cur_nice =3D kcpustat_field(&kcpustat_cpu(j), CPUTIME_NICE, j);
++		cur_nice =3D kcpustat_field(CPUTIME_NICE, j);
 +		if (ignore_nice)
  			idle_time +=3D div_u64(cur_nice - j_cdbs->prev_cpu_nice, NSEC_PER_USEC=
);
 -			j_cdbs->prev_cpu_nice =3D cur_nice;
 -		}
 +
 +		j_cdbs->prev_cpu_nice =3D cur_nice;
 =20
  		if (unlikely(!time_elapsed)) {
  			/*
@@@ -552,9 -537,10 +552,9 @@@ int cpufreq_dbs_governor_start(struct c
  		 * Make the first invocation of dbs_update() compute the load.
  		 */
  		j_cdbs->prev_load =3D 0;
- 		j_cdbs->prev_cpu_nice =3D kcpustat_field(&kcpustat_cpu(j), CPUTIME_NICE=
, j);
 -
 -		if (ignore_nice)
 -			j_cdbs->prev_cpu_nice =3D kcpustat_field(CPUTIME_NICE, j);
++		j_cdbs->prev_cpu_nice =3D kcpustat_field(CPUTIME_NICE, j);
  	}
 +	mutex_unlock(&policy_dbs->update_mutex);
 =20
  	gov->start(policy);
 =20

--GC8jSm6KPweHtmMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmogLPEACgkQJNaLcl1U
h9C//wf8CPuzU8hHDHDVdIyqT30HUlk/K7C+amwlcJlgLp3KjUlS07Klrdum+gaI
mYOuQq9XFdiWUm13kmIxZxCEmBFnoFQuthTwFZBBYYhyK7wOgsq02NhtI+LqCoGY
tbCez0rkoAnYEm6AZtWRZNmTA3L0bAyw4Zlkp+GlG4JLx0sbf5ShPrcY50v01Pqt
D41yz0k6paAhs2+t8sRxO/rXqT9bthduRO+2NccwzEm7Q25Wmy2GKhnoPexrKYbr
O5vBsuqO7F1wOz40BdrjE21cF1umLhItl3b2LPJRws2bMdNhEHsCQvKvre7x5x6Y
bAj5H0PyOYM7537K6Hdv7wHaCNjYZQ==
=H9Tp
-----END PGP SIGNATURE-----

--GC8jSm6KPweHtmMC--
