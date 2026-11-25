Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615995;
	b=jyCYyBVaNQgPUKhZxw2jDEqRVUVkOiWJ1iqRFV8QOwy0/2Apg2x8njPMIgqG+ZpVV0wG
	 oR5Rpyylx4qxigc73vOfgbfqhtuQftmLvk1uDs1qm0q0G2vytnZESkhWCRJ2V1mpLesX8
	 0o4JVDDtQfCQzm3+FFkpssAsQSv7e5CWfNpoF7J2axFw7qOCic/UupZSMOPYQdH0Se+h5
	 V87jvQJHeongUxmpYNzDRNtCguuFal6jQi7l1g4r/GVBvUWGSfyqNx/oZ/JVAG85UyiUI
	 xcdAWPLuFB41Ks61oCN49fcBxVbY7xByiGVxk9wgPE1b5rBSnJUBaSNSE6DWeplp9ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615995;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=GI3ZxMKH7L8zCbu5GA5LzViNomi/AlVCFYXUEvuOGU0=;
	b=njhwa1g79xc93i/gP5fptbNVTvd4grdpX0DzWsKpfmjUTRUNakoEP0rtGhFNQVUAZRay
	 DEs56KDBBEe0ELYLWTSxD1I/uqX9gu4h5a2hKoiFrDQB4qLvZYrHww4hHvWuwBIEkiqvd
	 tCHbHKo9fV4mQDGeG2qyo/2by1VxKjKv/5Y8ZZyw3VgvUS+USEpMacVpHDNetLZKIewR4
	 P9HVzRtthF/CYKSU/o1HkzHswi2g8hvRGKWvscrvgpslAD0GkVHOX1CzilPIR35yFib4X
	 rjb0OWdAOji/zWSqCMx7pQPeaXUPxvt8ok4B8r6IBQHSQfbiGsaDExVFF7IKHwH3Paw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ot78oUJd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCC5606A31E;
	Wed, 25 Nov 2026 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ot78oUJd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AFAB1F000D3;
	Wed, 25 Nov 2026 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615995;
	bh=GI3ZxMKH7L8zCbu5GA5LzViNomi/AlVCFYXUEvuOGU0=;
	h=Date:From:To:Cc:Subject;
	b=ot78oUJd+5TOv8vhaP/LLKR+XLlcFH6a53LfouuVt6bQDVDIVLOqw1lwU0kslcp7f
	 0V5Wo0UyJrsiO9DRAFAkmQweWQ84pY8wgGNZOSHsfdjhxzIwx1/Ps7+Cw8cpnbUAfS
	 g+jdrUdMjMZrY6s9JoWttofDdqcMqv9dWlRkr+oAItZTsBqGklLvAQeFtAVxReYzgA
	 bS6bRFoLi1VPEuzcG6JBdKGgtn8pdFaWeggOgG8XMtmw0jjoVTIxEykY/hreUA0Hor
	 zXXLleHHGeBoZVmXI49iHK/ohDuMqUXOpaxrGeequeXLhiAwpbTHdi/wzSQoU5ydQ1
	 y2OQOKzr9xdiw==
Date: Wed, 25 Nov 2026 14:13:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbs94RtiqAOqhEx@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uj506szF2yG9Koaf"
Content-Disposition: inline


--Uj506szF2yG9Koaf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  6f2f8880226f7 ("arm64: dts: imx95-toradex-smarc: fix vdev buffer reserved memory node name")

Fixes tag

  Fixes: 6b7a9871e171 ("arm64: dts: imx95-toradex-smarc: Support Cortex M7")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--Uj506szF2yG9Koaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7PcACgkQJNaLcl1U
h9DhCAf/fT5DRwtjsT4lqsWvSEWO1E6SpoUlGWHI2ppzJjO8pBcT0VL8/xXAXZBL
gs9XaXUNlT3I865rP4PWPUmdxaPO0XMK0l/agzQJ1H0UkHt7MXeSYB0jNia48MPo
e4uMQwhSg2NyE87nxg2cx1BAQcyIv4Of4w5WH0k1JT1Cd03INl0mc2fafUcDkaV9
+1Na9Hpjshh8Tx6hHkk5lUf7XeQ3xueghBHSOXucTpkSaYDre72s1qYQV8s3UaeR
29QdIqNMgfdC/2Dh0Wfub2bb2Qw7L6qLO3Vq70QkDcNonXgJVoR+ziPM0RTYuJRR
s74YDT0Hcgh8Tq2Htsef1tG2QTKfpw==
=KudC
-----END PGP SIGNATURE-----

--Uj506szF2yG9Koaf--
