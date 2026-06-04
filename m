Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B1C408015;
	Thu,  4 Jun 2026 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780582407; cv=none; b=luEEaDGeXEDjtzzxtZ0DTQWdl3lLtd73GTOTm7IJkwIn5qmIK7ddcDOTOpHucOafbKheohFNSj1kLJprZ56MVYDidE0SPENa6fJ1ij2OVj/5XCYWF1nCt1tizMZ6Yc1mSHI8milltYWvi8kYeRrJ/ToaChYTtQGiqsO55feYRKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780582407; c=relaxed/simple;
	bh=6CcX8yV8VOe0EN6+HgyCTiaq+fUo9Pi6VLmwfOie+nI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZT24WwnpdEUxIfyxRHLS6U5Y4ku82RvFaxmWdMkLlZnETSauIu8jN1dvXXu5XipmofJk3++fQwOCdX+z3sMY3OMYAkEzgR0Y16JlMbaEgGl3X5PZ7vt4BHT+G0L2nOpjf8DexX8Hv+gpz8p8lgsw61V1nK9RlGIAbqFY2+ai1as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNlGCnuk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNlGCnuk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4021F00893;
	Thu,  4 Jun 2026 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780582406;
	bh=eDJm0+QXogHyMLcncNn3NOGlWPPfQLymA0g0RvrTxns=;
	h=Date:From:To:Cc:Subject;
	b=XNlGCnukc6AesK25KaQ7yId1gKfmVmzjsJHFA0ChLzOrS5Y8+75EYWnhi7zmsTQbW
	 QWXM1iMJfabJSHn2kxGDC9UOQemELDAH8CJd+sPZaK1OrcBfp8oXANHifng5T1uvpc
	 GR5dMqC3XsrmiPKNNBjv8POFsitW9LCPY7mvFskAAGhJMSrLD2EKEgPMo6TN1Q/t+/
	 mnkBLOQxy7JSf98cPbwYyDdWkNSCY0Y4i4FJHemjEmoh7rEJ3dr/YmbZQeX27zaDUI
	 ilAnjV1VbWe1KW+cilAlfxRlnqyiGHj8jqnGbYzrAQAuuZSIISuBIyC0w11DAyTY3i
	 HOV/JahnrWBmg==
Date: Thu, 4 Jun 2026 15:13:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: linux-next: manual merge of the bluetooth tree with the net tree
Message-ID: <aiGIAgebpX27fJpz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="132b6OakgwO1sUT9"
Content-Disposition: inline


--132b6OakgwO1sUT9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/mgmt.c

between commits:

  d3f7d17960ed5 ("Bluetooth: MGMT: validate Add Extended Advertising Data l=
ength")
  de23fb62259aa ("Bluetooth: MGMT: validate advertising TLV before type che=
cks")
  149324fc762c2 ("Bluetooth: MGMT: Fix backward compatibility with userspac=
e")

=66rom the net tree and commits:

  8f5b6b4b198ed ("Bluetooth: MGMT: validate Add Extended Advertising Data l=
ength")
  899a200a76486 ("Bluetooth: MGMT: validate advertising TLV before type che=
cks")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined net/bluetooth/mgmt.c
index f4aa814a03975,027b266ccc747..0000000000000
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@@ -9114,9 -9114,8 +9114,9 @@@ static int add_ext_adv_data(struct soc
 =20
  	BT_DBG("%s", hdev->name);
 =20
 -	expected_len =3D struct_size(cp, data, cp->adv_data_len + cp->scan_rsp_l=
en);
 -	if (expected_len !=3D data_len)
 +	expected_len =3D struct_size(cp, data, cp->adv_data_len +
 +				   cp->scan_rsp_len);
 +	if (expected_len > data_len)
  		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_DATA,
  				       MGMT_STATUS_INVALID_PARAMS);
 =20

--132b6OakgwO1sUT9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohiAEACgkQJNaLcl1U
h9DHpQf/evqqsNrygxEQ/GOAmuG3fgx1ArpEuVFIAhJeA0uVG/84bFTxYln2SiN3
lbLB4kvJIpn9SYhxinX1sxTxwrXDt8YctO7SYjS4Unb7njSx8skZ7IOVJwe7NHu+
qKu/bv7FhIHJ5kvIVinGZYj5lOM2iRzqVwokmopufMVV8+1WFnvzZButYRiimZmF
BrRz4o2vUjJOxprSn+QgUMrrZuXrKLt3uNVGVWNBXnfwK2qXFzIcq5NqQi0kz1nw
N+xp6xDpiSaYVq2wxQ37+2KIl9iP76bs0HiCnioC7/b+tkXTxS8C88j/UkcP6Oab
e38TzsEP3agwhmG8IhjpFP+OXdDGIg==
=rqxf
-----END PGP SIGNATURE-----

--132b6OakgwO1sUT9--
