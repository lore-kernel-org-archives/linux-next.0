Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A4A36654F;
	Mon, 22 Jun 2026 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125111; cv=none; b=HVF/9T/WtrIJ84oCKl8EpD3PBc/rkddfbNfAZL4/VkV62kNxO1+mO9wcQlLnOoeLhknXBFA3ArwiGRwaNR0DxkjcbMazCIWEsXfhA+wzgoDO6THh8JfSDcHzwK4lIchgAqKWtdQWi/JyP1SHDTjgPsngjVh6abomO8A4/Amh6GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125111; c=relaxed/simple;
	bh=TM6VK0JC59arjHPTmnfcPl0BJD7bGuQvkF/hkKvPt+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOo1AJxYKzGiTk+lb7mF0lP49ebxm8RcftvluXYWy+slLL6wyZISBdb0nTtpBMIXxu/MfadZsfaEknHXituJrcitTlLV6YbqG592EfEwHA4o5M0jJ9MfWSUf7BL/mjlvsasfL1cdb13IOcB1BzNlOqgUSLDj3Ryk5+SPX7D9Iug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1NtF5gY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1NtF5gY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B775E1F000E9;
	Mon, 22 Jun 2026 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782125110;
	bh=rEsNl6rBqt+G/Ruk8hnxlHD76PhOxanvqCNc3IyKEgA=;
	h=Date:From:To:Cc:Subject;
	b=D1NtF5gYYspzSt6ApA2JxBxmz1iNKATkJTvQysqwux/2lWK328j4ToNL0SfnhWWH1
	 5+q5uxj1W1cikUvH8Sn7RqVANAsiRjHVZE6qWo7ASbFyf30jPwZ0R5ggv1KGAfeNP+
	 PWwK72HgEInQlB1iSb1we4W7CNpTw0NLiduBM5dZ4nRCm5otkqsTdC6rb4UVPClX6U
	 ZF66DgjEqGMYOvKxF4I0EpuXw7qMYDfTsocOSATHl2slSj2PahjS+xy587yUXHAg3n
	 y/oIOOmJTOLP82n++k+ydXGENpdrHYijH6vBWPVEeaTI33Zr19u41533E4kQ7MeCG4
	 vApAHYAoYosyA==
Date: Mon, 22 Jun 2026 11:45:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the amdgpu tree
Message-ID: <ajkSM2E3NMSYNc9M@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uNc33Gpi+EuMbLUH"
Content-Disposition: inline


--uNc33Gpi+EuMbLUH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in the drm tree as a different commit
(but the same patch):

  1b5e413713c0a ("drm/amdgpu: Fix context pstate override handling")

Please note that it is the merge window and you should not be adding any
commits not intended to be merged into Linus' tree during this merge
window.  Both copies of this commit were added on the same day, during
the merge window.

--uNc33Gpi+EuMbLUH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5EjIACgkQJNaLcl1U
h9CF2wf/TZ5s91euwTAnI0Im2xnFBzqAjPDntj/VWW9WWmnPdV/j8uNuTsRd1UfB
dzjWLB0mAvExWKo30rubOSzK7Xi4nYixrC2KiBMdQi74ywr5ywpRWNm1T/FAUPqJ
w/u4Fo8knBOfwal+sbxLgu89/hgcAySR/5niJcWQxrNFSOr1XdLksvFjnUGqHREK
jC8IuF9lcT/HtOn/tygFiaAdfce0bGYKiSN4flAqKU7tCkTaPBfhH+bpS8E+vMkX
nia7EE6ebNDRcjS4EFpNDgTECCQzXfFZ9fw2AJbxhxiE800a0t9Hl11ZlDoltcpF
nbWsPNNPKuGCoFRnhyvWiLGtz4QBfw==
=Rfd4
-----END PGP SIGNATURE-----

--uNc33Gpi+EuMbLUH--
