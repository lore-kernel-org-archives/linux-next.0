Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112409;
	b=HYJlP4c27HvRNB+F4+Jf7ITeSmXI8AKxu57sPe3+KLCna+bie1WNlWwR0zODmMFwcT97
	 +Gi+DVx7J+LECC6AnQxU3hxbkQguzbHqFp/cwAXV82EAM+qIPzwqz3I+UBoQ7sVpMVhnj
	 eBmP0oIIerhoCVjrB7pWg5iodjT+dbB6C+gzKCbuNDeRKHrV2qH383pGxE+/BYAXprNrG
	 CxjAW7bKF2DB/nMgxwhOG4DR/i2hIQnX7ttut2UpEjabvl5FjoF5n0CkJgFxxwOcjpYRe
	 onPAXpy9HeA/mduNmQRPrEw4TAaDPUZmdKqU686LK6EY/lpA0goOUAPScnFuQuBUr3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=i5hy4P4exgctsWNbL/FQFw8EeR2kORRjAFNQsoHveUE=;
	b=EIJzuaAA1kUiJtHbFK9pmL/gi0yQUins88GAxcXyUgLnjeAmP2tGPTxc3/3plOtTW/vd
	 /O2amgHCVuHSjgeAIChgpq1vle82EEL+jOpEnZc9bnSK7bdEWF7CQyfYeksI13HgJyTTv
	 ryzwI0kX+0Q8/aMcK/1d/V4Cuopt/KjXaOXVn53KZVCv2tDubkdZrJnSmsNli/nxZip1O
	 ydK5znRKz+Oal/+0C1REDwFZFp27DSmh7luKitIku16y9sz2yDy9TrPCkPZlHNCuIxuf+
	 i2ThcWVyP1otk/B0zn7cXiSTK1imGIWhaflJs+HxJGd+CuhlP0si26OighCy7MSg1ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IaW7XsJT;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72343606A320
	for <linux-next@vger.kernel.org>; Thu, 19 Nov 2026 18:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72343606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IaW7XsJT
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50933bdf4bso319522766b.1
        for <linux-next@vger.kernel.org>; Thu, 19 Nov 2026 10:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795112407; x=1795717207; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5hy4P4exgctsWNbL/FQFw8EeR2kORRjAFNQsoHveUE=;
        b=IaW7XsJTep8I4VUFC5bPuLhX6Kgj6po7k00Tj5RHys5QDBwgt9vIWwYE2WPpM7lasg
         N2BjFZ7T6MUt0kh/vkWQDbJgKNc7Fc1q+bCFDeC5MRcbM2y65vJUTbYoESuLdvreZaZk
         SCGBnuFI3/g+t/zEtPLD7k7zEpY6cwCox8hpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112407; x=1795717207;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i5hy4P4exgctsWNbL/FQFw8EeR2kORRjAFNQsoHveUE=;
        b=Q5j9SngUchhtfUWBKssi1nDHUasxuCZ7YxmPmB7YvsPEB9M67ZoMTpaAv3Ogzml1xn
         KSttcc5gOV7rAjFt05PgVGAn0Dm23Td5RLR+tQdYh8y3Xn+nMwJCWu5sDH1hgC6Zd1+V
         TAlsNT5ZglTsfdHndOaUWjqISFRKS3YX0g6CxuY/vSmEThmftbcERlmgIQD0ta4G7Zht
         Kv2kUev0o24rrfcwqD8SH1ng/igN/Hhrr73dwWyfxpIJgRuAmnibIMU+Tt1ZUXcwJHEu
         P9jt2LU7MxyHA4mmGaOOFbYABI6esQ9Bw2LoVLRBRLngl+qg7ZFt99KaV+NbDsMCVjpt
         iN/w==
X-Forwarded-Encrypted: i=1; AL+hErGmli009apiGvz3EIk/ZT6Q4iNSu1PRWXzTCt08T2AGY5yPxv9MEmE7cEokU8aeH3b2J5bQ/ylbKZCc@vger.kernel.org
X-Gm-Message-State: APuU4Z8jildR2WgaT56XTbScLWblVx849/FFXtNnVkRm6HGOtN+Vmiy3
	hcbi8UqbONijyOD4p/kmmFmbDvW0Q8y8ytY+184V40yNndRZs0GCm/FvqfOpXSwRtKOuoVoWLtQ
	aRTCU8ps=
X-Gm-Gg: AYBFou00EuCYL8x8Ei6VEz+YH9ToTyhtOiHDU41yqFinnu9n6//KiTdHGMAGU/tAnHw
	lyIqzGERHUkkHq/T4yt/e1nDd5wSqNQ2zmsrFUg1UIbSffWISk65XJ8ch6niJatrk6BlOkaR3kr
	w1zOijubGE0+jtNEFdSHTVZ2kDt2H7H2g3o1NOfDKobqcjPJ60nOjWP22y/cZRsyLDocdSwpwmq
	2W3zjNRTTOlF870BMHoH5McweCkyibUbJT9Qo5FbCvoblXY71jbRvb2ndUkyowvDWEGVMKxtSVs
	Zn2fdP9JlS+BzPNWDCkTzenUMm5PX8VYqU16i3xeiw4swrwdPOHRztPMPc4/jQbjWqGQjny6IlE
	ZV43rY9ZtQqo9PBBWrnpG/XzRz2fr2/t7+Tnnj0yuiq4783bHsrswCA4XiuIXFmku7hW+t2Z8Nh
	yeDgMLvP+XH61HedxZrMG3aJ2zrgEBdmIweDq34PFu2JSBL3jkg8lroO7dDcME7TSFI9SAdc/wa
	ciIJVC+nhkYo9O9qjmapgO63hbueqpEDUkuCWrJsG+gv26RjDbxZYSK9tgqZVJ9R/RpDUnzMtaO
	xHBfGP1jIeYCXVS9u1sMGeCSQZ93uBMtGfeMGZVpr5jTG2fMn7ngQmdF3AyMaOeUpLFwsxY+Srt
	wUy+I9NK9X6GLKWCbJvq/y2i6
X-Received: by 2002:a17:906:394e:b0:c40:9b35:ad91 with SMTP id a640c23a62f3a-c513a854929mr60588366b.13.1795112406660;
        Thu, 19 Nov 2026 10:20:06 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8d0dbsm22043866b.31.2026.11.19.10.20.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 10:20:05 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50933bdf4bso319517766b.1
        for <linux-next@vger.kernel.org>; Thu, 19 Nov 2026 10:20:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFKUyBpO6F94LeJVl2etxqZyD6TvwM2ygx0y1Hv0kj+7jG8enEN0d10UXXWSxn+DYOZos0CmNJb8Tmy@vger.kernel.org
X-Received: by 2002:a17:906:394e:b0:c40:9b35:ad91 with SMTP id
 a640c23a62f3a-c513a854929mr60584466b.13.1795112405562; Thu, 19 Nov 2026
 10:20:05 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avxpkXiyWwLqqAuu@sirena.org.uk>
In-Reply-To: <avxpkXiyWwLqqAuu@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Nov 2026 10:19:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg2n=x77DKc2Z2sWSysTmQ25_S+EGa65Equvj+KtWkVCg@mail.gmail.com>
X-Gm-Features: Aa3M54oLOxQwnMku_wqvDfSMTe9hGLPtKFwHEgAVaLJ7Yldu6AOkOEZlATZLzY8
Message-ID: <CAHk-=wg2n=x77DKc2Z2sWSysTmQ25_S+EGa65Equvj+KtWkVCg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm-fixes tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Daehyeon Ko <4ncienth@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 06:50, Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the mm-fixes tree got a conflict in:
>
>   lib/assoc_array.c
>
> between commits:
>
>   2dafc9bc491da ("assoc_array: find and collapse in deletion without gotos")
>   4a5db94ad9b76 ("assoc_array: move deletion's collapse into a function of its own")
>
> from the origin tree and commit:
>
>   37ff457ec4679 ("assoc_array: discard shortcut when collapsing a leaf-only node")
>
> from the mm-fixes tree.  My fix below just drops Daeheyon's patch which
> I don't think is the correct resolution

It does end up being the correct resolution - 37ff457ec4679 is fixing
the same issue that commit 48691075b0ad ("assoc_array: don't chain a
new shortcut onto an existing one") did.

And the conflict looks bad just because the whole re-org to make that
code readable (with a couple of other less important fixes).

I htink Andrew already removed the patch from his queue.

             Linus
