Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BF0379C39
	for <linux-next@vger.kernel.org>; Tue, 29 Sep 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699500; cv=none; b=c/aXFX1+I+S8j0kXhFXohQaMhi+J0nRA6YBX3B9SitxaGA/c9OAyIMRtMFLD0sZhnUq1E6zQRmikJlli1UT3liZFGCNkihyDGpjq/lCShy0ai+W0k9vlhM69J1bxiLCblijvu0pjCr6bluVUqT9wEEjG5yIUViyAm0PciC8rU1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699500; c=relaxed/simple;
	bh=lnpKMnLuqv+oX44Oz2gq1nLSEgp1cliwREafqFlWmDY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YQ4Wxp5ETdAou1Mh7DrPP4RJ4H56FrxOl7CnGSSI697JJQYAlComTSgOvFlq7VBQ7OcteNRLzVmjVOWHCNXTZbDYRijgJjCCKuVdl6e0ncbyeyboQEh9DjK9f2UjaBUU2d1HD7cpbqi4VzQ0/G36FuwBuRLg1xBTdwNik/5cUrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXLZnBkh; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXLZnBkh"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88272e1d069so1985941b3a.1
        for <linux-next@vger.kernel.org>; Tue, 29 Sep 2026 09:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699499; x=1791304299; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vWBRVFg3TNII9e3JzDYA1qiuNTLpJveN/yke9DPuJTk=;
        b=WXLZnBkhaQdF/n4yC0ECg3VUQDF1tfB5yHqnqXisqAp9F9pakdePCmKAKHtu4mZ3C2
         5h7bRYuW4CKnad0F6ikmUcR7KhJECVan+A4XYV9UIm5yacC94ktORqUpxiTu85MNUbw6
         1Zte8PAEukPCRYONDX3xeeZZVLSnhoKgEZy4zgl/7RAG64hMciGhHjZmCmn63j+e6q+e
         jAGLTztlNpk2eHGxEhzoiMRHr4N5ZjxGrMVoVZHGRbtKyuwVTr48tfRk4RMwavxJXYI/
         /K2C3CzsFVsSqE1nr7BqgZ0nw3YG0jIGSWml4hDAYj6mbslFeGojuj9f4tmkBu7bxRrh
         JGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699499; x=1791304299;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWBRVFg3TNII9e3JzDYA1qiuNTLpJveN/yke9DPuJTk=;
        b=SqiuTKoS9fUmuEgyhb5jUFyEDXB6Nb7C2xqVlLfITjLsZ5iIW1C2PywPZtlglTJJiw
         cIja1YnKMvXFECpAlf2KF9It+GXR96Z2P9Es3IIeXmYYBisPqg1TQwP33lYt6PmP0V2a
         ein9ii1mtNNW4srKkHz2dTSkGXxrPxhw/dDjJvsvHtFdgJfsKERcwgWR/YLm067UviIa
         yb/4D7Twdbm9S2eCiFNL/IkX3mDselZuteZo7IemMGPaydRdZ2CpGrtCSb7Z2fceI832
         yEhphNWoQDWDGghf9JYgvzR+Fk6E/0orxszm41jMv30p0QdK41mOWQvCnm6mcOrhHpfs
         sgzA==
X-Forwarded-Encrypted: i=1; AKwUvBwcT+fu+h61W4epBgtwWZ6rC+yqqbcVyLka3HP7m8Koic0Sxq/8AGW+nXuKwW/yuLxHZMD6L/bLa5VY@vger.kernel.org
X-Gm-Message-State: AFuF++kqxecvhsBtp1V7zBf7oPX4sDBb0LBN8MhIY6nsnkKjzwjJw2d8
	jvAVtpCA0n/OYE0JU9kOEH0e6U+pTIy240KGP+zz9hFrEFRiZKTM+hvm
X-Gm-Gg: AYBFou1AjfZdoZd+A9gFw9Gt4VNdMd62AbaNNev4VdsbYCWToPe3yfTXSQf6dWeeadk
	hoKQQfiMcjeAf14a6wbm+Rk9hKosWlW9VwrtkZV6AZIFg/tbfkQ8I38D/EERwg69T84PSAlR/6K
	8INb97OSp0/cp+DpXezFgQ/L007y2Rx9llFiTWvhTHMGUBI++th1U3D7TQ4VRZOMjuSiegc6Kh1
	kakq7pFf71Z7/h4n3FCPnf73ASAy9BOLSmKNgV2TsrgsoevxBrTzT3V/GkN+4IDI1z2yNHfOcNJ
	xOLlPpt1d6c0EvVZ/0HvoZBhmXb3KKSYkbEoqOkMsUvBAqMYFx+FN8YbLRlmsv0OeOjKGtBFvin
	SDGeaB+EOd238+22VLE5upEFGBSl5XM0lRksjfRcCSbT+o4+X10Ee/+yLF8JJmx27qcZRRRxfo8
	OrGxkXLkp7ibNrNa2GapKPLeq0gZgQPWelUUu63ThYQvsXE/pfTQAl0lp5vPJlr2yp1bRBcBl2U
	ACTAiO56eEmxjGawNP+mya2LuWQsHbPxUy0kvfUoMUL/G1D9oEz2xKO1wzvAHVWelfG7DWHflKE
	0RWa
X-Received: by 2002:a05:6a20:9e4c:b0:3dd:a007:cb2a with SMTP id adf61e73a8af0-3de26db5242mr11967568637.38.1790699498710;
        Tue, 29 Sep 2026 09:31:38 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7d2b562d8sm109617a12.24.2026.09.29.09.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 16:31:37 +0000
Message-Id: <DLRXZSBSYJ2K.3UN9IME1MKDD9@gmail.com>
Cc: "Florent Revest" <florent.revest@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <arvRs4KdojDnW1O6@sirena.org.uk>
In-Reply-To: <arvRs4KdojDnW1O6@sirena.org.uk>

On Tue Sep 29, 2026 at 2:56 PM UTC, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   arch/x86/net/bpf_jit_comp.c
>
> between commit:
>
>   17637e1a581a2 ("bpf: Skip detached progs in trampoline images that are =
still in use")
>
> from the bpf tree and commit:
>
>   29fcf9ce4bbdf ("bpf, x86: Use global buffer for trampoline size generat=
ion")
>
> from the bpf-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

all correct. It will get fixed when bpf gets cross mereged into bpf-next.
Likely on Thu or Fri this week.
