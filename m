Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB8A392C2C;
	Wed,  5 Aug 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785944725; cv=none; b=s4NthauTzvCxb8ftj1aDZ2E3I9D9gix/2m2aJvPxoEdGETlW6Xlu8YCNPHHjdq6iulQdAK4aVa+hOOFalTMh4pzoiT4PL6r9wgVuJCzX4aiXlwuG8c92fChtdnVWQheMQYoIAYpP9s666RauZvif1RHICGonUUPB91gVvL+WyTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785944725; c=relaxed/simple;
	bh=pMV5XT2otoDWQnT5bcCxSVYIm9mRrhAOH4QKAXI4iEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WA7oJcylcgrFo+kBy64x27FXbObn5SuXCyxo2ML+pL1ussG7or2bEmgmdKAK9rxXYZ2sjcIze8qYiEtzS4FWH1+9rseMkNyuaEdb/QKUedGUukQFzHpcbGH9+RdQ8UGxooUxKDmL2y0dBRW0fxVgqst3EFsmi73ZPnUwCedQ4vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZE3iwUN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZE3iwUN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0301F00A3A;
	Wed,  5 Aug 2026 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785944723;
	bh=vycdaxwIUZSSvYWreI+/2Yd5vDnM/8sMnATDeFH85aU=;
	h=Date:From:To:Cc:Subject;
	b=eZE3iwUNZ1zyMPvRmni3Lfaza36rfKRwn/wJ8yFwj5vZY8kpHshT+zAN4CwdnyLLs
	 Syf38nuVyHFksoYvBaqS5tbtEaURuft5wF+0kZNks75vW/aqAdLgzt5XalWDxnDp07
	 0xtcX6YWySqvrPZKKZVDYS+mnZAr/mQpbWz3YEwxFSqtCjuDibshWBR4lMg/lBkNg/
	 B8wj487V/OPztoVhXcaM/1Hy9PcoxVwXchvq1gW7iAxNBnmGrigADudDVgC6HYQ6/P
	 mey2K/tCYgwuMrGqdkq964EGfG92dxD7y7ckLbJ1Nq0ffEPYzy/DvXst+z/spXsX41
	 3Tl7nqAkEMgvQ==
Date: Wed, 5 Aug 2026 16:45:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>,
	Joel Granados <joel.granados@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: linux-next: manual merge of the sysctl tree with the mm-nonmm-stable
 tree
Message-ID: <anNajjU_UzCddnPr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6/lgkBHSjOvFHUyy"
Content-Disposition: inline


--6/lgkBHSjOvFHUyy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sysctl tree got a conflict in:

  kernel/time/jiffies.c

between commit:

  9e10208005eb3 ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG=
_SYSCTL")

=66rom the mm-nonmm-stable tree and commits:

  a3c70a5a9f944 ("sysctl: Generate do_proc_doulongvec_minmax with do_proc_d=
otypevec macro")
  38f8bf3859a02 ("sysctl: Rename proc_doulongvec_minmax_conv to proc_doulon=
gvec_conv")
  9eea1b9eb9661 ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG=
_SYSCTL")

=66rom the sysctl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined kernel/time/jiffies.c
index 84c6bd8e742e9,213ae1d6a0147..0000000000000
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@@ -185,6 -185,23 +185,23 @@@ static int do_proc_int_conv_ms_jiffies_
  			     sysctl_u2k_int_conv_ms, sysctl_k2u_int_conv_ms);
  }
 =20
+ static int sysctl_u2k_ulong_conv_ms(const ulong *u_ptr, ulong *k_ptr)
+ {
+ 	return proc_ulong_u2k_conv_uop(u_ptr, k_ptr, sysctl_msecs_to_jiffies);
+ }
+=20
+ static int sysctl_k2u_ulong_conv_ms(ulong *u_ptr, const ulong *k_ptr)
+ {
+ 	return proc_ulong_k2u_conv_kop(u_ptr, k_ptr, sysctl_jiffies_to_msecs);
+ }
+=20
+ static int do_proc_ulong_conv_ms_jiffies(bool *negp, ulong *u_ptr, ulong =
*k_ptr,
+ 					 int dir, const struct ctl_table *tbl)
+ {
+ 	return proc_ulong_conv(u_ptr, k_ptr, dir, tbl, false,
+ 			       sysctl_u2k_ulong_conv_ms, sysctl_k2u_ulong_conv_ms);
+ }
+=20
  #else // CONFIG_SYSCTL
  static int do_proc_int_conv_jiffies(bool *negp, ulong *u_ptr, int *k_ptr,
  				    int dir, const struct ctl_table *tbl)
@@@ -211,6 -228,12 +228,12 @@@ static int do_proc_int_conv_ms_jiffies_
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
@@@ -309,8 -332,8 +332,8 @@@ int proc_dointvec_ms_jiffies_minmax(con
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

--6/lgkBHSjOvFHUyy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzWo0ACgkQJNaLcl1U
h9Bb4Af/WxFzLlpFY9trO9qvD5P79HhjDViczHsTf2DGEc0qGsKayZal4e2QLn6K
9hQSEprH0mC0e1rTMH3qr3SLFC4kM3oSpZr+W1Cupi5bggYVR9Ax5YFAlPB+4Csh
tEdj97Cy3NkjtbgmamtPk9vAz0zPn3ay04vVYIx5MQFDXswC/A9hGa8lESTwGPDJ
beEDAyXe1GEorlkYv30dmV+O6x5QuKzzSes5kpsde+e7RItEIVNVE5yVpahgkD3f
HXMl7osDU8HKW1XCfv2YCCcog2jCLipKbvhYxqzlcWl422ysEWArAoO+01/u7Pa8
B4ZVUrdockQfPu8Yl5DdhqXt64ajjg==
=iFo6
-----END PGP SIGNATURE-----

--6/lgkBHSjOvFHUyy--
