Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8670C3B6366
	for <linux-next@vger.kernel.org>; Sun,  9 Aug 2026 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786276387; cv=pass; b=U/xwz7OuHIPUCtMxNntuHl+FDNCyKpIJcjpX1V0Bt8CToKcVv+o13PEyQXmYTHHzD+Y7V1/vQOWF2NochBxESO3b9HURooO8MGiWX/hrUtVSsn6LFmduq2vcIJJfq2Cc0jc2Qcph5JD0aoDOvK5e/FhiLyGgXMPrwlliJaAoIdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786276387; c=relaxed/simple;
	bh=CC+w4v5x+lKfG03v7I9HBoqcRXi5E+1FHHtfkyyNmJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHOPEAdYP98jKpRU7uyqg1GNDi5TcMJKoBypa4rznry9S2XLPR+VS/aVqYOtvlfGm0x5+F4tZbb53jNjzt3CK+UydddgVxaPus6m1QPE7bCMXM/wgqYjGoW9edZ2A1pC6Y4RzQQP0mKks9+Ou2Uk7hIZ6FVvZEKb9YlQiCZbXRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0F5q8OJ; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0F5q8OJ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84a3e5ca66eso224474b3a.3
        for <linux-next@vger.kernel.org>; Sun, 09 Aug 2026 04:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786276386; cv=none;
        d=google.com; s=arc-20260327;
        b=WgIuWIhrUSR2tauNrWpv/P1S5782w5Wo+5V49Y5wtn96bvTfcXggDTLppvtypWxvjp
         LIDdbfqahGX5BRFJ7hUDPixBqvjTPYfOA0yFrdjSa3aYjinQoQK0hZpkXwQU/utMaGYu
         fwBbI+MfIPQk9K7xUdX1Myw9/nfNlanSD1lNxP7nLVUjmoUsvTe1z/EP4rhn3dTPl0Nf
         HClwfBNnUmbOrDZAgo7fydp7BKv2XJLhJxaDUBMejBfqW9ka74zrWwk8U42xSFnlloOc
         iRLdz7AEwIV5/IRLuUGKOgTF/BRHaobjYTja60dTClMtt514Puu+c5VNFwdT/xGgJAHn
         o3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CC+w4v5x+lKfG03v7I9HBoqcRXi5E+1FHHtfkyyNmJ0=;
        fh=miRQpqV+ULioGvWdgp3tjS0Hik0OwYuGJdi8eOP5Hk8=;
        b=gbvkgeKWawFV508a0ImzTEbst7mxtrxlfrkd0QUCji4rlwtFS8w7jLOyPmI55X9ZQz
         8D698UNfScJfSXfWjdGevqyZVWrTc2Yq5BA0zTKIAqhGfA3vp1tgcz+kqPJgsfjg8HAK
         vfhaXGpuixrPbX/4khpv+WTIFqtBPqLI/0G8SUhB7S9cyuNLzwhpbXl9j3+/GD2dK0GS
         87jEZ7cWAcsZwxfLS85pQ1YSI33vvDeFhVpkykgbCuof4ImGXEEno5O83Qs6lOZsRKvL
         oWDd4SYfLGvrtnkNwyzVAbH5G6rJax39nynkEEj8oEkBEXhCX68clcQenR4glcaBW3YL
         +vXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786276386; x=1786881186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CC+w4v5x+lKfG03v7I9HBoqcRXi5E+1FHHtfkyyNmJ0=;
        b=H0F5q8OJ5cRTTA0slD656ypfi0bIHVRoBLz+KtIVCG5rlsbk7o+6+NsB2w5St0s+lS
         nX7EAXdW5qwT9bXkswk510Fs0/E3Ih/RrlMM4h1a3bFlOBXkdji0qy/ICWywaxgBpoGL
         NjCpSQcaweCoYOFekiq4v0ofYvAV3gmwo2jpafFdj2Wxd7jcmOz3TO3dIYgaOoc3jwW3
         gImjmFOQntxabLqLpZqt6nYJdpYR4faRyrJYinfEm2iXso3jxbFpwe4pptzoiKNf9NXH
         1JyHQHObHaxIa1DEpK4yL8A0RBLY+srHy2zor0JRlvk+pnhGSM2cCuJsF31KmNfoe8tO
         QrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786276386; x=1786881186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CC+w4v5x+lKfG03v7I9HBoqcRXi5E+1FHHtfkyyNmJ0=;
        b=eku//Ejq7vT5Lb0b6lVEjt3LlabIbNpP2DMRfaj+GMDX9Y3rkNgC/rBXQMfoFLQinn
         u5t6ipMCryA1ehRBrkKCK44on/B4X3NMnHVeHo9gJsKdTS9a9kV6UpJlLWPP0T7beke/
         01t28h8pASoo9crokPrL2Sa1UtAYz74E80xR6eiOYMC5oX2RSALy3pf6wG+mVcFvCc9t
         28MP6d7ViPS0IautwD71rpgCjqE9Np8X6fL0QbaCXs+zy5UupjJWN2694b69mSYR/Kc/
         BBd52GuQS+2V1RqiW+CmtgA3kgFZZbEAQFCpI2VLN3vZ4rAH3DSkIDzeWe138jx1h9EM
         /sbA==
X-Forwarded-Encrypted: i=1; AHgh+RqfflDMYyHZ5DlE71UpGFefxXbL5Vf9PJstOKdNOfg6laVoP1j9JLTCGELRcjZYK05eK6SGzK9OIRMn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1wQsuGjyCXe/KmYIOP4nCbdTigQw0bgGc372EShkvoTWORBP0
	+OuspuxBFhjo7Vy5TEVfjoE90inkZ1pBzssEg8npNq7if7kqQTxaCxtvUcUNiuykK5SvoGK641G
	JTwwPKHLfz7pCnW2IyP9VSg7ax7StyTw=
X-Gm-Gg: AR+sD11DbF+r/7SLoeP98m1XXgTvDpsblr3x6as58/WOJHT2WX6r8+tz5tTmxG9a6km
	ztWqQXuhf+lKCiyGwSNwI8Q70uUgHWvepiJun311uWrIclmPKp0E0kJe9+kpKZ3Q888L0SqZLap
	WvTEqauY2Sp6VEhjT1Ix1gaHASvWctfmNNh8VJ9E2qd0crga5TLqN7G5kNb6bDwqrQagHPhIHKZ
	qRKT4EJ9XBExa1kTcdgog6VXTEgEJpeB0YW3vA0ytQOX2+Bf+txgCSVLITIwcLnaMH9spopgonW
	m3QodU18Rl5ccSOPfmTrnbtiys8Y4E5grTAbdSXHMRLairuRiqNS5Kkm4Di7MLNLbKoS3C66rbV
	NRnZOhOvshRFj+PtD9JA01yYrD/jtB//CAFcz8e2svGwSaPygEAvu3CntanaP
X-Received: by 2002:a17:903:2c0c:b0:2cc:d6de:d58e with SMTP id
 d9443c01a7336-2d0cab4cf8bmr279075165ad.4.1786276385756; Sun, 09 Aug 2026
 04:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805190012.2934907-1-gary@kernel.org> <20260806170101.67544-1-ojeda@kernel.org>
 <DKI2GNME8JEU.27LL7M7GZHZKQ@garyguo.net>
In-Reply-To: <DKI2GNME8JEU.27LL7M7GZHZKQ@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Aug 2026 13:52:52 +0200
X-Gm-Features: AUfX_mxWUmfsWvnlQdackIqF2MdVjCznd7IvgrTx1dNCzI5vB6E17kVrKjErbnw
Message-ID: <CANiq72k=xyeftXo7VLvxPQkaOQdXZP69rK4_GhcEc6khuaJqHQ@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org, Mark Brown <broonie@kernel.org>, 
	linux-next@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 12:45=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Thanks Miguel, the semantic conflict resolution looks correct to me.

Thanks for checking -- by the way, I think you forgot to push the tag?

Cheers,
Miguel
