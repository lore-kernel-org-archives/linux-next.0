Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799243803D2;
	Wed, 11 Mar 2026 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244675; cv=none; b=Abb++tIo5ilI8q3KlXCXvNfQkudhErRWpke2n3rco4GWKdt0lYGrOb4kf2+t1pWxxblzFsTsHtF3Mvz1XQgXfJcBc2DDFL6+e5vRlF+Sd+savTnWSekZGZhI5V+0SNlunGydSGJo215XSSAJ5znMi8s+OmEDVh3WuIMjGfrQKw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244675; c=relaxed/simple;
	bh=WdrHs3xeblzXL/s8QYf1gPYPUnOfZjhZt+KsxlhRCWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sAW8eMKQ+RCHGwmDkei2naGPEA5K/JznFuTiuCgBoMsxM/e3wCq8bN+u2lqdwXEvdG0hif/o5R8MBIZLvICW2PqiEg6ng+mKH0tiYQFnZDDYfx64e2w0bY8yj2j1vI19N6JBBmmfnQMGzzjGIlZrxO9RB4HjNTi9bUsp5/U5zUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOvvqtpc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOvvqtpc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E106EC19424;
	Wed, 11 Mar 2026 15:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773244675;
	bh=WdrHs3xeblzXL/s8QYf1gPYPUnOfZjhZt+KsxlhRCWc=;
	h=Date:From:To:Cc:Subject:From;
	b=rOvvqtpcd0d5KWRFOj24b3n52oa+DpKuOAoAnut5mMZOWaPoYQX9rvDMMgqkXDiZD
	 3myz9BuO4hWSijSRfYhNzqGW7YF65az4QZ9ZUrim+4iCPHvYgbECQX+MM4x15PL1EN
	 h/rZjJpglX5pzCaD+bRg09A8SmLqMpXQN9/z5urDVhFj37oBww3nLEL76MVqaOgCI0
	 SGo3W3hYZDxomsYg7/Jys6/qVhu9XggF0/WBBKspXyomeSgESjwYYV/KeG1WGzRiAA
	 MB7xQsk6t8DsFvvH6Cazg6CcF1xlp3y+eADdeXPvpu9t8ulCEsIqc11ft2II2O+a8t
	 XZuPOFiDVCh5Q==
Date: Wed, 11 Mar 2026 15:57:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the final tree
Message-ID: <abGQ_oGjSltl7yxe@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fGdriS3ta0b6V+wl"
Content-Disposition: inline


--fGdriS3ta0b6V+wl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

During the final build, today's linux-next build (arm64 allyesconfig)
failed like this:

/tmp/next/build/arch/arm64/kvm/hyp/nvhe/trace.c:16:10: fatal error: simple_ring_buffer.c: No such file or directory
   16 | #include "simple_ring_buffer.c"
      |          ^~~~~~~~~~~~~~~~~~~~~~


Caused by commit

  680a04c333fa2 (KVM: arm64: Add tracing capability for the nVHE/pKVM hyp)

It's not clear to me how this is supposed to work for O= builds like
-next does, the Makefile does:

   CFLAGS_trace.nvhe.o += -I$(objtree)/kernel/trace/

which is pointing at the object directory but simple_ring_buffer.c isn't
generated so I'd expect to be looking for it relative to $(src).  I have
ignored this for today for the purposes of -next.

--fGdriS3ta0b6V+wl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxkP4ACgkQJNaLcl1U
h9CCZAf+I+tXYpmBKN9YYKMCQm+xl2nCMg744lhw8ZIOeL69wivsJWU46jWS/qNN
bQQXxqOJprE70qdBRu0k3uU4axZlHhzrqFueIOaNwPcUauVlJpBLsg81BBjRL/H4
7r6UrUfmg05N/8fI6FMnJDk0cnw3Ee36yJaNg2FXHgWqQF0eUN0EnRbTWW9KZ5/k
AcKQsW/Db0H2gC81pYSJhpC2PYvc81vq0/Qqg/f5+04Uf2BOVTSAWdRH0Q3ZXARl
ih1nURdIYFmZltxyfKFINZL88wHghgsOI32zKA8igt4DMQmz13OpTlZgkJ7fEg/4
LynQ7n35ov1Y8mouEO6gW87cTwhvYA==
=722Z
-----END PGP SIGNATURE-----

--fGdriS3ta0b6V+wl--
