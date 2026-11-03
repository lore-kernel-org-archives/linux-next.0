Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793741097;
	b=BYWh3YV/+ljI+3uVowZ78hpnfj5MZA2f/pcIvzJDlVggL5SOatwpFOrfdYJKUQEJc0tE
	 9MBKmAaGBsjiBOVBk+m3XcV9CDw6G8+QhZ50CD5tgLogQozjd3LKR9jh6HXHbNqM6d0ov
	 jt2yjNtsw1E99Yy6yr0sWeTqY05ydipRDHiZpgSlBUCIL6Ys+rU1Fo4/XqSf0fICv1R88
	 sv8+vg4yDu19aWn9ocwfZnP8HR5t5iQ8/h72tKqlmoCS3E3RF1RIJTUBiqytChmFJ14u9
	 Kj1I1wFUhF17JR1lserolRMe9SGkGlHA/cNv0MwEGtBr9HuVnZN+7i5REJ+5EEW3Z8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793741097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=griRhT58RktvO7sgJyedxK3XqWlFRaj4fFKAMoaHwtI=;
	b=exMGIjXwT8in13pBYPjrc7D7OX5qbikwfxk/0hK4zkmdlY/6LHTq6g3zoesleYIeKhqc
	 DuzmRX7pyG/Uj3PUNr3JWmyEq6gD71Zm/f85TD4n+bgRRJKr2d2xmfMw08cIxsd33eX6m
	 +ekLWosp8vG3pl4INFRUyCyHbUSojD6uhCXkq/lbiB9c/jhNeq8VrMCkVBJalBPfSyfQ2
	 RFFkP0Kemc0Ihg2k4sidkAiiCs8ftVWdA/mszKf3fzHjJWTXXUNKIiJ5kotyCrAEYfweb
	 FwKBSFozJRqJ8Gn2OIc/eaiFOiICztGkNYhLFTUyFbBQrjSuT2IarhdIwC/6gmSfLSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7XcFa9K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70B6606A31B
	for <linux-next@vger.kernel.org>; Tue,  3 Nov 2026 21:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70B6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7XcFa9K
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1abaaf33a56so2286c88.1
        for <linux-next@vger.kernel.org>; Tue, 03 Nov 2026 13:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793741096; cv=none;
        d=google.com; s=arc-20260327;
        b=fPtwSETtP1D6VPyUzyzvN/zP3rKt/alY4FECXCvQzv3s4jWvR6n54KhtQXC/L1PtdZ
         O8UoNhWrewVMUd7Meoxns+hxVqe6lLTYiqraUmpzCxqGqHAL7Ln1wA8Tfr56ya73H5D9
         Fbl61p93wR0wJGDm5wh4JdEIMvp2eLdpyzwDMrD4xb5KT+5hCkyCBX5/t9IJ6rzCewje
         KGDzN7bw+o/Erxeu+2BsGTD54u/HBwqBFIoCQ/YamACKS88NF0Cke2kE1qlrmimQ2XbH
         r+T3um8pPzvdIU+Bs8C+QeSKP7AMEzRTL1MDIiEpRHKHrmNLGcfQe6g5zxsIHgObheBZ
         8wYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=griRhT58RktvO7sgJyedxK3XqWlFRaj4fFKAMoaHwtI=;
        fh=950RayN/eODURZJj7oT0LYtzKGVHn2u+kzIAWJ6rigI=;
        b=lGUh6Igp3qqtmVcAu523erX2N5yp3ReAsGpTeHhjDisdxZFTbj7RhKdKJ29hbsQsrC
         00FmjlzCZOhd+UpA8Uu+IGf8fnSiWtYGUqxIN/LViXedOx8mlREuz6a+VxNnl3SJMbsy
         lYEh6YGuawgxZHsyZ67dSHI+7teWoHoKFMv55Q7ft7H84P0i1uVKxF1vFzOZg2I9FFta
         o4ZWlFt8Z8N6fNyUkUy4LlO05JhmtMuPCqy7/7Tcob4lcc/l8vQjI87h3wR1Q6CM9mjy
         /4bfEqL3WzGr7IPIWvsBkuKxAVExQLrCNswANLWRkna9DJOKqoG5Qir4/d6uLXxRUd0m
         NkdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793741096; x=1794345896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=griRhT58RktvO7sgJyedxK3XqWlFRaj4fFKAMoaHwtI=;
        b=r7XcFa9Kdmm1MPn+RGwozrZ2uQEzX7+qc6z5vMZHhVeTlhVz/FrPg2qqKIHJv+aVry
         fW2kR5iuAqwOKYv9fY5CAelQBA5ZArViLXt+IeeVXKC+2QGTxtuljWgWs+Jq56QQeyOg
         Z9LWjH0Sx5VpN2POvzUrdgths9r/ixwajSG0GDdwyDUDmEFfbVlyahc/+YFp6tbnKKaQ
         tq6Cs1rA4eyxN/BkylYwpQVH5lxQ7J0uG67Qs53nkkRJAPmhS6AQGqq4cmIjML2TnzdN
         amM/IaCocsm1gH8dLfxVm8dGYX2FVGDMtDqJexBA1iGtlvjZtDftaWTaHg9/EPm7LxSk
         jjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793741096; x=1794345896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=griRhT58RktvO7sgJyedxK3XqWlFRaj4fFKAMoaHwtI=;
        b=n8yIQ7V2+zOrX5VXaPp8L2kBJKdu7Y3Q0yR+HEyPFc3VA4BAmDGK6IcgAcRPDtW4fG
         kBHRkhIHOhX8GblY33XNgVO2ds/Zank5woWT4zjOUTLVpYNqiMiwgZYm+DSU5md5U86u
         igwqsqyfAmHwHGxqurG6qnfF3E+fpy5FCqYmIL49EnvbqnRqH57XhTngbFkgl2xyGgmK
         j41xzKO25B6mXHuxzROt7VVQD7BdhFNXYc6QOdeEjCcRH4Gn3Z67O+KLbfAB/EWldULi
         3Y/o3FXmbEQT+L2Rcqy1J4jy/e6y6Og7e1dqTDiGu1kAWVAz4//NSwGw0Mv763yJnknG
         dxUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCTUe86clU5OfbaxWx86s1WH+LpP8FNM8F9YWWYgbmJvEdnkthJpXrbQawbmFmE6DEwS02jhFQmkwM@vger.kernel.org
X-Gm-Message-State: APuU4Z+cY5iTTIvODf3Lf5lkZBCWc8FrCrCukqQc1ZklNKEx0XvKQli2
	e7kbKsK9SKYnGnp13uE2J7Ky+yqIC81bsk775/XYabPgxYR+OiQCdc3ukMssMCeL590hAnmUUbr
	40/urUvRKYVCZ7lwzFRbtH70t6sKNpXg=
X-Gm-Gg: AYBFou3Yk22VV1nJUzQ2r/xHiIewslzLmWPqazqLoKmAofzsRQyoTlsC/yG5S5Ch9T/
	tUDOMk4ZULp/dhpEPN4wUHjacna/51T7HDqDKNh30K7yiXLaFXdu1sW+gn9J9Ak2wu9smn88+ZU
	PbDkyFXKNccnxhozfglDoBPjTlsNcdIkGvFRyl0fkxaoNpaALAmSJF94dyk/77VA4BADYmVZ6+s
	PsYcdJaeVTAetrkk8KAihdZqySJvo5XLiPcRGCwF5q20bOrwJS554J3Yr3VU817AQXm0ZI02fS6
	CQDo1hXA0p/civ9rs9wAk7Z5OCSe7k8JkIH4YbmngT2xwViiSXwnU+IPrgvmGWwgSvvQssRSQ4c
	QaPjQKHyRrhaqBg39wq9UP2rz9hXmr8J02uyDG9M++jHX4TTIaUjhmzGk8T0YoSMaws/BE3ufcx
	p8p1I7lN+byN+dzdOPsZWZf18=
X-Received: by 2002:a05:701b:418d:10b0:190:e602:c769 with SMTP id
 a92af1059eb24-1ac59143aeamr34394038c88.1.1793741095721; Tue, 03 Nov 2026
 13:24:55 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aujZcJBUyQ7iX_PM@intel.com> <CADnq5_M5SjooHDGt3T=69mTqYW0rjwM25Y8r9dgi8gDJEWYt7A@mail.gmail.com>
 <aupFpMdhZD7vcP0b@intel.com>
In-Reply-To: <aupFpMdhZD7vcP0b@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 3 Nov 2026 16:24:42 -0500
X-Gm-Features: AclHuK8C6NStvAz1dQJfq2azB7y9C2eQ418Bin_47lR5VnRJH3htDrx2QjporTI
Message-ID: <CADnq5_MNaSCYhkQ0LMLyObVHZidaEC_J2BD=GG0tKbsmvwC2+g@mail.gmail.com>
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

On Tue, Nov 3, 2026 at 3:35=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.com=
> wrote:
>
> On Mon, Nov 02, 2026 at 06:07:15PM -0500, Alex Deucher wrote:
> > On Mon, Nov 2, 2026 at 1:51=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel=
.com> wrote:
> > >
> > > Hi folks,
> > >
> > > We'd like to replace most of the DRM trees in linux-next with a singl=
e
> > > branch:
> > >
> > >   https://gitlab.freedesktop.org/drm/tip.git#drm-for-linux-next
> > >
> > > It replaces these entries:
> > >
> > >   drm/drm-next, drm/drm-fixes
> > >   drm-misc/for-linux-next, drm-misc/for-linux-next-fixes
> > >   drm-intel/for-linux-next, drm-intel/for-linux-next-fixes
> > >   drm-xe/drm-xe-next
> > >   drm-rust/for-linux-next, drm-rust/for-linux-next-fixes
> > >   amdgpu (agd5f/linux.git#drm-next)
> > >
> > > drm-exynos, drm-msm, drm-msm-fixes, drm-msm-lumag, drm-nova and etnav=
iv
> > > are not part of it and stay as they are.
> > >
> > > The main reason is to reduce the conflict pain that Mark constantly f=
aces.
> > > All of them should be handled already when we are rebuilding drm-tip.
> > >
> > > During this work, I realized that drm-xe is a big culprit for leaking
> > > future work without a blackout date from -rc6 to <next>-rc1.
> > > So, another quick solution would be to get a drm-xe for-linux-next li=
ke
> > > the other domains are doing. However, I still believe that this unifi=
ed
> > > one will make Mark's life much easier anyway.
> > >
> > > The unified branch is rebuilt by dim together with drm-tip. It has al=
l the DRM
> > > -fixes, drm-next, -next-fixes and driver -next branches merged, with
> > > the conflicts between them already resolved on our side. From -rc6
> > > until -rc1 (per Linus' tree) the driver -next branches are left out, =
so
> > > nothing for the following merge window lands early.
> > >
> > > It contains the DRM fixes too, so it would go where "drm" is today.
> > >
> > > During the past weeks I have confirmed that the drm blackout period
> > > works well on this new branch.
> > >
> > > The dim changes:
> > >
> > >   d875049d2b29 dim: build a unified drm-for-linux-next branch
> > >   3009867cd318 dim: keep -next branches out of drm-for-linux-next dur=
ing the freeze
> > >   https://gitlab.freedesktop.org/drm/maintainer-tools/-/commits/maste=
r
> > >
> > > AMD:
> > > Alex, Christian: linux-next takes amdgpu from
> > > agd5f/linux.git#drm-next today, which differs from drm-amdgpu-next in
> > > drm-tip. Is drm-amdgpu-next fine for linux-next?
> >
> > They should be the same.  I just mirror drm-amdgpu-next to
> > agd5f/linux.git#drm-next in case anyone is still looking there.
>
> That's fine. But please let us know your thoughts on either going with
> this approach proposed here or with the other approach proposed by
> Danilo, where we in xe and you would need to create a for-linux-next
> and for-linux-next-fixes.
>
> Both xe and amd are leaking next.next patches into linux-next right now.
> And we definitely need to stop that.

I'm not quite sure I understand what you are proposing.  Is the idea
that there would effectively be one drm-next composed from all of the
constituent drm-next or drm-next-fixes trees (depending whether we are
in or out of the blackout period) and that is what higher level -next
trees would integrate?  Isn't that what -next-fixes is supposed to be?
 Maybe we just need better documentation for the upstream -next
maintainers?  Maybe the actual vendor -next branches should just be
renamed to something like vendor-dev and then during the blackout
period vendor-next points to vendor-next-fixes and then after that
vendor-next points to vendor-dev.

Alex

>
> Thanks,
> Rodrigo.
>
> >
> > Alex
> >
> > >
> > > All other maintainers, please ack if you are okay with this approach.
> > >
> > > Mark, you're in Cc for visibility only. Once we have all the acks, I'=
ll
> > > send you the formal request. After linux-next switches, we stop
> > > updating the old for-linux-next* branches (patch below).
> > >
> > > Thanks,
> > > Rodrigo.
> > >
> > > ---
> > > dim: stop updating the per-repo for-linux-next branches
> > >
> > > linux-next now pulls the unified drm-for-linux-next branch instead.
> > >
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  dim | 53 -----------------------------------------------------
> > >  1 file changed, 53 deletions(-)
> > >
> > > diff --git a/dim b/dim
> > > index e3f616b..b3ed8f7 100755
> > > --- a/dim
> > > +++ b/dim
> > > @@ -658,52 +658,6 @@ function dim_range_diff
> > >         fi
> > >  }
> > >
> > > -# update for-linux-next* branches
> > > -function update_linux_next # branch next next-fixes fixes [for-linux=
-next] [for-linux-next-fixes]
> > > -{
> > > -       local branch linux_next linux_next_fixes linux_fixes for_linu=
x_next for_linux_next_fixes repo remote
> > > -
> > > -       cd $DIM_PREFIX/drm-tip
> > > -       branch=3D$1
> > > -       linux_next=3D$2
> > > -       linux_next_fixes=3D$3
> > > -       linux_fixes=3D$4
> > > -       for_linux_next=3D${5:-for-linux-next}
> > > -       for_linux_next_fixes=3D${6:-for-linux-next-fixes}
> > > -
> > > -       repo=3D$(branch_to_repo $branch)
> > > -
> > > -       if [[ $repo !=3D $(branch_to_repo $linux_next) ]] ; then
> > > -               return
> > > -       fi
> > > -
> > > -       remote=3D$(repo_to_remote $repo)
> > > -
> > > -       git_fetch_helper $remote
> > > -
> > > -       if [ -n "$for_linux_next_fixes" ] ; then
> > > -               echo -n "Pushing $linux_fixes to $for_linux_next_fixe=
s... "
> > > -               git_push $remote +$remote/$linux_fixes:$for_linux_nex=
t_fixes
> > > -               echo "$DONE_OR_SKIP"
> > > -       fi
> > > -
> > > -       if git merge-base --is-ancestor $remote/$linux_next_fixes $re=
mote/$linux_fixes ; then
> > > -               # -fixes has caught up to dinf, i.e. we're out of the=
 merge
> > > -               # window. Push the next queue.
> > > -               echo -n "Out of merge window. Pushing $linux_next to =
$for_linux_next... "
> > > -               git_push $remote +$remote/$linux_next:$for_linux_next
> > > -               echo "$DONE_OR_SKIP"
> > > -       else
> > > -               # dinf is ahead of -fixes, i.e. drm-next has already =
closed for
> > > -               # the next merge window and we've started to gather n=
ew fixes
> > > -               # for the current -next cycle. Push dinf
> > > -
> > > -               echo -n "Pushing $linux_next_fixes to $for_linux_next=
... "
> > > -               git_push $remote +$remote/$linux_next_fixes:$for_linu=
x_next
> > > -               echo "$DONE_OR_SKIP"
> > > -       fi
> > > -}
> > > -
> > >  function check_conflicts # tree
> > >  {
> > >         if git diff | grep -q '\(<<<<<<<\|=3D=3D=3D=3D=3D=3D=3D\|>>>>=
>>>\||||||||\)' ; then
> > > @@ -1192,13 +1146,6 @@ function dim_push_branch
> > >
> > >         git_push $remote $branch "$@"
> > >
> > > -       update_linux_next $branch drm-intel-next drm-intel-next-fixes=
 drm-intel-fixes
> > > -       update_linux_next $branch drm-intel-gt-next drm-intel-next-fi=
xes drm-intel-fixes \
> > > -               for-linux-next-gt "" # no for-linux-next-gt-fixes for=
 now
> > > -       update_linux_next $branch drm-misc-next drm-misc-next-fixes d=
rm-misc-fixes
> > > -       update_linux_next $branch drm-rust-next drm-rust-next-fixes d=
rm-rust-fixes
> > > -       update_linux_next $branch drm-amd-next drm-amd-next-fixes drm=
-amd-fixes
> > > -
> > >         dim_rebuild_tip
> > >  }
> > >
