Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F7B1A01BE;
	Mon, 24 Aug 2026 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574044; cv=none; b=DD8mtLaTAf7EnKfkkDvMWpLImCpguxmfZkT1eO5cGeCl8BSDjGpmuxwTp2D7F39VrNS/K66/IIjdIJbMq76qRaFsFzJHf9pwGO487HgIIFfU4GIpURvkZkXXzpFncW0vcKIwbZidSScUPIa8tEjr+F3eHlbGdbniaKfXbZPOIvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574044; c=relaxed/simple;
	bh=OGDqi7IdJu/MwBxGMTQK5Ur1EiS5s+CgLy/bjKcuRYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xo+SJcSvhGHDU5h+3YNT+QIEEc03lk6bSZhv3KEuxEzFSKvb8Zobeelwh98nbytWn9lYiwLM8+zxigGJuetiONcXfBt3ClbfQtlpYfdaDOm2HkMpeGIdzF75ust+uVdQTbJPkZLYnXKNV25Bnw3fhunuSxs4+uqTGAnW2DmfntE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzJVzBcn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzJVzBcn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE4B1F000E9;
	Mon, 24 Aug 2026 12:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574043;
	bh=DDCGi922+Kz9thKELn6lGAVa1uPqb8AbtQwSxv54w10=;
	h=Date:From:To:Cc:Subject;
	b=AzJVzBcnQTXpacN27++HgXqsvFK/jG60N1lNCXNJrih/yOELvLtlWe6o5QEccUpMI
	 yN7PI3p7F1UznnplROegA80mcL/jZ50UYj8FN13FnUo6l/SIs+bDixfDaC6YFU8XnF
	 z78k6saMcQ6Mq1w9lof6cCRDxXA5x5ozDrW/w+P+30XmEe2lXHl8OpsZgteNdZhfoC
	 Tw4N09tp6JWOePMfKxKCPotE333rDAUp3PIGEFWbWaBLIj90WaKaK0P7ZHmWgdMMIC
	 +Y+upVgtmb1MnRHHUN0yZPrxM4lmnwLCgXs1fefSsgaCU9J15aRFZsx5sTEstIce2K
	 whXAhWjuqTKRg==
Date: Mon, 24 Aug 2026 13:20:39 +0100
From: Mark Brown <broonie@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Chuyi Zhou <zhouchuyi@bytedance.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: linux-next: manual merge of the paulmck tree with the origin tree
Message-ID: <aow3F8_WbvDDIm1k@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5P7TWUsZKvC+WMj+"
Content-Disposition: inline


--5P7TWUsZKvC+WMj+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the paulmck tree got a conflict in:

  kernel/smp.c

between commit:

  b46883305f261 ("smp: Disable preemption explicitly in __csd_lock_wait()")

=66rom the origin tree and commit:

  07230d21630f4 ("locking/csd-lock: Pack csd_lock_wait_toolong() state into=
 a struct")

=66rom the paulmck tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/smp.c
index b696bcc60c08f,9092315c144a9..0000000000000
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@@ -285,19 -298,13 +311,19 @@@ static bool csd_lock_wait_toolong(call_
  		cpux =3D 0;
  	else
  		cpux =3D cpu;
 -	cpu_cur_csd =3D smp_load_acquire(&per_cpu(cur_csd, cpux)); /* Before fun=
c and info. */
 +	/*
 +	 * Pairs with smp_store_release() of cur_csd in __csd_lock_record():
 +	 * a non-NULL cur_csd here implies cur_csd_func and cur_csd_info
 +	 * are the matching publication; a NULL value is ordered after any
 +	 * preceding CSD callback/unlock on the remote CPU.
 +	 */
 +	cpu_cur_csd =3D smp_load_acquire(&per_cpu(cur_csd, cpux));
  	/* How long since this CSD lock was stuck. */
- 	ts_delta =3D ts2 - ts0;
+ 	ts_delta =3D ts_now - state->ts_start;
  	pr_alert("csd: %s non-responsive CSD lock (#%d) on CPU#%d, waiting %lld =
ns for CPU#%02d %pS(%ps).\n",
- 		 firsttime ? "Detected" : "Continued", *bug_id, raw_smp_processor_id(),=
 (s64)ts_delta,
+ 		 firsttime ? "Detected" : "Continued", state->bug_id, raw_smp_processor=
_id(), (s64)ts_delta,
  		 cpu, csd->func, csd->info);
- 	(*nmessages)++;
+ 	state->nmessages++;
  	if (firsttime)
  		atomic_inc(&n_csd_lock_stuck);
  	/*
@@@ -338,15 -346,11 +365,13 @@@
   */
  static void __csd_lock_wait(call_single_data_t *csd)
  {
- 	unsigned long nmessages =3D 0;
- 	int bug_id =3D 0;
- 	u64 ts0, ts1;
+ 	struct csd_wait_state state =3D {};
 =20
 +	guard(preempt)();
 +
- 	ts1 =3D ts0 =3D ktime_get_mono_fast_ns();
+ 	state.ts_report =3D state.ts_start =3D ktime_get_mono_fast_ns();
  	for (;;) {
- 		if (csd_lock_wait_toolong(csd, ts0, &ts1, &bug_id, &nmessages))
+ 		if (csd_lock_wait_toolong(csd, &state))
  			break;
  		cpu_relax();
  	}

--5P7TWUsZKvC+WMj+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMNxcACgkQJNaLcl1U
h9BgSwf+K3Nay+1hjqkV/TtfR8tC5IHflURNQWmlnoecwso3mh6YFsUFDIsrFif1
OZh4iYOynUuxVIV3PQ95SQ6Gw3BjTBKzpSgm8FV9jYzUh2YI0G6M7qDRGnhC2vl2
/ttAY1ULPJW+dbeyXuk+4V4vK8TcQY002CB0YdY6jEhxBH5WqzwT4CFNcyKT+9V0
EONZeQcDjWDRAzkn9nWmLP5efqXWzsC5uElBvK+La0v/c3GSKjK4xTzOoKbM0+g6
BY11c6awtvD5IZxxQpjWzUcMtWfI5JeHHcaYTjLJa2g9Jfob3W3Ij2TUJ6nlzqtS
OPJa092ljD4bXLgaDKhPQwCBiurAjg==
=ad+m
-----END PGP SIGNATURE-----

--5P7TWUsZKvC+WMj+--
