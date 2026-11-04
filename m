Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793762960;
	b=N1p3+sC5a5QB3FHUKOvKBHOhbDwieJgSAE3w2qiISuOiKlfNb7mVM1RmYLLNxP7lhmm1
	 Ti2G+Jpi7TGl9fpsQqu1DN4N4mf5+dQe+zZ3lrLOhbbMkbqBVGcb52lTohIE0EfCGYb8A
	 4ZYOERnoN8oOkDTYeS/YJjnDnhXkSUncSMmsE28fgdm10w8ZBpOA5x3PtvyeTUBL9maps
	 1P4sNR1jQfNtQLAzULQ2K1w3DINb7n6SfpJiyv5AAvuMOaoglT4kVFusBeATPVz1LOJaB
	 UGJ7Cm9AUFMvpAoGh7QBppZCrETHozsR5VSViRYaLcMLCMNWPfN3iFdrm+3CSlaW7ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oO978g2g+ySozYrr4RRVibDsnm8jDdPaT+WiTnU9rNQ=;
	b=F+g+uyXHtHTqvzyIJW+xjUU3cy4j/dI1CSnw2P2rsI3OdxjoW12V5EAM5v0+pG6tTt4G
	 EPyBnoiL2Np+aDtGtScVcRbye+AB0x8dqeTLptZmjZg+wrjFtp9WFSkoZsvSmiidjju7f
	 t0l+Z6LFcsBS8lgYi0u9h1SZSl61NWTJJYbvfj2CF9+5miPj1FkcKTRXkWa2CYGvZ7AZM
	 DbOiu661UYpu598+YTLhFpmxb5B9ue5N2bKTnU7wxk+wW7zxnNKCt8ilWJxNIh0arGla3
	 pw9H3Q2C/q9+rHkV5Qvanf4NZQIRdsMrQLpe+HdNT5ozzNBjEu65hYBrLuJDPwSZNJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itcGKno5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B809C606A31B
	for <linux-next@vger.kernel.org>; Wed,  4 Nov 2026 03:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B809C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itcGKno5
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53bb57f1310so2194571cf.2
        for <linux-next@vger.kernel.org>; Tue, 03 Nov 2026 19:29:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793762958; cv=none;
        d=google.com; s=arc-20260327;
        b=CGbuym+3x8B8dAY1fFGJ4VT/0fErVSkLegaDuQXDod5Erv52bRGS9qzZOUxNScqq5B
         +ymMd0Qy7EdGy6VBJC/JyVxWHi5pQZkDv5delhHm2SRjW18VRGyl2mnIcorQVwO9qGw+
         eGBxHSEq209mXRme4FLVaUuSOLo/u3d+kce3n0K+8oKfTzFXL9yqcRXyFeVtj5H6RkYg
         oXcG7f5ATa8XpKNHz4kmh0YNRDI/4oh905eQMu9c43qmAJ23uT6/OaQSlZusfs8os3PY
         y4aCQUHp81Y0Ux3ziL5RAF5eA6KBLiRM02lwGNmHLektuz2HdNPxIdlWKsavpzu1gb6g
         E/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oO978g2g+ySozYrr4RRVibDsnm8jDdPaT+WiTnU9rNQ=;
        fh=qADRbFo/cn2MPc1C4d6izqglc5f7qINibPUSdqrWNO8=;
        b=rRtVQXZl4yMEAexTfNGGgQN93YS3tyU1fPrXG0SKsA1Bmk7ej3wM9oeZcD3SSto09r
         R8G4bZ7bM7vCDcE3ivGfDwLmK4Z76ryIIn0QIXu1HOXwhul0umhtBrffmYL/SJ1u/kAF
         m7wPtY6BZyKjnyjpDZTk54VlUkX3UF4X2UE3bKgiqQGN2CfT1fkNmZ7sEmEiwJiSMpSY
         jj5nsHJ6084Hnld2UePnpD/28vIUN+n8F2Mv7WXhHC0T71t5HQlRulO8uj15o4fd1bge
         hDi5YQwsGh0uJ9mfG8g8OCETWjP8f/bRkVdltXVkM49/ZO0JemasJ2iO/MlzyHYwMS0C
         0qPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793762958; x=1794367758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oO978g2g+ySozYrr4RRVibDsnm8jDdPaT+WiTnU9rNQ=;
        b=itcGKno5RinUMMaSiczim1+QNqk1bKYzlmX9ASdzqQNkNonGVFqpuuRp8hoFyF93v0
         g+YsFMIb0Efqv8MT3aWMcgiPotKqPXJKttGJF9ARYRPMGxY5P8HUrFNG+NEnSCQvZHcz
         pmOwYfmMqQLE7L/HEOA/73BCZHd6WvBCaZQkFElPOkOQMhA7qLdXRdCEna+B+x7jljH8
         TPBcdF1gq+LT016lJUstuCdEfx7YT27mEUTvwez8ik/2DZCFW/K/+VBguxx6l/9lqSKA
         HUEI6a8uY8JCxJcRZd/uPUhB5+qi0kgKPcIgFxLDoaU21sndqHxR5ck5KdVYe8CwF+Od
         VrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793762958; x=1794367758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oO978g2g+ySozYrr4RRVibDsnm8jDdPaT+WiTnU9rNQ=;
        b=sOLe/ffzpPTttJW6U+ZIwblAOmZ0fE4HB2nRYKozMHRkLli/cNI3QDZihYOrPJTo/o
         xQhIqn8dJyzniZFoxoInSzaaObtx6SoQjqL6wdoUo6STVrZb6wD87lHqeuYqpcALVhFq
         RmzAy21w04G/iAEtXpIok4W8Q6KVioMzH2X9rQy4Dv5ofzhq7/9E6laxohF8V0aninzO
         pXmbxHOVGtry1sNrfprposnmfiVhDDJqc61lS3uICi8Ix9VQCba874zFuccvkUy+0RcY
         m+VILZs2Uf6iPDvhP7xV1bM0oP1D3kBuor37lDPgpVQpQxFytG+rMG3J6AHt4X3hVSC7
         AU5Q==
X-Forwarded-Encrypted: i=1; AKwUvBy81Vph1ibsHfCqjNKZqnmkXa0wEBiZJgqAwcI+JqGqKgyg43ivruqqOMNU00bn8icsh9MWVa0ofIIQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/ItR1f2hrdlfwHYofaDv16WdIvtIz685cEcTqc5h+NHcrAS88e
	E/1nkSgWQ/QfodPnPfuxDGV9ZIW5w3aWxrwNh/Kgvli/Gh6WCC+qBuq6xVA11JKGHMaEmvT5OMk
	tXmI9qVzM3hoH8mxmlgjfPac3t2AmxHo=
X-Gm-Gg: AYBFou3BrFpVKzBmq58Z5RBq+LLWLQhbNy2bpSfJfjMz3saQqvdfPX21VwKHgwWEUvq
	v2SjfFcEVDx1tpE0CZmck/7br03QlSCJdO5kbrdopy9GOW/VTHV7/KfIXgAgctHyB8j+6EIItiU
	07ayRaPpTFueLdULzmb88ESf0iLxJVmxm5c4Y0Lj0R3mjVcxsYnnNNgoH9CRIdeAfWZRMScf8S0
	6xRR99IKZ/rXEblLtklvmNWMMfGC3vX46YQubWERwg7oYJGbguPRgh0IaZbiqhkEjLne7Aplocj
	euv/KRGk2jU71PXyUsWi/RtsKjrrDJ4hiOOu+ylwTiKegtlm63l8IWT7P9xfMC8++eRIknidzfA
	t0nsnGGlV0b0bVWlFJiID4iK2fBY2TcmvM9p3F2oJr1cBsrTHKpsh/Ex2mhvlA40e4KRj/IgRP0
	xihavH10J3mlDukmK8/Z4OdpxWA5grpJS1sD5Xi1516Fw=
X-Received: by 2002:a05:622a:5c19:b0:537:af9c:1538 with SMTP id
 d75a77b69052e-542b82fa290mr253528921cf.69.1793762958622; Tue, 03 Nov 2026
 19:29:18 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <DMKY979I29AF.BS1DF5YAZMOY@kernel.org> <aujikV14tF6K1Xqw@intel.com>
 <DMKZR0YZV1CX.DWVK9V47GR1J@kernel.org> <CAPM=9tww=CJdxzvfUvLwQ6V4uoszg8JrB1XCAcp15upM-xPvSg@mail.gmail.com>
 <DMLTRKUXTL3P.11VRVU1A8ERMG@kernel.org> <aupFKGpAwAiGXN0U@intel.com>
 <DMLVPRO7XF7F.21199FO61MFRD@kernel.org> <CADnq5_N-6_T8EnihjoTSqpHGb_mZPogi6z=Ti-7_oue5d07oTw@mail.gmail.com>
 <aupktBCwcN_coHEH@intel.com> <DMLY7GDT8VBO.EE1P01ZX2HPK@kernel.org> <auqaZdocMvOIxN1c@intel.com>
In-Reply-To: <auqaZdocMvOIxN1c@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Nov 2026 13:29:06 +1000
X-Gm-Features: AclHuK9drYAacddhbXIiBI0dBhlm-N2TmBWV6CewNw1USTlKHw4AiMKzH5-lPpk
Message-ID: <CAPM=9tzu6MYQ-Y0iYK=2PLiM5=1BsEN+Q5WnmYh=hkKnLJ4b1Q@mail.gmail.com>
Subject: Re: [RFC] linux-next: replace the DRM trees with a single drm-for-linux-next
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alex Deucher <alexdeucher@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Nov 2026 at 12:37, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Wed, Nov 04, 2026 at 12:01:36AM +0100, Danilo Krummrich wrote:
> > On Tue Nov 3, 2026 at 11:48 PM CET, Rodrigo Vivi wrote:
> > > On Tue, Nov 03, 2026 at 04:19:11PM -0500, Alex Deucher wrote:
> > >> On Tue, Nov 3, 2026 at 4:11=E2=80=AFPM Danilo Krummrich <dakr@kernel=
.org> wrote:
> > >> >
> > >> > On Tue Nov 3, 2026 at 9:33 PM CET, Rodrigo Vivi wrote:
> > >> > > On Tue, Nov 03, 2026 at 08:32:48PM +0100, Danilo Krummrich wrote=
:
> > >> > >> IOW, linux-next merges tip/for-linux-next, and tip/for-linux-ne=
xt merges
> > >> > >> $tree/for-linux-next, rather than $tree/$tree-next.
> > >> > >
> > >> > > For this to work we need:
> > >> > > 1. xe to create for-linux-next for-linux-next-fixes
> > >> > > 2. amd to create for-linux-next for-linux-next-fixes
> > >> >
> > >> > Huh, I thought all the trees are doing this already. Well, that ex=
plains
> > >> > where the the problem comes from. :)
> > >> >
> > >> > In any case, drm-misc, drm-rust and drm-intel already have for-lin=
ux-next and
> > >> > for-linux-next-fixes, and the implementation is generic. So, addin=
g it to xe and
> > >> > amd is trivial.
> > >>
> > >> I've started doing this for amdgpu this cycle as well, but I still
> > >> pushed an amdgpu-next branch as well since that is the source of all
> > >> of the cherry-picks for -fixes and -next-fixes.
> > >
> > > But it only works if you stop this branch of updating after you sent =
your last
> > > -PR and from that point and on you merge or cherry-pick-from your -ne=
xt-fixes.
> > > Otherwise you are sending next.next material to -linux-next.
> > > And this is the current issue Mark is raising to us for a while.
> > >
> > > We have 2 proposals on the table:
> > > 1. (this RFC): a global unified drm-for-linux-next that is a chop-poi=
nt while
> > >    drm-tip is getting constructed.
> > >    If we go with this option you don't need to do anything, but stop =
maintaining
> > >    your for-linux-next.
> > > 2. (Danilo's proposal): Each driver/domain keep their for-intel-next =
and
> > >    for-intel-next-fixes for granular control of the blackout weeks
> > >    and dim merge them together into a drm-for-linux-next
> > >    If we go with this you need to at least ensure that your for-linux=
-next
> > >    doesn't contain next.next material during our blackout periods.
> >
> > dim already does that, fully automatically, it checks:
>
> right, but like xe, they don't have this for-linux-next setup with dim ta=
king
> care. So they do need to take some action.
>
> >
> >       git merge-base --is-ancestor $remote/$linux_next_fixes $remote/$l=
inux_fixes
> >
> > which means:
> >
> > - If -next-fixes is an ancestor of (or equal to) -fixes: feed for-linux=
-next
> >   from -next. This means -fixes has caught up with all of -next-fixes.
> >
> > - Otherwise: feed it from -next-fixes, which contains changes that have=
n=E2=80=99t
> >   reached -fixes.
> >
> > The only think maintainers need to do is push $tree-next-fixes to catch=
 up with
> > $tree-next, which they need to do anyways.
> >
> > IMO, this is more robust than relying on all maintainers freezing $tree=
-next at
> > exactly one global cutoff.
>
> This is the part that I disagree most. In my proposal, maintainers need t=
o do
> absolutely nothing. The freezing is already guaranteed by our rules.

Yes this is the thing I like, while I like maintainers having freedom,
relying on them to do something manually every release at the same
time doesn't seem to scale so well.

If we can't have the tool enforce what we send to -next after -rc6
then it's going to have gaps.

Dave.
