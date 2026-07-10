Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B522E737D;
	Fri, 10 Jul 2026 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692337; cv=none; b=RTpiXp94aismaMxN8GQMgEuG2n/2jZQ84P5qxqAyPn0ieDnW8vfLlbsIpVFEqccjS+Va6e8u4xoBrJH4LdEI83h3UuVEc1dgpFBrr2dgTNAgRjgpuaFfj7yBrsGFwZMkZvNIN6m4VhV0PSj6keWhS6PKprVOJ4iMiApcT72fK4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692337; c=relaxed/simple;
	bh=DbrtNFY22B/Ml+9VJsbqWHuqyK1BSF5RGqcQbd/2j08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CnfdjE/5jQnBaKIJg25+y3cvHuHvpNH3uzZQHGHh0uIaRlMgXwMPe67rdZ/yxtLrvA5hEsepY3bzNJBHAds6swnBbRN7eO4/Rxui8T6H3tGs8wflZMdAiFy2N5hjir5wuzQcM8e/lhgNslIKNBfFJ71fC/vrVqLEFIWTFU3+myU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODUldz5r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODUldz5r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C711F000E9;
	Fri, 10 Jul 2026 14:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783692336;
	bh=Mee4Ve674+kXW8lX0M1/6Fz60I7CFp6y5B5h9SWN4Fc=;
	h=Date:From:To:Cc:Subject;
	b=ODUldz5rjDEL7RdE03pbAPvPUH9DBZltqBETD4hB5ttlhJrRgiehQppFCZISosmLM
	 qMSEggsQMX+tc00d4f6MhXjV0W8yyYBUMMVosiUM8ygwQfUeIJSrR/TBv4p+dgJjob
	 cp6HQLpIFSRHE7rgKK1Zj+e8SmZduyH8Gz4/+hNT4tpX7lKYjyUjpadQG5yjJ14F5n
	 y/NMgjNEWVS0n48Z5tz6FNfCIzl+GVfworLeHG1BIz9Lz5BO8+DW/IBtrCcb1U2sPJ
	 Ixdf1Gk94iQB1SrrMMklCtvf90Qd9pWPfVuBcsO/vSAPeMVsCerKFUYMSkxhj16OJK
	 6RFR8lbNL2Dug==
Date: Fri, 10 Jul 2026 15:05:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
	David Francis <David.Francis@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the drm tree
Message-ID: <alD8LLeWXZ5t9TgK@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zt3J7OzN25muvLFf"
Content-Disposition: inline


--zt3J7OzN25muvLFf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in the drm-fixes tree as a different commit
(but the same patch):

  f19d8086f6644 (drm/amdkfd: Check bounds on CRIU restore queue type and mqd size)
  1cafa8b29e029 (drm/amdkfd: Don't acquire buffers during CRIU queue restore.)

--zt3J7OzN25muvLFf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpQ/CsACgkQJNaLcl1U
h9BiLQf+Ko9ezryOIXuQ2Lz7wLZBRv2yDmIIHA4lmWYcrTxESbCwZpIl4fusYFrG
/UJpZEiXu7WVIBkchoDhReuV2zG0zN2WabW4ZCie+Ggp+Z9rUtUeyxCKCNn2YzYg
wJkm5ud+7L+yNWd+3//jUVsmlXqnSGAgMfBkNxVLKtezFIRdK+osNM5eWFQo2uH8
bt4WiK1jnUGN/EHgna8xcOC8O2YItlTAKUtcL7OrPmQeEQlAMa4sRVo78PAQ0Ngw
H1qQYhD054SE5jt3FWOXsDcqqpwLjbHCAhSseUfGmAk1a9vyOsviQNR80K30/B4C
ObS8QA3BrCxfSYvPWQPQDNFrzflx+g==
=GYyV
-----END PGP SIGNATURE-----

--zt3J7OzN25muvLFf--
