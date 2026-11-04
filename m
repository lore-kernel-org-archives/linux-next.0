Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790493;
	b=FEbHbt2XlOXZf88odStwlIfUonhsYnIa/8nIWwLCzMro/gjjJcQxdEkWV8BWS2shJE7J
	 I/hnmIpTVzbag6VRjXAptGbC9qlpVdC7xLiJbvSr85w0ElvQlhAl792uyprkmVqx2eRE5
	 wGH3uqEG3FqVf2B2J0EQNIkhCTuIC60XbbL35easgQde+9M8MjbnP2h3ZUqfJotpxQWCr
	 61jN2RkdSbKW0ESEw+GrVUDF51tz7QYl0Ny+nVteqBqcdtOGCJZExE+XKs9Vd8/WLmGdV
	 Kp+ZrNPNN4PlvzILM9yZ6QwaKq679EJBCnktSGFyXxk72bcBrgEk6hfsssuxENTtYww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790493;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To;
	bh=u0pzNhc88EQWfEvdKmTmCWvYxL0guJ9gozKWEalXU4U=;
	b=GM/kKqy/X0VmhiwHHtoYBwZLMxZo+VBAfvefFVitnGd2eoUKP+ybjRamPvNLYxcqr1WO
	 bmQvOiV7/+KoZFmayTzkYV/CnI+8xxjqYM8cWSz8QAHkXeijdrteBlocD5Vn3/GSS5igS
	 xGklvBb0ICATnHWDg2+D2e8IqTxj95/1d3WLzfjY9qwKJE0Z5xzKAT0zLziCzhNybHnQW
	 DKeSMagSHTYGOA0i0j9syD8f1SDXAlOW7xMG+PE6mSlJFYT1qs6k1kqSOS8DIpG4xaVtC
	 JMQXeFppljO2jlDlCTbM0gbiX1Jt+i66DI0nXaLOC/7M2SeG6ODFZeKkDaETmWCIJdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNoFUyHE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5792C606A326
	for <linux-next@vger.kernel.org>; Wed,  4 Nov 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNoFUyHE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4711F000C1;
	Wed,  4 Nov 2026 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790492;
	bh=u0pzNhc88EQWfEvdKmTmCWvYxL0guJ9gozKWEalXU4U=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=oNoFUyHEbgkk5cIKOy0xO8hz/PBgZm1fpGpyJXJ5kZ4HpiLdM3tqZTCHhQtE9a2On
	 xeMI5/n+XtP3rOh7e8G8EqJsWYRc+xineIDIymEqx1oiHaS18sXV2AobdPow+oEAhq
	 mpBjBcgtkA5ZMHhloH5JuhIa2bmRmy9Kjr+5F3wofARCGElHxxCoWBe8pr4+I2irvG
	 BJTeWC8WJBuiXl2DMKvA6r4lPhL7ZeONoExfbTsDBStdf0HkKqmnJUVmpitto4EMmp
	 yzw+Jogix8A0y9f31OkeOwjIcJ3DQPaV28B+y5sTJTZxvYdjdulRfgk173yMmUXua5
	 iyTvDxg9aDz5g==
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
Date: Wed, 04 Nov 2026 12:08:08 +0100
Message-Id: <DMMDNQ0GD6AP.6HPRG6JWUEYQ@kernel.org>
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC] linux-next: replace the DRM trees with a single
 drm-for-linux-next
Cc: "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Alex Deucher"
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
References: <DMKY979I29AF.BS1DF5YAZMOY@kernel.org>
 <aujikV14tF6K1Xqw@intel.com> <DMKZR0YZV1CX.DWVK9V47GR1J@kernel.org>
 <CAPM=9tww=CJdxzvfUvLwQ6V4uoszg8JrB1XCAcp15upM-xPvSg@mail.gmail.com>
 <DMLTRKUXTL3P.11VRVU1A8ERMG@kernel.org> <aupFKGpAwAiGXN0U@intel.com>
 <DMLVPRO7XF7F.21199FO61MFRD@kernel.org>
 <CADnq5_N-6_T8EnihjoTSqpHGb_mZPogi6z=Ti-7_oue5d07oTw@mail.gmail.com>
 <aupktBCwcN_coHEH@intel.com> <DMLY7GDT8VBO.EE1P01ZX2HPK@kernel.org>
 <auqaZdocMvOIxN1c@intel.com>
 <CAPM=9tzu6MYQ-Y0iYK=2PLiM5=1BsEN+Q5WnmYh=hkKnLJ4b1Q@mail.gmail.com>
In-Reply-To: <CAPM=9tzu6MYQ-Y0iYK=2PLiM5=1BsEN+Q5WnmYh=hkKnLJ4b1Q@mail.gmail.com>

On Wed Nov 4, 2026 at 4:29 AM CET, Dave Airlie wrote:
> Yes this is the thing I like, while I like maintainers having freedom,
> relying on them to do something manually every release at the same
> time doesn't seem to scale so well.

I think maintainers have to do something manually every release in both cas=
es.

The difference is between "everyone has to do it at the exact cutoff day" v=
s.
"everyone has to fast-forward their -next-fixes branch" (which to be fair h=
as to
be done in both cases).

For the former, a tree that closes before the global cutoff can still leak
following-cycle work into linux-next.

I.e. the global switch is automatic, but doesn't ensure correctness by itse=
lf.
In order to be correct, maintainers have to do something manually.

So eventually it comes down to whether doing the correct thing derives from=
 an
explicit operation (i.e. fast-forward -next-fixes, or just add the --final
helper), or an implicit commitment to push and tag branches on a specific d=
ay.

I think it is better to derive the tree status from its actual state rather=
 than
a promise about that state at a specified cutoff day.

> If we can't have the tool enforce what we send to -next after -rc6
> then it's going to have gaps.

I don't think either option can enforce correctness. The difference is that=
 one
approach relies on a timing promise about the tree state, while the other u=
ses
the tree state itself to make the decision.
