Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7B3822A8
	for <linux-next@vger.kernel.org>; Wed,  1 Apr 2026 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775057281; cv=pass; b=I8QFr0n7ncFSIehcJjhKYUS/qIWG2wvPTWOWIUfd0JIeXDN/fqKzgK+7dKLaOdxrf/Ep00g449JO8hecyUhPVqULE71ZKmqx8Yd8d55YXgW4EwCZ/ZIXTReUKWE9CQvuoVd87XfbyIISYoB6wNv32znSZTy5MtMyEpoku6kNdwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775057281; c=relaxed/simple;
	bh=4A/xg9VYn45t8YYunHBNUwIaHOOxM2gP1TF/kZTTzrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcMWpOdPSPjioO0xqnrJycYEYJum30uLFK9D1/5A3qR8pjl86UcfZIMYjkmcqNQHyEr0Ve1p5pQb2urQCkEx8cJ9ldnj7wTMTU0DI0l6c2jjRACpHHhpWuRkE2FQok5hHkVfjqZB5tWoIyRwNf9Irc7cUd9hPTzCzSGxY7UrGuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qv/4tX0l; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qv/4tX0l"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483487335c2so75810185e9.2
        for <linux-next@vger.kernel.org>; Wed, 01 Apr 2026 08:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775057278; cv=none;
        d=google.com; s=arc-20240605;
        b=Gsi65W0PjE3UbrfF6ZpF7vrLmJIay15bRIqAGJ5A9BPBLBhxyW0gw3U6OD3BbU4k1U
         4TO1rpIddmQiD3I+xVJZXbb3Z1wIhRgkOxeGxCCqK2x9GT0O20XJxv9q0ayHbh10Fmfj
         ntqHe2h5mNydq3TG+uZoDVbwBn4kscXt+U6Yg5XIFrP/YCMnU/x5+94Po31VHEpC0dyZ
         I366bbJF+Ih/u3yfOYosonH1mbCRB5mU40wY5Eo4bQjrmtljtIRB3q9Z7P1oBFPUuFIn
         /hA43e9dDFwRJscvxfenaPXPQ5zZx/TRWodpJZTM1ITyfiAvlaYcqWI+2mM/Xw8lXvYJ
         rVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vCOHypGKguo8wBkpBnEw63yLvcdsQkVdKAKwk74anwg=;
        fh=SGznvBrwlw/hVsbv8lk/k4nixiHgZroUPYf39f8Qb3o=;
        b=QJFOvCHnppfmXQRigFPVa57NV3DhmRR11Nv36e1fSbU0KPdaYfyvzphJrIdFc8tkV4
         q5dtVt+3SURK4ovnrJUyNWC4xKmpv5amCUVtBT3gR3rqSJRigyXAOwURGFjBgsk9Mnd+
         gTPqsWQSmYu0n2eOKKX6DvTc73DFeV3uy9Uyya3SCCjoFW7ueu4GfUcAE8WtNgym8fzx
         GbPYpFwLif3wVkdKPz29iUZPUx4n2KZufO9QACLIaOwOAetnI9V+Y7/hKchty2LhRnJa
         3xzPPu0pglKBi4gXZLMJ5QxQYRXyGj4gLSWp3GQwRR7kAZxnJfZaJmQQ7czv6SdIadaS
         7HoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775057278; x=1775662078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCOHypGKguo8wBkpBnEw63yLvcdsQkVdKAKwk74anwg=;
        b=qv/4tX0l9OKhkkJH+vDrBljtZYiuCoqt+CNRC1p+kUUZkNUmGpdPGRgxuNhRGrmUWV
         OWawQIcjEVj8SYGrwpmnmzhPeUEAXRAsVuqv4IvFHnwr51jpZ0GLVZmYY5p9pt8VX0qj
         tS2OOjphaT0Cj2NQSYJwIi0eqGqkA9jP9W9KewXaUD8qm6EpUxkUlkC05Z79W2+AbxFY
         igeq6svQN3ddMILocr52O5rr/sf5RWZ+j3bhk2Lar+whTrKsFxmDBEgLH/A/5V0bfSJs
         yoL90cf2n3RqS/Evk48BBfWiLHSdCj3zpsJur787ARAog5z8+OWi2H3UpYgXbWNPNg8l
         NcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775057278; x=1775662078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vCOHypGKguo8wBkpBnEw63yLvcdsQkVdKAKwk74anwg=;
        b=jrN8+2WY/6iP08aPZimK0isLvL3OFIU3zKKUahe71/zIiqkGW49t/n7atGgb2aoHKq
         ZNtVUXkTI3c+v1k+B1XVpugMzieo4aLuiTL0wCcES4r5+KbMl0XCo43pt+KtqpZ3e+4C
         lduBwUuxh0OtL/MXamcafEWK0BZLa+ab0Q+LLqKx9+elqNNG4fh99YaoXg9niw7qGKzV
         P/oRmN3kWDys+K6WJOECdsCtGALSf8XImZOrqevsiwXqpgroCv0NPK2Rs7A8jKZIgMFQ
         qI3A6+1/tiFRc72eV1lhO9LfZcYyIU/rmrXMyS5BzcEieN9N94959FYJcw4PmjZ1gM61
         IEnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjQ7BqKpJ6KUqMgPFq2BFrlNHSMx5UaDS/XAUYNbHYXE7Z2QrkxV2puPtanIoRyDZZvtfBgWoTYlHM@vger.kernel.org
X-Gm-Message-State: AOJu0YyKYrfNJxfBfOSJVqULwF6cBaAaoeAslMB4sYt6WMbVeWlw3knn
	KmxlpPvuSWDLK3VnUXDmfyEWQc2jXpKUo9MOMTbHi5xw5qYCoM9X7yYKaWKWnpbGpbWyhuk1UAX
	6Dii3Mcm9Mdy/Qarb5qWxfOsTKy/z+os=
X-Gm-Gg: ATEYQzyfZautgI5CQEu5zbR2ulJ3oqTyhi1PhzTgKHGxMaNNmCCTUdKExfhT2zlLdZQ
	bDNRAmwH5gXXWAuayRBLeAMmu/kF2t/Ezd8OT6leU/ZxpS1QiChd7J4VsxirNls/rgeOgeIdBnB
	uGHh1dUfWgnCPDnsXc1+c6J6tBN0zl9qUBs29iORjImOcoBZ5rJnPLOlD195TVkdmLO8X7l7gAz
	R2AtTyEvHmmNP5SBiUjHZvL0tHT0OEv1ogXIc8KPx9W6n9WtoqwYkRYPPVpPtenjpplWl9rVaSk
	o6e5LgSAplDCnUw+vP1BJxZk4gZrf+lA3Y3vnxe3wpnsNdTdwaU+Sfkd543Iui+Tn5l2tEoddDq
	jK30N6rdAis3jihDLU7ZNVpqDPA==
X-Received: by 2002:a05:600c:1f11:b0:486:fd3a:fd22 with SMTP id
 5b1f17b1804b1-48883568b21mr60612905e9.4.1775057278387; Wed, 01 Apr 2026
 08:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ac0Pr9K1Qbn1-Dn9@sirena.org.uk>
In-Reply-To: <ac0Pr9K1Qbn1-Dn9@sirena.org.uk>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 1 Apr 2026 08:27:46 -0700
X-Gm-Features: AQROBzC7wcHLCyA-6tldZ7Ce9lGnYrr2f0ucx0sfqhOnFZehMHR_aY88d-OhHDw
Message-ID: <CAADnVQJdQRi+763mE8pVoYjgCzhUJNFj5b2YYOrrcLhv9s9-uQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 5:29=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/verifier.c
>
> between commit:
>
>   a8502a79e832b ("bpf: Fix regsafe() for pointers to packet")
>
> from the bpf tree and commit:
>
>   022ac07508836 ("bpf: use reg->var_off instead of reg->off for pointers"=
)
>
> from the bpf-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

thanks for headsup.
lgtm
we will get it resolved once bpf tree gets pulled.
