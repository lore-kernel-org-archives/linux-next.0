Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAD0366544;
	Wed,  4 Mar 2026 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626896; cv=none; b=plQwOxqJb2FFWpjYwFEqfNw8nnin7LrEv/IpkjKWH7Y1s428tqs5ItB6iub+9V0cWEbJ/xkJ4FrQOdjeqLv5JiRXBCSCWZOnAckW4ST6lwecH+E1nG4IxHl/kTSWbhLDHO2lA6wMArLip2CfxR/p2m/EGabryZ1AjPeZfoC6MPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626896; c=relaxed/simple;
	bh=7mklIkr+5U11fpdHqFgIm6fTQRjLRsa3QpET+KwLBuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=siDdaZ+WcZsErO+YjTWXog92DtlzL/BvDCjpUf0eOyksFiERMEYPR3lHPbx2H4ctEJZ1eo9lrtImy//EPnSwOkLsmRFzzBSB0++UqrPGHoSk8UfA+4f3TFgHp1TGGD66kr/nB5wAF++BKDex4pFpMHXtGoHErl6Us+N8rxGLBo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5RdpCfP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5RdpCfP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FF8C19423;
	Wed,  4 Mar 2026 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772626896;
	bh=7mklIkr+5U11fpdHqFgIm6fTQRjLRsa3QpET+KwLBuY=;
	h=Date:From:To:Cc:Subject:From;
	b=t5RdpCfPRpiLeHEY8Z1NQP9ITiBkv4VmOymCGdOvNVa37IKfW/hnh33VqFSiyfpGC
	 alty7eYtIDRkQW6Kh4mprnf9vTJCkRwZjq9yd0/tkfpQnJm6u9SQ67NyR6XyQKoqJH
	 p9KyxKFyen+oDrgkSJNoN2RnSUgAFlE3SXYrsTBZpezC7If9bOB9CAslBzW/I/H2CD
	 +k4kgHxTOakP1rLoAD9JXYLHGZQDWd1dur17Lxa3OwC+7ziMdNufWbj7Lqr+eBsJOJ
	 i0+beWK4tYl7Ky9w0VTiBu332cW6a9ZarpVHxcUsi7q76iNWn6KCDZNp+EDFKm0vcH
	 oN9EVpUneOaQw==
Date: Wed, 4 Mar 2026 12:21:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Chao Gao <chao.gao@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>
Subject: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <aagjzN07Pv1fnSHq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GsL1QkAk1VR/qkJx"
Content-Disposition: inline


--GsL1QkAk1VR/qkJx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/virt/vmx/tdx/tdx_global_metadata.c

between commit:

  311214bf1df4b ("x86/virt/tdx: Retrieve TDX module version")

=66rom the tip tree and commit:

  75b6c694eaed4 ("x86/virt/tdx: Tag a pile of functions as __init, and glob=
als as __ro_after_init")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/x86/virt/vmx/tdx/tdx_global_metadata.c
index 4c9917a9c2c39,360963bc9328f..0000000000000
--- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
+++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
@@@ -7,22 -7,7 +7,22 @@@
   * Include this file to other C file instead.
   */
 =20
 +static int get_tdx_sys_info_version(struct tdx_sys_info_version *sysinfo_=
version)
 +{
 +	int ret =3D 0;
 +	u64 val;
 +
 +	if (!ret && !(ret =3D read_sys_metadata_field(0x0800000100000003, &val)))
 +		sysinfo_version->minor_version =3D val;
 +	if (!ret && !(ret =3D read_sys_metadata_field(0x0800000100000004, &val)))
 +		sysinfo_version->major_version =3D val;
 +	if (!ret && !(ret =3D read_sys_metadata_field(0x0800000100000005, &val)))
 +		sysinfo_version->update_version =3D val;
 +
 +	return ret;
 +}
 +
- static int get_tdx_sys_info_features(struct tdx_sys_info_features *sysinf=
o_features)
+ static __init int get_tdx_sys_info_features(struct tdx_sys_info_features =
*sysinfo_features)
  {
  	int ret =3D 0;
  	u64 val;

--GsL1QkAk1VR/qkJx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmoI8sACgkQJNaLcl1U
h9AVgwf+M6DY/g8J/l+P4ZmibVVWJB9qBrED/kG8LXBGM3IwO9eX+s5YuZk/7oHr
UFtd2WFrweWohJ9vhhcIMh9zABKZGouGk/43Z707InHNU+HQWpNnpCHe/VQ0OYiw
yPbnbvJlysVkl/n1MKy9et8UzG7Mihto3pGKnPMGcJJVakwp7HsvoyOlKI5J6lvJ
eihnWNS7GWcC5LkTOWQ7s0PTDss+q61icnGfENnsTbp6+KleEVnqxr5GITUcwTj2
quTRAI0lbsrgnnrsF6vckKmKyo7XcnqrRlWDfcsVqxdHokRIYZQXqQUP3d5t/06o
/f8tR/buaCV7C+uC3WcUOMdRdwXpXw==
=aal/
-----END PGP SIGNATURE-----

--GsL1QkAk1VR/qkJx--
