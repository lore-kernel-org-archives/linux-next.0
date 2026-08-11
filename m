Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83108347506;
	Tue, 11 Aug 2026 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450967; cv=none; b=GWSnp/OlKakvkWCA75+efANfkTvNKEoQFLf5nBZ0oK6Jn4TPzzDJfJUdSOrnlnYR//XBRarpT6osp/+NynKx6+MhajKgPWSYOQWb5F7SB8GJ0lOR4z1j9r241tvU/6hdCbIrB8LLAK0WaJrmbtP1aJugLSeoV+rMUR5+/9zyJIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450967; c=relaxed/simple;
	bh=yRurcc1wYW3qW2zwU5epHpeqbrxjqAzaGFRLYJg7Gq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnvWb+UajzG2gwLhwhWQ0lLQ8xgr9jXHGgGUP83Cl0+9+3JIKCcuyc0N2auzASP+ryr0jhXdrQ/K9XbWihIBYqZcB5y7DKPP4ost9kk9Rqu+yZ2depr0aDbdPplDYLFtVOq0T7hATlYD4fJfURyJYyZzUuOo2j5dBjg42JFckmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIKwB3TJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIKwB3TJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A741F00A3A;
	Tue, 11 Aug 2026 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786450966;
	bh=RpNXqOHPd/EcZUJaLOaJD5A/1RIYuvbrvjwgg2RvTTI=;
	h=Date:From:To:Cc:Subject;
	b=FIKwB3TJmcBOrHLhtSwfqHnML1u1YxHWEbD7tfAXB5eJgOSSrM3Gx0m3p4k44NW9u
	 zhEvpbkQmVnpyxrwKKQxskzSSUvWjiJbgYl5sFhBkxmY2EJOyStciHpPxd7l8cAfJ6
	 R6ZWYdOpU7n9RBbk8xV6yCxCpIw92NnOGcnJFsguVyS41g9U480r37MF/WNlk6hO4V
	 rNIByzXqZVKQv5+8TvreYgoPDzy9O8lOhhMiKKYvJiYhDNlDRgssujjYTQDm/TV3Y1
	 AnB6rWcqpFXZdetJAlAXRgG8kCzYcGXBuzM4YQzhLkFmmBecqogmMir88no6IV20U2
	 xaFnZXUsF62Ig==
Date: Tue, 11 Aug 2026 13:22:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the thermal tree
Message-ID: <ansUElkrTmSsSCNr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/HuN+cbLjEBSVxnl"
Content-Disposition: inline


--/HuN+cbLjEBSVxnl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  22114b21259b3 ("thermal/drivers/qcom/spm mbg tm: Fix missing bitfield header")

Fixes tag

  Fixes: c3dce117333c ( "thermal/drivers/qcom: Add support for Qualcomm MBG thermal monitoring")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--/HuN+cbLjEBSVxnl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7FBIACgkQJNaLcl1U
h9CyXgf+P13263VthqzaySiHmpg47yKkiKiMzmRYR9Vl4SI5fvbtUVRJEtp3zxn2
FOxK9xD2ePYtMHczhk1NHMexwKNU+IK6Qd7NvrOnelpuSrqfPhxWA5GRs7Xjha9/
tf3BlRKCK/vV/exXg/Mh9zIRuKi8UgrLq44buEsVFKzFjJOI6fTWs5fjjKb/rQku
NvopnpSiRxuIZCQSA7aA2CYirnpbXZY8Z6vYt6Ho9nc5X0mA0rF2NO0d2F6fGc2+
D2YtJmnY/zYAcxekmEWr5YTXNXieja7KVCBRsSyK7QoSx1G+r71yr+QxOTAemREZ
TeG9RYUsS4/9yDCsBWLGvIJpZhHrwA==
=zcUg
-----END PGP SIGNATURE-----

--/HuN+cbLjEBSVxnl--
