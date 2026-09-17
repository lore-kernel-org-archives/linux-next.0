Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933824F4028
	for <linux-next@vger.kernel.org>; Thu, 17 Sep 2026 17:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789666051; cv=pass; b=lD/YPTQ9Dq1rDYxZduB+TlxthrJoDoom2UJaORyw3yHOj4P+zFznCmVWWjiJHgEnDJiq64yzQQiTE29ddugNF1ErYU/ievuT2MVgl2lXi1TRWB9Pt5oIz2s2v1+XZtYwCF4Pc5EST4QcTyz6iaLKrRfMFkXloAr5pibvCh2rhfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789666051; c=relaxed/simple;
	bh=rnjJ2IzL4qK8F+LMB5D40jZ72KTwVoNqdK2RH6FWOTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfsdUKUdGdZaOBet7CRE6cDw2+agVqKk4uVPqYQgO6tedNAGD8J0bWDG3LH8zl/turyatWb288Zy0A+4h3auA2PIQcex+ygX/qTD+8l9iYCQ/Bdbmzje1PSMUw4c3Xxc9eYejG1D6U8GyqqMPaiM6lw4a28MjxUTL09AlHYNGaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/EOIUFV; arc=pass smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/EOIUFV"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so1013116a91.3
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2026 10:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789666049; cv=none;
        d=google.com; s=arc-20260327;
        b=oclaPRZF4xVNhTOcUnqkYAaTPJAVATxoRvaq2D80ydtTpoGXASHX/r7ai4BIVLBBLA
         a0ldhPbWcltYsii0922Ndd8De2/fEDanmL9qDh+giPVh9Nk1dVZQv1ndHIhm87v/3dNL
         aSllfmGpC3QYTs5emCkpw7ER74zpT8m98Gp9KyHZKhj8BkUihhchc7moV1T6SF8CNauc
         W/TrEnaREm5XXdspiHKnn5joum1jZ+xTOeERj0CGHZ4ZQdH4hE4m76eddQvujyyGYT5C
         t8xVlKMkUxZ3jxCkOKarb3SB1O4YPcL9CB5b76UJdXPHDNtxihMD9YXSOiNZXYVWUrsX
         CnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rnjJ2IzL4qK8F+LMB5D40jZ72KTwVoNqdK2RH6FWOTI=;
        fh=iBgJZCDfZbe0wcc9HmyRD9MwiFmA11tuNoZeZGsZqfI=;
        b=Qt5pRReWe5ORQYxhD0TpazcZIalvtJnStrvYIpkF+zjjpUZOJXqV4Xvu51FLsfcdD3
         pUC8kVMOTzgPSBkm8fARh2Mm8v6v/Ff7RtwQgnWlrH78L2JHwAEk5e/m21UEvFLF+v9a
         bSldVKK3YHiXP6sUsfJ9gP7hsaCNtp495m5pDfaTZ7iFoDVuaG9O1GoXImT5mh4lmtCP
         n3iggzDt7h0r1Qz+5Eni/2c5NXqqFizfr0Zd0/M3xTt1e5SK8PLbMEdWLJ1opPBrgvY0
         kiRx6f4oMGHtniDpJJSJAGsK4LTSlf2XludFCSFX60TESMPf1yOFWMdwtU/05xWx7zt4
         Ufbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789666049; x=1790270849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnjJ2IzL4qK8F+LMB5D40jZ72KTwVoNqdK2RH6FWOTI=;
        b=P/EOIUFVamxgwK6SDy+zh7t1x8RRYudJFaA10XcXxnzn85VO5e6+5LMlq/sjnkAXaV
         YfcxlYkIH1J8pTcsV8p0lBy4D8QNSr1Q7l/z+lDKi6f11Wmg4g3hxhHuPZEwvNzqwshz
         PLR2wa8jYqTM0YFcIX6qZoyrH9g61a9Td9C06GaEWscC4pEb/TJRzRqtlSRFKz967Bjr
         A5Bzn/FeuEs3qh5cVKUGd2siTLAozBSZNqGGnugPTgx4lFTU9fjUZ9Pg1F4wABGJvXf4
         HSaewfc3A7MmUNRW8Ls2QygEZF8Q4cYLJwqD9KI7QagOgys18+j8YdB/2kOPAIel607G
         TlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789666049; x=1790270849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnjJ2IzL4qK8F+LMB5D40jZ72KTwVoNqdK2RH6FWOTI=;
        b=1PowR+PiYr55dLPic0vU5fQYLWQax7kHlgnqxiqFBi57OBc9cN7K6pccVK6iIwvSKq
         9ZwZW8xmZhZDQAgHqQBIXKKcVgJiJYjdbo2evXdlPRCqCuQLIHbajH/XwN8bUe6JXtg+
         30bdz/ergvSSg1t0pLpjG+9MKJV/hiAkaka0hu2Rm/y9KF0aNsLkmWByIwX26+yunap5
         TYSlJYqrkV6GaOhWWr/iRK1w970GvuK1y9gzgj7qiXtUUuScSoVjY+sxE4gU0zLO5wGF
         Xxfcev1Gu4xglYUIBki7pFjfm0XfdcUVYGT2ge7SG94sHda277lpkn5bwYSXio8tjo7f
         cC0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzCw/js4pk621HWlHTGuCjDSPvi8p7jlWuAvVJCfmpUoikXfTFsY0nJ1PEal8oly0RcdFLKNNzYUce2@vger.kernel.org
X-Gm-Message-State: AFuF++khqpDTziRUfCrK+hJNvtvaGkMVKMqIhWYhfSD3hR9FejbbyMne
	Fy2k8972by/r1SZY71Get0622t0R+tEj/PbniBsDyOjK20RsBrkmx7MmxRcduzMM+AmQCCnChZB
	LbcZLU/aULayLBwMM9C644aNQEJeJnpk=
X-Gm-Gg: AYBFou3WH7d8Qfpgh/3Wm3DlqIC3zjIXBu2e2b2xrhp+jVn3OrQvYSwZXB4cmhxe929
	GYE9DiyCwwDQg/E38I6J2oRAGPt4zYKT0dR8uAugdhLn9lz1AVFXaHkKRmUE/7zbIT0Ugt5DBZY
	1m1IjyxsGJ3hx+czRSnmIbVXjSnitpnoAnRIsbHV8F/JYRj8Xm4C8CVX4NpuNaA4V95xH2zgN3z
	TGnWVVN7MSN/8rLhOEaMVKVfi/z++XHffAFCVlwO19IIx7bllO928HlvGnLulhpRw2BvVXAyKsK
	lrH7E0JQX/haLv6LWOI+KM2pnuv/qDsbqLqUTklFywG8ZeYIS0U0iuKl5e21yW4A9wcn79sW66+
	F7g43DmCxPaCRv+FI2yap6FBAqG+25W3o4z7peoVnV2qrVelSVjpLdDL6PwMFnWs=
X-Received: by 2002:a17:90b:1b03:b0:39e:3558:f925 with SMTP id
 98e67ed59e1d1-39e3558fa6bmr9227481a91.24.1789666048912; Thu, 17 Sep 2026
 10:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aqvBPVcN__UX8P85@sirena.org.uk> <DLHJEZ0K0FV1.SCQLJJQNS1ES@gmail.com>
 <66d3f5cd-12df-4000-8459-360ba57cea12@sirena.org.uk> <DLHJUSTDSQ05.28VUGOV7YPS6V@gmail.com>
 <ec2acd16-40e3-46b7-b120-ce9eec70e942@sirena.org.uk> <DLHK013DCY3J.19Y8X3Z0RTWCI@gmail.com>
 <9d668d7c-8f85-49ad-bdb9-5cb81fb6f60d@sirena.org.uk> <c80c4e2aee9502d781fb52bcd5c0972ccd3bc7e4.camel@gmail.com>
In-Reply-To: <c80c4e2aee9502d781fb52bcd5c0972ccd3bc7e4.camel@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 17 Sep 2026 10:27:13 -0700
X-Gm-Features: AcwNN1V_0iUx8qs13fNseQxj5RN_q6E_gTGBE2XuMqNGKhunfH4trjoxSpweNWY
Message-ID: <CAEf4BzYp0YAbhkdkKJn1FR0pjUF3JXUxqXkZtWqKiSVPT4=qOA@mail.gmail.com>
Subject: Re: Missing signoff in the bpf tree
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:08=E2=80=AFAM Eduard Zingerman <eddyz87@gmail.co=
m> wrote:
>
> On Thu, 2026-09-17 at 16:03 +0100, Mark Brown wrote:
> > On Thu, Sep 17, 2026 at 01:27:01PM +0200, Kumar Kartikeya Dwivedi wrote=
:
> > > On Thu Sep 17, 2026 at 1:23 PM CEST, Mark Brown wrote:
> >
> > > > Do you have a full list of the current committers, I guess there's =
been
> > > > more bitrot than just this?
> >
> > > It's me and Eduard, apart from Alexei, Daniel, and Andrii.
> >
> > I've added you and Eduard.
>
> Apologies, that's on me, some issue with scripts configuration again.
> What would you like me to do? Force push with SOBs?

rebase preserving merges, and add your SOB for all commits that you
rebased, including "xsk: Use a 32-bit compare in xsk_map_gen_lookup"
which you didn't apply, you still need to add your SOB
