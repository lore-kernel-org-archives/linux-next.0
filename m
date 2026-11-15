Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781723;
	b=UfpiekPX4wf4+FfVmYxqVcroY0BMmVuCaI4OEj/RNdoVr4P1b4Bo2EBVOlngmqPSKxDx
	 sKYexceqQaxgu6fsFMFoL7T8eKncmEVybFq3C/D2WU4TRNmrz7BAksydX93rEw0LQJQas
	 bVuMMatZq9lftX+2tFS2dIYaGu4Vm7BzScMeW3cYyQdUQfygJrddSSGJki3jgeyVxHnzo
	 ee71ljhYsrAbvm2a+zUNCD5qHil5/+3EZEhgqHt9H5bj8JI+ts3EcH5de+xssYh0k32vX
	 PdXrS/CEgCqNujhTgG/yLzAwUfGmX3sQfc4fDE2pS/sueCvthCAJW9SvBG0w0H3p4Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781723;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=eqS1kiyzjUYtpNhX1JXOAbWIfkJx9vqsPOZR2GyPQzs=;
	b=v9xZiYczWr8Vom/mSlboJ/OKI7ERVbpS3dy2SynmOukYup4m+QG/WuRCIg2lHsDj6asT
	 OKwHwwMjAjQRomRcPbz/FaxwqOpX2gv/u/zzbfOLaMw++By02Af0Q7mnc+rQerbjPbaXT
	 hoMW9Ot4Gei4SEqeufwSEJxLgJyfI+6V69RhLlaiKA69137lt5g0sDiWSAwQfpN3hXTTx
	 2ZG4MxCSDRGFKEbV8VMX28mbadR+1v58nUEWT2N73nn4xoC2cBzrRudZLs7FmZPaMHw1l
	 RNJ8pduzpy+f2Hcu68ixq2dYpZfxerJ/O7hs0bK6sVMNaQDO3Ka/0t9oZ9MAR0gqtYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gI5kQf1Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDFF606A323
	for <linux-next@vger.kernel.org>; Sun, 15 Nov 2026 22:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gI5kQf1Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8068D1F000C5;
	Sun, 15 Nov 2026 22:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781723;
	bh=eqS1kiyzjUYtpNhX1JXOAbWIfkJx9vqsPOZR2GyPQzs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=gI5kQf1ZFI2CFDcOq61uRCQKqGNALCx+WRddx7DSOSqVygmvUvMpgA6SRbvy0EPeB
	 kVVkPw6s+qdfiFg6GPQPoImRhmtR0Hp0S2X3eYqPq9Y0lvfZvt3dsayyz5tfdJEOmi
	 tmmM2t5Zfv3hRmqLbwURaobFIdCoReF+riSrQfqZP7ilMEyggDyBmsC+M16xZ8Wf7e
	 PgzYf9UXMsPUSyYXFTHCGId3MQ2uYhbRBEUwuFa0mIRr+ULvRr8ZH3mT3Q+sKN89QG
	 JIOUO0rVevcNlEg4xVgFqLffOSEBQSlJ3ZMNunLnpSHIMTNgrMH7EX8rhHTGtHty9P
	 SfH5bGjMB1cnA==
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 23:28:39 +0100
Message-Id: <DMW50R7OLMBC.2937FMZK59SIH@kernel.org>
Subject: Re: [RFC] linux-next: replace the DRM trees with a single
 drm-for-linux-next
Cc: "Dave Airlie" <airlied@gmail.com>, "Alex Deucher"
 <alexdeucher@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>,
 "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "Alex Deucher"
 <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>, "Mark Brown"
 <broonie@kernel.org>, <linux-next@vger.kernel.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <aupFKGpAwAiGXN0U@intel.com>
 <DMLVPRO7XF7F.21199FO61MFRD@kernel.org>
 <CADnq5_N-6_T8EnihjoTSqpHGb_mZPogi6z=Ti-7_oue5d07oTw@mail.gmail.com>
 <aupktBCwcN_coHEH@intel.com> <DMLY7GDT8VBO.EE1P01ZX2HPK@kernel.org>
 <auqaZdocMvOIxN1c@intel.com>
 <CAPM=9tzu6MYQ-Y0iYK=2PLiM5=1BsEN+Q5WnmYh=hkKnLJ4b1Q@mail.gmail.com>
 <DMMDNQ0GD6AP.6HPRG6JWUEYQ@kernel.org> <autvCxZuSCxFjtgr@intel.com>
 <DMMS9R5JJ4ME.TBIB1TNLB3IP@kernel.org> <auz6sKjP98m3IoG3@intel.com>
 <DMNO09PAED4M.34GSWNA0Q55E1@kernel.org>
In-Reply-To: <DMNO09PAED4M.34GSWNA0Q55E1@kernel.org>

On Fri Nov 6, 2026 at 12:27 AM CET, Danilo Krummrich wrote:
> Sure, I'm happy to look into this.

This is now implemented in [1]; here's a brief summary of how it works.

Currently, for each tree that already has a for-linux-next branch,
$tree/for-linux-next points to $tree/$tree-next when $tree/$tree-next-fixes=
 is
an ancestor of $tree/$tree-fixes. Otherwise it points to $tree/$tree-next-f=
ixes.
This is the existing selection rule in dim; with my changes, drm-for-linux-=
next
follows the same logic.

The merge order dim applies for drm-tip is:

  1. All -fixes branches, then drm-next.
  2. All per-tree -next-fixes branches.
  3. The configured per-tree for-linux-next branches.
  4. Record drm-for-linux-next.
  5. Merge the remaining -next and topic branches to complete drm-tip.

Of course we could easily avoid either the explicit -next or -next-fixes me=
rge,
depending on which of the two for-linux-next is equal to, but keeping it
explicit is harmless and keeps things simple for branch-specific overrides.

dim pull-request, which wraps git request-pull, now asks:

	Close this tree for the upcoming merge window? (y/N)

Answering yes fast-forwards -next-fixes to the requested tag, updates
for-linux-next and rebuilds tip. --close-tree and --keep-tree-open bypass t=
he
prompt. For trees still open, dim normally prompts during -rc4 through -rc7=
,
inclusive.

To enable your tree for integration through drm-for-linux-next, add "$tree
for-linux-next" to drm_tip_config in nightly.conf, after all -next-fixes en=
tries
and before -next/topic branches (keeping the existing entries).

Trees can migrate individually; coordination with the linux-next maintainer=
s to
replace each tree's separate inclusions can be done once the corresponding =
tree
is covered by drm-for-linux-next and drm-for-linux-next is merged by linux-=
next.

(Note: dim technically doesn't need an explicit for-linux-next branch to ap=
ply
this logic. However, I did kinda like that it gives maintainers an explicit
branch to indicate what exactly goes into linux-next besides the -fixes bra=
nch.
Besides that, the code already exists in dim.)

[1] https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/11=
5
