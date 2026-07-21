Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4922B4C9006;
	Tue, 21 Jul 2026 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645463; cv=none; b=iI+T1L1JHlNaXzsIYQcmNwIni91iHDZSW9GjTnkCgI2YHlMvVO2W0sP4FldzfL6r/ZkbK4YX7j4id260ylTYRFqUK/ZZwcR3SUBIcRHg8nmIHtNdhc0ZssVoe1STnjirnRg27iGRZP+AdCPA+701mNEJw1oyzXbIPFBB1ohxew4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645463; c=relaxed/simple;
	bh=7SNjFhkAxGL1meZIpKZVxhWyQcKh8rXS1blXSP6tntQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAV8YOYk39O0zBxhJDm5AS0fl77fyTiqQOv319DIx6YSYIYWora2Ncy6SkTznxHnPimwdKjywrmjXmp8n8EENJIyIwpdT77YTuQdIjGNQjNCAA9fhWg8FD3ocAApnLFk/KvFxXAVMX4NFzxxE+14egXm0uQMaMLgDB6qlpeX3VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMpBW8VU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMpBW8VU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12E61F000E9;
	Tue, 21 Jul 2026 14:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784645461;
	bh=u2sARGkiTeB20giuCadXKwvYE7A3hgVC9wgtznPcd6E=;
	h=Date:From:To:Cc:Subject;
	b=oMpBW8VUn4WQf4wTHeFh8kfCtbbbCgVErqsORa3+FHOGE9h5io4iKLECxgJ19xpaK
	 rIfAGHZM+anT+gjwJNpnPBvTHMw/APHE08BFHe8qLHNjUBBQ9aMYcLp/0FusrFEZcF
	 kwteucnB1HpRHy8P8/8ZOgRIe9bDUKCCgACl/MZLfeZIrPHn4f7bg2kWnePDFlH2Cn
	 YNtv5pz9wGQ8347PHYT5h/6NuZVNE9BvlQ7OXkF6BTgGf3PzlddFaUBb8njiMQzt4d
	 z1RY3lAmJq02m05700IxuW3MWqmDlSSxhnyE/G8Tk1Cg6VhmEHMnY7ehpquvRct5MD
	 tMIe8qVU5V9lA==
Date: Tue, 21 Jul 2026 15:50:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sre@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the battery tree
Message-ID: <al-HUrIVJZ-vLN2n@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OPMNduZ+bbeEXMvi"
Content-Disposition: inline


--OPMNduZ+bbeEXMvi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the battery tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/power/supply/sgm41542_charger.c:209:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  209 |         reg_val = FIELD_PREP(SGM4154X_PRECHRG_CUR_MASK, reg_val);
      |                   ^
/tmp/next/build/drivers/power/supply/sgm41542_charger.c:249:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  249 |         val = FIELD_GET(SGM4154X_ICHRG_CUR_MASK, reg);
      |               ^
/tmp/next/build/drivers/power/supply/sgm41542_charger.c:271:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  271 |         reg_val = FIELD_PREP(SGM4154X_VREG_V_MASK, reg_val);
      |                   ^
/tmp/next/build/drivers/power/supply/sgm41542_charger.c:293:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  293 |         val = FIELD_GET(SGM4154X_VREG_V_MASK, reg);
      |               ^
/tmp/next/build/drivers/power/supply/sgm41542_charger.c:452:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  452 |         time = FIELD_PREP(SGM4154X_WDT_TIMER_MASK, time);
      |                ^
5 errors generated.


Caused by commit

   ac55d04627d41 (power: supply: sgm41542: Add SG Micro sgm41542 charger)

I have used the version from next-20260720 instead.


--OPMNduZ+bbeEXMvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfh1EACgkQJNaLcl1U
h9BqdQf7Bm8FWAMJ71C7+goot7LOqKK4uKSotsdyEb+sd5x9q4XgLO5f52Vz9ha3
LG1sK1dqDBEEPp2758TU5nNPPzurM4a4hqadfJ00kHfcod1aLz1cqFsrdVGtR96J
MjW+hWOYmHfa8qi1qINA/fWbaODuHKrhzfanOE9vyn2Qj3AUNsaYydFHW1zgJoFF
MMFjDx/Ap6htKsFq1RCfDptuGjv3gtNrlzVUiYdOMIvHxp2ORjZPvc+Nt0RP2L6c
LRFhN/tJOw799cK7chU8pnzXpzRJftCIRW39jwYnyWx95LkFFbP5b6qTI5Uyur2C
i+uygQd0TmZhDu8RiDxG510dB/Qmrg==
=GQ2M
-----END PGP SIGNATURE-----

--OPMNduZ+bbeEXMvi--
