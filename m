Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794844991;
	b=pGYqgaOaDqdDrU+6u8OmfprFo5gAWtaLdLsczKKYodSuemsZR5YhWrl76FaV9UJt01bP
	 sluodWIROKJShu32Etn/tTcfhv9b6BkQC10ArvkqKJz5BBKjROXi8ODpv9cSo/Bx67f/5
	 bzya65f8bZiCe1Jj5VKmwtC3XWriTdwT4Pao5HtntsGg5L9GPMAhwKgkL0tTZKx7/H6VW
	 v00dTTyLwb/TFPUoM7SWhzlRs5w1txln1y8+Kt7l5z+azFD4ZbYlI4nz039NIbo6Uj/h3
	 9zlhEgAp5glj7iS/4uTdo5o0ZcEW4n8p1JAHrXmvN6vk2JlS1jz/JjoziTyCGviV2GQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
	b=IgtgqYHhgNrgcGp5dS60E57KYhSFFZtSiOy1KGtnCx3aBUvyCC3N9j4wYhCN9mH4C+xq
	 qkGL9gCfWWBSsKrhL9K+t44J5zzFmqO7EsmCRAkm6J/xwqfS6uYdZxl9b4b4z8qsdjXg0
	 7XDOXhgl+41hXUoa2XH22HXcDcqzE2w9bOLuGNGxw//qVW5GeGG8p6xKjHcr3O1hN1A4X
	 sTnFrkfu6oWxTUpcMyJs6g87EL/0vdfzIRhQZu0Drjc5PK/Od9P+G0KigWHzF12k1veT6
	 1k0EfHw4cxKubgcqcFYPs2jr8RHxZXP7B5rX9EF3h3JZ/Qn852rU4N7iPc46AoiOUKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5+qfPZW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9658F606A31C
	for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 16:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9658F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5+qfPZW
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2efa9addec5so5770345ad.0
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 08:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794844990; cv=none;
        d=google.com; s=arc-20260327;
        b=S07ALOOPL7tqE1j+Bc0pdRJ2sHpgZCUwgX5/ZtbHf51c/bguA/eqegyE6TsTKEgfio
         qMFVFcKves0TIev2doY83qHgmTrQUknUa9cKgOx7O7vKSdYylyRBPAvk4r/xZ1nnDKTn
         Oghjpfhjfdsd6F0ozphM8BKL++DoJ88h3HB5JrzcgBl3TWsV9BvWzBAER7mdbp1ew/EQ
         OjVUXxizTAYagMrd9pz/KTHgU35g2S+ZkGenRJzdxA4J4svY5nksVE+7krTMNU+bTtao
         9mUtTxbhPPow43Ohz0K2+nCfGbTl72unB24nssn3u6wbzDpaEJYsWtEh5WQcJ2SEtZQd
         3w/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
        fh=+Y/eQ3COL0kCTWg5EVs1k6OHrvAZHvfQUKcTijIx1Oc=;
        b=PsT58C7ktcdR3nBQ+uATdj8Eua0qcQE//DP9H5B1C+9GOvkcuQm4ByRZCVWobxhCB5
         GQcNUT/ayU3oL5TqVPkNZjOsdK8271DnibFmdBSAul1HsoTsaHxciyXxPgYxiOSJILiE
         uDXvewP+NOO9n1le29f2tvmNKar2CxCgai3175JumwVeufA5mFGAK513z0GpVwvFEXuV
         wnhhmZZ94GjGazIDP8OdJ2zlRpBBS+/zqGUejTjNWZ8xGL1Lmh01jp1Ly1PXLpULfr5a
         XGAiKLB4/tYI9YxFLprwd7Q69jrRglCASevNdhi+66nm9MVqGsCLYzrsJmzrJUCb8CgB
         dtJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844990; x=1795449790; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
        b=j5+qfPZWt2MiR9AwyGnuSWff4kqLNf2XZOiwJnxZ+Fv0u1xxF4OIzba8auw2DFGria
         RUb2lc0JvJCxRj6Sp5wd8n8GN+fVHAzINHu4GRUl3yu2yHMI501c4wW2crgydaFx3jsE
         lSM2odqPpPWNXbrGAKXoPpmlZw5EaXH1hh87buKYcgSywRmFBtM4pSnPlvXkBQe4++xh
         0bQTuOm9SoWLQT8EZjRSo/DtXDY558fBXgN3Z+o+1TrHGsvMJ7HiAuWun66rYU1dHnWs
         VXb+7U5JpdSFegGhqgYMC5nLUFcvstgH/6u4ood/1y0JA3IoK1AR6cJ1RlH2vVzkS7hV
         zBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844990; x=1795449790;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75pkuYW/tk7J9Bw8nfex7DohVw3/gs/HE93Gq8puzEQ=;
        b=jDawDNYGUVODtWOa+LLM2dxCKxXuebuJckH7unmeWzocbh1S4gdK0Qd0xwJ8et3vfO
         G6qUopNoMsTF4DRFqWpRrvIl+7aBTivL0xCbVWCjq6GXgXRNZ1tYGbVnOBHee2WgYVRs
         gNT9UycPBRTAFCU/Xjqcj/ThlfgDlB+RREsAYNHf8KZHlJDak8qX8QySuD5SvmJWWR1k
         tGiYJD/vCUrYtEcj5T4mL3Locb5lgUdCLZcSYRsxKa+Vvo6Ziu4l/b+nasrgwj4TeRBN
         DB75xZxzmg6IsbI53JctdOve/ZK1Ak0tQt98HLuk4ZwayY6nfemgqs3+VS6xbYG7uJD3
         vsdg==
X-Forwarded-Encrypted: i=1; AL+hErFNEZxFmp6Iz+iYQ1KhoaMaTHlr31sdeFmpOagMbozg9Plg5Jxgvdumujt64WyhEX3GpbX2mLZpDDYz@vger.kernel.org
X-Gm-Message-State: APuU4Z9CjtjvbPF6xFzuq80HVGS8GeoaUYYPApjJcputu0ylW0AUPM3t
	KSyXisrxGPd1so+mBHiqsiheTiyOiR30yW0YZk7f+QoVP72TBSbdtHIkn8QYu1wuKkVQVf0UPqz
	jDEZwdiHb+f1EjbdZNhrqn3NrP+VJSKf0Ow==
X-Gm-Gg: AZFdTZc+qdWmCdjhe4ckxoflk6jwx+zavHOolM7EdxnQcM2zRDVrgrRXe/qqfDP97gR
	+ixQ3brYPH6nLf8wXXEQtssCMTgrbfumjFi/lwPipzI41JC89ffMDLRsTI9jXpHzeaeNVgWnsMK
	a9B6xLySLw6bFxnS8LWB4sICFCfJdJeiIq7RQ0uG+ZXqnEdCngpvE/64ZC4L5bkIuh8XYt4/MV7
	v+r/qTDoQsxnLZXan5iR/mELax9WWzj46FpZjdfEHP46QbqYffDpSEquy2GBvc4HZodqE1ktQno
	mPeo1V9K5+GYKgzptdIKOQw/rV6nr9oFtnoxGtQXvA7IJBtHg4fjHs2O91e0fL/Xk0Ck28AtJ4g
	aCt+puS7mNPgGEtepMq/kkLeMumo/vgazgg/ZbZdrmTbm25sgX0kPYwWmMxiCt6iYj/Q0+8YBJw
	kP7VIjJu0hV7toAEEy645qeIMWp/eqbOmCA63Go0e1rtGWrZA501uTd9Cs
X-Received: by 2002:a17:903:3c0c:b0:2ef:d952:4a70 with SMTP id
 d9443c01a7336-2efd9524f10mr160655ad.15.1794844989621; Mon, 16 Nov 2026
 08:03:09 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avsfpHqbu_rdmOrf@sirena.org.uk>
In-Reply-To: <avsfpHqbu_rdmOrf@sirena.org.uk>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 16 Nov 2026 08:02:56 -0800
X-Gm-Features: AclHuK8Zde0ypoKNoy9FjTToivHq-RePvO_-KQS7SMLakIHz2MwjMtcG0NQBgHE
Message-ID: <CAADnVQKjK2ezTcTUfQLACJDBLzhy=aBvoiK7L1cqKmb5RE40CA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf tree with the origin tree
To: Mark Brown <broonie@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Sergei Nizovtsev <snizovtsev@cloudlinux.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 07:22 AM Mark Brown <broonie@kernel.org> wrote:
> Hi all,
>
> Today's linux-next merge of the bpf tree got a conflict in:
>
>   kernel/bpf/bpf_lsm.c
>
> between commit:
>
>   ea8c4b37b8809 ("bpf: don't mark namespace_init and namespace_free arguments as trusted")
>
> from the origin tree and commit:
>
>   ab86b62012b9e ("bpf, lsm: Mark backing_file_alloc/free LSM hooks as untrusted")
>
> from the bpf tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc kernel/bpf/bpf_lsm.c
> index 468e63dbd922d,f39a3766f2245..0000000000000
> --- a/kernel/bpf/bpf_lsm.c
> +++ b/kernel/bpf/bpf_lsm.c
> @@@ -411,8 -411,8 +411,10 @@@ BTF_ID(func, bpf_lsm_bpf_map_free
>   BTF_ID(func, bpf_lsm_bpf_prog_free)
>   BTF_ID(func, bpf_lsm_file_alloc_security)
>   BTF_ID(func, bpf_lsm_file_free_security)
>  +BTF_ID(func, bpf_lsm_namespace_init)
>  +BTF_ID(func, bpf_lsm_namespace_free)
> + BTF_ID(func, bpf_lsm_backing_file_alloc)
> + BTF_ID(func, bpf_lsm_backing_file_free)
>   #ifdef CONFIG_SECURITY_NETWORK
>   BTF_ID(func, bpf_lsm_sk_alloc_security)
>   BTF_ID(func, bpf_lsm_sk_free_security)

Thanks. The resolution is correct.
