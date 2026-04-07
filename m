Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2663AF648;
	Tue,  7 Apr 2026 11:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562440; cv=none; b=SP7JhYvTICPnIQePay26nFmZAvUAhoM11Q27c9nvNOtpYUqbsMVv8X8SKjj7vVc71oBMrv1ewak4Qjy5OV50EhpzdM+nLl+QQGcm0Qb7QtCE/Z9xZifoWzQPKTvtwGLcxGRnS500I1p7UbivwRHLL5WpRnQxjqUG/y8XL9VtN1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562440; c=relaxed/simple;
	bh=EgCXBrPqjBiI89C6QGU3OoQPuorVvrMHeKjNYLoDcqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=srKWXe/AUj6nUq4/RqwsbOTcJQzEEM+bxmFx+qkJjduL/AN0GIZeyToQ9dvbLLP7LmaqGHD/KO8kuOEhcqdcn1Go3GrSGD11QnTaTFqktajr34dPcMb4dozB6TkLiY9d4/CfkQUEvEGGicc0TOIMlr03CoiWzLDdNDn6EHuNSV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTfL3phJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTfL3phJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FC7C116C6;
	Tue,  7 Apr 2026 11:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775562440;
	bh=EgCXBrPqjBiI89C6QGU3OoQPuorVvrMHeKjNYLoDcqE=;
	h=Date:From:To:Cc:Subject:From;
	b=jTfL3phJxTSrLngEbn/llP+s94wThOymPaaTslOPidqagz+CgouCcXTo1Ynb4dN5P
	 3GuLLWAZNh1/VlI9UisLhwsIqr9UeGiS9D/UzrCDe/+2YFan5/uyz8N2oWkahfOu/i
	 ExzMqxo1RKp7fJl/hoiQHyIAYeWSRk2WzFUeRO3CvR/1+JhYXJG7j7kVRk332VT5Fw
	 3PlFXfhtTm7nurCN1Xm5U72uriRjvcS62QqHUYVXEbB2BwDdx7QBYmeJgNheZjPeQ5
	 dGEf5MtBR8wPC+vSPq8YEMaXQE93Lo0OE2YEbgsIj0JhMDqCF6TPBNfUxrik2G5mvt
	 4xX4wtShryrdg==
Date: Tue, 7 Apr 2026 12:47:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the bluetooth tree
Message-ID: <adTuxQhCHp3BnwM6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2pWdUI+0b/Y2uoa9"
Content-Disposition: inline


--2pWdUI+0b/Y2uoa9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  ff4aaa2d1db81 ("Bluetooth: l2cap: Add missing chan lock in l2cap_ecred_reconf_rsp")

Fixes tag

  Fixes: 15f02b910562 ("Bluetooth: L2CAP: Add L2CAP_ECRED_RECONF support")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--2pWdUI+0b/Y2uoa9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnU7sQACgkQJNaLcl1U
h9A5/Af9FVyzssF9Ea6CQwO9meZeNwNaM93h9VtQUudjEN8SVA8wsqULJPionijf
k85yCnhdJgsuNKykMsSuI4VaqLnoHQgOInEgd/Kjq8JN62QrF1ebodtVMb8WPJ1B
Ykr4pAl+jIXyxIDGIIIqDIJsX2TBImwBOik33yY0AP0ucnxSthn/v+1j8qER8g+6
G+TfLiM+LfQfp3Va0895/wLBer+9d8jdp+8TSdKL75JaciHGecvs8YQ3vltKVU5U
IMm9eUe9J1t9JRYUnUnFg9QNA1RyqE+IHyzmRn4C58SYMGl7hmdqsLbQar8P0P53
sg1x4Wal7LbLO84uRG8KWXDc/pCcTA==
=dT58
-----END PGP SIGNATURE-----

--2pWdUI+0b/Y2uoa9--
