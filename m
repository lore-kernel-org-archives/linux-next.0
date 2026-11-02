Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793660848;
	b=rBHScodsh5pizfCwh1ngtaJKclsKh8EyGqqQzM9/UdbTzDjrEH5UUNlVm8Hy2O7a7Mqp
	 vh0mDGCeORKEmZa4bC1YHkoRoKk0eRWkoPskYEDpqRNkfgxAiFom7cMcclZL6iFJGeWzK
	 oiLQKRM9sf6/x7S1nEPTT9lnf1zWBtZv9J6fskLb6lxSBzyVGX+WnJ+Kzb2mSXuKbO3nL
	 qZnaEX6AhqeR5rmzw2TSDa3kOPf9DVL6HkZDsgAUnOVurMqYRlHHiiKoHL58HZzy3s/Zh
	 i39VT6JCyE3EOeapXfGOQwcrInyH3HlsgvAmUxM4G2a5Ls1IhyUFydekn2WO/JxN2sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LtJ5JL6qAopgs2lhUvZDWm4BbQkkZyUq93j8S5yMDyg=;
	b=V5Xmmcjc0EKsX9Gj5JqE9QFSIdMT7QzM84sihgOWMHGUETwmR3rvRx2yIJNlkKQl49/X
	 JTsZcQrASesG7vIt2uKukOWOATobGLGcU0yRLLnLt9tV7G5uhbKGHESYfEBVQXSLBzBW0
	 VGHJrDzMREsabWcO1ApsCn90BFgsximoEMofgnykaDGXMvx/JXV2yxSWQGtnIokFbtrMD
	 EV18a4zU8NndyXidre0j3Jma06wiKv+p4MRJE1X2AXwLAXuUKD79iP2sQD9SHLXdLIu9y
	 gEqy0ZW7p1EhTOvehiOrCd0WhpbYmU9SKC2Cq5xosRdmG4XMH4XfDIrOe+ZqIGKbX7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkCVo7xd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D838606A324
	for <linux-next@vger.kernel.org>; Mon,  2 Nov 2026 23:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D838606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkCVo7xd
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a0eecf73fso616295eec.3
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2026 15:07:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793660847; cv=none;
        d=google.com; s=arc-20260327;
        b=XNbnVXo5jHoeaaTfQNo8Gn1xVYKa/IQWtuPibnu0JlmiZvOvdmxLP0KTnbQT6C0OTz
         p1d6XF6EGBewZW//aiYc6gzV4785uJC3PFRnj3xcXj6VtNR2qiPNd7FVzQZiwfWZh1WD
         mSdppWoVZ231H1DbQkK3gqngxkEPWIgWAPoUkd3j5/ULEiBUErJFduC5CRFF23A6o4Gi
         I6xbU5reFRLu4OpkrJOH9LM/9kJ7lSSKnHITglZqG3wnOE2/2e6cJ1dkgaBsnFWMDiBp
         sAQBYWYMycbCxTivbc/cTenpFOEwkpzL7+YwgTOlObpp6GlKY24MWKZfzWKMzRa0qf89
         YYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LtJ5JL6qAopgs2lhUvZDWm4BbQkkZyUq93j8S5yMDyg=;
        fh=gn0qEJrQ2dRdpDMVmMVQDFb+h5a6U11unn6br5+VJPU=;
        b=TvfkKdM5raTyLE4s5syu2tMeEJXjC0645UTwnS7UHUkZ+GiM5fthpH7BSu3xLMVeQF
         RxD+kLyefyzkbCh46BR1GcnxO6WFBWH1H2TpoW6oMxm4UqWiA4tQ1WhtFJSnb5NqtLgj
         868cMarSNXC+/ORkPLAOdufQOv8CIOpd06KSvHvnLPL+z7cc1EZMFawpV8gPfoCtkVJf
         kNk87hVe/YVYP5U/8iCSRyNDtC5MUGgvvsqGyGOUMTMirCPXXcc43U9Zal4P9vMq26+c
         ARTm0IIX9AGS0li75VLNMYH7mIC/0dV8nMycOoZqKFL80XsuiEHZ4Z9RE0AvOze4CAD5
         m6tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793660847; x=1794265647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LtJ5JL6qAopgs2lhUvZDWm4BbQkkZyUq93j8S5yMDyg=;
        b=HkCVo7xdjlAt+MEGVdQF0QuY6zycnCadDSAjttt8Hac5pq/9tJDqj5Pi27kogNnIYN
         j97mniks6WvJkldxeLnu96BKJEnCkPUn/2RpcXoIPr2WEK7w0hA2UlrK75nwNVTHUT/L
         vdTyj2lvkDWHh4EUdumkOZUlGTuPGZMx6orCWPQwK6aSoRY4cNtRrt1YGSaEfDssZTXT
         XQb3V6MfzI0GSJEhD1kc6wAe48FNp2k/ouh1GyQsdcrN+N2rAjbfIzigAqU30q4YOLeX
         fzmYQW5ZCY3dkYKqLDnCBwL+ta1Fx5L0RZsFfHlXiqNTzpLIZCJhg6EqQVteU5EFd5kp
         HjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660847; x=1794265647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtJ5JL6qAopgs2lhUvZDWm4BbQkkZyUq93j8S5yMDyg=;
        b=KINXlmT5kwuiwMIKq5Ki9Q+OSJqIAg1VMZB6/2mY0u6vas0SjfC7HCxB7ZKw1WLinm
         aO2OZOmmlfnSUdFC53VPiAubiS/aA1XjR2vtZfKrge/IVOrdHTTh6uAkL2NCrQqPe1Xc
         tz1cRx+TzxjYekRM5kaIm+3ky3Pkx+Tm17kl+Xuc5+nQN2cB8d4VnQO79OqnUc4S5mMT
         Kfp0n+aYGb2LOd8zYtneZdNankger2prYEh9FbEhCERJo8xZHoc4ZgTwPIqn4cBylU0T
         Bw8l9npN9cSiPcsP3UMSju7MNI7dxAq6sFDVPu7IxfN0ziHjODQAgvhrXrVa5XO2boLN
         WKRw==
X-Forwarded-Encrypted: i=1; AKwUvBy1Gvr8rcm1WBuwSxCyZiuY3InvfwQB37jEuD5YyEJnk0r4aNJFew/kRhxuqTkFIbXj2wlxbTnCMeO2@vger.kernel.org
X-Gm-Message-State: AFq9FYJLvP2sbjMZPjlSKYfdJNkJWhi09Ihd92yi/lzKmQwyrlezC7FC
	XiAp8qIUoekk2vxAvIR/2MYTVTkMJ0hyTnrC9B49iAV4vG2PYPQ2Lv958cuX9Nwbs9aqA8MjRPM
	Iq0F5zdy3M552y1pfuS0pf8uJz3iNC/M=
X-Gm-Gg: AYBFou1IFHm3F3g4MMXCGt+VFsUBhXqTcvvXZ1G/xLHMJq+u6b+9Kqleh0xwlI29Umg
	1etCqIGqlMxKG0ER4evVd5yTwe69QJN204TX5gB5JXZTW+S0RztMrPagT5QwiFq08MQ4i89OMN/
	0R47WyLdVZQEw2L7DvVh+RHSujQgbYDj9X9u7O7/v2PMNYG1wsruQa7YSrURRVIoo05Werydmn/
	vy7kdFYkd6fGbaiQFPbPTtblBxpd4WX0yZ6hjpJr5h+c9W96okawM5eR08in2EF5Hz5WNGk4ccM
	nHYL5Wz9X9EIDWAkpts8IBswF0+uCThn7TU5rwR87vjc7uVXXyiw3JYiEowxd9r2yn56GUINWUu
	YYNJYf2PUTD3e6FqvNc3d+TDRr8OymnAg0a/YSjxp6k4PGBzaALNPcX7Nux19CAXwxbdjek6c8d
	aahR9YVMkigKt66ZT++0rSsSY=
X-Received: by 2002:a05:7022:c90:b0:127:def:dd72 with SMTP id
 a92af1059eb24-1ac5914348dmr23169730c88.2.1793660847033; Mon, 02 Nov 2026
 15:07:27 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aujZcJBUyQ7iX_PM@intel.com>
In-Reply-To: <aujZcJBUyQ7iX_PM@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2026 18:07:15 -0500
X-Gm-Features: AclHuK-yoykhBZZPuI4MkDU3EtbBAN1xWrPAe0gQ6PXSlR0CMnJh9ZxVOdSAIg4
Message-ID: <CADnq5_M5SjooHDGt3T=69mTqYW0rjwM25Y8r9dgi8gDJEWYt7A@mail.gmail.com>
Subject: Re: [RFC] linux-next: replace the DRM trees with a single drm-for-linux-next
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:51=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.com=
> wrote:
>
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
>
> It contains the DRM fixes too, so it would go where "drm" is today.
>
> During the past weeks I have confirmed that the drm blackout period
> works well on this new branch.
>
> The dim changes:
>
>   d875049d2b29 dim: build a unified drm-for-linux-next branch
>   3009867cd318 dim: keep -next branches out of drm-for-linux-next during =
the freeze
>   https://gitlab.freedesktop.org/drm/maintainer-tools/-/commits/master
>
> AMD:
> Alex, Christian: linux-next takes amdgpu from
> agd5f/linux.git#drm-next today, which differs from drm-amdgpu-next in
> drm-tip. Is drm-amdgpu-next fine for linux-next?

They should be the same.  I just mirror drm-amdgpu-next to
agd5f/linux.git#drm-next in case anyone is still looking there.

Alex

>
> All other maintainers, please ack if you are okay with this approach.
>
> Mark, you're in Cc for visibility only. Once we have all the acks, I'll
> send you the formal request. After linux-next switches, we stop
> updating the old for-linux-next* branches (patch below).
>
> Thanks,
> Rodrigo.
>
> ---
> dim: stop updating the per-repo for-linux-next branches
>
> linux-next now pulls the unified drm-for-linux-next branch instead.
>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  dim | 53 -----------------------------------------------------
>  1 file changed, 53 deletions(-)
>
> diff --git a/dim b/dim
> index e3f616b..b3ed8f7 100755
> --- a/dim
> +++ b/dim
> @@ -658,52 +658,6 @@ function dim_range_diff
>         fi
>  }
>
> -# update for-linux-next* branches
> -function update_linux_next # branch next next-fixes fixes [for-linux-nex=
t] [for-linux-next-fixes]
> -{
> -       local branch linux_next linux_next_fixes linux_fixes for_linux_ne=
xt for_linux_next_fixes repo remote
> -
> -       cd $DIM_PREFIX/drm-tip
> -       branch=3D$1
> -       linux_next=3D$2
> -       linux_next_fixes=3D$3
> -       linux_fixes=3D$4
> -       for_linux_next=3D${5:-for-linux-next}
> -       for_linux_next_fixes=3D${6:-for-linux-next-fixes}
> -
> -       repo=3D$(branch_to_repo $branch)
> -
> -       if [[ $repo !=3D $(branch_to_repo $linux_next) ]] ; then
> -               return
> -       fi
> -
> -       remote=3D$(repo_to_remote $repo)
> -
> -       git_fetch_helper $remote
> -
> -       if [ -n "$for_linux_next_fixes" ] ; then
> -               echo -n "Pushing $linux_fixes to $for_linux_next_fixes...=
 "
> -               git_push $remote +$remote/$linux_fixes:$for_linux_next_fi=
xes
> -               echo "$DONE_OR_SKIP"
> -       fi
> -
> -       if git merge-base --is-ancestor $remote/$linux_next_fixes $remote=
/$linux_fixes ; then
> -               # -fixes has caught up to dinf, i.e. we're out of the mer=
ge
> -               # window. Push the next queue.
> -               echo -n "Out of merge window. Pushing $linux_next to $for=
_linux_next... "
> -               git_push $remote +$remote/$linux_next:$for_linux_next
> -               echo "$DONE_OR_SKIP"
> -       else
> -               # dinf is ahead of -fixes, i.e. drm-next has already clos=
ed for
> -               # the next merge window and we've started to gather new f=
ixes
> -               # for the current -next cycle. Push dinf
> -
> -               echo -n "Pushing $linux_next_fixes to $for_linux_next... =
"
> -               git_push $remote +$remote/$linux_next_fixes:$for_linux_ne=
xt
> -               echo "$DONE_OR_SKIP"
> -       fi
> -}
> -
>  function check_conflicts # tree
>  {
>         if git diff | grep -q '\(<<<<<<<\|=3D=3D=3D=3D=3D=3D=3D\|>>>>>>>\=
||||||||\)' ; then
> @@ -1192,13 +1146,6 @@ function dim_push_branch
>
>         git_push $remote $branch "$@"
>
> -       update_linux_next $branch drm-intel-next drm-intel-next-fixes drm=
-intel-fixes
> -       update_linux_next $branch drm-intel-gt-next drm-intel-next-fixes =
drm-intel-fixes \
> -               for-linux-next-gt "" # no for-linux-next-gt-fixes for now
> -       update_linux_next $branch drm-misc-next drm-misc-next-fixes drm-m=
isc-fixes
> -       update_linux_next $branch drm-rust-next drm-rust-next-fixes drm-r=
ust-fixes
> -       update_linux_next $branch drm-amd-next drm-amd-next-fixes drm-amd=
-fixes
> -
>         dim_rebuild_tip
>  }
>
