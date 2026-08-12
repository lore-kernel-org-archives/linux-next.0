Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DDF36B910
	for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 07:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519851; cv=pass; b=kscphPIyawEoz1VF1oyRNDWJW+cKzIvg9b6phzlKeyGKfuOjQxnSpuiTLE1OoDCuJNu6wxutt0t/o3hxY0USRay1YexKbX2NQiHfPNli3/s162RuKh3PETR8+vP8I73C5QUZNWzsqGr89rBsSqu2F7Py96NVB+6oWtCOVOxJX0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519851; c=relaxed/simple;
	bh=Kt27DySIOR9GTticTxpbPLAgFJUAOoiLf1zfjK9TSos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4QLJ4uCv7Ns9Ia9ACkJ3Nf/ApnoheXW/HztJ9Wy/vi2kg61FWjXjQBpO/r1L2daSaPzhV96MjtpihTd0II6teQCbqPpCrNcRUlAYMOA5TgAHrBLz3q2tN8wbk4JEnhsz5eIN33/cm3mirsOB4+Og6avosRK4cjcKzUU5a0RG2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIfj82uR; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIfj82uR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccae46de39so1350715ad.3
        for <linux-next@vger.kernel.org>; Wed, 12 Aug 2026 00:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786519849; cv=none;
        d=google.com; s=arc-20260327;
        b=N7zfQxQkbyCT92tWWRybhXixs/XPA07KBI1Z+S8FmQPtjxmm9RsLekoGrtcznWTPq/
         lg4DRdu0xc3xrmXUWH7ZckkcRBdB66SQxeM9LOPnFP1npCHh5JJW61K5xrmTYo19fNPO
         9wtkL9KCQEiH+LNHWmtZ+4765Dk0lNmfb7TIZ9nhtQ/7nUONA+vZl0JmwM9Gc4bHYkkJ
         suQ256RPjj0lNXbfivbrVlRDd3ovmDX7WL8kAySdlclO8b8AA99muY9bq7DFEetG26CG
         VNOaVQdHWMWRqRoMOBxwHbqlWxNTreDqiZrVnaB5f4pJFOZO9B6uxpbHx5xXPT9uZfW4
         l88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kt27DySIOR9GTticTxpbPLAgFJUAOoiLf1zfjK9TSos=;
        fh=9S3jzi2AQS446p5HtQgTx8Ml7F/2vkvgnjx0Zj1d0xY=;
        b=S9PTKSehuF+5TLVnHPQi1b5lFIJPioIpdRzoKGcgmWpdB0AP4zhh4+wR4D6j8IhawJ
         wOmtRo8yiolDEkpUrHpEg9lOzG0LVz/8xJ1e0vSm7kP6WLsTvQFinXfBLzjOHaLscnYb
         wK6pEk7NqU5Sqg9frQ9msrd6uP4JFn4VQMFKl1ULNeVwutXyStI7AX2u8964zdxgW1xk
         FMoFgz/fBnnW1Kr3Ungx/tehGnp7hw2i8RYNjVyGCoEtyCFxwfMIDsEvMPSaTHs3D9E2
         7py2pQFg6OMxcQLmt0xmww6iuwWmxevztjluP/dEpovwxcU4Y7D3YoKva1puGCRr6nm3
         RGlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786519849; x=1787124649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kt27DySIOR9GTticTxpbPLAgFJUAOoiLf1zfjK9TSos=;
        b=UIfj82uRRoI4LQF8ik83tWoB6pK/uajbzn+pFtuPFp2fwTIp5A3hwp5wA1s9MGTVj8
         6nqu7p8by5ydmhcZ51knkLCfzSYO6jcXEm3qB6dCehtCFjm1M3JCRqzZLDsnOo81KaFt
         GeEQDHjAyw8fljjbmZcVG8K4WrkrbKfx0RBaf0+ugpvL0+SwEh3DpFm8+jbZNCvhCf5q
         Bwdd7kWKYDTv8H7PDUex2bR2P1egnt3P525FjL+O7XY7TXB6ETVJYhB82r1l0s0EB7K7
         6jsazP6Y0VgIE1ZUsVAEhKF4vKOXZUn1KdrBnxyCPz8v8gyO8S62eKfwqPl27nFmPaWt
         i8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519849; x=1787124649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kt27DySIOR9GTticTxpbPLAgFJUAOoiLf1zfjK9TSos=;
        b=bvw0NAkBSf7qPh70s2b0bp8r4upl+oPTFyAi+ZqDp9ufUmKbAlT8gcRkIsylmIquMU
         j2rNUDpnAd+dQJ6i0TJoIAFr2fgOeyIIRhVii4fNZCJnRB6gb4LCGDZcQoan0esgDznH
         PXyksWbz/NljyABDuSXlldk/zYOESljAwBkZ1MSQXjZnGdflzRDsammDxFN2ir9T3UUp
         2LZxF86aW6I00YTp1P32jzX//x1v3ViSr5NPnbq/IeJp08JJzUewthtLg/uAWN164RUN
         Fq0Yxftm2qrTI5SfCZQo/fpogpPtscv2QW3J+wez1PzD4ZMptJsD9k1Ono66p4lprs2L
         fiog==
X-Forwarded-Encrypted: i=1; AHgh+RpN8H6lFya65gww73I8iMLxG3KGmi9DgYJEAPxVn9SVk8Qq3GsGVWePStChIm7Iyo9yJDtX4zOFFZyd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3P7iMPb/c1yiJiJ7L4UPMxIwWIr2Knj2JCMc9sxh//z8t8m0M
	dU2aRok8GAorLRgmTiZ7T3oLY8BSo1BR/A31rFI8D55iuB5Ccpj64Nm2Uy7ggtgJ01lVRUXiTOP
	1oq9n4yfsJTYIgMXvaw+08QUea3qooI8=
X-Gm-Gg: AR+sD12vfEXUuKu1NPD5l2HhiN4NI3o7cTH5qXmB1krZh2nOgkjvJDuK0OT7BXwprKe
	LG7P9fuZ/2zEe5wZIxNl5BAVSwFnOkEZTyhDXttO/F0B9R8/s7WevxHNxPZiKAvcprbpDBikrHo
	P/SI7elTyj108nLY9vyQIHjuk80krajH4kGX/mcHJ6+xINMZhr93tp4kE+qkVGTWfCdomWe4nKP
	FnHj8F5tuNVsNRwI3rRvKV8Rwt9or9c8sGlTnTCJRayUk4BKCEyPNvVr86itqaGLHHHvraUTcus
	dkpltLeM/aP1bGFsB+bfl6bExbm6rBvB4aSGOVtQWqZYNFLEvUoZ136uqPWWQlMjxDSSDSzYfo+
	puo6w9+EkChoCZmz10ncnp1tbzU51X3O5sytzhWOUJRN7lu0OWBTwGLK5NJjoq9sJ5CnnD6I=
X-Received: by 2002:a17:902:ec90:b0:2cf:7dfa:7f56 with SMTP id
 d9443c01a7336-2d3455f42ebmr27338635ad.2.1786519849333; Wed, 12 Aug 2026
 00:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ans8lsGbkro4pO6N@sirena.org.uk> <antMNVcZNPw4ojxI@google.com> <d59a2bca-883d-4e0b-8880-e2a887a411f8@sirena.org.uk>
In-Reply-To: <d59a2bca-883d-4e0b-8880-e2a887a411f8@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Aug 2026 09:30:35 +0200
X-Gm-Features: AUfX_mw_-8LYODQN0jOzMYYws8OhrfEcv6Dptsfe6b3Xn6uJmzDP2Q1eUPWS5AM
Message-ID: <CANiq72kXRevcVMWZnJZQ_PTK_iRO4z6iA30xvv6mR1VEdy96ZA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Carlos Llamas <cmllamas@google.com>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 7:02=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Yes, sorry, forgot to update the diff before sending.

I forgot to reply, but the actual diff looked good, thanks Mark.

Cheers,
Miguel
