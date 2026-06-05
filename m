Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7237BE8A
	for <linux-next@vger.kernel.org>; Fri,  5 Jun 2026 17:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780680358; cv=none; b=Frd7qT5DVhPe/hs7Ov2eFcvpsFLKB0qgJvKbc1H7ai9BNfKkSChbetwKo4IpyHk7fzztSy1XXj1wX3MLlhv/u5jccEeDeN/WcfEJRjZPpDraXbTzrSw58KzLiErzSKE6UiOUPo5Fa9B2yosDEhN+7vArJS6aVPsAzXwk3V3yUBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780680358; c=relaxed/simple;
	bh=HdIZAQh/9RFpUDLiDHRlKc6fZPdDRKlHrJyvQhmJD6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VptnQ+DzJn5vHrLMNvoxJODpLygFi/gn44P5ukmof0uCk0qGxe9zQCJMSB3y1P4bFuNOHgkbbqiVTHi/CB+dErt9gXelJG/FPZPCGh3K4CNUe8OGTw1D9mM546EtFdEYGekilOUxgE9NzRcWLXe2WkjkwiNqVMRw8gX8GsDdRKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LyH/JliW; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LyH/JliW"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68bac6e24fdso3193337a12.1
        for <linux-next@vger.kernel.org>; Fri, 05 Jun 2026 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1780680355; x=1781285155; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eClztFfJ+DkV18cFEkoMrmwHyQzCIK0BXK6wGWgeyF4=;
        b=LyH/JliWRnJPCiH1XArBq7Nzq/QVm9UJEyEA64WlyoiYXOochDr9n0yKXlik4VOgUN
         Eimd9MxEqjyjNzi8c6DhDOmkobIinfwDvp+M96e7yRMn+8Bhjwo9wRqOEPRDhNoSkb7V
         NISF8wMhlKJF5m4YXPJrTBbAFUSB1WkXUKqo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780680355; x=1781285155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eClztFfJ+DkV18cFEkoMrmwHyQzCIK0BXK6wGWgeyF4=;
        b=Cr4qobv34sEIwgdbKoOTlhPU/zR/1jEHjbWWy0bn6nkkdGUFn9yfQVwtiG+NtKo4hl
         PCJvQ5BHP0thhHb1WGVwP1YkFvLzFRpZxxNlw5zMx9sBviR5VzaTTc7ekNPB/Qrd1gb8
         GUQfDXHMNTiFKCMwY9NKNFYzjmS+yCBnWlVmFbBK7NbvnOS1njjV0Y3QpPiBjxAfet5g
         bbn7X97DfWGH8pSCPwCi1NqEkpBg0VngMZguE7q4oSpD0N6tAt7gED3ium9AKIka96kT
         oUQ40ik4jVuwkSM9xdtwgIhgt0hqzNzEyryfOfursazAvctXx39KCrTJJ2DJYG84fW/z
         QtTg==
X-Forwarded-Encrypted: i=1; AFNElJ+BRu5sXzoCeKgEtpi0uAwLDMa1C0L4PyKLMzZQcE/B2N7lVrufCSv9R2oU4zPKTjrQENNOVl90NqFF@vger.kernel.org
X-Gm-Message-State: AOJu0YzcSVvYbV6846HneaNazd4iexa7qAtcQ934xUKs6J+NBNFbeNHJ
	eowpvb4nTC99nlezNxa5gJUQlHrCFGtVvLf+moBg3iDbU/e9Y/GHk/5hklIHGUsjLuKfVK++bSK
	m17LKR7k1Jw==
X-Gm-Gg: Acq92OEFh/wRCNqYhCd4OFffjhTJOaoiGe+P6HEzYfq5/ZWzKQ0kfV5PNkbCObPo1/y
	36jkRRqJ+2C3wre9JNBgP3gPepq2sALPXEZJ83HJ/nE3ZNp06ErnRKiMVEHeaI7+cMSJ36JhPcm
	BVY8HR/TpPGLx21RHtjL0jDWxbeTMzyKp8O+PlKwiAiIcXnpDmxr9Ay7TFot3sE1LFhwD0Ra6CA
	1Y3O+KdWUjO8hTfIAWumloGVCMW8m0bZSo04jPY172fMw+0c6kdDzqUW+pLG7hmEvJRex4sAOGS
	rznVz8/JYyXK9UKe+s5Iq3Esp6J9zA0it+t0ZohsPV4cL9pICVC6DgS63Fa9FQqGm/IvomZjR3m
	22+05TNT22XuuGIWhTxqUHn5uO5l8UMoi9ilOfueGZepWFoaRvnGYerj/MUSJh4MhU8AIIignn7
	10gpQFZ396jAGFbAThu/DLnSuvpjWDx76OWeQvcWp8F+lNVHHI+vJoB6MMEVkcUhN6itUywt88v
	1ZF7aX7gT0=
X-Received: by 2002:a17:907:6e89:b0:bec:fd3d:4072 with SMTP id a640c23a62f3a-bf372931ca9mr250363866b.35.1780680355381;
        Fri, 05 Jun 2026 10:25:55 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055308063sm492893466b.48.2026.06.05.10.25.54
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 10:25:54 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bec49f7e35eso302472166b.2
        for <linux-next@vger.kernel.org>; Fri, 05 Jun 2026 10:25:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+y06jAeb4YmY+76F3gCU12Y8A+6UTKSxkv8PgdQtbNkbLXi7/dvUeEI3TTmfsqAVnmt3Nqm8F3/trx@vger.kernel.org
X-Received: by 2002:a17:907:cf8c:b0:bf1:7897:9477 with SMTP id
 a640c23a62f3a-bf370b6008dmr245196866b.18.1780680354400; Fri, 05 Jun 2026
 10:25:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <83f77b2b-8c00-424d-b6f9-b044e7ea1ee7@sirena.org.uk>
 <CAHk-=wj6CtZS9hbwFjQcoNkPwQLoyKmk8czaBF6=bBOCYuXEUQ@mail.gmail.com>
 <CAHC9VhRX1=tx4+arzuH76kirYFFJozexa5L=41Bb2QbgWZXOkQ@mail.gmail.com>
 <CAHk-=wj_rtiufEEVudMCSbh86HYrnmEa9NhYfKeWHs1SOzJVnA@mail.gmail.com>
 <CAHC9VhRXW_kyWXgYBqW3K-jSr5yN9wp1EPos1c=BFmiebxLiUQ@mail.gmail.com>
 <CAHk-=wij4nkMRcshzEGsxvjwP2RBQyaiQ4-vQrYTOqvQusxu9g@mail.gmail.com> <aiLS4wOtpqrpw4pA@mail.hallyn.com>
In-Reply-To: <aiLS4wOtpqrpw4pA@mail.hallyn.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 5 Jun 2026 10:25:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh7Zk0X=FyYc8gJpR1=U0wWJiiOzNzpDUj5PdJHd=ryiQ@mail.gmail.com>
X-Gm-Features: AVVi8CcLuRe75DJKrgOu14xG1-XM3Ks93m94kU_UVSFKHwmay-oxCn6KrAS5ua4
Message-ID: <CAHk-=wh7Zk0X=FyYc8gJpR1=U0wWJiiOzNzpDUj5PdJHd=ryiQ@mail.gmail.com>
Subject: Re: -next status as at v7.1-rc6
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Paul Moore <paul@paul-moore.com>, linux-security-module@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Blaise Boscaccy <bboscaccy@linux.microsoft.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2026 at 06:45, Serge E. Hallyn <serge@hallyn.com> wrote:
>
> The two most useful threads I believe were from a year ago,
> 20250502184421.1424368-1-bboscaccy@linux.microsoft.com
> and
> 20250528215037.2081066-1-bboscaccy@linux.microsoft.com
> which includes the proposal by the BPF side:
> https://lore.kernel.org/linux-security-module/CACYkzJ6VQUExfyt0=-FmXz46GHJh3d=FXh5j4KfexcEFbHV-vg@mail.gmail.com/

Ok, so that's not a thread I was cc'd on (and I'm not complaining -
this is not code that I *should* be cc'd on), but that does seem to
match what I saw in email discussions I've seen.

There clearly *have* been alternative proposals by the bpf people for
signed unprivileged eBPF.

And they have apparently been ignored for various reasons. And it's
not clear to me why LSM people think they can just ignore maintainers
in the subsystems they want to then check.

Now, again - I'm not claiming to be a subject expert, so I have to go
by maintainership trust. But as it stands now, I really don't see why
I would override the bpf maintainers' NAKs.

And that "as it stands now" obviously very much includes a "maybe in
the future I can be convinced that the bpf people are just being wrong
and overly difficult".

It certainly wouldn't be the first time kernel people have been ornery
and strongly opinionated and just loved arguing.

That's the kind of people we are.

                    Linus
