Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8CE37F740
	for <linux-next@vger.kernel.org>; Thu, 28 May 2026 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957384; cv=pass; b=klHJV0LVffs1YKaqyd5/oxQTWpQRPZ2XE8b1xXyvPSm2WBhyh0wjcBsz/PZA6/cidDdCMc9+D8sLOcr1dhV0yJ+v0645+MSHYS4aA78kveTa3/oWl+W1BvUXnA6z2E2dl7eesUo8GOFRnipVhWbL/WSGq9DbC7UQXOL3utrdLt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957384; c=relaxed/simple;
	bh=Gwa+f2tCEaj27soh//zrPlf14ZYL1HfF/iZnquJw4Yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iDPrgvpOn56ieD58v4g27fivQYbh8UywJeqTJcq0EquOFQOtiSUKSOKyDcB3lxx+vGEgaO7HcSIYev8M5Ypibg7qsJzxUa6Y/CS0BF2RKv3Ws1tDXdJlEoxUOyR9a0UHE7nvpWGqHzKqXT/0qEfhZtyO2ONchIg/PGyfUqxqY6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5aL9cm8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UTxyRaKa; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5aL9cm8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UTxyRaKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779957380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gwa+f2tCEaj27soh//zrPlf14ZYL1HfF/iZnquJw4Yc=;
	b=N5aL9cm8C9clsDNKeQI0BObLxSVMjz9DA0J4XqoWwBavZn4itbEl6DwFOxxoxSrhhKe0SG
	TMbDDleDF0TBVTzArIXnQobW8O15Adm6/3kVM+cbJrxJF/9wRi/ptlFCcG9u3QQkVBXeQS
	alSK1MlKMtxTwlLdiXhizzCShIWB6zY=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-PgkMe3MXN8Gam4j4GjVZOQ-1; Thu, 28 May 2026 04:36:18 -0400
X-MC-Unique: PgkMe3MXN8Gam4j4GjVZOQ-1
X-Mimecast-MFC-AGG-ID: PgkMe3MXN8Gam4j4GjVZOQ_1779957378
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7dc4ec9e07eso13731207b3.1
        for <linux-next@vger.kernel.org>; Thu, 28 May 2026 01:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779957378; cv=none;
        d=google.com; s=arc-20240605;
        b=UBLU/N4RwHBPaFwUwYX54Vd/VF9yX9///Gl2O1FFVN4sBRfN5WrbK9NMLAYH0K3SVW
         9B+zsuhDzyq4wn59KDaSSnenqbHENNFjKJRrKua1owJZTWbiO3XkPEe7cGG3n0N8STWC
         QaEvWPn7di+6PFfdis1voEsDC/59bzzLumDXi3OCkAfZEcI0xksPkOGUmcMehQ65xdzU
         yxv12aGqjIQDW4L+a7BVVVkS/A+o8LI/8AVHgiO8c/7a9J5+zqOpaZl0lBV7W+BbNXFi
         vDBk0C91YDVdROzPeRpKMTcpavk6dJUeGXIVTu3F76AK8Yu2QazmQBpINCjSLCyyGsop
         CPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gwa+f2tCEaj27soh//zrPlf14ZYL1HfF/iZnquJw4Yc=;
        fh=1eUjC1UyX6G5Z5YgYweote/TrSmoav9iJ6y4wfoujUY=;
        b=RVXE18iDFKOMyxRjUMibPNCHpnAz+qU1KlzLpGtU2YWdj+C4edWJ2YI/43Wkx39Z2B
         gk3baluF3J9q4doO8qnUjD3jQ0OOuigfee/S5HIs9pEPrh8i9ABZJfDfYlzCbH7Lc+DN
         Km6qQ4OABNn2f/t3EianRchJC4mtunRtfsfIDw7crSUxD62g+CODA+PwJDEcjw0ZahZ8
         3ikJC2wgj8pdk8dKQuQXBfNow1N0bo2VBQJoaqS1DER83dTRE7ujkn+7AX+ljRtevd3Z
         kYEZrgleDq6q3ZCbcHIZKuwCs/3owdXWTDZV4VqNQds3q1Jzu+gQg7cEUmSGtgiPIYSN
         hfng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779957378; x=1780562178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwa+f2tCEaj27soh//zrPlf14ZYL1HfF/iZnquJw4Yc=;
        b=UTxyRaKadUtTIEKKHK/+1oowmJSTPTVIHwW2qQlpokODR/lWZ8vFrB0JzbCgUWXsc6
         PWgbeZRrZXsWNt7mbcm89xl7+2B9UeTEXmw5XzneYORzR690yi0WSf3yMcZOo2VTlun0
         3KWnW4LoMdyJiA6nNsLMiENhbEjAufXQnL6bnFbLSeqGz71U2qL1buxUFmTc1IQOpqnM
         stztGG31eEab/JHjFwSpEarxJetHl0Jn94A4h0ElaP+e8j9CYn+A1qkCszukKOo0OgRL
         w8V9E/uns4pmtv4dgAjLRT1ozywBRcHSvYkSfgj4O2Rwl33nqR16TyRQASusMSNAyg7Z
         hqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779957378; x=1780562178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gwa+f2tCEaj27soh//zrPlf14ZYL1HfF/iZnquJw4Yc=;
        b=HmYWecbdoBeczp8vFdsenntyBjxhVd8ZRipn7Bvmk9Log/ldS0e/uivKSFi45AIaoH
         vMuNE0Ggx7VCCTYVUPHOOSTt86AwgW348NARr474hq3sfbhXUzNN0UXTOovlBMhmYdAF
         Qq2GrIUfbW7ArgUrvW9qmlS83FgMGV/kIdqMrKkxqEbRZ///FPfqk9iUZvqJYquxZ+Gc
         Uzl6WkRmpMB+UUDGhA9MJ5Md3SF/ZzNbjPDKpTNkwDSC8ruCZYj39fB+Z6UvLkaZpXkL
         gt4pmMB6Fm2KGvCu6aERLZ0uzIkf84lGkgO40I06xyG3uyZ2cMbKDB8iIMtoVOLYWKlw
         D9qg==
X-Forwarded-Encrypted: i=1; AFNElJ9zq29eM1S2lKjE6BKe3PligQly/i1bNajvMRROwWKfB13y+kRrRrkhW9JrQr4DDAQWEVIcatT8iJpi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ZcVQzux+exQ5DI90fGXYO/8DIRleYnDns8t3qdjF8Xe7Kq1C
	W0znGiV4D8we1tWYaMa0x59pfpPipCsLWB7P5v4C3yCU6fde5w8LBczhFIfkN4Ml1N2FgJ0xmt9
	USqg/wo1vDJzxq28rkwC+nx+x6tvazQTXu5ryQwMbYwxPMIUIZPd4Dkk3PxqMmXI+Zji/DwZSFo
	mw3tF8QY+1FB2JKqk7L1GMGfYfgWYnkojuJQLoHA==
X-Gm-Gg: Acq92OEU9+L6NVoFh2bDs5cj5xEyFiee9ZCRf2izH+0QzlNzsKAmNHj1DOj3IXojini
	tiXqwe0TWbgXoplnafvMWkVd2pe8Cd475WTHk853nD6h6CJLFYawVC2FF5OBKlsNNaCNGCzD86h
	/fEQD+51TNC0idY/STrlrOZlhk5zyjAFal0AGnlUgy3FfizWrulaWYXYmBJtpTqPSj0OgEl5W7f
	mUPrtFqUQeKinFb
X-Received: by 2002:a05:690c:298:b0:7d3:14db:a1db with SMTP id 00721157ae682-7dcec6950f7mr3877677b3.32.1779957377795;
        Thu, 28 May 2026 01:36:17 -0700 (PDT)
X-Received: by 2002:a05:690c:298:b0:7d3:14db:a1db with SMTP id
 00721157ae682-7dcec6950f7mr3877517b3.32.1779957377374; Thu, 28 May 2026
 01:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahRHShZFjI8AsT8G@sirena.org.uk> <894b9eb2-e054-40e4-a423-1ee5412a5e91@sirena.org.uk>
 <20260528-schalldicht-krampf-gefesselt-1be0e54eaa10@brauner>
In-Reply-To: <20260528-schalldicht-krampf-gefesselt-1be0e54eaa10@brauner>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Thu, 28 May 2026 10:36:06 +0200
X-Gm-Features: AVHnY4K1VhXvWK_pXjpghxUFVUh6G8XU6K0VeXTyG6UvMEfY_GJxHumiBSmC30w
Message-ID: <CAOssrKeMEfjGSvcr_T9PnRoQqNuMfE-qr6KPvq0pVjsi2+_2uA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the nfsd tree
To: Christian Brauner <brauner@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 10:30=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:

> @Miklos, I'm switching this back to jhash() otherwise we have to
> default-select xxhash. See appended patch.

Makes sense, thanks.

Miklos

