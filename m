Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7123CF03F
	for <linux-next@vger.kernel.org>; Wed, 15 Apr 2026 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261328; cv=pass; b=j87M/RfdQ2quDZNcHsJwgJOoHFIJvOhHZH8owYmdRMPPiMN5kJsXURZiIhJjMfM03vlTaLcXbqd0gKfjRSx2iajRZQlvUfxGC6poz/XK9B6BssVuj+GUzvxL3ToCDDuPpgSDB9H3PJEGCiae+nYEVx9Uyu9rDpMCHlU1WqX+jGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261328; c=relaxed/simple;
	bh=UpT0EKObg+jQzJ6YaNvY/P94MAqyWqCigqU3uXMRPM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAu/BVSFJhqpbF2TLNuGKcQjngJuwtwm6SMswsGYc//j84Z1gyx1Ur5rK9Hm6YVUD4kxI/C4i1HIujyJFDTDrfq0vxG7EyEGt+kLNNy1wawaDj+6NODYqi1vZsBr0pg1MX9BinfFiiEIMJ34XJqLB+tYgekFlT3b12Uwx5OliTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXpBwPc9; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXpBwPc9"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8a3970f1a0eso76862556d6.2
        for <linux-next@vger.kernel.org>; Wed, 15 Apr 2026 06:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776261325; cv=none;
        d=google.com; s=arc-20240605;
        b=ejsdQZ26sFt41KnbwaK2VE/hmBWhHyjA1rR5GybxqFOlYetWwN5j2zn2LBYY9dOicF
         9eH+MQeTB/OUkFTLvcxtjSvnFq9vTwfWnC0vPh0qNfeKjEG7r+959rRhXF4bvIhOgRBl
         6FLCgOXmhqUNKXtOgsSKGGketoVaLs5VTBZ1ZmU4/hBBoQjhHu5+eW1PSGOvYYnnRnJM
         wIudITDYoJeaTy9dYIJQDQoYi8QUNZ4ALv2ANnIKgaXvYBpVcIJHtjtatPnA9OFnDkZ4
         XF2rcP6nV602JHovml2GM+5mxY2SNY2DpClGjPsoNizPQE8YPmBzrVNOnigLRiR374yS
         XQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2kBf89uxyRhEvxT1gNsF/PxAWS7XuFq6Zxwh4oMnGdE=;
        fh=PTBJvocP8nquS2qs/aSE78uB/Jby1BW0Mt8UVWrHwDQ=;
        b=lJpanTA7YFsqoDmT7ZzX4W3AkyHxWRnqjGfLAt649z/AbdiLOsA5AlJKexmUCTDwM/
         H93PGthIk5DHgwb/MWM1nn2LowIwtd5jt2DsssRVS0GXHXB3bha2z0FweNyWxIFSsLRl
         05hJR4xwr8qqk36xb2YBPPr3BD9w7/s8qrLXs2q7V+NtlYRyMWP2oUMGY+LJLCqzS4Dx
         pmgq8J9YTDJmb6pPjvrLsX8KLXioYYqOZIWcAMRPgZ9vWfhnskTXXnNecFzxq90uJDKz
         DXtbPh+YzP5mvKPSdtdRRYJepWimM9/B6l+mDnzMNms3+CxWhjpfjv7kIWWndW9JwCLj
         +Rrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776261325; x=1776866125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kBf89uxyRhEvxT1gNsF/PxAWS7XuFq6Zxwh4oMnGdE=;
        b=bXpBwPc9tQVk1+ls+xt2zNK7IB+HnhiY3fUnL0D48IsywtEFJ6FOrsUrmob5lX2FDv
         hKbCxWcRasqwOKt6hK0MW9b9QlMAKAjTDAqNwPnTyq13tPkbPSJnlNjGvIkSjfzjv7XX
         KlOHl+iww9jYamGzeEjS8SEkV8PvEpy5rqQBjQMp9kxMuMAU26EGhLD6U4jrt52rAwSL
         ZR4pVkT8Ng+tReunE/EaSBa52pchaZy8GliGAEgVDpNDIIJ3NGUmGS/iZkps83gIS1W0
         F4jCOiPCMF2XOeCHxYS5pH4NiK661YwDAWs17diAUcUwE0uTJWp04bwX7sAI3yCez85j
         zenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776261325; x=1776866125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2kBf89uxyRhEvxT1gNsF/PxAWS7XuFq6Zxwh4oMnGdE=;
        b=YJYyFvKlMJobtPTwCG9E0OtZ4CyB+8cuuBmUnbwlRHRA1LdhH8GKZGTrn5hkrPlLbV
         S49SD69DmhkKhfXuLt51GnoMzoKqQrQhVYDRz+Ci7Z8vIsvf+hCrSjlqZeOveJO+xtoL
         jE803haFqLXNLHjzBy+JroGu08O/hhsbUbdbQEm1rgpAa47A5UJd4aeLUYZvI/ByJzr9
         SLD2E/Uedjlt0fXFydMoQpX9mrujo1gio2wE7vk/UWQlT5J5D8da6LLMNlyWLHWvKjdk
         9L85O/GRS3vU2QBZqUphqw7ihRyqRATgtOwZT0ArQEsvkXfxxRVzIzu0YKLZFn80PPkP
         NyKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9leQzZw+G2KqtJsf0viYiHdJzUxw7oJzPUez+7g5zqDEpOHmJVJ5l1TAyudS3jXrZCOr90hiXH1ixY@vger.kernel.org
X-Gm-Message-State: AOJu0YxTUoTvY0E9MuzxK4oHTvOez7m3ebIF7hJtSw9WprWTDW3HtBKu
	Ua7j6tJFGGeKA3ligVFdsSwjldIjVlpaBKj2FjNHaMvHV9jUC/e8ycldCUW4OPEzhtUnNK36zEe
	1xxFiSqDcqEhoYqnWUs+O7HOqQ2g3P+o=
X-Gm-Gg: AeBDiesXsaZGlyvPyPjWvhpRs3qul3Fm6kCj5oh3r057hJcgpCTVosduNUKI09nZp27
	l2mnWS92srgoD51NfPHS5ZUJen4gni1kMWBE+BKMKK1tvDSI7yCX8szuxigRnNpKWMJOCkKS2VX
	fAr9mG9wGVMNiuRLZin9jV3XWGI2pjqOjFeYFoIWKZzB1JcbF4SU3r6BxBSL6eQvQm20VrRPQsQ
	2arCd1thTusfkA2or/27WUU5J8XQWUpu7+3QEqyABVGEeVF0KRA7tW0kMERYiW3ltya9qkUFVX2
	jzvu1u9UlqOV77XPkFPG3NdV8W9m10R2xJKmd65zGeTqXMdyFXuAHMK0HjFlvQhdo5JVoRU7UQy
	4luTrNo/ogcqbeawMu8nC4s81ql8AMKuYK2nd0uQBHJlrgXtNKGcgSZWZ2nVwb4/tu8S8lwAek8
	creFw5kJ6e5ZAx0wTpYC2a8yzPUO9dRGtOylszo6SczEc=
X-Received: by 2002:a05:6214:4985:b0:89c:4c6b:4615 with SMTP id
 6a1803df08f44-8ac861547b7mr342507106d6.8.1776261325526; Wed, 15 Apr 2026
 06:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ad9r3jEtJJNv0IiA@sirena.org.uk>
In-Reply-To: <ad9r3jEtJJNv0IiA@sirena.org.uk>
From: Steve French <smfrench@gmail.com>
Date: Wed, 15 Apr 2026 08:55:14 -0500
X-Gm-Features: AQROBzBmh5DpYsR-bFwQMWvK7UtMrn-Fv0VZbpniWKuH9GrnyVn-JK5N-9uHCzg
Message-ID: <CAH2r5ms+Cstvmgoqs1bcfdqZcZOfJUBTR=kRBa_1J3FqmHuLaw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the cifs tree
To: Mark Brown <broonie@kernel.org>
Cc: CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

removed

It was missing a prereq patch

On Wed, Apr 15, 2026 at 5:43=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the cifs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/fs/smb/client/smb2ops.c: In function
> 'smb2_query_dir_first': /tmp/next/build/fs/smb/client/smb2ops.c:2655:70: =
error: 'CIFS_DYNAMIC_BUFFER' undeclared (first use in this function); did y=
ou mean 'CIFS_NO_BUFFER'?
>  2655 |                 rc =3D smb2_parse_query_directory(tcon, &combined=
_iov, CIFS_DYNAMIC_BUFFER,
>       |                                                                  =
    ^~~~~~~~~~~~~~~~~~~
>       |                                                                  =
    CIFS_NO_BUFFER
>
> Caused by commit
>
>   3777ce7e53f80 (cifs: optimize readdir for small directories)
>
> which really doesn't look like it's a fix - please note that we're in
> the merge window and only fixes should be being added at this point.
>
> I have used the tree from next-20260414 instead.



--=20
Thanks,

Steve
