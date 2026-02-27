Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E8341C2FB;
	Fri, 27 Feb 2026 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203729; cv=none; b=oYR4ewV6wHM4ed74b+8ffDm+eQ/fEHdGJu7eQ3RDGU6Ifhu/xPSrFZI1aoJQrvPtbquHWLhfGuXg4UtCmwzLLcWoZoa5X8M6Ufn37hGE94iNuvK90MQXLabM+3Vj02ilTUCCIFq04W4lmJj6x/DM5rN5/w+5aH02EsKg10HnN7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203729; c=relaxed/simple;
	bh=n0kDwokIRje0xU/tV5ICjxrWhcZXerWBn+IhTSBUicM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFLzE19zawWfyJnBeGCg5PHCyrG35tdiTSN7kBGiOB5gCZXuNz5QMZ+XSKuqmfXiYq5ae3RXC5QToj1LsrYKT0bJYBz0R4L7nXQmKROxT0CqgtBxdPQH7V8florqEpDSak9pcTKIsR/P/oHplgqB5hooIG25WSktASWIf9CkwkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAhwkvRU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAhwkvRU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C34C19423;
	Fri, 27 Feb 2026 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772203728;
	bh=n0kDwokIRje0xU/tV5ICjxrWhcZXerWBn+IhTSBUicM=;
	h=Date:From:To:Cc:Subject:From;
	b=HAhwkvRUrfwaX202IEvinwaUDazpiJ5u3OiQ6d/0Q9+nslcArIQFfwL0OPV90MVop
	 HFX3IBmoHrAeI4H70+8ZQ5dJnQEo5jiGg5Xs+4L8i2zlgRUagVVrmRWpQ40ChDso3K
	 hD1O8ntzZJ9qTpAdzF0BmWwLRH+JLbjt+RNm4jLq8M5pbbI5KIIcElvaMlK9ePqvgF
	 vex8GxvMjHx3F6/8SUVYEBCcfSeoeYiEaRKCG+J3fQUm1z/+6yjZq4JLJDSrp7/Jcj
	 w8NwA6pV/bQx+oJ1Fbx5l+Z1qntifGmPl7purwmp/8RSuOX5t9ArRQU1ywyVoib0xm
	 ZVflgNxzyeGJA==
Date: Fri, 27 Feb 2026 14:48:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the hid tree
Message-ID: <aaGuzG3rObsjhhDc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NvUb1u2hYhIMFUST"
Content-Disposition: inline


--NvUb1u2hYhIMFUST
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm-nova tree, today's linux-next build (arm64
allyesconfig) failed like this:

ld: drivers/hid/hid-lenovo-go-s.o:(.data+0x840): multiple definition of `rgb_enabled'; drivers/hid/hid-lenovo-go.o:(.data+0xb00): first defined here
ld: drivers/hid/hid-lenovo-go-s.o:(.data+0xa80): multiple definition of `touchpad_enabled'; drivers/hid/hid-lenovo-go.o:(.data+0xd00): first defined here
ld: drivers/hid/hid-lenovo-go-s.o:(.data+0x900): multiple definition of `gamepad_mode'; drivers/hid/hid-lenovo-go.o:(.data+0xb40): first defined here
ld: drivers/hid/hid-lenovo-go-s.o:(.bss+0x0): multiple definition of `drvdata'; drivers/hid/hid-lenovo-go.o:(.bss+0x0): first defined here

Caused by commits:

b53ccf3f72653c8a843188ffa2edd4bc2443686d HID: hid-lenovo-go: Add OS Mode Toggle
1d466a1adbf40e55501d766322d665de3a822b6e HID: hid-lenovo-go: Add Calibration Settings
557d5b34d52974bf4e43c459cbf50bed5615ead4 HID: hid-lenovo-go: Add RGB LED control interface
f0119d450f1d4a5cc2ef2b38c2b522f902698a38 HID: hid-lenovo-go: Add FPS Mode DPI settings
a8a9ca568ce547634e80e999013ac9f123acff1d HID: hid-lenovo-go: Add Rumble and Haptic Settings
b2fd12c205b5a533ba2b1c5ffad669d08d52ce12 HID: hid-lenovo-go: Add Feature Status Attributes
3bb54f568ecc35be7675eef5303a47e14aba54bc HID: hid-lenovo-go: Add Lenovo Legion Go Series HID Driver

I've left them for today but will take more action on Monday, probably
reverts.

--NvUb1u2hYhIMFUST
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmhrssACgkQJNaLcl1U
h9DPswf/ZGVEHhiXRJQGE+1560Z/yfnwTqM77KMGOX4Fg3VJCpmzt2xQbx8unO9L
qFVI8o+Lfp7KyoOCIZRPJ+9PSgQ97HmTcJa4Xv27uw0F1UVwP8BlNHQYaNFy0P2i
Pbj6HrKyZwnFEVd8ptfZlyOGW40Uwobg+QSLVlxsY3+RQosc0CcH+7IqdthFDYHS
QqiXSqo34+Y0J01xoivJOO5cWFmk8HsGK3F5AAeSH+VnfJJliAj6HfpB1pbz/GnX
IjgtLhGBCnLZiWmLgqowEAgcX8ZFH+vbffySiueQha8lVklaPSUOFWAjRVtS0gwa
qfxcoBduTZr0yApEbtnvECm/08eX6w==
=g+x5
-----END PGP SIGNATURE-----

--NvUb1u2hYhIMFUST--
