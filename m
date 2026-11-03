Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727608;
	b=CbBmFKEXgqrPepCkWQJjqYw+VBSgSUmvPuYaVubbUIUGBjXzMMtw1M9TDp02z1k05+oC
	 OrhWSNFzgVTTJLeb8uC0g6JEA8rnkebZot+XEwfRe3bnugbOkLkar2zIJ3XPybm3w/yQO
	 jQe/B6w94rwCvgROKTntPcIdNhzpRhVC0VR1Z/H/VP6d+4VuRv0uCcPnagGhK77/Y5SJO
	 tLnGBjWY2uGC7BzvtB2D30Uwf2xi7KkXCUI0XXqCFrgBuq7zCcCY4DlvgEcX+K6AiFaxh
	 ac18nuPoU9JwF8TDDLMzoTW4cjWbhwqhA0zht6Hys2sMabpuXXfW6iyS1tJOM/VD70A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=z0GygfKxw4B27PwG3wjW8LBVwALAwJtEQDPEKGZVDSU=;
	b=lFF77tmxSdpKKllXTzMc8QlAyaJJmnh3tUBgifWMDEWchc+5CdZSQaKecR59ajfdaIY6
	 omj2aTqQA7BC/tCX8zjlC+IUzPOtd4hWkQ+q+3xWUZckmkwFHFYYxesQiHsUPj6TqfnIR
	 Y3sit9koW9WG+gqya7tRY3wbOBqYCQ/2hF0hTEjvVvNm5tJUVdage/yZjMARA8KnqAtdm
	 XuyCMzSGbmUq3860aqoEz8nh/ywfXuHHY7lUEeWGMl9cF33XqeynfpZe7B8ZRxzUDZrj9
	 PIOcaNvqufbUOTUN+PUPJ8pHFBV/wbkPpDFLc1FURuZO4ZAWsXE0ZQfRb67ySj62duA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Egji2Ggt;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D66606A32C
	for <linux-next@vger.kernel.org>; Tue,  3 Nov 2026 17:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85D66606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Egji2Ggt
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06c60065fso3128116b3a.1
        for <linux-next@vger.kernel.org>; Tue, 03 Nov 2026 09:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793727608; x=1794332408; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z0GygfKxw4B27PwG3wjW8LBVwALAwJtEQDPEKGZVDSU=;
        b=Egji2GgtKG8VkxnFY8MI7OhQDJQOYjTtc03HGW9e0YX04Mm9lrjtPi0Gp7a2LT/NcQ
         dNQ9qbVR7aj38zHNtO/eHIFry0UrPZ5p/4o8cG3V7LjI5J+fW/2ZlSImoNIQ91tjRwJb
         kR91N1plurobXIQ4JEDgVMf9l507Y7VOVSYKf4q2hV4F7jQ7SRYI+plm1i/JHfZ/5eJ/
         4iJeHBhFKyG8IG7zOr/OjF3j+HdKg8aZLqCK/rbVITTktDpYOgF/HvUZbQQ5jUCY34nN
         wVpw3RDmIRgiUArIOooIzABR6UBAJYJHbY/WK6GoZyK2v63CRpboh723SaF1/ZuiITtN
         o27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727608; x=1794332408;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0GygfKxw4B27PwG3wjW8LBVwALAwJtEQDPEKGZVDSU=;
        b=18VAn+ZM0I8lVTrjH4WFRjithPlNBKKdEOVcOLdqc5cJXbR9TxMkC3Q3H2NwKYFTje
         IH8i9ZwuDm/Gp7DJ0+IMk8Tg//xtxW4SeVFpefslXdQvmmaelopW23L6MqUqcf+Xvw+p
         XRqliDkhs24hIOLR9gLXEdNrPol+ONGB41eJD7xQeWU47yp3ZgMmDK5jqMl7O/1BKbB3
         rV0K90M29RNdoHvWzCpkzq+82Or0yVUeEKgndIWAc/maBFlYOBj1PafdkRPFjn2fef7x
         vvPyD3HdI8p5ae9vi1Oa/VNk4/WTqp2fU9lRupTFjm9uvg+xea8DTbF80Qed73daYYj7
         tLVw==
X-Forwarded-Encrypted: i=1; AKwUvBw0Z/Ct/6cvaVnp716XcH7Rc08guLBRFm8/Y1lHzn5IueWflzygNVjNswEQEiwRa69dAYDqrWzlx5eO@vger.kernel.org
X-Gm-Message-State: APuU4Z+nvZWvNvT0Ns8RetUWnLymE8XT7areRbwGJGQC1JI+c3GTmP1O
	Gvp6ywdkg5K0yGuUbrKX/43cUM70s0vwz4UdAbl9JvPDYnBx9jDYOQ42
X-Gm-Gg: AYBFou3uXPmYv4Vz578SSq6JrLDQiK4v3lQrMqXptb919uX2wVRui4Gz5VaGral4gcy
	HZUtZZHeBiTD9ptRGGQgjwpfODsKHfznV396nN6B4yy2GDZOMO74A5sF8KtLPsShf4tp+k99zPe
	9k0VaT6C8sO8OJ+4Bht7mpbxoMbFJ4eWBJJHv1RAHnLCE0H1RC348iCX6zk0HENYCQwQXm6A9o6
	4mQjGwf5ema9du4bE0HaHn5eV48vVYiMJCnsUb9mg808hVLJZG/ch/Kq4cfddiWwkGle8kiD9Td
	UzBp3F+2WjqYALXuSaGfg40pOo1Y4MWu4B2Jxv1eI/g04fYfPS+S1QFTZ7eaiiazPJ0OQeqhR7u
	xNeQhNycJYBFEZ4M9sEKLI4RQmAXNZGvrLMaK4KgX9OcphZ+2spJhLKAuqoZNemrbCbYCxgespY
	Xu0/vJXDPRmQ+WbGY2P99oJihU19bb3+fvZc7Ln/RJgKBL1v1m5j3yzJkd0OUEMY2ISeB7DOK+l
	Q+514iSOWjiSq3L9GjafsmbVr03WZk1m0Bc86pzZcYbinKhYhurGetrHTiBZCjWLnRTnc6gcgr2
	n2EDYBsl6sItIvhPBWSpfCccBnDjjMrVkbjdnIEpOGnxpiIMlbcQIuja/kQtXRCQjB0SovD2lx1
	ujI8qm5/lQNh7/z/f+hxzAGfwZ8dk6PUaSvGNn/nkEDqh5MGB/2l7OQS6
X-Received: by 2002:a05:6a00:290f:b0:8a3:df84:4c14 with SMTP id d2e1a72fcca58-8a9bee525bbmr10517197b3a.57.1793727606391;
        Tue, 03 Nov 2026 09:40:06 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d3603sm3435238b3a.37.2026.11.03.09.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:40:05 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 17:40:04 +0000
Message-Id: <DMLRD9KZPGMA.17182J5DEZ43B@gmail.com>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>, "Qiliang Yuan"
 <odys.yuan@gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <aunq4v24N-Gzx_n3@sirena.org.uk>
In-Reply-To: <aunq4v24N-Gzx_n3@sirena.org.uk>

On Tue Nov 3, 2026 at 2:08 PM UTC, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/fixups.c
>
> between commits:
>
>   ec274bb4665c2 ("bpf: One may_goto time slice per prog invocation")
>   1ddffb57b3623 ("bpf: Emit timed may_goto for JITed progs only")
>   1ddffb57b3623 ("bpf: Emit timed may_goto for JITed progs only")
>
> from the bpf tree and commit:
>
>   a7a767c66a2e2 ("bpf: Queue the rewrites of bpf_do_misc_fixups()")
>
> and likely others from the bpf-next tree.  Given the nature of the
> conflict and my total lack of familiarity with this code it seems
> vanishingly unlikely that I'd be able to do a sensible merge here,
> instead I will hold the bpf-next tree at the version from next-20261102.
> If someone could help me out with the merge here that would be very much
> appreciated.
>
> The conflict is:

Yep. It wasn't easy.
bpf tree is now ffwded and merged into bpf-next.
Conflict is resolved.

