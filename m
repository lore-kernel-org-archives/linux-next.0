Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A923D2A1;
	Mon, 26 Jan 2026 22:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769467852; cv=none; b=Bo2qfL/uWVt8uRMaBOhyfbw/07BHYj6tUcvIyffPjmYgIHYBFi7rnzjPRbmw0U0usb1ZwahtmzeCwIeZeIhEc//rgo29kPb2BpTzNSlpFltpQXNKIXgEc0j4k5UKJi6C41BWep73PmPBdLvEjJLzdKnjTlF6ZcaIA9LL38spwEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769467852; c=relaxed/simple;
	bh=ehELMWxDdWr3U8hAhLuLS59JXkVJ21JOfvcLfH2zXUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VoPHFZpsfjWnkQQQaV9knpJ4F/bMFQtNhUBh55GFeR6K8jcIiv1adbZ0w9yeDM//2mcfQUinJBOztYljQxNo87/AXdgXepSaH8cxQbPTEdLhd59JZtiunnS/te55kQ6w67hg4RBLhP3bksD1/EU0ktkxs4++HJ1NxmbgEwK2Q9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ueR/+5zk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ueR/+5zk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED4BC116C6;
	Mon, 26 Jan 2026 22:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769467852;
	bh=ehELMWxDdWr3U8hAhLuLS59JXkVJ21JOfvcLfH2zXUQ=;
	h=Date:From:To:Cc:Subject:From;
	b=ueR/+5zkzPMZV/u4sID0rZDn2fmkXhL1QZtZIVcGIOTVrJL6tEXx4VsoO6V8CBAqs
	 ONmSGrqgCa4AByVjasAY2Qz2IdvXt8JFOdHRR/RQAfiugzpTBwBVfeXC/vyv6yUm7W
	 4NK28lIJ/1yDTbydE+LbUIf1fs5k9YBMKXKfBCltLaNO0R2UfDzxcUczWoevEyI5C2
	 PX7xrawLMkhPIOumO2kUAwqKy9Kf1xJdjmf0+KieFRXz4Yyxz7A0pEekIr/8pg4ppO
	 eJt/aaXCTjRaqONj0DKzZlvY+hpKFLY25U5vsMlVs1NORK9fONozIr9gxEj7xHHycG
	 1/AVx6XdWv+IQ==
Date: Mon, 26 Jan 2026 22:50:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
Subject: linux-next: manual merge of the cxl tree with the tip tree
Message-ID: <aXfvyADHrlh2BWxJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tq/OVyrE0DZz5K8r"
Content-Disposition: inline


--tq/OVyrE0DZz5K8r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cxl tree got a conflict in:

  arch/x86/kernel/e820.c

between commits:

  44f732f3ec827 ("x86/boot/e820: Clean up confusing and self-contradictory =
verbiage around E820 related resource allocations")
  dc043d6463bf5 ("x86/boot/e820: Standardize e820 table index variable name=
s under 'idx'")

=66rom the tip tree and commit:

  bc62f5b308cbd ("dax/hmem, e820, resource: Defer Soft Reserved insertion u=
ntil hmem is ready")

=66rom the cxl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/x86/kernel/e820.c
index 97b54bd0f4822,69c050f50e186..0000000000000
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@@ -1171,20 -1146,23 +1171,23 @@@ __init static unsigned long ram_alignme
 =20
  #define MAX_RESOURCE_SIZE ((resource_size_t)-1)
 =20
 -void __init e820__reserve_resources_late(void)
 +__init void e820__reserve_resources_late(void)
  {
 -	int i;
 +	u32 idx;
  	struct resource *res;
 =20
- 	/*
- 	 * Register device address regions listed in the E820 map,
- 	 * these can be claimed by device drivers later on:
- 	 */
- 	res =3D e820_res;
- 	for (idx =3D 0; idx < e820_table->nr_entries; idx++) {
- 		if (!res->parent && res->end)
 -	for (i =3D 0, res =3D e820_res; i < e820_table->nr_entries; i++, res++) {
++	for (idx =3D 0, res =3D e820_res; idx < e820_table->nr_entries; idx++, r=
es++) {
+ 		/* skip added or uninitialized resources */
+ 		if (res->parent || !res->end)
+ 			continue;
+=20
+ 		/* set aside soft-reserved resources for driver consideration */
+ 		if (res->desc =3D=3D IORES_DESC_SOFT_RESERVED) {
+ 			insert_resource_expand_to_fit(&soft_reserve_resource, res);
+ 		} else {
+ 			/* publish the rest immediately */
  			insert_resource_expand_to_fit(&iomem_resource, res);
- 		res++;
+ 		}
  	}
 =20
  	/*

--tq/OVyrE0DZz5K8r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml378cACgkQJNaLcl1U
h9DMPAf/eJx5ApQRI7tFptob2arcgOShfIGL7TxxcftZfUnTbRkk8Yaz8LQThJTH
LQmz5tY3zxRO1Xc9k0JYUu6cYOJVlfPwvijJS5umEcytbc47FQWyDYAJStFCicDA
FKKIlB45eVbGI37CrZWZE+iVYreMVniWC155IzbKaTU3WuYAVhZ2JD9CbGAtURjK
gEV+/3qYbbKwIKOgCaVEm/+YLVZMDEgyhGACVJPNH39G4JKgbpt2rTwwkANxzfrG
mB3bRoF0yXIwK5/JZiMW3cAX26EvqsQu6JGLBSIkbFqRs1VX6X7tTvr5N5WwaFys
zw7D2yfDZmIG/3bgoGIq6s4M76K9vQ==
=kaa0
-----END PGP SIGNATURE-----

--tq/OVyrE0DZz5K8r--
