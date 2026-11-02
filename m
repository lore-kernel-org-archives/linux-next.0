Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649697;
	b=38AztDL71mH9dwmagkg9vNOczSe28L7/XM2z6JrxHRZbFXLXO6RT4/VIxfL3+HIcLzcp
	 enXPbd85VqCt4eHpRtdgB/N0/qi5uW/O0o7Te0JM+uXcMas9aIT6Wma+asVyZdiLJPxYN
	 X5zvslTgLQGK2l0UCTfX0rIVojQtwr9v7R9mcqzGCynvBvZxqv3C9EmgfX9XJYPiOfEr1
	 KISLmqruoy6wEisCfITW04MSucZZSoItlWn9hAuSfJh8Bmnuf/qK557mtZ2LrhvIDiFDJ
	 kMmFl4HtwYHINjISM1+0U4A5Zm10Tsd9l5zdAfBbxqquCFlT/xzq/raB/Rwxzxo+O5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649697;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=RJYRwDLxOAqByMkWCFUQlONmwYPl4Hw9XG8zdhfVq08=;
	b=A0+sLnB3JW4aIg59Z/KuMz/jSvD1Q9H2/WHaNhNuPOfdK1U4To+HpsW+O+e/Xp0+OhK0
	 S1aG6hojrl/NjyH4IgWzgJrwrVdNhYalpjJkEq9ctmWgGmy/GFzwZpN6ynMiqn0XOJhwx
	 lv+TEYLFcqpqp8hAnEt7fTBXpkkxhKy2c7jINwweyrqsQMSKo384ghFtOWfGV+vbyf9lW
	 qWPt84B5YRcGmrGmPmi+MeJD0/seChPaJQAd0QgJ60IziyjRmc7jRrSNVxCNlpJXsvDni
	 fvZpUP75fK5+/kwfwYxuLV881MTC2NAzbw3ilRq+/0jX05qXC4SLxKRRUlHwHoOmgrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SuNU9844;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2307606A324
	for <linux-next@vger.kernel.org>; Mon,  2 Nov 2026 20:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SuNU9844
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1F21F00A16;
	Mon,  2 Nov 2026 20:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793649696;
	bh=RJYRwDLxOAqByMkWCFUQlONmwYPl4Hw9XG8zdhfVq08=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=SuNU9844wpdybe1sCRbvxPneKyTqJAElJfloJfpL/l9Tn485SCPSEB1TzxK8qnHfY
	 IxMHh1AOajrdWxSznm9SLdT1Gmg8N/LChuJQE0cNIrRqMADDQGH4mcb6afAYLOFrkE
	 r8Yr70XvBgbab4htfICxqwAR/S5VDY/R7qd+QzZNvkRk64fGTAZS5MBKvCqs2d0kmu
	 yt//ZwxnijAHQIvLEvpYoksUIIaWZ8lAHdnEkgf2JfRAMIdc9/yepFSkq00Pb+18Ac
	 uNNKpIVLoX5JZTKDv27AYGbBfvWB7nEoOeymJtSE2SG5VwL8FCq7JM5GY5UMxLa+Ra
	 blKfE32l8VG5w==
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
Date: Mon, 02 Nov 2026 21:01:31 +0100
Message-Id: <DMKZR0YZV1CX.DWVK9V47GR1J@kernel.org>
Subject: Re: [RFC] linux-next: replace the DRM trees with a single
 drm-for-linux-next
Cc: "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
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
References: <aujZcJBUyQ7iX_PM@intel.com>
 <DMKY979I29AF.BS1DF5YAZMOY@kernel.org> <aujikV14tF6K1Xqw@intel.com>
In-Reply-To: <aujikV14tF6K1Xqw@intel.com>

On Mon Nov 2, 2026 at 8:20 PM CET, Rodrigo Vivi wrote:
> not exactly... The per-tree check goes away and there's one global rule:
> the driver -next branches are left out from Linus' -rc6 until -rc1.
> But this is the cutoff the drm-rust docs already describe and used by eve=
ryone
> anyway.

As a general rule that's correct, but in practice we have been leaving -nex=
t
open for a bit longer (with the last PR at -rc7, depending on what's contai=
ned),
as it sometimes helps with cross-tree coordination for interactions with ot=
her
trees while we're still ramping up Rust infrastructure throughout the kerne=
l.

The Nova vGPU parts are getting closer to something that can be used in
production, but it still remains that it is useful to retain some flexibili=
ty as
we will keep having some more cross tree dependencies for a while.

> So, the maintainers are still in control on when their -next is closed. B=
ut that
> is their last PR. around -rc5/-rc6. And if they need extra PRs after that=
, it
> is also fine, because drm/drm-next is still feeding this unified for-next=
.

For a late PR that leaves a gap for stuff landing in -next and only ever hi=
tting
linux-next *after* it has been merged in drm/drm-next. Exposure to linux-ne=
xt
should however be a prerequisite for making it into drm/drm-next.

So, I think maintainers would have to commit to strictly close with -rc6 to
avoid such a situation.

> IOW, when you fast-forward drm-rust-next-fixes at your cutoff, that conte=
nt stays
> in linux-next whenever you do it. The only difference is that drm-rust-ne=
xt
> itself stops at -rc6, not when you fast-forward.

Sure, but that'd mean -next PR a few days after -rc6 would need to originat=
e
from -next-fixes in order to get linux-next exposure. Thus, with this appro=
ach
it just boils down to "no flexibility on this".

Can't we just keep the per-tree for-linux-next branches and just merge them=
 into
tip/for-linux-next?

for-linux-next-fixes could of course be removed as it always follows -fixes
anyways.
