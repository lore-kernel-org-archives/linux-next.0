Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7145D1EB5CE;
	Wed,  1 Apr 2026 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049261; cv=none; b=ZX7c1PoOJQUj4FVdRhuatRO0dIRkZE7LXFbb/dDyOD20O0k7oVx1QbjTGmb4ar+CiEj2tNuTcmAgTIt/C/qFwWkV59dacPtloHGchcVDIWTIH4XWRVn3RUNCOrFyrbR3FxV08RhAg4MJZ/3WsvMtQlGpecU1i/xPB7PmsezEfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049261; c=relaxed/simple;
	bh=xxQ/Clqzq5KkfZeJqS5qFM90bo5Bp4fh1EdnulQNSv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIgjUasfnDtwkliIkQscMHMgDQiNtFgS9Hxt1nwZHxQpFsPYri2C+J3NgbOszLuQVlLAc/Pl9FG/E+kRlWdv+XAgVouwj/eXVw85ySDxblJncVu4QsbQpEsveCVeVP+jdYMAE4d9m9CHDJDQZWTBMEmDb6MjLUSLpVTqA5uNSUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHUzeoDJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHUzeoDJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1816C4CEF7;
	Wed,  1 Apr 2026 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775049261;
	bh=xxQ/Clqzq5KkfZeJqS5qFM90bo5Bp4fh1EdnulQNSv8=;
	h=Date:From:To:Cc:Subject:From;
	b=DHUzeoDJQ2QYQNnl9bAGy3z96tcZERS3lFTPHA+UnrHJ2v6Zy7wvW0MSAsO2grpQV
	 ykwR39GB/T5HOM+bNSgRY41PMTxvcvQaUmAAcn8peChWdwH4mKCw+vBPZP94v0d5Th
	 3BrTkrWUniyO9q+Ks5zOWyGojvQblFAYQFcrEJM+gwyl1TkjzAOdfxicYajz/HzIaE
	 bu1AT1g32ylJ9gTR9EZ2E8fx03Jo1IUacvAnjIxn/TWOlqcdMGg3xGRV5766rz7lrh
	 gD1Hpumc5x6Qgyvx2E/rbXl/C56Fo0fazOjGAv7B/PLdH7q4BPekVDxQaDCCWhnNhj
	 ROz86NFxCqqZw==
Date: Wed, 1 Apr 2026 14:14:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Amit Sunil Dhamne <amitsd@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
	Joey Gouly <joey.gouly@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michael Reeves <michael.reeves077@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: linux-next: manual merge of the usb tree with the battery tree
Message-ID: <ac0aJ6jpCcSaemt7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jTulc/CnEGm69LS6"
Content-Disposition: inline


--jTulc/CnEGm69LS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/power/supply/Makefile

between commit:

  0ebf821cf6c75 ("power: supply: Add macsmc-power driver for Apple Silicon")

=66rom the battery tree and commit:

  70d7dd27f6dc9 ("power: supply: max77759: add charger driver")

=66rom the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/power/supply/Makefile
index f2efbb82707c7,6af905875ad5e..0000000000000
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@@ -129,4 -128,4 +129,5 @@@ obj-$(CONFIG_CHARGER_SURFACE)	+=3D surfac
  obj-$(CONFIG_BATTERY_UG3105)	+=3D ug3105_battery.o
  obj-$(CONFIG_CHARGER_QCOM_SMB2)	+=3D qcom_smbx.o
  obj-$(CONFIG_FUEL_GAUGE_MM8013)	+=3D mm8013.o
 +obj-$(CONFIG_MACSMC_POWER)	+=3D macsmc-power.o
+ obj-$(CONFIG_CHARGER_MAX77759)	+=3D max77759_charger.o

--jTulc/CnEGm69LS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNGicACgkQJNaLcl1U
h9CuoAgAgB1P57oIL5SXo7doAPzGjYxcQNb8vbRY4A3SVCxNX/DV1AlBu7HnRjvy
daoJu47GfI9VEU9B4a1q2FV4bGiV7y6b4EiwD+mu2HryuoS6hZmB2cUNIpF5QmKi
ljvAsyCbdvboDP2Ace1DrPGOBNOE++jdmaDHI1Vh4xyDjginxJfUZmCPWqBTQBQw
YzhfFO0ug7FLcp9fLo0qFyE6DCkKkuoA/oHFt7v4GWLZz4IH4MPegiVxJ3tlTdgQ
y2nwdQGHUm9bOkgl4kgOPP3LpnuJWQfh8GR7MlPlqLfW3ZB/ZzYdymkI3Zgj1HwP
Is1NgTxgLOC/PY0stgImqwW86EV4lA==
=XLuc
-----END PGP SIGNATURE-----

--jTulc/CnEGm69LS6--
