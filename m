Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D78940FDB2;
	Wed,  4 Feb 2026 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770214755; cv=none; b=MVNzI4k0FwMRNnVI482ewh/LwOLZQrmq+A4Kj22KtMPi4HLP9ySf1VdwygpsjbPdgcbChP+yDXp2C19Um0g1v+C9jfTrdXTheiY6avxVf3e6WrtopGvW/i61coZHgh0MPyZqAELjKoLSr/eGCly/TqudWibdcIH6JM5P3JxIyDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770214755; c=relaxed/simple;
	bh=x7AixGXwNIac+RP1XfwUAor8+SZa8T4pp47tFQ5uzqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OiXbhl71Vi5J4P39TTktfTWX4HN2W7/01BYXxAiMEGCdkH/hg8g+g2MIylnhbXlHo8lIFcBkhgeV/LmY6mPe6BZycm31ZdpeeiKL5/WofhCfVS5NqI84fR1Q80WlCrPGtK0R08gsrCnbR35b0fwMGbdEMkQC8dJkUkma+pTjgL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4wTpUr1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4wTpUr1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964AAC4CEF7;
	Wed,  4 Feb 2026 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770214754;
	bh=x7AixGXwNIac+RP1XfwUAor8+SZa8T4pp47tFQ5uzqY=;
	h=Date:From:To:Cc:Subject:From;
	b=O4wTpUr1cZ6UMbm21h2daf8H0x77vt57/Q31ntt671pKrucoBAfQ3ItPHMCjmoGMq
	 Y+xbFW0axjhxiQBZldflIcbr/mase9UFd9Nl2r0VkqYzE4Y6nFStFj6kj9S2pRZ9aK
	 tMgRTLirwk7CvdMubkTA2JrdLlvfq/aNonEqaYCSAV8fhiyxo3LFVIwUw8Eu1GraCa
	 IogLHMUEvpT1wTktBftRk3+IUGt6bM6KEPYOwDfjZJArPNdKA8mxqpKyD89G+0L4yM
	 AfpmPKzmt/x0UDoKQOjzbMJeroB8FfQjO/T4wa9yyT+xpPeJOisGcg8A3tF3CM/+HA
	 Dddd8DROe1dHw==
Date: Wed, 4 Feb 2026 14:19:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Ira Weiny <ira.weiny@intel.com>, Li Chen <me@linux.beauty>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: linux-next: manual merge of the nvdimm tree with the vhost tree
Message-ID: <aYNVXlLl98EbCBBO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H5kK8TVjiqeX+yd/"
Content-Disposition: inline


--H5kK8TVjiqeX+yd/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvdimm tree got a conflict in:

  drivers/nvdimm/nd_virtio.c

between commit:

  b381542686726 ("nvdimm: virtio_pmem: serialize flush requests")

=66rom the vhost tree and commit:

  c4ae8ec088db0 ("nvdimm: virtio_pmem: serialize flush requests")

=66rom the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(note that the changes to add out_unlock are dropped)

diff --cc drivers/nvdimm/nd_virtio.c
index 827a17fe7c710,af82385be7c6a..0000000000000
--- a/drivers/nvdimm/nd_virtio.c
+++ b/drivers/nvdimm/nd_virtio.c
@@@ -44,8 -44,7 +44,8 @@@ static int virtio_pmem_flush(struct nd_
  	unsigned long flags;
  	int err, err1;
 =20
 +	might_sleep();
- 	mutex_lock(&vpmem->flush_lock);
+ 	guard(mutex)(&vpmem->flush_lock);
 =20
  	/*
  	 * Don't bother to submit the request to the device if the device is

--H5kK8TVjiqeX+yd/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDVV4ACgkQJNaLcl1U
h9AbYgf+JRP/1mq1Wq256ARlf/9OeEIypcqzwOCo4vNA4JrRBexVO/ci24DuwMc1
ZGIpvDa14t0rImG3vpMz2lfcqZqULvREBil0COPQ0D+QNB+msm+nDTVjJQYrp6tF
EMTUYzFHUQS6Xr5WhDfpXlxOJFdBoyycbvaWrV3oy9B2YKGfFCnHKEIFxSNDE+nJ
WeGzztloWrv0qybaE0lYcVewUxCG7tLMjUrOk0iOriSdF5Mml79fDsSucun6og26
XJ1XG7a9pHppkSdfdpxxpLxxZf6tXkzfLE9yv4/U63MR/MWuewuJopvVe+Exk6jY
2JbEQypgR13Bc9RZs0Dd0KUv5mVghQ==
=nxs6
-----END PGP SIGNATURE-----

--H5kK8TVjiqeX+yd/--
