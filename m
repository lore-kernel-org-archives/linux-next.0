Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBDD3DB65F
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838367; cv=pass; b=mj7Co0gJyjQRC21p1w+EndK5smjZK369w5nP3qj/4R32YbGplE6rCiABOnyba8YWBQHk6msh5W8bc5cd2h7amiaFh3MSXqOdpGj04w1uJfXKNviYRuONdk7WVKS2arc5Ni3mkondDJjQ3OFyKVTS32GlyzC1ZoRcRK3gX3B1nSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838367; c=relaxed/simple;
	bh=lkzrT07a8/Qg46Fp9kKMFKI1f9fKUzYQJv/j5e0aJzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+lpFBRGhWEMYnTOxiOZf0zXwiitGZHCTsIzMwkhvszWUxizEyVbg4CYaP0y6m2EwLVZ2GkKwnCaPgBKVM4GvK2i/25WicOoJuOOdNZRB4llyU9d50Bu5BNteZJyZp/6N2ScFyU51GaNfFPrI2BBzy+3B1m0v26bX4SjR4craoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVjK9sxt; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVjK9sxt"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8d4694105e5so167312085a.1
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 09:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775838365; cv=none;
        d=google.com; s=arc-20240605;
        b=QshI5JKzzvEiTOzxL0JJu2FSFuiom3pLhYAPOxU+PeSK+NNQy10AGfzIaDgLVVagOg
         73AtX0yBHvdw+jMxi3cNVsrhiNVgLTrSlD+mG7ZzZAnF4i+aRxq0zSJT7thXZhsSAcpQ
         WnkkmCcySTqdCy4nCuyoq+Rg0yo6nyAHGo287eJ3rSOn0LMKbUyCtAU8XatK/J4qTEsq
         KSrYUmtcqBpuitREXP3Q1Si3PO6XSq5ImaxNldalv+vDQc8NYo3OZkzJ1L5JgwMT155v
         D1bMYb+iBBZIxtzVfrQy5j1nVuuuA2dM1PzGa+sXRvJ9DPX8vUzn97OUJKCj0wKVxL7h
         eSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y5zcGD70rMW3J3k9zmjVKV4kgX1S9eCtey5rqaqexSc=;
        fh=RAM2gfjtqXC9tVsveoXyhme7OTJWjF/f+YeZMCQJdeQ=;
        b=V7PlA1P1ZRe0bmDM9K2LvoB3QTa1XJlomhf7TeDVZQR7bKa9Corh9Gj42YuV5YynO9
         NVpMMsm3wkHycxqu/6IHf44E31dSPhDfdsr42RG0gP1ABuHN5HZuCJJBD1SirtpKfxW6
         7sFFxDuizAjh4GueOal2GLswgZgCn5vSi4n7gtXkVtoio61FXgmQrbx+Vvv2GwDtekuJ
         R6a98N+W1CIMCwFkTJy3LTGqsLJdIbSC9xZcFYdi7NYY1jL0q0zkDRUIJHvhxs6vwF/A
         uLd6ZA8nH4qAaWK/6LZiQUaM5j3qbKAAvUwgdaTAl8syWIAeJBcelh//yuLmtmyOC3FD
         riRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775838365; x=1776443165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5zcGD70rMW3J3k9zmjVKV4kgX1S9eCtey5rqaqexSc=;
        b=IVjK9sxtrWP14IlVT7zCe/IP2faPYVVJvYN6ORWO9s6HIUX2ldnXXAafeEfLHQQZo/
         G7+7yXOykPOTIawj8aTWE2CdvRKn7a1jWekbsr7EFfg3E3QSEwLe6IniAQoDdgdPlN3+
         PLiZeCArrCslwmYegO3yaBzRYuTasSl0qqAKYkiGaFMFCFJEWuCYQ6HUGCysY+zlKoA7
         VyvglogGWwwDvnIica871uTxPyWk9+XXkAtgp86riAIxDMzpvwVPUVmrLBb2a0V0MfUs
         r0jP/iB8aS295YR+LqGK3fuMsDCeJzMhCFkqTyaD0URRZ3KYe04CQF6fhLZFO8S7uWpO
         OORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775838365; x=1776443165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y5zcGD70rMW3J3k9zmjVKV4kgX1S9eCtey5rqaqexSc=;
        b=FoP/7K60kr5g4xRMUB33IRpsy28ypOuFJVjjbuEmQalyvuMDXhgT6uIWAaCuhnOqTR
         9M/qT7jEo0kESnkhzAQYwP/I0rJjRYrHLx45dGI7YhtNserkvDn5FKd+Ucp1cg5iifGQ
         5g2diuIbX1LQlIUULB43KceIszoSYkXKg+hGAM5Ru2JnlX6CGo3uIofn2s0NBaaDW0Sc
         v9Y8vAWNZoydT0XAbE22Uf9zkGxl7oJhZh2GR5f0TGob8VAPHItH++09NFevVUl7hDXf
         idmOPFOtJN5NzoN/AwfXeLAx0q4ZTmpqb66t4xxvomqURQVXTJ9FoW1CsbCebHlvDrTf
         Rvzg==
X-Forwarded-Encrypted: i=1; AJvYcCXxHxoDZebJ27vtPvN+A11yTXd3X8MM+j72kUBaPtVrmRrNErY48AFyk8vM5yPaTM5UaMTtKrQj4EIy@vger.kernel.org
X-Gm-Message-State: AOJu0YxbskpxSQE1ydsE4+FRSSsht/cV4qFCrcCZS0Qwlh0od7A0rTdG
	GVIDItGFwwtosjJ4qnKQ4MzgTZyFxpmPXqctQuVy9RNHFlFctGVxhY9vH0kZkUjbBAzNAmiJdhN
	7uBHfCTyXMV7IJ90ohzdYLye/tckM76k=
X-Gm-Gg: AeBDiet3MdnKmJZzyhTBuUa6/WHpQfZSGv7vdPM2HejtDK0I+Id4KnNJFxLlwRJwgn4
	8HUz+R5WwEQMBPp7VoTOBJKykMhL98AV63WsaGamw88tFYYKBC7EKjfrorNaDUesAisvoU9Xuue
	XWtfwb4v4U7OBmUUsmCKa0QWoTjWKcyVxbNwk5Gqh5trA7/Waszzb8udXUWqNgMCri2CLtQxL5M
	qHDZ/ph6pcNkKm+VBPrEz1A9G4h5uQwgNVQdaOa7ATUh0260OkGK8Hhp6Hl4s1lgQ70dgJDzOVq
	Mx+73Ne334yB0NHScKcj2x79yExbw4VDlDzKkIXS6uVHs0sJTpsbp+Ec74OgjcdWJPenRUqhjng
	uwqNh/ljpdro9ILb180rRM4VMptyYMPzOzPcDfvVfEyhuEiBh0uevkxH0g6Jm0u9lZ9yu28lUhI
	tynt7Idujs9/8IIu6VbC6KUtXQZrzSbaja
X-Received: by 2002:a0c:e017:0:b0:89c:4d3e:fa41 with SMTP id
 6a1803df08f44-8ac860e881bmr47833156d6.12.1775838365363; Fri, 10 Apr 2026
 09:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410150247.93178-2-venkat88@linux.ibm.com> <f2beb294-1fa3-4370-906b-570616fc4b88@chenxiaosong.com>
In-Reply-To: <f2beb294-1fa3-4370-906b-570616fc4b88@chenxiaosong.com>
From: Steve French <smfrench@gmail.com>
Date: Fri, 10 Apr 2026 11:25:52 -0500
X-Gm-Features: AQROBzBcRk3OMNIRbgJ331ZgxpUFolQQJGCjrJObqeA8QNkoUhRYo8deNTlG2-g
Message-ID: <CAH2r5mup=BpCfa9sr8Q+0qVswTBXcbCHs_sCD0JwfL=XHSuApA@mail.gmail.com>
Subject: Re: [PATCH v3] smb: client: add missing MODULE_DESCRIPTION() to smb1maperror_test
To: ChenXiaoSong <chenxiaosong@chenxiaosong.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, sfrench@samba.org, pc@manguebit.org, 
	skb99@linux.ibm.com, maddy@linux.ibm.com, linux-cifs@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

added to cifs-2.6.git for-next

On Fri, Apr 10, 2026 at 10:59=E2=80=AFAM ChenXiaoSong
<chenxiaosong@chenxiaosong.com> wrote:
>
> Looks good to me. Feel free to add:
> Reviewed-by: ChenXiaoSong <chenxiaosong@kylinos.cn>
>
> On 4/10/26 23:02, Venkat Rao Bagalkote wrote:
> > On the latest linux-next following modpost warning is reported:
> >
> >    WARNING: modpost: missing MODULE_DESCRIPTION() in
> >    fs/smb/client/smb1maperror_test.o
> >
> > Add MODULE_DESCRIPTION() to the test module to fix the warning.
> >
> > Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > ---
> > Changes in v3:
> > - Update MODULE_DESCRIPTION as suggested in review
> >
> >   fs/smb/client/smb1maperror_test.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/fs/smb/client/smb1maperror_test.c b/fs/smb/client/smb1mape=
rror_test.c
> > index 820c0dd3bcce..2caaf11228ef 100644
> > --- a/fs/smb/client/smb1maperror_test.c
> > +++ b/fs/smb/client/smb1maperror_test.c
> > @@ -74,3 +74,4 @@ static struct kunit_suite maperror_suite =3D {
> >   kunit_test_suite(maperror_suite);
> >
> >   MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("KUnit tests of SMB1 maperror");
>
> --
> ChenXiaoSong <chenxiaosong@kylinos.cn>
> Chinese Homepage: chenxiaosong.com
> English Homepage: chenxiaosong.com/en
>
>


--=20
Thanks,

Steve
