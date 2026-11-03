Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793740765;
	b=JRGmFkFDKcGt2DK9M0VcjQCUCjmdr+Mt/XbW6QEZ/luq+SxPoxVwUlaWbhObKzT5pArN
	 bIIp/hoIpzr+eoP927PpcjPH+DHT7y84XJBkLE3E1huTqpx9x3FbNv651eufhHNajvdFc
	 H/LQAxFacgv7syegQpGFpMaP7Ih5Uis3LVC22e2+SiW901vJqz6ukvqQO9KkDrcE1b9KT
	 A6V2RVm5CUEI2OI6jVsRIVgIbW08WTGwXESVJzNKV4cGRdrDbIscro9EVpD2c/pX+Rxwn
	 ENGTHnH2I6eWKJLDS+0vs7/x5B/dQqufgoxeVMUb+vZxRpvXBWx6KeeVJVxcU05qDxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wBE5bGZhedA//s+lBFPy7kHAF2qFFj2zWvXQd1T2OZc=;
	b=bsoeJbMtyucroq3vpvlc5mLkvmzwNo1gjurkUqqmCZmW7fDprBfV2NQWlfT1eZJ75u3y
	 VhQF0LXcViV0wSSsE8908zHjQzFgJoDqSk2zaeLavleN09lM5lpd9d7upd19Slp4Qo5qv
	 9PMzyKd+S10eD8oAtsGlnpbfbrrbNKuGA/MInU0Zp9899bjJy5d9QfLjkeH1VuSb1/FeH
	 C5BGldxyVJZDN2vahNuexEEs42llaL2EyZucFlZNVQypr5fm7xvWmJxBLLeqwwdoODNnK
	 eqc10kMItR1Hbw5SHrey6Bw7zINYiT/DdUCwRBX4gZ2IjUjIVSTWRipheaFUuYvp9rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ltjOyfP1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5779606A324
	for <linux-next@vger.kernel.org>; Tue,  3 Nov 2026 21:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5779606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ltjOyfP1
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-89d3a4c9fe6so11149b3a.1
        for <linux-next@vger.kernel.org>; Tue, 03 Nov 2026 13:19:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793740764; cv=none;
        d=google.com; s=arc-20260327;
        b=ePylh3HgTjZAxtwc0nqAwym+1Nwvf43WBU9HfgDg5tMGiqGb7uHigPxv+2ucBs1PYZ
         tG8T751xvybVM8lnBNnjTdR+66nmwvQNJ/FsCLNUM1wMFYJpb+RcQCw9XaQKwo48mbCt
         WzAAd36nWCokvY1Gx88e9YZbrb8C6UPAViywoIb6X7KqqVii1ll6xkOOh85fl4nnmy/Q
         kXanzVNRxUmImhbCwihslDS+ucCS8kbp+4kG7oi/d+FMSAxvAmwWpuO2W/7FoP9IsLX1
         UhE8hWzBk6NwRglU3ogvdIgcgTaruHxkQg7ZrDI55jooW0m95VEuTqWTcJ4ruq2wRTbl
         ySsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wBE5bGZhedA//s+lBFPy7kHAF2qFFj2zWvXQd1T2OZc=;
        fh=XOiixlClAmoHhd3fjAE67uYdD1THWOKadddZiFY805Q=;
        b=RowwlN/SDgw6oKNyexNunKf58W5hWaXCzPAAwgPfHaVRiPVABHW5AlUlUHnE/N/7cl
         zGop/fVsFthXWd046XELzcAzO0Duvb8Y45dhAMrwX6yxVOEeC9mDp5a8cDnW9KAAjVBn
         0NwQI8DyZQ17dFyDQqr2UxO1fk+Kpv5bW0JNyAzdGidZUIPc96p88mF6LgKi1nUB6WJi
         tvNppYgNUTHasDR17xjCm5zhgdQQE00lBGJS3fQbx2wH262xJDnUlbIgsiaqmip7ImvT
         ifycexSSof+xewkg/j87vFGNvdhiYkiQo7LvnTOQyDy9dhapjTju6WMTOgrotwt2H+l0
         N9zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793740764; x=1794345564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wBE5bGZhedA//s+lBFPy7kHAF2qFFj2zWvXQd1T2OZc=;
        b=ltjOyfP1mkJVCeiKj4bLuRJF2VRQLa2RZsdMSkkaDdIEkOsnyqwSKaSYQnSqkKeOT1
         Z0lNujaHaUSMvBLBsehI5g00ommuhmAsZPbF04DV8qHeu6BxVlwGvfNY2f+d31//mqRd
         MPXoVZIF0+/16GcSzqV0EMpPg78exPDuZRiqUbnoMdKR1OxOREJ4Nivr14ufRa8Catft
         Hqmi83xurGdeErJD7LU7ZZkUM3AEdr+w10S8pQsW8VbSTF7L80kGtw9S+7h7Mp/ZuCEX
         zeC0kKUPS9A8z1W2LAzR3NZhgl4hLzOo8DRlszGX076AbumMnMyxs/D/8IUBPgvhYhqE
         LNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740764; x=1794345564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBE5bGZhedA//s+lBFPy7kHAF2qFFj2zWvXQd1T2OZc=;
        b=Yb6ohICOk7eFURi3yUacd2LEZb1XQaHeuuMO0+uFIRBqARlQj3SfDqNuNr09mWVZAC
         zY5QZsLSW7ZQdQ8iFWm4OyM0ZZRJTjPyeWvLda/yNDd17fp9WFbJ0yGbyDFc71LpB21/
         dFqLUSpj6n4yqKDxu5auG182KnmUxBex3qUCU1sJsZFi0GbGV3I6T5CcGsgQDi0ZbOyn
         zfhJhKGZmgj3J94eqZqTlj0BTvVXDubpMignUBHlEo8opfwHBhrTDiOOU80TEw/1t+d1
         ekI2Do8YZy/HfcF1Inr235Y4ZxbwTJl82OnBD7qtMFFwTKYgtDphKem/TTNpAf/2SehA
         9XSA==
X-Forwarded-Encrypted: i=1; AKwUvByQcfU6OHFWBV/8ueC3dA04UnGBUWt3rXRmZnLEG3fnsuOpCTD967EnH1ZXzy7W/tszv7r9Z6528qea@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sp/SPa8e9MOEYmk0PQ3FJE5+jWasJKuoPmwOZsoQ4Bq7XvNhd
	OPqp+g2GqepRcdYNwUg0AQh7OTbPPVSUhd57iigGf/n7FyjD5UNP6xclY1535X7Q/mbfwQQKKt8
	qHgwmOlvf7InfLn4ZaAgjO49I6UrmIE4=
X-Gm-Gg: AYBFou1D0hGgg1z1nZEjdvDH8EHA7aon4JrE9w84XSThy/GAiO5SYi/XO1ikWOGurJV
	1kvHy/Pvoj3JUKToRKinyGz5bO1vc+Rdxw3alMPq8IRPc/xKBxaZejwVhclWfnU5R8lOFMETB0L
	yEJfTQsa/TcSYhWb3unebLapyYhX3wZlpmRTlhys7A+8mZLcE88zLRTavk+kS6jNV/zfHdTtdso
	ZygBPXkAL+FmlGaSf2THtlI/XhuBAgMbNWVB5zrVi2iddgM8LOq4nFeDL4d63kenIyisATt2iQW
	YwNsQSER/PuoHciUuuHXOXQtxwhH9RDrjhoL8ZyaDwvr/PddFzdz4czwV6g8Kp+tsrZcM61iJpn
	QgmfCLitD5en5g2UD/T7yqsbHYITzLs6hxvenVNm9r+VU8W6rwc9axt92CNcZ+xti9SKNqxRY83
	8Imfwjd+NIHTv4tuetqX/caTs=
X-Received: by 2002:a17:903:388b:b0:2e9:5714:607a with SMTP id
 d9443c01a7336-2eb3641d0edmr226893925ad.2.1793740763907; Tue, 03 Nov 2026
 13:19:23 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aujZcJBUyQ7iX_PM@intel.com> <DMKY979I29AF.BS1DF5YAZMOY@kernel.org>
 <aujikV14tF6K1Xqw@intel.com> <DMKZR0YZV1CX.DWVK9V47GR1J@kernel.org>
 <CAPM=9tww=CJdxzvfUvLwQ6V4uoszg8JrB1XCAcp15upM-xPvSg@mail.gmail.com>
 <DMLTRKUXTL3P.11VRVU1A8ERMG@kernel.org> <aupFKGpAwAiGXN0U@intel.com> <DMLVPRO7XF7F.21199FO61MFRD@kernel.org>
In-Reply-To: <DMLVPRO7XF7F.21199FO61MFRD@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 3 Nov 2026 16:19:11 -0500
X-Gm-Features: AclHuK-QY53_MeeAsq2_7VWuOuBtQ5OHeIVET2v1xKAgr_M7JWpMcXTZioJWzRk
Message-ID: <CADnq5_N-6_T8EnihjoTSqpHGb_mZPogi6z=Ti-7_oue5d07oTw@mail.gmail.com>
Subject: Re: [RFC] linux-next: replace the DRM trees with a single drm-for-linux-next
To: Danilo Krummrich <dakr@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>, 
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

On Tue, Nov 3, 2026 at 4:11=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Tue Nov 3, 2026 at 9:33 PM CET, Rodrigo Vivi wrote:
> > On Tue, Nov 03, 2026 at 08:32:48PM +0100, Danilo Krummrich wrote:
> >> IOW, linux-next merges tip/for-linux-next, and tip/for-linux-next merg=
es
> >> $tree/for-linux-next, rather than $tree/$tree-next.
> >
> > For this to work we need:
> > 1. xe to create for-linux-next for-linux-next-fixes
> > 2. amd to create for-linux-next for-linux-next-fixes
>
> Huh, I thought all the trees are doing this already. Well, that explains
> where the the problem comes from. :)
>
> In any case, drm-misc, drm-rust and drm-intel already have for-linux-next=
 and
> for-linux-next-fixes, and the implementation is generic. So, adding it to=
 xe and
> amd is trivial.

I've started doing this for amdgpu this cycle as well, but I still
pushed an amdgpu-next branch as well since that is the source of all
of the cherry-picks for -fixes and -next-fixes.

Alex

>
> > 3. All maintainers to agree to move their -next-fixes on the same day t=
hat
> > they are sending the last PR. Or have a new dim sub-command dim final-p=
r
>
> That's what drm-misc, drm-rust and drm-intel promise, yes.
>
> Something like dim request-pull --final seems like a reasonable helper to=
 me.
>
> > 4. Instrument dim to have this secondary reconstructed tree instead of =
the
> > implemented chop.
>
> I think for this part isn't different; tip/for-linux-next just merges one=
 or the
> other.
>
> > 5. Prepare every committer to deal with this extra build time and extra
> > conflict resolution.
>
> Which extra build time and conflict resolution? You have two tip trees in=
 either
> case, no? One that contains $tree/$tree-next and one that doesn't.
>
> > I honestly prefer the simple chop solution. But it would be okay by me
> > if you take the lead and implement the dim changes for this flow.
>
> I don't mind doing this. :)
>
> >> I.e. the ultimate source of what is linux-next material remains to be =
$tree.
> >>
> >> In general, I think that this is more accurate and probably less error=
 prone
> >
> > I would argue the other way around.
> >
> > The reason that we are seeing so much escapes from next-next into linux=
-next
> > might be exactly by the fact that the blackout right now depends on 2 s=
eparate
> > actions to help simultaneously (last PR + rebase of -next-fixes). What =
most
> > of us are not doing.
>
> Interesting, why is that? It seems to work perfectly fine in drm-misc, dr=
m-rust
> and drm-intel.
>
> The only thing maintainers need to do is push $tree-next to $tree-next-fi=
xes at
> the cutoff. The rest is automatically handled by dim already.
>
> >> For instance, let's say a tree closes (i.e. tags the last -next tag of=
 the
> >> cycle) a few days before -rc6, it could happen that subsequent commits=
 to
> >> $tree-next still appear in linux-next because tip still picks them up =
until
> >> after -rc6. So, after -rc6 those commits (that were in linux-next for =
a few
> >> days) would disappear from linux-next again.
> >>
> >> Not that big of a deal, but technically they didn't even belong in lin=
ux-next
> >> for only a few days.
> >
> > But well, this is a good catch and a bug on the current proposal indeed=
.
> > Should we move that to -rc5 to -rc1? We just need to ensure that everyo=
ne
> > have at least 1 PR after -rc5 and we are all aligned.
> >
> > The only caveat is that patches landing in drivers-next during -rc5/-rc=
6 will
> > take a few days more to propagate, but it shouldn't be the end of the w=
orld.
> > It is still a couple weeks before the merge-window.
> >
> >>
> >> If we kept $tree/for-linux-next, tip would never pick those commits up=
, because
> >> a tree that closed a few days before -rc6 would already have switched
> >> $tree/for-linux-next to $tree/$tree-next-fixes.
> >
> > Well, if you don't move your -next-fixes at the same time of your last =
PR
> > you are leaking that as well. And this is happening.
>
> Where is this happening?
>
> > At least now we know why it is happening (besides xe and amd sending
> > straight from -next instead of having the -for-linux-next branches).
>
> I think if xe and amd would have those branches there'd not be a problem =
to
> begin with.
>
> But independent of that, I think it is nice to give the "fully merge conf=
lict
> resolved thing" to Mark. :)
