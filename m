Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EFD35C1B0
	for <linux-next@vger.kernel.org>; Tue,  7 Apr 2026 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775577176; cv=pass; b=GbXZpphbhuca5jR2BaWxWC/4joL0juBrR3dkktjGV42IQOWNHDnq12VIspM9QuseO0MaCtsDwzTRU1rDdhGMlZQ3Kz3YzWhWmiEmKRU0t4IQlnVIB+G45BPzIGejjWYBinufHoSK0zmoyb5zKnRfTRW0Y+OMvz5/ICcYUEOrn2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775577176; c=relaxed/simple;
	bh=uYA7Sv738FyT0NBuCem0vbgK1lEOBM/j0+n790yBBBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExFCJ1n3QOIIbbi/ykgnhCe3UGcwxzUmK3oMA98Gd75chBNq8hNZFhxoPaltmmKb1Z0R3K4jtPOsww8iNZ91vHaJWlSij+GotbnTX0gDaNfumcThRhXo0SobKbVj9wVRvO86PhPs5963meJ63soXMvZi88aocgkexxUUU33S350=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com; spf=pass smtp.mailfrom=omnibond.com; dkim=pass (2048-bit key) header.d=omnibond-com.20251104.gappssmtp.com header.i=@omnibond-com.20251104.gappssmtp.com header.b=wwa0Lnvi; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=omnibond-com.20251104.gappssmtp.com header.i=@omnibond-com.20251104.gappssmtp.com header.b="wwa0Lnvi"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2aae4816912so32955265ad.2
        for <linux-next@vger.kernel.org>; Tue, 07 Apr 2026 08:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775577168; cv=none;
        d=google.com; s=arc-20240605;
        b=ev8SfwlVOFVnDYGsTQ4T0bBkz/LpF5i3f91Bo5F9LcPr+BYfQbqlpZIG4wjgjLOzeR
         3r7D5XiTSpk1fXWMNBVM8189VfCQgfYAphLY+X0cAfhFP8Fp0JigweZRgr5UO6DLGarD
         XotsPfCd4ZknXaZHQc8kgchOwzqL+smFnyA5sUY6u/cPtTDNX/5wBqEho5g18L+47Y53
         IJS0gP+//rHimQNZanGRjymMRHqJtZB3bw5DNhN7eggiOfTMs/XUqrHvlc9221Sh1diM
         VhrUGxOpdbN91xV9dg8iVEhX/6MHkBaV4jMEnewdJ4V9hqONAyBmTYwU54jg25BZ6uCn
         EOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2oTNfAoknbpIIALfMFeCUyqniW1ITB6n9K+7aevpOLk=;
        fh=FattjNpjwZXi8qCMiYon+iLSw1gSnPgoTaCJkfXfTU4=;
        b=MkbbROUTOkTCQZBGvLbyzDBZXnXx8chinJ7Xut9YbxG+cSVbMDkhDTjIWgDij9WHhM
         n2x3LTAQsB0W2GvDACms/fLgaTzM5mLa2UsvN1y5Qrf9hx2ylusHhKBqQCuaCNEIdKfo
         o+qRZqL4insZG+8ZisZgW5EOUcVINf5WeAqog4/gpuxMCoNO337yivJ1SN4yQnVqGQi4
         bJLHfYG8sugYwm/FeSQQv5UQUg+YpQ8+2aSM8Pyp/5zI7npmHXJKI+kLP0XNxYCze/G5
         xRuII5k7KsKxF47a6OwwI3R1LS6b4bSo7oUb3etD9Urv/0v3pMT2pKBLBljiy6CzKd5g
         E7cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20251104.gappssmtp.com; s=20251104; t=1775577168; x=1776181968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oTNfAoknbpIIALfMFeCUyqniW1ITB6n9K+7aevpOLk=;
        b=wwa0Lnvi5rdfNd7nIs7T4DWcmOTyjT+k32QqtEuAhpQrkVdr8MPaVF0TkAhniy7qhs
         ITOROgP6OJdBXUBjn+PbNcnJ9V/okT+G/YfBroSx/jWVZRjtintf6md8BaYShHBm9/af
         bpF0mlDX1zwv7pu4G5SRfGUZ0o5HE3fdrklE6K8N2TtZeXH2gG3iI7eq+cqR+6IoSf+m
         daApt/O5yeFzZIVgG7/9gJjSP8dLF8AF+qO4c5yhfIAkCCmdEgE6h7+xJ/RHMkMattnW
         9uNxLizMHMCpq8R73AYVVoASKghfXwZnQIBejv44fzrJ5zZru9o6TruAlo9ikjJEQBCG
         yUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775577168; x=1776181968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2oTNfAoknbpIIALfMFeCUyqniW1ITB6n9K+7aevpOLk=;
        b=Ugi0txU3n3lAPBthp6yCh4ghxct5IUU35JuTo2uJ/RHnuHI1dsXg3+k5lceUS3ZNA1
         1pf8e6eZz3lpG2PiHg/eiGx7Me4jm6rjNBNUqxSzNrlpbqUqfIC0yYDWwYkIzZD1Xdy2
         /lS5Tiab08Sm65wlUQhROnO8aJ1tqxd8Yzx91P9KVCfKSyqjQO43ioUmLnqG/6IY/SpD
         jHuPQvEcHH7+p4nzFHOFOqpUHiVTs3M3dIOcN+KROBfVzSq1oKOgTZi4LON5+2uvISFG
         1BQZarWsHsFgC0XcxXSK9xGTd9bf2P9/oe3SkgQap9Yb8/w5CWIq+Bm+0ddvFyR9pOWh
         vgvg==
X-Forwarded-Encrypted: i=1; AJvYcCVkfuwoJdbzpc72OfwjhVxNzU66d0eUCmEbJc4+rFY2a8krpkoRUFo8jhMO9YF8Wa854e8T1kcba60S@vger.kernel.org
X-Gm-Message-State: AOJu0YzhcMhHTeZ5yCA4Ts8nrEuASG68tLWo/qAVt/LVJaDQYDoRTlnz
	bCfDkrhHIvl/LynUA4hHmqNXSGJjqPUFQoxGvg/nMOsqAMGuDBmDSydeYcAd5tuQLBwELsci/ky
	oziYqpRy9fsRhfx7S6lnL2BKjczlWSzAom7KCAThu
X-Gm-Gg: AeBDiev/9clTv0ytUiAXhgNunyXX/Z+nz/ZqGeMDbE2koOj6Lc78EFaOYu1J307lcPL
	/j0s+P/T06HPxmEOXY902uEwx2sy2NmUWqn7OXrqsznllLxuS0VJLOKeaPN2Yh2MSbX5A2YHzfV
	07CjeB2AZjdgnQtDfhZR7dXZzyO+tfdlY0s0Z/cd1NbrU4quPce3SziK4KGA/9ubEqbi8bD7GOc
	I0xF78ubzgdy+XMiJ8WCT4xC+eOlMM+892jYV0ZgA8Jvp0QhvJh4JP/DmcGb1MPjFE/aI0v6ldn
	TfX5BFpVG5s3es/lBsc7yByJ12jdqA==
X-Received: by 2002:a17:903:1c6:b0:2b2:6237:b0a with SMTP id
 d9443c01a7336-2b28188a924mr175029115ad.43.1775577168044; Tue, 07 Apr 2026
 08:52:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adTuuT0AkOUwxC6H@sirena.org.uk>
In-Reply-To: <adTuuT0AkOUwxC6H@sirena.org.uk>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 7 Apr 2026 11:52:36 -0400
X-Gm-Features: AQROBzBVaIMLFMtc8erWdAFm9MVnSnBSqjsYaRI9FDRB5AZ5UYz3jVge02-c870
Message-ID: <CAOg9mSQ5heun3eeo=sxYuxyuKD_Q7vk8=vUh=zBku3B9RwnsLA@mail.gmail.com>
Subject: Re: Missing signoff in the orangefs tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I added the needed signoff to
"orangefs: validate getxattr response length".

Thanks!

-Mike


-Mike

On Tue, Apr 7, 2026 at 7:47=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Commit
>
>   43bf488aba642 ("orangefs: validate getxattr response length")
>
> is missing a Signed-off-by from its committer
