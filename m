Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051030;
	b=KUWHEFMVtoYuprloBnWn8ugWvkOzpUFmfggnePikIad5Z/7s2vxOExJxPLRqk4rQq4R4
	 x2p0MX3unIQ0jZUbmL1wbWYyImGShU/gWRU6eYyDzkp4w7CHfdamg1D31a3yypCl8tBJo
	 sA2lNZMgVCzMKxjTTrxCIRYQR6uAQebqTlEwOuZa1E9eFb/KJzDwNtUFuydELdRN8NFlO
	 y3/bjYfkwrp/BdbTHWkjD69x/AAfrPnexnI19H6MtIduJkcEqvDXrJ3TkVczBCLf4LsZw
	 xMSSg1DluEr9De8zwRfi6WGknMJe1D0uBpmyj21z5S26ZH+82pRVZJU5XA4vV1hGGPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=59Vn+6ZCrn4bkmigHbGhLn/ZQOyW7NScFiy8pChk97U=;
	b=KbRNc4wtGNdRRLR0XMp3tHHnSc+frVOqTdYWU7u7hDUJM3jCxvD+IOnB4EqLOGz8BIjI
	 49qZTPnZwaSZ7xmaQIC6yh096T6U3SCokD1YCR7zEwz/IwM9KNkE8fWymwEJS9w/Xrr+l
	 WqzpXZ07MXGmDI84ZH7McC/ikcgbNvnCgFRfOZEKLdNQtD9wgWK1KFpbMzT64ODMfHMVj
	 syv1gOjA65902onqm8fVs7Ag7igtvWpsbPknkw0qMxF4lWGV5CP7te8w7XQ05n5lctxHV
	 3Ot9Na7FBUBAFqRYqWdGYkZCP7ap9k5w09z3wA2dicMNRtVyjpTVYD1XHZVFzjjN/4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OodLDqWV;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC97C606A32A
	for <linux-next@vger.kernel.org>; Thu, 19 Nov 2026 01:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC97C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OodLDqWV
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so882554a12.1
        for <linux-next@vger.kernel.org>; Wed, 18 Nov 2026 17:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795051029; x=1795655829; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59Vn+6ZCrn4bkmigHbGhLn/ZQOyW7NScFiy8pChk97U=;
        b=OodLDqWVLKJWRJ4hxsJ+0H/bezzEwzFKojs+r32NAdCAkVMc4Nwq1iDewob/8kYBUv
         JCfPxpSQ0HMUags40Mt1pFZ1Gkt1tkJ8RqaEVbemFmkZJsRHtcjynKb6UZI+MEUaKplg
         i+aQ5CLAjSvcZpVSNhZFAnuVWMV14aj4vhpSEkUdnpnygjvdVw2IvjbA0YRQMV6jrS1o
         clGsv6cndA8hxyP+N2tDp/PL9oxGHjp5BWXzOtscSWyHARXkcSK9Z526nre/f3kQDQ3l
         e7nAdv672XkwpthS6aIWB1g0G9K42GfA23U+7MqGA9SAp1oRKVgq+Usm3JkEr91+e0GQ
         6v6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051029; x=1795655829;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59Vn+6ZCrn4bkmigHbGhLn/ZQOyW7NScFiy8pChk97U=;
        b=FEHreEqPlSdiaSXIK025SBegJLkRc8tGKIbc9oeyxvQ76HW5ucO0cxnVUR/YEyXOZE
         Z2doU784W36zWYaitG/gIfSMoPm/H9IWVqgGf2n90HCmUf1XhO11v8yWtGzyS9usgMKL
         KcQrL1B1Klgbzg5Eg7Ia2JjygpQtKcn4rMh6plonYbPG7ED77P/F83Tjaswu7Af9TehQ
         1Y2ysGMTTa6xsSxuxqv/K9uDaFFND6lxAofFdKX1MTKeHeJMZFbuDNxKvfZWd1mLTptl
         kfOzh22O6lJG3c1KoridllZMR+3YjJWD6SatRnP2rwqb6z03J6eVMsb0DFXaTNCXdQTn
         7bkw==
X-Forwarded-Encrypted: i=1; AL+hErHAbZdglxKCqd/8cOMB4DPFqUfMvEkcMpx9d1fJnnYoNqdmCMHqVS9OBeBQhdhDHV5RVF8A1ncdMc25@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sf1pnzXCJVrF4Lf+tUf+3YuFqFo/s49B1AYDBZTjCgFfQwWOu
	/WDmAizGP4mwkAkRrCfpIzw4H1t4r+jTxbidZwZAZ3i8XxdOiSodeQw9
X-Gm-Gg: AZFdTZd85DYCkJoneA4AD38uXKkn/SJ18nK8fM4KoRDShJgcDT9id5ivVepzZZw7JYY
	ik8xmJI5pmoog4xk1bBPpkPHy9OuME8iI5A080AcFcViOqCJrmXgrrwtknAGqmZM23WTqCtOnxB
	JvUpY7j59XpjiXLUzYbJobaH4c8Ed7Sb6HiuhXrofX30+1giO0GX/1ojThGjlCVDZ0xOT3uMVxH
	2cqJJIBatF3bbqszMPWrfb2344kEKziWEaa498EtYpGgN4hEInZ7PH1Bcx0KAfqQqMsNSocDEcO
	INYDjvgXGQyULCWjx0IHp5+jT3c+kgBgpj/hMsD8uQi1kj71bdyamHTDQ6uHO0bV3MAh9Gh/n+Q
	KeOpcxTvihz6eFe6mTeIB854TE31gN61xmtSB0sjWC6PCsmMx7U7o9Ztdi1oNeuUJleJG29c5uj
	LFsRpScZZ9R3PMPqObaSIcHPWDy3+gj7194Q9kw1loipxxnJLoRl4NHxCDsQTGucwvcMt77I34m
	4cGCXnE2nNfsxU0Wokj6PIKm56J8yMmIpXmzzgkGwqDPxA0JZF1zKQyTLyVkvbhGQoT7yeh8/YC
	mQ37uIPkRTZoRPI4r9+uD4ct8V5uLcAzgxZuk50yQHJ725lh/+eY4JtEg2wiAzSndsR6Iji5Ztq
	PcQSv0qxyobhN9AxJumCb8x/CIwlEL71dlA==
X-Received: by 2002:a17:90b:3e82:b0:3b1:2810:dfdb with SMTP id 98e67ed59e1d1-3b3d07a85c3mr4591922a91.48.1795051028783;
        Wed, 18 Nov 2026 17:17:08 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402981814sm107875a91.2.2026.11.18.17.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:17:08 -0800 (PST)
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
Date: Thu, 19 Nov 2026 01:17:07 +0000
Message-Id: <DMYSHE1LVD7S.3IT6CHA55HJGY@gmail.com>
Cc: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Daniel Borkmann" <daniel@iogearbox.net>, "Alexei
 Starovoitov" <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "bpf"
 <bpf@vger.kernel.org>, "Networking" <netdev@vger.kernel.org>, "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "J4f J4f" <shlomojune6@gmail.com>, "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <avzIz70qnJIA2t3x@sirena.org.uk>
 <CAE_LbwkvPV2-LJ2b7OCFzmWmBP-jfxeMR=ARZJvuF4RNx8M1dw@mail.gmail.com>
In-Reply-To: <CAE_LbwkvPV2-LJ2b7OCFzmWmBP-jfxeMR=ARZJvuF4RNx8M1dw@mail.gmail.com>

On Wed Nov 18, 2026 at 3:47 PM UTC, J4f J4f wrote:
> On Wed, 18 Nov 2026 at 05:36, Mark Brown <broonie@kernel.org> wrote:
>>
>> Hi all,
>>
>> Today's linux-next merge of the bpf-next tree got a conflict in:
>>
>>   kernel/bpf/btf.c
>>
>> between commit:
>>
>>   b7cc45994c3f9 ("bpf: Check variable-offset accesses against special fi=
elds")
>>
>> from the bpf tree and commit:
>>
>>   ca4395aade31a ("bpf: Walk each type once when looking for special fiel=
ds")
>>
>> from the bpf-next tree.  I'm not confident of this merge, it discards
>> the bpf commit on the basis that it looks like there is some new
>> handling of special fields in the bpf-next tree but I'm not sure that
>> overlaps with the fix.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
> Hi Mark,
>
> Thanks for the report.
>
> I reproduced this on bpf-next master: the rewrite does not cover the fix,
> the check in btf_struct_access() now only looks at min_off again. I will
> send a v4 rebased on top of the bpf-next series shortly.

Pls ask your bot to stop doing stupid things.

