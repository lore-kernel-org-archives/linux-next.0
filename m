Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3EE3FA5F9
	for <linux-next@vger.kernel.org>; Tue,  2 Jun 2026 17:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421190; cv=pass; b=YmGawXwqrdkwAEs/6N/Le1I2WzOl79sbaEQ6WzOSbGPjotM0QLnpwKD8du8UzLMyqU5xE4VtiDug+OtoCdIR5R1UwnBVSCECAntBg5VTU9oWIBe4wmczPjaD/e72Lu7TIsZTkibSGQ+QmC6SmNvP60yNyBwz0VAzQP8uiMxRQL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421190; c=relaxed/simple;
	bh=N2zSfTpJNCY4t5qOyP0bEyizCSmSRAoY7KosRj4sPVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSAgz/WhFnfTGBwSb9j5OxCg/bRVmzCpx/0aci+fSqxTudJnFEVQwm75DQ4rX4VIkfuNserWp3f2gcxmlHbhHMnLy039wXmoZPR98pv3BhoBhX7jG2m5Y6JiqnnfUH/PpZdFjalt47o7Fbr5cDoJH4S0p1z7k00JRxN7tXWNf08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CauyokWe; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CauyokWe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68ad1e513d3so9029418a12.0
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2026 10:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780421187; cv=none;
        d=google.com; s=arc-20240605;
        b=kG7g2Fcwv48CLMmrlfEIIG6k5CnwD4V9Bg/Zb6torybLOLJq7h44cS8gk11z6ynebB
         wJBm3dtyuA8FfAaVmeS7XT7CkXSlkqUQj7QJU0nl8LkXMjKpTrhxch1ikqvxHFuOxsXL
         k+7W5GwoAPFMNYQyMAFlYjykjbdxAXnAlcfo9cvkKNCkLEk8AR61x5nOtbbV42kPUCaS
         9I12UJIByIZpvOBnC/9ZRLI/nbnfQFKWeJPcFLUsz7uUTzjSzLTDKE91FPBlrGouwLrA
         vpC6jil5DVJs48zhJL9DTVchXvM1/51WNXnxZAdc6cul6b8hiBzWxfX3HhgPQSEvO/Z1
         UG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ho8QkYK+Vpwcxs/VwgFPXZbnPKw5fMjoiOMIsH7CC04=;
        fh=EVgwhFqWFu/q8XmNK8b9SeXlfFIglvL4qdkkfa6RlxY=;
        b=cZC1t/GwKzP3ysjqSdGdvOz6svh2t5e7mjat1v56rfJW3STFy2N5kLKWyJuyXV0JfZ
         Cyvj9AhC9pCLcMl3clyOPMhFIIa2n9cPgbiytBzcXwFQ6pcm9ANIHbMnBNwQw15rxh9l
         dX7VaUFhuQEr7h9SjUUoXl9Ilra/TxxB+Y+Xck6jjdw91z6m7gxhJ3CtPydWMNjvw6ng
         PsoZKIKWCZNw+Ifmxe/FHZbN67t/Ux8oS5OPAQ/q0zNiwUDzSdz7NqGy6psvSuZ3WU+y
         9aNdiJb0ikzsYuS7AXby5wD2zUDg3f2lBhqus0NgXspJW2ojkWLR4hUuRiMLnZkENSll
         36Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1780421187; x=1781025987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ho8QkYK+Vpwcxs/VwgFPXZbnPKw5fMjoiOMIsH7CC04=;
        b=CauyokWezlvbzCwO9w7wAu7iXK2YIYUTDAr2NF0lnPw/x6nU4UCptjnj9xKMdyy4T+
         n31Kl3rkOfRXAxSVe31eq48vHI08eiwVEfE7eS7Z2sn35xBxdzsFdz2xoRFS5ceaMcW5
         A/TGb1Wu2thAugJ4HkXP2DEZ5NQgjreeyOu68HKWwWxqA8Ow4VAISobHmhY3h3Wv/QjZ
         ggzf1v7iMicpV+OaSNnjW1B3ZcnB+uzDEDWkCQqNBCzCpJB9Q6d/T/D853mMsaVVtQgl
         Bpos4l5cQDZ5NkPS/rKgFsTn6MXjhnd9nHU7cPk5/8tbmlvd0Hio1w5biVKDDr5RK974
         LIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780421187; x=1781025987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ho8QkYK+Vpwcxs/VwgFPXZbnPKw5fMjoiOMIsH7CC04=;
        b=p70qg4fuZ5P+hH/jLvHnxyPqnoQ3S2twEITFQadTAVBK0oCMm74V29xTIA49ADz6lZ
         5b9A+jEiL/FF2x2xddF6/Roc7qJviVRXu6l654ftaD+9DnIWYErerQDHunvnpIHud55M
         VTuO4X5Uks63ZQGjgwm6T3uhqn4o4yQlt88KTMnpIDfYAmUN2pKFaLjYxuN62f7psqqW
         f/GYVG2gWCydVsgyghfHLt72bvrtvggifKNbmTBItXzm0OvEPepXLdtaoKKzmZ3uZVeZ
         D9bZDSa014vfz5y8rzka4Apsvzy0Q/CWZC0GT5wnOZfaQk5OOGGRbCvIhLSswPP7SjGV
         XCxA==
X-Forwarded-Encrypted: i=1; AFNElJ/MfDhtxYpvOFjZIl/Xz+zXkkcWJeVQGE63d6SFwJUCRTScKHGlOebmYx3Fokbbqoj7LENVu/pyeJT+@vger.kernel.org
X-Gm-Message-State: AOJu0YyN1IK/4MLUfvPZPGpNesEv2M2i1diPTcZw8HPG23PFSOQ/Mybk
	Dr474+kro5tXJ4f7A5AUDi0aYdOXQS2NwdJ2v8aTgaG+XbPQB/Eao63Bh5/8qUyRIl92YBSsA65
	NNklfXjX3k4/s56BUAovx4HdlewozoOLINOyRNyyX
X-Gm-Gg: Acq92OGwkUP4dishSRxX56lpTK1cN/u6uc3ZKkGfinneVUMG7XlEMu4ztoUHXlEqaUe
	aw8+SsPLzt24YIZI8kHE+Z/GJ7rk+ML8EkVStuXQHjRIsjByDLpEQXlJpDeZMoSA6VGF6yAHYSC
	WNF2+tWOReZ32R7/fdZyjZEbXnuKS9Zz/jkSwAghj1lFHY2PVxn9Sc/hn6yzI3ed57tGFGBXjU6
	Xm1jp1JMCx+mvEGvDMQ4AKWcoumkiA8CvV3y09sn1AAqBMNrIz/cBLzNCNukBOSdOu7idp8V+ge
	rXeA7zx/8vX0YYF4KQ==
X-Received: by 2002:a05:6402:5417:b0:67f:99d8:868 with SMTP id
 4fb4d7f45d1cf-68e5d94b50amr370315a12.16.1780421187178; Tue, 02 Jun 2026
 10:26:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ah8BzqSmZO40xYhS@sirena.org.uk> <CAHC9VhRR4mmkOdWwUCLswmA+_KEjB8RCBBTJ2W4JGiLUWKzxyQ@mail.gmail.com>
 <f7892d83-64cb-460f-87c8-ebc7fb4476f4@iogearbox.net>
In-Reply-To: <f7892d83-64cb-460f-87c8-ebc7fb4476f4@iogearbox.net>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 2 Jun 2026 13:26:12 -0400
X-Gm-Features: AVHnY4KXJdTKb86IwXDncHxbtqVCvwUqkbs2YhZ2hnshZqTYs_erOE_rsX9CAPE
Message-ID: <CAHC9VhQPc52RQpTN41NpipM6U+DBB2CWRjdwh-ykhDkfZACrLw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the security tree
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Mark Brown <broonie@kernel.org>, Blaise Boscaccy <bboscaccy@linux.microsoft.com>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 12:52=E2=80=AFPM Daniel Borkmann <daniel@iogearbox.n=
et> wrote:
> On 6/2/26 6:31 PM, Paul Moore wrote:
> > On Tue, Jun 2, 2026 at 12:16=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> >>
> >>
> >> After merging the security tree, today's linux-next build (x86_64
> >> allmodconfig) failed like this:
> >>
> >> /tmp/next/build/security/hornet/hornet_lsm.c:212:36: error: too many a=
rguments to function call, expected 1, have 3
> >>    212 |                         if (map->ops->map_get_hash(map, SHA25=
6_DIGEST_SIZE, hash))
> >>        |                             ~~~~~~~~~~~~~~~~~~~~~~      ^~~~~=
~~~~~~~~~~~~~~~~~~~
> >> /tmp/next/build/include/crypto/sha2.h:14:33: note: expanded from macro=
 'SHA256_DIGEST_SIZE'
> >>     14 | #define SHA256_DIGEST_SIZE      32
> >>        |                                 ^
> >>
> >>
> >> Caused by commit
> >>
> >>    c62310df81899 (lsm: introduce the Hornet LSM)
> >>
> >> interacting with
> >>
> >>    c48c3a7e7d5be (bpf: Drop redundant hash_buf from map_get_hash opera=
tion)
> >>
> >> from the bpf-next tree.  I have reverted the latter commit, the new LS=
M
> >> means that the assumption in the changelog that there is only one call=
er
> >> isn't true and it seems like the most straightforward approach.
> >
> > Thanks Mark, we're taking a look at it now and should have a
> > fix/answer later today.
>
> Sigh, hornet should _not_ be merged to begin with for the many reasons st=
ated.
> Messing around with BPF internals is yet another one aside from a really =
bad
> user experience of having multiple approaches to BPF signing !

Sigh, if the BPF devs had shown any interest in working with Blaise to
arrive at a solution that met the security goals we described (and not
necessarily what the BPF devs continue to mischaracterize) there would
be no need for Hornet.  You are free to be upset about Hornet's
existence, but you need to be realistic about the role the BPF dev
community played in creating Hornet.

--=20
paul-moore.com
