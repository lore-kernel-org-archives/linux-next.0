Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFAF296BDB;
	Mon, 23 Feb 2026 18:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873024; cv=none; b=VSBDEjkKJJccwRG2/ydzJHYR2J3IOWJtNkZvLebKLMU1muvKX0qTVd2rW3YDGj3/b7l/EJy0qJU0KxkH3vS0ZPg3wjUPLkceA4XNlNTa4tb8L+l69T1gjYNDEjuzuaT+M6HIu2R/HYgqosyIxUOcSyLG4i+zHpbwXnjkJMZpwEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873024; c=relaxed/simple;
	bh=ECcGiIiCVNtZtgp0LEUz9oiHptzMbElK0MmzTEMxbAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wsdz9nZPIN7EVR/2dt9s2h7CEIEAZSx3iCb8CbbM7da9GllDAF1djjx8gaCNzKvxeWVcdr5ppIXOEprpbnCrIr12zaaePJYIirbE5OfXrgYkMn2LNWBmXJE/WFtCauAoE7XlTfZcOQWRPfAqGWXQGnvcDs63OJ4j1F0i0J+rj5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8OiI/QZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8OiI/QZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2576C116D0;
	Mon, 23 Feb 2026 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771873024;
	bh=ECcGiIiCVNtZtgp0LEUz9oiHptzMbElK0MmzTEMxbAc=;
	h=Date:From:To:Cc:Subject:From;
	b=R8OiI/QZZfB5JmzWcoAY2Sp5UCPGPb7O2wqp1ZfkwMhH+sufBh+CNrQKND05OOSxw
	 YKICW4UCkCnntuclK3G7Cz1xJdCu4EhrVn0/qoRS4/uV030jp09A1eCdRnn7uOZgOD
	 QqBA+LPdl6Y9dqJRzgHJdYgUzkjOoOE01PYAex72pcfrm2uQ6sExuWGfmkYU4zWq0C
	 stE3P6K3/hnL69OxVLActQBeGzImKd5hgr2i7QrJhfO8Onu7KJOU6NYH87C2yGBrun
	 Tv8vF/pB6MVBS2pefCupJK8ZMTJ+k7sk6kYou7e36et7UPDLAlb7MITQpXJo6RGQfs
	 ak0TK8ZPM+Ybg==
Date: Mon, 23 Feb 2026 18:56:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <aZyi-yCFoilK6C7u@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QvFcYzBgespsEbHF"
Content-Disposition: inline


--QvFcYzBgespsEbHF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/i915/selftests/i915_active.c: In function 'active_flush':
/tmp/next/build/drivers/gpu/drm/i915/selftests/i915_active.c:326:28: error: 'struct dma_fence' has no member named 'lock'
  326 |         spin_lock_irq(fence->lock);
      |                            ^~
/tmp/next/build/drivers/gpu/drm/i915/selftests/i915_active.c:328:30: error: 'struct dma_fence' has no member named 'lock'
  328 |         spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
      |                              ^~


Caused by commit

  1f32f310a13c9 (dma-buf: inline spinlock for fence protection v5)

I have used the tree from 20260220 instead.

--QvFcYzBgespsEbHF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcovoACgkQJNaLcl1U
h9DMoQf/VkFzDPVDU8H4TnBntftCMC2NQkSWcTpAkLvre3bHEDTEa/Ou+eeA45Xy
jb5OgRszEGfOQIKSkUl+7mmNTo8qPstFnDaM8tokkqyFDGNv4azqKNJ3Kp4DOKgi
jbqfwlTzHgmHTCS03Z6MsLc+vUPGHvyyjO/nPYFAHR140/Tn3LllFMhE8fAslq4J
SS6gGsozM7YcOiHpKFZNaRDTgYP853lDQjYZ1D5dtFw/Mb/E1vcemB3jATL67mri
2uGZCvEdFkMF6e8C3DOlImI2m8sBjMoz6R3jEMN0woroP0EY5KgjIb9uAxlFuEl4
2hlUDOOK0wPz5bDNriUjnoD2ivbsvA==
=+Uu7
-----END PGP SIGNATURE-----

--QvFcYzBgespsEbHF--
