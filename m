Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983073;
	b=ceruSGAI/W9plaFXE5O83VlMgD4lU8nNUGfkkQeq00AX+pp5eDNUg4x7Z3vcXncr4ps+
	 teT0s0kzQwj/mFeQgPg4SoDurUdzpk03Z3ehAXhOG0Fa9h+O/xtHFfHxySeAVnG7wrby/
	 LBQMgU7kV7BZQkKRr8J9Gbn86rlIC9j4Xc6IHYvICLENiteOox3R5k4JdZ4xrxIVvj5gV
	 WFeSR3RZSIgtRSQhSJIv7va6xrNtKSWlxtGeCP4BLI9tar3JBQkHIqycdxMGwh3ysIM4l
	 oKiPeGu91OIfFQlnUnk0scLyfxbmxHejjqM3GuHNKeOhJ2BPwbFkpoWOW0FC+quE+oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983073;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To;
	bh=vLjr3aN3svtfAg+boMWqs422HvhByANgbsByJPhijUM=;
	b=a1lYdrIvslEuOtJ27JinAJO+V6pPwyNP+0ppIqYNBJ2YYL9WtCOAKiSQhIAlNRQTJL/I
	 vqyCsbdNecnIoEqGEYRPqhrD/ALlp7n4du8lkYW/EpKsUvmunZ31lefDI56Od0fDUpcpT
	 R6YM1+T/88d5CKpScVayF03Lgrhj+8KcXwKVfVPHmL5BQP2WtBoKQfH4mMAVysEC+6Fl2
	 4r69VmF5PRB/mRN3KRZtP5eUh07F82fCq0ZDbB4fG6sOZxLeIIWv8jGeTfsZGD1W4iH6T
	 szJmGChfsF5Z3uVCVfImRY2k85y59OUxlN0cXrKE5O4RTICfRngfJHlol+gwxjOqnQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PqNn2ZPS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9E4606A32D
	for <linux-next@vger.kernel.org>; Fri,  6 Nov 2026 16:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PqNn2ZPS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D491F0089F;
	Fri,  6 Nov 2026 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793983072;
	bh=vLjr3aN3svtfAg+boMWqs422HvhByANgbsByJPhijUM=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=PqNn2ZPSbtV+aliQY+qri8OzTkVFhHX/RcF49t9kMRpCsmPtKLGAl0ofmvvRDZC1Q
	 fb1ipwVXN1A4Hc8z4lDPpyFl3WE1mN4JFnsoGy/qYfl20qH+Ck7uk3eg4l5zXL6MYf
	 Pr+TxompeaQ8TKyJuTx//wd6WZaHngdB155MKoKHABCivkcdlDFl/UTxAlvyIe4Ifi
	 bT37UmUYBvXd103eTyacBfHfGkarkpKeQ47YiQr2PGsTBfXIiuO5NA/aC1Od04JWdQ
	 Z+LIwjb2VR0o8jyq5nS7FbefvW398n1HhNvy3a/AdTFwIVpcA5X+MalQJ7AelTbhjM
	 nGHTloIhjADYA==
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
Date: Fri, 06 Nov 2026 17:37:47 +0100
Message-Id: <DMO9X7V4K1MQ.2PSHDUJKA9Z2B@kernel.org>
To: "Jani Nikula" <jani.nikula@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC] linux-next: replace the DRM trees with a single
 drm-for-linux-next
Cc: "Dave Airlie" <airlied@gmail.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Alex Deucher" <alexdeucher@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>,
 "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "Alex Deucher"
 <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>, "Mark Brown"
 <broonie@kernel.org>, <linux-next@vger.kernel.org>
References: <DMKY979I29AF.BS1DF5YAZMOY@kernel.org>
 <aujikV14tF6K1Xqw@intel.com> <DMKZR0YZV1CX.DWVK9V47GR1J@kernel.org>
 <CAPM=9tww=CJdxzvfUvLwQ6V4uoszg8JrB1XCAcp15upM-xPvSg@mail.gmail.com>
 <DMLTRKUXTL3P.11VRVU1A8ERMG@kernel.org> <aupFKGpAwAiGXN0U@intel.com>
 <DMLVPRO7XF7F.21199FO61MFRD@kernel.org>
 <CADnq5_N-6_T8EnihjoTSqpHGb_mZPogi6z=Ti-7_oue5d07oTw@mail.gmail.com>
 <aupktBCwcN_coHEH@intel.com> <DMLY7GDT8VBO.EE1P01ZX2HPK@kernel.org>
 <auqaZdocMvOIxN1c@intel.com>
 <CAPM=9tzu6MYQ-Y0iYK=2PLiM5=1BsEN+Q5WnmYh=hkKnLJ4b1Q@mail.gmail.com>
 <629d19bcd0f61974f3e1c94c90b4052216d2a967@intel.com>
 <DMNL1MG0A8P4.1VPON40R8BX2U@kernel.org>
 <3678ff00381a70148d6abafcf20ba3726bff2fc7@intel.com>
In-Reply-To: <3678ff00381a70148d6abafcf20ba3726bff2fc7@intel.com>

On Fri Nov 6, 2026 at 12:08 PM CET, Jani Nikula wrote:
> Anyway, how about just *prompting* "Is this expected to be the final
> pull request for the development cycle?", and if yes, update
> drm-*-next-fixes while at it, and have the automation handle the rest.

I think that's a good idea! So what about just git request-pull prompts:

	 Close this tree for the upcoming merge window?

and in addition have --close-tree / --keep-tree-open options that bypass th=
e
prompt.
