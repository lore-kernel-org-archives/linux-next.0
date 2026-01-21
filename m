Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F35D354AC6
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769019276; cv=pass; b=f0Kyo10eRnjVNXXaDdDgSCzZMVwzyAk7AYzN8WXa83IDOMV+mBqoaYzoF7ac54Misako7m7bRJq47FrMsf35qiOTl1bbMwTJLy4a8Lw05V32M4oiWZw7Vrwpc/SAgHbd14bByhbsyXFUV39EVvg3+PBn5LiQ7db1VMJVMb2VkO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769019276; c=relaxed/simple;
	bh=T0riNlykuMjd4gOZpV/RLixR2bRHKUYs81M+RJUJ0Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WECMnPfECTfdVMh+Ilbk07it9qMsLV598otuHYeuyUsrJK1+J89ztTBHF8bvXa6jT5JnMcSD4SneqJ2ogSFkIYuaZRghZTtVdMt6gWQBoixX7sceAf3BBqjyLOyVvrG5n0WJoBAjo7Ddh7fE0TTI+QWuEaBiwgILE6EsyEVkj/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bq6pUmBj; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bq6pUmBj"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b1769fda0eso9639eec.3
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 10:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769019272; cv=none;
        d=google.com; s=arc-20240605;
        b=jrXjUHHWkGSzaEyw92Q1VBiPmJzNMPdToU5q5ASB5mgjZZXTGTGEQzS/s6kvxxMNoI
         IedVX5bcDoSpvBq6XxJc5+gLn5EVKi5Z5awKaQtrjrBY2zybcIoPLo/VcubblRylAre9
         qIvKy1JZG7kX6y1OUjq//q6NiiAr53M9QcXrr53NrATijt8uRW+fIRzn3PWIDkrGen+S
         b9jY9EKQCg/p0v+0wtKZsBXP3JAssyv4fGR/YsscY7bNZ50eu5L1y8g1KdojaJyLnBvR
         lH81+dKnIb1Qy3XHagwovoHP/vJuHNLoveAa7hxpwTvFTT1I3LMPHLf5jFAYDwMwL1t5
         cdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p7R0UOIllmfuEL/af3Mohkz4SDOrsvLGMTAUtFksQXU=;
        fh=hRnF40EmojgLrU6Mr4EP//R3EZISIvCiL0CG6iXk/Vk=;
        b=hp9P72oFnW553R1tFVXcniV8wHmzIoUbaksgQnzBmpqBycoSH3727sFKcl5cAl9t60
         AWuZRIxYHJm+nvGD8Ja+1tJ9+UFDJVm8QYN/Ee+tAJkD3iJNK1QG4BiIso7TN6CdqNNi
         mag/cPVjv5jdNxvrBu6C+OPUSPe5sLmhon8erBe2H0Mg8dq33tWnEoVBIJLWiC71Pu1u
         4fE5uDZVIZ6EtiWoezeVLRq0DKUjRCXhvixcWTa/ZkIkPLl3JALHou5UlS2h8Al48lQ1
         MRZE6YTP9+OrHxSyD7dfa2yajAAkm6hJ/jIGHcRFg0YVu6BssjPo+/CtQzmLg2G5Eb2D
         vWXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769019272; x=1769624072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7R0UOIllmfuEL/af3Mohkz4SDOrsvLGMTAUtFksQXU=;
        b=Bq6pUmBjvYrc2+/sVSVzyNc0gB/CQB035pUCxBUHQb2wmujEn4QIdeJMXUYGah5OHi
         xav79mtqxB/WBGy0ZTSyMpfCbwfGLsLsfySJGBa5nuIprcgEvNdCgQFlYn0jmqy7LsSN
         H/Av5ttEAo6bk9zvhZlmE+OjAWYHx/b8ufjFemuBHl2jb22JLoNRglBj53hgehs235FN
         +8dhGHaF4LzESKUrOeJ06KYBpeLWIAKua+7bAeFy5eX7I7CGe+kxaA+EfGUUvRfZbVgY
         GtywitgajS+4k3vTqhyHrVp9PXoJqaK4nO9ABHoRbC/nEl9u4LCe3K2FuvW2JBBGtj93
         pKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769019272; x=1769624072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p7R0UOIllmfuEL/af3Mohkz4SDOrsvLGMTAUtFksQXU=;
        b=Ym7GQS9AqqIesegdyueAQMIh6757pLZnNHp2n9xiZE4P397GF7rRF1QFKxYM4OAcnJ
         TRyEviHo2rl7k1kNLlFbwLg6ARpeL/GwDpnj9cqYkWs7x+wQvjOvwKjEeoqugbQuDK+I
         Pl67DaAbwPUHHSQiN05HuQ+EPWlra20EFSMUNubs7UTOO9gIdiwSjQztuvKGtTVBAB3o
         5HyV+vgFe8CmwamZTKRqikvjXQTmqeG0CoPbRnYgxhDXu262A8AysBaoADN8JOaLdMrm
         BNkxMtkYnmNP59lSj7A/USf+k1rE1lTM6GRBw9/dxHa5kvsDS0CQWihiE0w3eAYQ4yx/
         u1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsQlC734GSmilzzDnXYiGdDa+WTYhEeMfcr/bbk+l9KCFVtrAvs7ukkQTt2qWG4YLvU9UdItV1KRWK@vger.kernel.org
X-Gm-Message-State: AOJu0YwDsgSX+kI60RPVh4BrtHHHABuWtQwG6n2ES2gNAPxDsmW89VtV
	R0fmIZIcQ4NkWw/n9yDuzF7f8+rGGJorno+cplk+kblh9rkNMMkgfw45OBCf+sDiOxn8UpTm0kE
	SnRvxufj/WXAq85TcQWd5Bi2zAoFAWSI=
X-Gm-Gg: AZuq6aIbFo8+R1crjZDJRZoYToghC3Z41KKCMW8BoRQFzFlBKMaCVo8eQ4UXLQQ92fL
	kt/Uf7k29qXeLVl56bgxi0CIkeq+SX0y1/SBRG6Pc1qR7WvrTJLX8hvhgVk758N2T3LmtdXoDmh
	nfqGf5ovkGzRJLn9v8wlDeM13qDae0fNJox4PnkeFYPjeiot5mGC0OKO+wX9ay9SR6brO4BYEAq
	BylSO+AMHRxIxCljYuEVonbjXluJjxH+37BSMYdYS0GfReF19nH9tL6JUXc9CHrhU4TKBCRFoNj
	/7Au6+TAA3PU+lGUk8l5wULItqHNG3vd35cZdDw31gVvN6CQm09TqYB9XdiABSkBc3NMYuYYrsz
	+0KElPHMohEVLsGcA1wN2pLM=
X-Received: by 2002:a05:7301:6084:b0:2b7:24fc:f625 with SMTP id
 5a478bee46e88-2b724fd292dmr63969eec.0.1769019272355; Wed, 21 Jan 2026
 10:14:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXEJZ88g0Ng2dIQ4@sirena.org.uk> <CANiq72nC3-k07aGpw8Bp-sbJcYa432yvtXwxrqNgNj8aFuvR1g@mail.gmail.com>
 <52b22a1d-b135-46f4-82ca-1c54574215d7@sirena.org.uk>
In-Reply-To: <52b22a1d-b135-46f4-82ca-1c54574215d7@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 19:14:19 +0100
X-Gm-Features: AZwV_Qi8nzSzg0uQ6zKZSdu2fg-BXmqFAJlPufWS1toDwh8VO7Dwasm1Yv0dBLc
Message-ID: <CANiq72=NO8V3MkS2m5gN7-kKzBSwO8UbVgQZPE_tMGzmSCSw=A@mail.gmail.com>
Subject: Re: linux-next: build failure in the final build
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Beata Michalska <beata.michalska@arm.com>, Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
	Rob Herring <robh@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 6:25=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Ah, sorry - I missed his signoff below the Link: trailer separate to the
> rest of the author signoffs.  Copying the Cc list from the blamed commit
> is a manual process for build failures, my mistake.

No worries, happy to help! I indeed thought that part was probably
semi-automated.

Cheers,
Miguel
