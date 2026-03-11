Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88652C08CF;
	Wed, 11 Mar 2026 17:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773250726; cv=none; b=TqKsPkIpCwUhWN33aoyv4txGR2n3JLDzSZAEdjaBPjkiGYfcM48lYb7ii1QB1OGyjEnFbllIgWwjbau/3xWGuBj1Ze9lN3YRPH7XtRYAfp4nPtNnzUQJ6R3ZgRbWXY3VxOMiNfLooGH1mR5poRYIavFFR567IBZBArfQ59qEaIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773250726; c=relaxed/simple;
	bh=MOzkuo2ZCv+dnVy6Yk3CkfuCiwbn8uKCU2KkVktFieg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JN4wxIekxT23FmSBDowjvimQebh9YDh6HQOPecwoOwks1XrgmP/UKbKqqN6DlTyrU1cmxFJQza74JBiL3y2TLkJc7QGLN2RDq81wlZu979RP9wJHdlRoQYGz5MLLs8ux7scAV6Q+ePTDzVbfDqaOwCceL+J72Mhon5+lLwgAcUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYtELwxA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYtELwxA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2F3C4CEF7;
	Wed, 11 Mar 2026 17:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773250726;
	bh=MOzkuo2ZCv+dnVy6Yk3CkfuCiwbn8uKCU2KkVktFieg=;
	h=Date:From:To:Cc:Subject:From;
	b=UYtELwxAJgisN+xMgAJDfUe4M1nibD2viqSGMRM/Z8lT1YJvL40HBAXPfZszhpw2c
	 E+kfNpZMOMkS6fUG7KVQqaXzr6jD6XMHrR28jQESc+fmYKZsXLmznRokfpHF6B+veu
	 eCZbeDZ2ZkEtRvYOnCpT3yVmTKQg8jnRLU6rPa2k1IE+lgEk3/PQvQ5igrOIx88BDG
	 AhkP4xhk9fRgLn3PGb7EpS/o9VbOjIRK8Lox3CguxyDRXANYeGtg8fWamBzMhPvxUZ
	 AicVH0UP1s5n0BJXbaoBPJ64ow1PyQ55W/sllqM1xBLA+oPf+TmcBBG5UJehy1vAuX
	 eFzLjKEeiarNw==
Date: Wed, 11 Mar 2026 17:38:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the amdgpu tree
Message-ID: <abGoosTXdMir93ZA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zGggWpGRVJMj17/w"
Content-Disposition: inline


--zGggWpGRVJMj17/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  94ed7da7be3cf ("drm/amd/display: Check for S0i3 to be done before DCCG init on DCN21")

Fixes tag

  Fixes: 949adb4789fe ("drm/amd/display: Migrate DCCG registers access from hwseq to dccg component.")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--zGggWpGRVJMj17/w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxqKEACgkQJNaLcl1U
h9DtBQf/Ui+8ADSa8oljW1++rkn7YQ1klZ7boQVmVc+Sf4wNYrKfd6S07bdt3vRR
qw9vFz19zI/n5Jtih3gebg4u1ddfojExZXgS6fQ/mrIqdUepn4Lvg2OpxVuPIXnf
HAO8BnPtutY07DC5WuaJts6/C6AcrnEd7/qgxXlnQ8g4OlEJGk7t0N1PrSQ+Y2AK
6kT8QGhrClJ6XZUOVpTiYlMYcMQJARAwvsLqFDiaMVeUuwiX3r446BDUH9XGS4TQ
KCiXBO+O+8cZyD6Bkf+ZXKsZC75PMgyLy57EqeN1llIB22pTYACiv6Qp6TnZUd1d
R9yK1UpylvP4lkq/TF07K4Ec+mjFhA==
=/5Gx
-----END PGP SIGNATURE-----

--zGggWpGRVJMj17/w--
