Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D498F3B19AF;
	Mon, 23 Mar 2026 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282288; cv=none; b=W03GWGWt4sFvh+xl5ivmdoqkLCtFv1hL22q+xK2Yy6at1VXTbkauuS9EGGOf950E7OcsgqtPV/2A2XllCzt70ru9CrxfUqHTmBtJZ/KjrDN/2SMYJDmAdyxC76gkvqdytT9avoCx9QWQcKQO/tt6JMwq9K736Ooj21YNPb6q7bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282288; c=relaxed/simple;
	bh=V1LVRrZnRMFi9aIQt/j+G/0pQkJFmJQGCM1dZ8y49SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EOp19CLpPKEhQy55lMWJBGd3y2upiCHfp4+sy6REIdPXbdbOoYK53ZWXz5jTOilhLyCK66jj0uIsI+VyHxndSwOMtsvoJXyNGb5UsCy1feBpfYzY2EA+vMnemsTlcnS8RySkRBFLuvXvuvtAupTkto8mb2tASh4jY3Dk51ScFN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SA55263E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SA55263E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7250CC2BC9E;
	Mon, 23 Mar 2026 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774282288;
	bh=V1LVRrZnRMFi9aIQt/j+G/0pQkJFmJQGCM1dZ8y49SM=;
	h=Date:From:To:Cc:Subject:From;
	b=SA55263E31kI8Si4S8zxuSxtt2si9huauHQlIn+23XRK6E7GZGD4GTZQZr/Yos3pC
	 WIzbnXDDCFwsHoUat1XqiAS3rbX++QVmXHEvF9IgYYrllyPeRGlcD1mRXsaR4OZo8g
	 qf//fGZf4u7O9gNSJaAW3j+niN8JMqK3iGioFk5qhFRD6jRNOno+UrXHXrnnaGCkmd
	 mtpGGk2CmlkpIReBICI1bHvyJ0YVM8zfJx/oDTKSDBXOxqDV4U9TAzT3rw9IZG8ziy
	 ltZ8wHO0Lg7BooScd7ibiYyp2tZMp4XiqCJutuwUfP02kITbc/8/11MJeNVE0yPpZF
	 IEnd6ss77VJJw==
Date: Mon, 23 Mar 2026 16:11:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Zubin Mithra <zsm@google.com>
Subject: linux-next: manual merge of the tip tree with the devsec-tsm-fixes
 tree
Message-ID: <acFmK57zs5UhM0sg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IBdSIgHAu8lO+gjc"
Content-Disposition: inline


--IBdSIgHAu8lO+gjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/virt/coco/tdx-guest/tdx-guest.c

between commit:

  c3fd16c3b98ed ("virt: tdx-guest: Fix handling of host controlled 'quote' =
buffer length")

=66rom the devsec-tsm-fixes tree and commit:

  0f409eaea53e4 ("virt: tdx-guest: Return error for GetQuote failures")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/virt/coco/tdx-guest/tdx-guest.c
index 7cee97559ba29,23ef3991c4d5a..0000000000000
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@@ -309,12 -306,12 +309,17 @@@ static int tdx_report_new_locked(struc
  		return ret;
  	}
 =20
+ 	if (quote_buf->status !=3D GET_QUOTE_SUCCESS) {
+ 		pr_debug("GetQuote request failed, status:%llx\n", quote_buf->status);
+ 		return -EIO;
+ 	}
+=20
 -	buf =3D kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
 +	out_len =3D READ_ONCE(quote_buf->out_len);
 +
 +	if (out_len > TDX_QUOTE_MAX_LEN)
 +		return -EFBIG;
 +
 +	buf =3D kvmemdup(quote_buf->data, out_len, GFP_KERNEL);
  	if (!buf)
  		return -ENOMEM;
 =20

--IBdSIgHAu8lO+gjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBZisACgkQJNaLcl1U
h9CyfQf/dacL1NAFXJWL+FxAOwhtvt1TD4xBI1nEB1iTAN+x7soGOuC/MUHTJeo3
V9kaNPZZsXkDbJb521y8QiCVnf2vEPbosh0ItSubPFH5sFjq70RUq+BpRfiIuDjX
S+Q3zOOLeO+kYgHKLqbJtWhPqjABq6G8tUYmYx03X3h2vHTO+X8URDD76lNdCY0w
F9fGRluLzZZARQT+YcHCS0IVIkBmYWTqWhfHpo0otmoHCcwVgxBtDMpFXdO+s6G2
gSDKYXriZBQX2aLff8yk9OuuE5BgoG5pNrxBLfGVo731Sq2BX89R4Umz/lMiXy2W
Tz1GbZNIU/vdkETlu3LXVC3jB03vuA==
=69Xg
-----END PGP SIGNATURE-----

--IBdSIgHAu8lO+gjc--
