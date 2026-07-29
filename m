Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA053976BB
	for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 22:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785365837; cv=pass; b=N/Zx2YXqK+2WHNMF2O9V3OSE2YAzDMPKLCJDvarwrC7Shk1/KvcyoIsvrbMZgSmzk16yzmddYEgpudZO+pDITERbICU41yJo7RRKO7CP8C2Fkjk7oWVB0XMhv9zVHiWZDSW+pSnWUpngM+NGAXOarRnLpiRI97ufm6NPDs2Hz1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785365837; c=relaxed/simple;
	bh=8fGr8J72evAnXrp5cZJsnut9qpyNVd0dfTHBg+tuL2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VvDGOkHWuT5yCykx5JiXJ0N4W0fl/azNP83wo0vpuLbCcdVvhTSz241K9FYM9fSSDlJi/uu5uDrfMFINLE9Yety720hK91IFDtyHgOPofRKyooCxvN3PBEJMAFCkEFJAsWbCvyKi3R9PZykbq2Kg9SZixwaFgEwXumFFN/9TfTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pw5RVunh; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pw5RVunh"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8485ab7c382so207657b3a.1
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2026 15:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785365835; cv=none;
        d=google.com; s=arc-20260327;
        b=ZaT8yqMAtj8Zr1exlqu3cC61vqmm+fErVI5qV17bEFjG6DLOuLGExZ0qffLrbMFvJm
         2S8SAsrSKEPn3UuBzj9v3zEJtPxGjkLxAhSyfqb2Y/DQscW18hM8IPVr8l2Py4aBOSmv
         t6qQ5gWrq6exdVm/QoWG/vQ85PQd6hkG/ik5Pd7owwNadJUJdyrKOfxJeZr6AcIn3ih2
         W1rMtWLgGI4c9xhBMG0RK+8ovTC//7PFRB555cNI85cYfiRmAFdLQo1S/pAifCK45ikZ
         5adqFSojymGhlWT3Kq4z5OcS6daANbcwjvS03m1LmMdFkBST9vgidiii0H0/DHsHn4Ve
         FBtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8fGr8J72evAnXrp5cZJsnut9qpyNVd0dfTHBg+tuL2c=;
        fh=L+IepgibwOkKiVSwLyTXRgX8g7IAngOn2OjYqgL8QAI=;
        b=SgCFk0NOerkWh3HYUMFiaWQ8qvtL2n5RnlDlfC10lKGhl6k7Ioy2epwasCvSLi6cMW
         ZwnWRlzBiNdxgsGOwXNHn8yrgK55Nv1epUVpyVUfnwWXMOK3uaCKDhPKY4wxmWnfW32U
         s6FAKzOsar/wP4k0Zo+BIkb/DxDAYY+0BNROZyBqY840Ed8pierryQT8xHsgfb3SqEOH
         if9MkYpTAT5xjN/2lEAufv07nD4833ks0B1zE7tsFa7r9LBfVF2E5I0zQ5OylRo5kSAg
         sCqm1uRJN9kv7if+hEfveOcEkXC8CzdquawRUAr/QMo6sc3ZCfE07/9+wN9l9BgSOCkI
         vARQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785365835; x=1785970635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8fGr8J72evAnXrp5cZJsnut9qpyNVd0dfTHBg+tuL2c=;
        b=pw5RVunh0TzKDriLomtT9xt9mSEDy8fKgfPQXGQWk+DVfSrPHva2CRwJ66kvP7PY/h
         lqi5CCMdxkD3fSoG9bVhfdLJDmkOPdMUpwt8RkcHwAK2I3KKWqtqEtan1OE1rc+uIAHh
         SaI+H/jihqpNjN6JUmI1PLECuO3FiElGpEFqdtEq5GnavXXdha+5R46uWah2m0k5E+rA
         4u86+CSzSj7ghX2lwAqZOOHNXfVgx4vb4A8dMkF9ksVjBE3kQdrctYPqQ6BR5LiC6Svo
         G6ogd6BcB84BDY6otnzH4HFb2wHtEJkFPMfLBdozm/GqCmFivRmoz05/k2LOgkjkY98x
         Z7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785365835; x=1785970635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fGr8J72evAnXrp5cZJsnut9qpyNVd0dfTHBg+tuL2c=;
        b=cgEUEm9T8iSIH6D0oj6lJC+w5qOOM37Wj31fKPGxCBgA2lBOt6WyjU3vsKmdW8SNSQ
         OeSy2H6dg8FQGKcpyFKWLm+wOD6pWQdzYCNa4TNkvcVelH5lZEG8mv+Kl2xS3uSEPklE
         uBbusIUR23EcxGpIvJqdX0baOJisgksKqq8mWB0ddc2I+hSGw6S+ggDsvfFiqgdqC9Mq
         ni35vJ5/nu/O+a5+jX30+16hrzcCybF38TzHsdoW9/dee76Ca/b14qIJ6ae2xF7SVIVv
         ZzpXQemh09xUbq4rAcMWnTz0OaqWijWrV3xUwpRXXRoHcKK2DvfLmw2ZMEfUoT7Pgjx2
         n2TQ==
X-Forwarded-Encrypted: i=1; AHgh+RraUPXzDKQG+DSB5dNfeRJJ3wlfaEBPdga3ITU59NInqzbYb4HU9/BuINhnJ9YaPknac7kuxk/NbTrm@vger.kernel.org
X-Gm-Message-State: AOJu0YxjaQSUBmCAYufBY5zYi2pZJ7Eu2UxFoMDG01JbLWZrweeszZ1p
	Ma7OYC2iS4a9C2KXlprgXUlne2fOMT53vzbyj5eKW0oEHkALen9c7blGVeTMov69ogKN6TovVDD
	ZstQmbHcRoNlnwSQ0108Nm17X5C+YI58=
X-Gm-Gg: AR+sD11oD2JcPHg5JebXYYouukxYvwV+FLv/U4eiqAGZkHZE4Bd6YkX1Y3zQBnDt20J
	M8Ej3puwvke52veUX8js3X426ptlYN8nb0Cw+a0xXQFgwq0s9yk7j5sA6bw/oZBJ52BDKiWiIzY
	JJtLPM22D62x5qJsvLetNSNFS+6m8qAWjZmDPlHS6jJ1ECo//mhZB0A/CEXoGwwBKLLE/jet4Uk
	n2Rf78pnsFE6IR9JmkjMaRnwm+jms4ZO+lqI/HvZXFvk8nIQnBAIRoLTYoigkyfFmb2BWUpwr2f
	7RmzEccU7/dSEukAojfP6Wl/gUyTXHBLQcCsMO4r3IpVo+5ugWZDVD8G6YoaodgANeL2R/HD/bQ
	xPr7etBTEULh8SUY2AugI+B1og6lxLsBoVkeAfG3/SVBXniGg721SkVtZVtIC
X-Received: by 2002:a17:902:d485:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d035b99da6mr3872135ad.1.1785365835342; Wed, 29 Jul 2026
 15:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amNsDFyTbsyAASjt@mit.edu> <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk> <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
 <c7b9cce5-5d69-43db-91c6-10f6bcd07b68@sirena.org.uk> <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
 <CANiq72kcrJw4Kt=5zTN9vvnDq33_4NV4AZ3jHTFNBJjVxmU+8Q@mail.gmail.com>
 <bff95de5-7f0b-4f08-8ceb-58a6e354ebe2@I-love.SAKURA.ne.jp>
 <amlXC0hahHo4Cdsx@mit.edu> <489926f3-795c-4e23-bb4a-cbbe2bd464a0@I-love.SAKURA.ne.jp>
In-Reply-To: <489926f3-795c-4e23-bb4a-cbbe2bd464a0@I-love.SAKURA.ne.jp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 30 Jul 2026 00:57:02 +0200
X-Gm-Features: AUfX_mzFxexV3Wl_6cUubdbUBQw0kjlqgE-HeG68jnKOH2Cfb36WFNPv8gcTPkE
Message-ID: <CANiq72=ps9obgSe3t0PV5hS30ifVY0g6qc2wxECLMZ1SzkKohw@mail.gmail.com>
Subject: Re: Policy regarding linux-next only changes
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Theodore Tso <tytso@mit.edu>, Mark Brown <broonie@kernel.org>, 
	Leandro Ribeiro <leandro.ribeiro@collabora.com>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, Daniel Stone <daniels@collabora.com>, 
	Alexander Potapenko <glider@google.com>, Christoph Hellwig <hch@infradead.org>, 
	Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org, 
	will@kernel.org, longman@redhat.com, mingo@kernel.org, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 12:03=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> That does not help. syzbot stops not because the kernel calls panic()
> but because the kernel emits "WARNING:" etc. followed by a stack trace.
> The list of patterns is at
> https://github.com/google/syzkaller/blob/master/pkg/report/linux.go .

The point is that syzbot could skip those until a given point at boot.
But in order to do that, of course, you still need to disable the
panicking.

Cheers,
Miguel
