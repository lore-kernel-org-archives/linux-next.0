Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A08933D4F2;
	Mon,  8 Jun 2026 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916418; cv=none; b=F6xQ/WI60hFM68Jv+JFO3637EXGPsDl/p4/+uCPiJRv6GOUNHy3p6E3J//NLlzj/Iw+n6J/gybBSgEUqIz/iksrFyl8xbkdkTQhDM541/Q7jDPKZQ2I6puAM0rmiHVjA4WkdmY6IOZGHyL2hbkGaZxKbKEh8PfnTt1RpH97zBPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916418; c=relaxed/simple;
	bh=XCvplO+hQuSilwTzWVw/X6lj3eFl7kLmSCvYo/ZSCrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/Uq1u9PSyR6Y/Jv79EU+iczHxuwnAIb5DZNIlxzp17+QnCtD5hrdUreP3iVSNryTqsbTaXt3c68LfPIbMRQBsuoaRfuWPrqstL2Z9Wh8QfZPGNlMgkteDPfAj1mkpl5ibNO8m7/vkNe7gv66do8CKumn75wJM3+g4gv1S5V6oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYmcCzoq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYmcCzoq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95E11F00893;
	Mon,  8 Jun 2026 11:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780916416;
	bh=Ob0My1i0XMzAff9n751W2D+uIEgucXXmPTSQJ44Aqsg=;
	h=Date:From:To:Cc:Subject;
	b=WYmcCzoqx5aKTVC6MM2mpCD94mcHS+UlguQAel2LSLifVaJuRORpO9zvY5A4+n9pl
	 qR8gZQkflwBuclCr4UBUVe0gtmp0otuiVYdlXO38IvgP1CMuuY63827fsNSeVs0OTu
	 tNysWSEKGcnF3rNNITXfMI4xx9GQV6iezElsKBzMvLnXF56SWS6PNbjdqKcMlsqJic
	 j2Lo2uDiQ8nFSuafpEuQXu/n0ONDMDiHr1fM3MKcwYJHaEIX6qSnC0N4sdp3k5zwr3
	 oApD50HkUi9umo8+1m/OfM7Pqi7YBM6jMqWHbhnLzP48HhxSiRicEpF58m9iKKVOiF
	 mtvMOFv9e9Clw==
Date: Mon, 8 Jun 2026 12:00:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the risc-v tree
Message-ID: <aiagvVcftjZXyt40@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tVw4tRx6/xXUSrQN"
Content-Disposition: inline


--tVw4tRx6/xXUSrQN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the risc-v-fixes tree as different
commits (but the same patches):

  aad60bdd0b5a6 ("riscv: Fix fast_unaligned_access_speed_key not getting in=
itialized")
=20

--tVw4tRx6/xXUSrQN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmomoLwACgkQJNaLcl1U
h9A4Jwf/e8LjwimJHpfi/CnUe8JT5LZVdDJYMFGmcz9qEXbfp8o1G/7pFJ+z6+7H
IpMOByqZGnQ5YVnA17jLqXRhsz4hdudAlkdoY7auD380QaD9lxqEmOoCkMPohInK
xItBS5H/VC1IGoENbT5EtqGP01j19jwqQTPXHbDnosZrot5TLxVs5ZfyXqvu5UL6
Cd8DmuWMEO0BRqvPg5TomJ95iSpW9i5ICFDX6neGgRtEED28LKhb4OOkaUNv+r22
pdA6WwHUAqVnZTpUj709tR3pk6GYoT8Fcgw7lABg5drNaZ0yQifvWanm4yN5GmsZ
eiVMk8eoY/5BHq2VutYgR4d3mK68Og==
=uozs
-----END PGP SIGNATURE-----

--tVw4tRx6/xXUSrQN--
