Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A511F5834;
	Wed, 11 Mar 2026 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241262; cv=none; b=dT+Ios1szu3vDXibjUH/nDRssDma+pB8dHZ2pzXP+rxwf2h7AHvA+J7qWOKcy9m6vkw30CiByxk6I/gYAwU59yePeEM2cmHI3pv0RL1AobWvz/XdMjJzKaMbp6amfLAxY6BG+9cvE3b6+um73XfGRJrT5i0BTsEKQ2S2q9pMgXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241262; c=relaxed/simple;
	bh=ymcERCacbn6nFb2qoMB7fYvlfWhBEYXJCANo3OS2jJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcVTVQD2EtJhxOd5J3Qnr5TMvVq8cB++VJYXQiJgv245dpoF+KgDCLAJjudwMUcv3R7VlNNH+8+Hy+tye7D+tHhoNCKszoFNlWqs1SeD0ppp5yr5FNHxtDmGJJJ8TKo8XK2J8sgIYpsX+Qim08X/0jQWOcnhetc0K3s9uydABJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1poh5U/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1poh5U/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB54C4CEF7;
	Wed, 11 Mar 2026 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773241261;
	bh=ymcERCacbn6nFb2qoMB7fYvlfWhBEYXJCANo3OS2jJ4=;
	h=Date:From:To:Cc:Subject:From;
	b=g1poh5U/JzJSsqXQfbXqS2476M6rEUhrJgcBzbFGbVICHpdSlZU+KbXY28cyWr/k7
	 X+0OOls54afCyGbOHNIdTu2tiOnpDbZge5pOVWCjNBsdCp+Si6SBEJ904kY6pkpaWl
	 2mBu0hO7nz0moTfsbDZx6kbljmNh779z82YzDzb9XdNwrMRdipNcrRfGU9OKgriDbX
	 vvSeZJ1poJsHlxGKtUZr0wCfuKdf2hbjR9IEahBRVH1P6n79QtzeFydj68hgJUA4ys
	 kl/JIqXAm+tSdUFEZ3YfVmc37AGzEbCjV96QRd9d8qQUoZRK+C4CBqrkqa05Gi2w/o
	 4mHw0HOg9x6uA==
Date: Wed, 11 Mar 2026 15:00:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nikita Kalyazin <kalyazin@amazon.com>
Subject: linux-next: manual merge of the kvm-x86 tree with the mm-unstable
 tree
Message-ID: <abGDp4jguPV2H2Mf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="korurQc/11RgqHhh"
Content-Disposition: inline


--korurQc/11RgqHhh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  virt/kvm/guest_memfd.c

between commit:

  83f131e867e17 ("KVM: guest_memfd: implement userfaultfd operations")

=66rom the mm-unstable tree and commit:

  6dad5447c7bfc ("KVM: guest_memfd: Don't set FGP_ACCESSED when getting fol=
ios")

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
diff --cc virt/kvm/guest_memfd.c
index 46582feeed75a,462c5c5cb602a..0000000000000
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@@ -108,12 -107,6 +108,11 @@@ static int kvm_gmem_prepare_folio(struc
  	return __kvm_gmem_prepare_folio(kvm, slot, index, folio);
  }
 =20
 +static struct folio *kvm_gmem_get_folio_noalloc(struct inode *inode, pgof=
f_t pgoff)
 +{
- 	return __filemap_get_folio(inode->i_mapping, pgoff,
- 				   FGP_LOCK | FGP_ACCESSED, 0);
++	return filemap_lock_folio(inode->i_mapping, pgoff);
 +}
 +
  /*
   * Returns a locked folio on success.  The caller is responsible for
   * setting the up-to-date flag before the memory is mapped into the guest.

--korurQc/11RgqHhh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxg6cACgkQJNaLcl1U
h9BYFQf9FVgmq1ggslNAP95zXMFd44P0UCY9ADx94dWnCrxma2aufbPwLVpbbdKo
GiQoMQHTi8kdrEfY7upJ141Lo0/OhFJi0TMO73NKMuRxjABoEHJQH3z6tlM2l2BQ
+BN7X3znOphYlbBsPc7KOf5Lfr2SWEQ/NXenXZgBENg07b8XjeQRQ03RLEU9Us4x
89tQWZetB6OIhKyidL3JTnp1XJIn2msfOMGFxB9dXAlBGcrj8JIOlCn7EiwKJvSh
UN1gtqzWH1jSrvP0F2ZAeQ41BZQY3uVtiKzxxw26KEKOiqxotOGFbYiSiaADd+y6
hM7UdBJNhiQ6VJaQJyFumuZkCKGxpg==
=ol1t
-----END PGP SIGNATURE-----

--korurQc/11RgqHhh--
