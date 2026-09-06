Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72DB3C4B6F
	for <linux-next@vger.kernel.org>; Sun,  6 Sep 2026 23:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788736727; cv=pass; b=u9r3GMfKVTkeDgNuDviMYvtqeQ47/Hhl3K9Q1ojR5f5VZeGzZtdQrzxxX4rY3bpJXkVOwYNsGFtzGj9IcuLWnC7zTTIvTc1dFOk7C4TXv+vBNHCkzUHYdjN/0i+SciBejF1J6ybT1Xi9LzLIaF1r25h6AaC5xO0A6c6o5hnvYRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788736727; c=relaxed/simple;
	bh=724XBBM18e/5/TAVSEA0cDWj19CNMiPpyAaDTnCZGLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rkobp8dipYEY0MP2ax9dp0AwHKO5WjBU3jT/yZ+slgCIINGX79xxEGeob4hcbcNvtePsAjMLBYL7pqrjPy6Z9GP9quqc96FcJCxZ2rvR7530EChRFK7XEdWMyq6iOTLSn3N46UTEztTRicG1nffEZEe8Ou5X1/bTb3WKL3epfWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0SQSRcQ; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0SQSRcQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-85339ed040aso2170647b3a.1
        for <linux-next@vger.kernel.org>; Sun, 06 Sep 2026 16:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788736725; cv=none;
        d=google.com; s=arc-20260327;
        b=Xbtgli6ft+R7ajzb9NoYqnu4XFtHs2GL36gyzBaL3GTSejYwJwbN/cMziFMMR4Zo3g
         8Ex1VHWKVofFv8dyh9j0pKdalmj1h58taADepU7gDBZZMAc+2dgKVoXxBM0UQ0eyCKk7
         KfhGPPl2mi5P9J8l++f4GQjuv2yxNZd1AnTIEvKl1f/I7Li6/b35ZJeun+6NUaLZt2WQ
         cOshfe3woEt8zYSHAeX2/wohMZ8SSANQy1Qva7q0V7doJBYG5cowOq+Ci+3qddoh8tEc
         VERG4kxOtZD9rGnsBciJHqQh8W9lydYt9eNN8/khuzaNKbIuj888fMTALcJAaFurkqUX
         6X/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/lolE45Uhyd+sThQbwL8EFg5+bmDGsCrRM5xzs+E9ks=;
        fh=RsvAnyTyYp3MbOIkUFzZF58fyIZWDzkJN6/hXQyXiXY=;
        b=gD6Z9aA7OUPrafNFcv0zNkBBcoVD6VefxvA5Zege7HgstReey9vs2nvWLXYHZzPL0l
         ZA8K3eeTIdN/tlcoYtU7z4g7oKm1vXR4XLCFgkK8RLeHyyr3BQGWG4bG/tvWn8Kx2KT2
         fEUwL563DaCy2zJAKmKxKog7P/ymoaw5xHc4VWNZTyAEiFOAJaXLlsowtPdZm7YrHUVR
         wWd2ucb9ImVtseV7VFC2pgrDk2+AsDQTtuYfbZ7lhVhhS6hSTDoB4NchGzFS3cTsMSFC
         9I/bV3Fl1cE37jIYx/rCZIcqSd35lXTr8EsCJELknN5SCj5SgBcRkwakTqrRrNY0wrY0
         FPtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788736725; x=1789341525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lolE45Uhyd+sThQbwL8EFg5+bmDGsCrRM5xzs+E9ks=;
        b=U0SQSRcQpQGzr9UR8MK+L9br7STH2Yj3Gw/0QQtpr2LsD7ahUiJPVL6Hd5qyU9tIIK
         LYn9bdXjdL64w/Vt62iOZr+0E6AtPvOvgSMO3Lpo4cyMfumMjOPfrIPqqz+aP/SPxtp6
         PKT78kyRXTaqAnSnkIJEk3RYEVUHwla2xZ4VZKe8qbIfh6mr9kfeMJ/VKro0SxcMWyoF
         X8cS15YfGT6ccabKtuGTcw02h4s0rbfgMU8RbQOL5A5L3KuIVTjjfip0nMIjHVcjmEtt
         M4lQdXCKLE14sGYggseBHXhbq71cm0Ao0+Jqs8JT2t47o3mlf2z3XxfcRwATtyvFSEZV
         aAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788736725; x=1789341525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lolE45Uhyd+sThQbwL8EFg5+bmDGsCrRM5xzs+E9ks=;
        b=KbNlqZBBUzF5dc1vCn8XhcQOkOA1M0cmakhYbG3OVlkIBFovVYFwjQAgMt7Tm8ipMu
         8LpSTLFdqoiDxCRsrzLM7vp2a8YJDHoT/0C6sij2dc2qkaUKJNZY0L2/BarU9C2q0LrA
         cnl9nmGayWcZk1VD+x9bTKRrKRbMcfU3xCRs+lXpDjivhxgMavCQCBtQfVNGMWfs4LKy
         fuamb7yynyqYHn7Uu0yu2yCFaiumT1V3J1Sf0h90sYAzpo+RCuI6TVMKfYhTAj5MKz1r
         //GMqlMRv/uzMWqrlciXM4sl/rb4AXz3feXLge/elY1bbbW8dmTuB6RtyhqQVPDVp9vJ
         Be/g==
X-Forwarded-Encrypted: i=1; AKwUvByX880L+RR1AS877WCgQlM4aMDIfrIwqSl1Q1C6XeInMZ1CzOP9wyDcGAEB6EHsfLWINoNl+79iLRDU@vger.kernel.org
X-Gm-Message-State: AFuF++keSmZbtnlPMeZa4tlMrhi/yqQrACFGcCn6a1zrcCwjxllGBEXK
	V/KwTnIrbcU4TFkOhatCwhCaYFR630PJNoB9/SwzTr6JJ0iJQ3qsDEA/GjpHVvLQyG+Af24El+G
	WPTFBGsnhEI3aZ4/8vXzivvtvp2/SvxA=
X-Gm-Gg: AYBFou16fcDB0P/w38qhi3tE2hQnSeXq6Ajo/lPYjEqZXjztw2SMD5MVQPoUJ3SH4Qt
	M06yOb3xCiND9G6auusmxFL9yVe2OWnDUCZGybKfDFXHkICJcKWPQN4a8dH0tzTLP8cRbTCdZ40
	stNMwE58xA+YqBMdrYmpvIPyHbzTyEFzKfX0mymVapvnfP2fTQ10EVtfUmamcWTeGcK6sNrKXzC
	MD2S1VfL7eQsJKJS3LVdNeBdKh3YHtBb8bDQgiB+xKuXJA02j6WmtNES2CVDyAqDEVZF7geuaw6
	vKsSnVY1WDLBdVctwkvb75J8cbxse3y/aGtCsvX04FMToX/eSOGISTvkQO7SXrG0YHlBpF35FZx
	u68pvccQ9qoHBHHkWiaVkRTk/DphlN2H/Sh2nT5U=
X-Received: by 2002:a05:6a00:13aa:b0:84c:5b65:ef86 with SMTP id
 d2e1a72fcca58-86168e88261mr23644101b3a.17.1788736724956; Sun, 06 Sep 2026
 16:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apl_5AVsAYLjVX5C@sirena.org.uk>
In-Reply-To: <apl_5AVsAYLjVX5C@sirena.org.uk>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 6 Sep 2026 16:18:33 -0700
X-Gm-Features: AcwNN1WQk-B2sF_oTeT_a5F-7sgNbJL45Qm1_BHeZkWfObnP1i9S5tuc4ycX_W8
Message-ID: <CAADnVQJuAGh0P0sw3wWWPAmq1OmAX27KNiCYn6__rZkGs0hPrw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 7:10=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/backtrack.c
>
> between commit:
>
>   e3e4f66cc4b72 ("bpf: backtracking shouldn't clear outer frame R1-R5 for=
 callbacks")
>
> from the bpf tree and commit:
>
>   5bbb242c08590 ("bpf: Handle R2 as a return register in precision backtr=
acking")
>
> from the bpf-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> I'm not entirely happy with this resolution but I think it's OK?
>
> diff --cc kernel/bpf/backtrack.c
> index 47282ffeeaf94,653db80bcc47b..0000000000000
> --- a/kernel/bpf/backtrack.c
> +++ b/kernel/bpf/backtrack.c
> @@@ -533,8 -538,12 +537,12 @@@ static int backtrack_insn(struct bpf_ve
>                         from_subprog_call =3D subseq_idx - 1 >=3D 0 &&
>                                             bpf_pseudo_call(&env->prog->i=
nsnsi[subseq_idx - 1]);
>
>  -                      /* Sample the return registers before the callbac=
k
>  -                       * handling below clears R1-R5.
>  -                       */
>                         r0_precise =3D from_subprog_call && bt_is_reg_set=
(bt, BPF_REG_0);
> +                       r2_precise =3D from_subprog_call && bt_is_reg_set=
(bt, BPF_REG_2);
> +
> ++                      bt_clear_reg(bt, BPF_REG_0);
> ++                      bt_clear_reg(bt, BPF_REG_2);
>  +

It was more involved than that,
but now the conflict is resolved.
