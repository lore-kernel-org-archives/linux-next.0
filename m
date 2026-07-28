Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563273A8755;
	Tue, 28 Jul 2026 17:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260397; cv=none; b=Y16NUywRM5n4oc4DjhFhgsqSZ+ufQ31ulDuTI40w7rhimzcULiUNM1BSwHMSB4/JopkU6T57x+eV3GCKHZ2U/3oRBnK6ZNWKN8cqLlM4US16g37egJT5x9tcpIuQdq9cB9pUF2B+1i25//jciXv2W5rfopK+G8smlZp2rqTJj7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260397; c=relaxed/simple;
	bh=OLOrPx067z3+Pump0QilV59SlYanlFQ4NsWI8j6OcUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uxgx5vaBdErttbCV15To6ld9fBZ8j1qKay7Bd4y+2nZkP+HX53+PSWGL7LdafoU5vEBXgJm7R7ucfkJYAn8zpnTK2HElov5eYhyW2sQuQ+1zNPirHT2qWRqGUag0++PWXXHmh6xTtQC2+WVWE+b9tdE8osZoJTIQFslpBHANipQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDMAG7Lx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDMAG7Lx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7260E1F000E9;
	Tue, 28 Jul 2026 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785260396;
	bh=36tBw3bTrZTnjcDZiBKGujBZz+liq0WuEdnq6leofQg=;
	h=Date:From:To:Cc:Subject;
	b=lDMAG7LxOYMMHlkt7usnkYGTE8lKlqNNcgrepcqcxoUWjCeCT8mZPqeBYYza2Tq7x
	 i4Nq0f32rwOdN+UKlnODLx2vRSmqfeEH+6mOTAhRgSe+gRLfZTa72TT+t1X/hDQe0L
	 QMjrfUapi45iw9+rP4oC+SDTifera/gQcBmmm0DIlcp4g/G6gCVLZiHDTIwghcHKTh
	 Hw8Rluw+ypkOxlLgAUMjvrpg+7fb/De9FK48KYgSh0PtbaYLEPPR51WQyAdvr1iy9f
	 +So7qhC5jNSD0eTXpyyQKKps+BBqhyGoJWbnl6aqOve2ZyV/nboSCJZMispZkdfraX
	 aI09ayDWFdOUg==
Date: Tue, 28 Jul 2026 18:39:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>,
	Joel Granados <joel.granados@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <amjpZ1aYsps44ExZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j8PgPfyjf0bLOa4n"
Content-Disposition: inline


--j8PgPfyjf0bLOa4n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sysctl tree got a conflict in:

  kernel/time/jiffies.c

between commit:

  842912dea6d51 ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG=
_SYSCTL")

=66rom the mm-nonmm-unstable tree and commit:

  a3c70a5a9f944 ("sysctl: Generate do_proc_doulongvec_minmax with do_proc_d=
otypevec macro")

=66rom the sysctl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined kernel/time/jiffies.c
index 84c6bd8e742e9,af529d558fa92..0000000000000
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@@ -98,7 -98,7 +98,7 @@@ void __init register_refined_jiffies(lo
  	__clocksource_register(&refined_jiffies);
  }
 =20
 -#ifdef CONFIG_PROC_SYSCTL
 +#ifdef CONFIG_SYSCTL
  static ulong mult_hz(const ulong val)
  {
  	return val * HZ;
@@@ -185,7 -185,25 +185,7 @@@ static int do_proc_int_conv_ms_jiffies_
  			     sysctl_u2k_int_conv_ms, sysctl_k2u_int_conv_ms);
  }
 =20
 -static int sysctl_u2k_ulong_conv_ms(const ulong *u_ptr, ulong *k_ptr)
 -{
 -	return proc_ulong_u2k_conv_uop(u_ptr, k_ptr, sysctl_msecs_to_jiffies);
 -}
 -
 -static int sysctl_k2u_ulong_conv_ms(ulong *u_ptr, const ulong *k_ptr)
 -{
 -	return proc_ulong_k2u_conv_kop(u_ptr, k_ptr, sysctl_jiffies_to_msecs);
 -}
 -
 -static int do_proc_ulong_conv_ms_jiffies(bool *negp, ulong *u_ptr, ulong =
*k_ptr,
 -					 int dir, const struct ctl_table *tbl)
 -{
 -	return proc_ulong_conv(u_ptr, k_ptr, dir, tbl, false,
 -			       sysctl_u2k_ulong_conv_ms, sysctl_k2u_ulong_conv_ms);
 -}
 -
 -
 -#else // CONFIG_PROC_SYSCTL
 +#else // CONFIG_SYSCTL
  static int do_proc_int_conv_jiffies(bool *negp, ulong *u_ptr, int *k_ptr,
  				    int dir, const struct ctl_table *tbl)
  {
@@@ -211,6 -229,12 +211,12 @@@ static int do_proc_int_conv_ms_jiffies_
  {
  	return -ENOSYS;
  }
+=20
+ static int do_proc_ulong_conv_ms_jiffies(bool *negp, ulong *u_ptr, ulong =
*k_ptr,
+ 					 int dir, const struct ctl_table *tbl)
+ {
+ 	return -ENOSYS;
+ }
  #endif
 =20
  /**
@@@ -309,8 -333,8 +315,8 @@@ int proc_dointvec_ms_jiffies_minmax(con
  int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *table, int =
dir,
  				      void *buffer, size_t *lenp, loff_t *ppos)
  {
- 	return proc_doulongvec_minmax_conv(table, dir, buffer, lenp, ppos,
- 					   HZ, 1000l);
+ 	return proc_doulongvec_conv(table, dir, buffer, lenp, ppos,
+ 				    do_proc_ulong_conv_ms_jiffies);
  }
  EXPORT_SYMBOL(proc_doulongvec_ms_jiffies_minmax);
 =20

--j8PgPfyjf0bLOa4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpo6WcACgkQJNaLcl1U
h9AeoAf+NCKdcHAcl6sE3YR1oSE1G6h4HISYhFK4w4JgKnBwxjHVxJ4yY7OvZu2J
sJ7zY5YkUdtVZzZozRgPEGuMPrnekZ6lwPhgZHeK9PrZKPWkMI27iLAuyLq1p0XM
EYnO5iDXlBjfQXOC0KlAZ4vzJxbs6gdDvlKWvE2/J0fk/wgrUZ6Xcw9DBB4q9Elu
mO5Q4YC1jipaCpzHkviUYM0h3aHKOWQSfscS7f/DLavTVMOZhFVCGvQqOEZYlQfQ
qhVbhR8vdTL22qGSaTShOcYmOIlYORRqWMLw39AsNIHQZ+0wdXaXmvVdPLZvD13y
888Sq8yR5kccqI1QBp+DM67AUqN9yA==
=qs59
-----END PGP SIGNATURE-----

--j8PgPfyjf0bLOa4n--
