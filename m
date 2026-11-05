Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912890;
	b=aoMqaLGNjxv99sDUnFM5bUXwvMQTSFIgx8440p8p7fN9dfOZYad1VYAiiUINP8nScM9l
	 k6EAveAU28/3nhItwedVh95hzQ49aqpQQw/34BzD5VvMcHzgywaKKmxTkkC0sGqT6bIf9
	 DRJQpIBR5+cRI7MqC92Urp9ij8EkduFpSAF+ym8FYPiHvgHBwbSuRfEEyqbehiyW5jbi0
	 OtZBUkETWoJbKiC1OXbatYO96n1YilEkRGjfLn/z1kyYcWPyYgr8fZlpwWb+5wHrvq8to
	 xDuKe7KaDO1GbIDAchzYlxVNUCh9vFM4Wt2MdqpD/6Nqw1ViV3FqmRtKDZ6CdCNcCDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912890;
	h=Received:DKIM-Signature:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:Content-Transfer-Encoding:Mime-Version:References:In-Reply-To;
	bh=zpjjG0/XZ4vbFxePWjR4ITlPAwQKEqDgfiUoqqdwJJw=;
	b=3ysR2xxfFAFgUApBdU0z6K6hEkLBuVAI2IXkHDgpWlF9fG9DyOwJP5ihzPIGOM3lT+ie
	 aeSamoSJe/RQpMKdVX9YTiIo8JISbnNVRzOco3wYRsm16ywNwyjeHmMLTnya4heP2kduh
	 7CpfdE2j3j34bW4rbkrR9333fNUgJsbzG5LgwaNLna0G9QMUs0fEW+89/KIbpPR7qun+T
	 CEal34NtljDN61DyHLahAI+N5TjLaw9xUts0EYFUbgzg/x55iGrFnglnX0OSK5AEz3/Ev
	 DXQYfsJpxtFZfrlSrrWsuDUMPBPyqt6qtEAqIBkpRXXQhDb2TOMvcE0mR1WHVjEWZ3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVXdgfUs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612E6606D828
	for <linux-next@vger.kernel.org>; Thu,  5 Nov 2026 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVXdgfUs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B441F00904;
	Thu,  5 Nov 2026 21:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793912889;
	bh=zpjjG0/XZ4vbFxePWjR4ITlPAwQKEqDgfiUoqqdwJJw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=DVXdgfUs3Y23/LQV8g9mAsVOOF4/enYk5TjZXQZICil6RJSm8qPw1/7y3f0WuoZho
	 mqi38x/iMGVBbuHEKQ7moVrRG8M2al1ziDpjw4FDHjOiqrW8k21BM/9lMdCmSggbM/
	 lSozANod2txSaDrhMmtvQU3ykrJhoZaSnR6ru+Ecdid53qV6vsJk06F6cWi70OscYN
	 QJwAEeJIhsn9nU/iiYUwwwkiLzrQmPf38k7RYh5RiNvK0hBVMUZer+DRngh5a1LT6h
	 M9lPCIXccF+a3HYO1q/FchdhwMHsDxFB0yz2atvz2oYH0/pStOwadFn1QHA9qAA10N
	 UmRjOrlRk4U8Q==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 22:08:05 +0100
Message-Id: <DMNL1MG0A8P4.1VPON40R8BX2U@kernel.org>
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
To: "Jani Nikula" <jani.nikula@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
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
In-Reply-To: <629d19bcd0f61974f3e1c94c90b4052216d2a967@intel.com>

On Thu Nov 5, 2026 at 2:44 PM CET, Jani Nikula wrote:
> The main downside is the delay between merging in a driver tree and
> hitting linux-next. But we could also decide to mandate more regular
> pull request to drm-next, maybe weekly, especially for the drivers with
> more traffic. This will mean lots more pull requests, but it's really
> not a bad thing to keep them smaller.

I was already concerned about losing up to a week's linux-next exposure wit=
h the
proposed global cutoff at -rc5 [1]. This approach would extend that delay
throughout the cycle.

Even with weekly PRs, changes could wait up to a week before reaching
linux-next. They would also only get that exposure after being merged into
drm-next, whereas I'd like them to receive linux-next testing before that m=
erge.

I don't think that such a compromise is acceptable: If a tree breaks linux-=
next
it would mean that linux-next is broken until the next PR hits drm-next (an=
d not
only until it is fixed in the tree causing the issue).

I don't want to sound like a broken record (sorry if I already do :), but I
still think the

	git merge-base --is-ancestor $remote/$linux_next_fixes $remote/$linux_fixe=
s

switch we already have in dim seems like the best fit. It already does exac=
tly
what we (and linux-next) need and is accurate: it preserves direct linux-ne=
xt
coverage and bases the selection on the actual tree state. And with the pro=
posed
git request-pull --final option it is very maintainer friendly.

[1] https://lore.kernel.org/all/DMMS9R5JJ4ME.TBIB1TNLB3IP@kernel.org/
