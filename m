Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645478;
	b=ghGDnun3pCAuM4HMjS7nEQ3Tg4pOGFz6tohuSZ7FqClcsgtpXjoiPo3TmSbq+47fOmWX
	 jOSKT3UcMrXdkMF0OGOyI9hjWpVJI205YjfUWqVw3HM70gqNac1blBE91ReRclgkxkgv4
	 iNNzyeI9JjVrciCsFM/gW1pHhTb8bRNPou9K37/i2lBqDsTbhiliwzIDWhRrnah/fgihh
	 FhzKBE3P+iQbIkwQ+uRjxSpEvPDNqwDd+EIBbbhdnq7va6unFSIqojB+ku4kSKGo5AaQ6
	 WEiWg6INcQTNIqZmOvAcV+siB4RnIE3KM9GQvru5ce+6Vq/CuSFYBYIhPs15fTDtgOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645478;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To;
	bh=otXeKG6/gRRVfdqsTiK4DIFWyfU/stsI1BzcXuDzzyo=;
	b=SaqIfToDkp/v5IXeGufuKQgEVXsc0MVW4IIsOfj05jz51ltvxIKf3TSIQMh5NrsGPvBC
	 cNxzKB2oxpMu9c6OpKDySpy8HyqpdjVzfFjzaNFxDPv3rqEiymZXbjBPkIRiefQndA+Ud
	 l3jF3TPmOT6UpboQofa9dfsyYbkDC8E4WLfpa6iKM0d/V5PFjpAkIzLoUyC/NYZHRhNoL
	 T0GzwGwmZ3lo6rC1YB2EztIBx2HD4vfHi0Ees4SmnXheihJJyw/fckxybCwA3APFc8tX8
	 FjDUbBITHTjtFSLsTcGPRszTrreh48DQRDXc7dM3eWbcAt/pi4RX5mtgISyGBQC7/zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8e9UgiF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C41E606A326
	for <linux-next@vger.kernel.org>; Mon,  2 Nov 2026 18:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8e9UgiF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B5D1F00A17;
	Mon,  2 Nov 2026 18:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793645478;
	bh=otXeKG6/gRRVfdqsTiK4DIFWyfU/stsI1BzcXuDzzyo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=T8e9UgiFwdH6mxjIKF0JFIdqmskIpM26NiN2xPXdEp8Lt++6ltlhiWTXkrLr0UxgG
	 EoFPlz4BHgbtx3aZPyPcK9+dK8xmrk8zIl9IM/+9iMg1psdbDySeKULyTtlD8ObXIC
	 hjoLhX2P+n1KRlHo4ZTXdAt4qXNXgikreECS/G7mRrwp2TtfbCOk0l0CHPUmZTulQ1
	 o6an0XahklNEV+Ea9qEwgJXBMmliOcPe+h4WwoYH5rEcAVUAmfMatHBB4AUfH7Wydp
	 65Z8Kuw1PG7EYHyUTwOREIQ/RUg/CWq4Pgezthn9qD65Z3HygAYRyWaahNhmFNB5TI
	 uR9qLnvaUMYaA==
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
Date: Mon, 02 Nov 2026 19:51:13 +0100
Message-Id: <DMKY979I29AF.BS1DF5YAZMOY@kernel.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
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
References: <aujZcJBUyQ7iX_PM@intel.com>
In-Reply-To: <aujZcJBUyQ7iX_PM@intel.com>

On Mon Nov 2, 2026 at 7:41 PM CET, Rodrigo Vivi wrote:
> Hi folks,
>
> We'd like to replace most of the DRM trees in linux-next with a single
> branch:
>
>   https://gitlab.freedesktop.org/drm/tip.git#drm-for-linux-next
>
> It replaces these entries:
>
>   drm/drm-next, drm/drm-fixes
>   drm-misc/for-linux-next, drm-misc/for-linux-next-fixes
>   drm-intel/for-linux-next, drm-intel/for-linux-next-fixes
>   drm-xe/drm-xe-next
>   drm-rust/for-linux-next, drm-rust/for-linux-next-fixes
>   amdgpu (agd5f/linux.git#drm-next)
>
> drm-exynos, drm-msm, drm-msm-fixes, drm-msm-lumag, drm-nova and etnaviv
> are not part of it and stay as they are.
>
> The main reason is to reduce the conflict pain that Mark constantly faces=
.
> All of them should be handled already when we are rebuilding drm-tip.
>
> During this work, I realized that drm-xe is a big culprit for leaking
> future work without a blackout date from -rc6 to <next>-rc1.
> So, another quick solution would be to get a drm-xe for-linux-next like
> the other domains are doing. However, I still believe that this unified
> one will make Mark's life much easier anyway.
>
> The unified branch is rebuilt by dim together with drm-tip. It has all th=
e DRM
> -fixes, drm-next, -next-fixes and driver -next branches merged, with
> the conflicts between them already resolved on our side. From -rc6
> until -rc1 (per Linus' tree) the driver -next branches are left out, so
> nothing for the following merge window lands early.

Seems reasonable; I assume the logic for individual trees would remain? I.e=
.
-next goes into tip/for-linux-next until -next-fixes is fast forwarded? IOW=
,
trees keep control over when exactly -next closes for the upcoming merge wi=
ndow?
