Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257753126A0;
	Thu, 23 Jul 2026 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784815511; cv=none; b=rZIgp7QRsUWTJuzbgXNnQfIzHGH7NVjQn3eDEZBhALVJucPYhLtBzARUVd+JsNOpw2q0iHejfnV2S343IX2JRQQ+ueuwEFPb9VdvpYfDoLrGjPThmRhz43U7sUkM1m+rtYHKekDHtqXXbf5+1Mvo+yZ06sdgRIJzMmmh2fMkEgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784815511; c=relaxed/simple;
	bh=spzsyIIugj0gk3X3Y+2HV8/064+Zwyno9LRkBEd3Xsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WgMMreJ7+yKuMB35MvG34y3YVzNQcU31oMPsr+NMEodujs/Llglel1BKacnIAKd7MKqTKCWtc2edhBI1drrG8m1yfnx8+IZEzuAgH6dJHwDl6UnfTuixthv+Cw+KdTcJ8TB2YAb6UZbnFF+abqXzStvPl/O7SnG4Hhj6x3HAsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HybIAyPC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HybIAyPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B518B1F000E9;
	Thu, 23 Jul 2026 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784815509;
	bh=OfWoiVAJf+OWQ0eH9Ufgm255QsLfRlLsPtqonsmdGeY=;
	h=Date:From:To:Cc:Subject;
	b=HybIAyPC05py03tADgVBFmBnVCnRRICdagNHX5vgX2eLnNq0BrNtzJX6Wt7yAU5og
	 GyhVLrUIR2j/5uJDYrgG3EV0f1ZSV+0VNqOX8dmLYdZTSxJ4WBsZGUtLwtI5l8YmXi
	 gi7JQ81UCRthAuDTiU6kJW/QN4Sdoc6xqZPRQmtUr1U8JLJjuR9YhX5xwkP2/vQbTZ
	 pggfdMrl6r4/6J3VVvSGphrbDbDzFP43iLwu/xi+ptyBD8LFJfTyRUH6+uPHN6s5ql
	 v1yuSh4iBRGvNlZs6IrPt+U8qp0dqv/GRZnFu2R2DwBb10dgv5DXo8XmsWz8GQ1QCp
	 DUwlp8hy1Abzg==
Date: Thu, 23 Jul 2026 15:05:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bluetooth tree
Message-ID: <amIfjcofuHRm3LX1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5KQYAEvx2tjUWuJq"
Content-Disposition: inline


--5KQYAEvx2tjUWuJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in the net tree as a different commit
(but the same patch):

   891916abe16fc (Bluetooth: btusb: validate Realtek vendor event length)

--5KQYAEvx2tjUWuJq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiH40ACgkQJNaLcl1U
h9AS5Af/cwddCsyqqIIs9SmSt6KP7Qx1NuCJWl6kOEXdSVVOdIYrJxFsCHjxFKaa
nTPtXCevVcZEfVP9TK2eFEXyLCY/3jJZsrxJp9vHERPjs1uWqPgPP4Av40iJu6cx
fCYAcjNgPHUifLK9BvfJ/kZ2CgTmge3xOM0BTIikx2JB7pw2O6ZALUF9sxlTFw8B
4IwFTSlbW/ZQdD/rD6r0/dle+/GUDI5+akxPBQZ0m23VJrDwwtGLN9VUyilBtVke
ecp98mWi/eM29NuLqbR6AlgUDQNTMTS9F4jkoi3Hcjd2JfaxHHmHwR8c1jXK0iYp
kdsFp7cT/ols0/JLYR+/lO33/AR01w==
=BFvz
-----END PGP SIGNATURE-----

--5KQYAEvx2tjUWuJq--
