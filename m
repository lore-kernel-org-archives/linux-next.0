Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F630C172;
	Thu,  2 Jul 2026 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008104; cv=none; b=WMTFLDhxVjdXw331G2t3+2F6H2n9cWcmczRAccK/uUfpZxyrubyS1bGDupPfRX/xmslxA0axASWLPC8dlzGmaEu1FlbIEpshkocIaPGzXFJGal/HlOVxdIykty0R4KASkxmA+O+ttL6feDuUO3FSOAJ6K2z7NxSCa3kRmkwdYC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008104; c=relaxed/simple;
	bh=SwF+QgB2zko+ZuR1xnQO6qvKyfLAuwNLq88x5fqCXw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J97SqpeZlvPzX7vmAk3KJxg0zhepARms1iAThxR8RLAfSbL+vOO+UJJtMNt8EWbIFKsLOfbnmhDr3v8egupfKr13L7AU8Wdz7G6ASTfU5ECqI8UK5xR/iGNwBZzsYKjJjaNpd/iSfJc/pThyDD179MlVKN/aEaftfM02RNsFdrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2GVVpPW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2GVVpPW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815681F000E9;
	Thu,  2 Jul 2026 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008102;
	bh=qprPArQvhcsrrimFC5afcaSvLUNDggX2Hfj04sqAiH8=;
	h=Date:From:To:Cc:Subject;
	b=C2GVVpPWPdI8ZOu1H5PX6qpw0aWzjUkID/8euZHn5HSrn5c/pzTzrrmdlFcX6DHCW
	 +3aSXriHogHLY5ynXrfVVviP8g3L8ebcdgyHJOyaHqP1XV9Ps6PT22jOO/b76F9pjk
	 vOAJKOz7VGxJBLrHdvZ3RrGDOtsJsf0SuthCrF9DA88+iNSrIURQykL6ayfOij/8dw
	 /r26T+6NTkGRijvePthpE1KCMXzoUWja3NQ82qwbaxmfIQDz6ry1dBvBL1y1dgKink
	 rLqaeykC/qCvf0who1caJmnV5sBermDUASuvD4QDc+XyNPdsHTfkkVBfEID25wdr5I
	 o7+MzjZLBnl+w==
Date: Thu, 2 Jul 2026 17:01:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Andrew Martin <andrew.martin@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	William Palacek <William.Palacek@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <akaLYjLTCemL7-uA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hBw13HHDahkRY0Uz"
Content-Disposition: inline


--hBw13HHDahkRY0Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c

between commit:

  1142738572ef3 ("drm/amdkfd: Fix SMI event PID reporting for containers")

=66rom the origin tree and commits:

  60271ec06e04b ("drm/amdkfd: Fix SMI event PID reporting for containers")
  9ba9a1486312d ("drm/amdkfd: use scnprintf/vscnprintf in kfd_smi_event_add=
")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index e659cd50eb0bd,6a7b4d959541b..0000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c

--hBw13HHDahkRY0Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGi2EACgkQJNaLcl1U
h9BInwf/ZTi6gFKg70mfb74WOhnhkx5honXU6Oih+drixSVGoUgXOigIVZX1CaUK
Lk68Td18am1+CWdnsKmX6gknki+WLlJRbMYabJ1oguViXDlHh9USw+HeDTtLjRvr
oSygcVDX4fve7WeDxJRWt9rWeCf/JhfaaSf4D1BHD/ms9qIOEpf1a2ZRx4J/IF3r
QwCg5C2D1k2s3QUEy+m8KFy1a8I2Fw0YLT5Zp2INIJdce2GpdErUy/4+DB6LCHUk
s0x/2I3ebnmYzpohQJXlXtAHtXmbqz8G6xX6XaGkKO8iIEmkk4AN08KGrD0EL1L1
vzCn4SSv90Q3TqJkVtf9osJ9hEluzw==
=rSYt
-----END PGP SIGNATURE-----

--hBw13HHDahkRY0Uz--
