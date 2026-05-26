Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BC73B6BF1
	for <linux-next@vger.kernel.org>; Tue, 26 May 2026 22:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779833300; cv=pass; b=RIVgtfv/dsQ5TpZ+LH9ju/ZPI+ewpV2bwU1UoxWPhIhAhNeMMPRMEV/X/2UWdIlhp/6KHMQVENcUrTwKLOaZDvV3i4483sPdPgXMagukcYrZHe3z7MD4b26hrqZinDQ1Ei9NgAo2iT/OSdMZTpjgexZfsJdSZecrt7/csH5o56E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779833300; c=relaxed/simple;
	bh=E5eVcu06k2o3PY8A09XNvdjNWnpe+Yc96+AlUiI1rCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4s5x08hEn3RFsmrC/FbUQPl93uas3SwnRTTO6qqCRDg31+GRpDSDrcAzk5gYZa9mRGDFrEtc/uK+46znR2Qm3RRA6I+6JR8/8aUvdPbREdsyLns5nw/F/uR5x/sEdaXuqJh6dCC9aJuL8dGXk1H7sghTkbxAIiLpijQohecNu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3OH9WlQ; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3OH9WlQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso34202455e9.2
        for <linux-next@vger.kernel.org>; Tue, 26 May 2026 15:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779833297; cv=none;
        d=google.com; s=arc-20240605;
        b=awR+fiKoDcUChc2k/D48K4XP8NYtqormCnE8u9HvP5Ar02z7Cu/HuyyHcFGuW7ZK8H
         BVph3xIBEOKhzq/is/9ePE5wZl18MXtNrftFyq3BQ+xUG2GAqkCx4FT2sU+FHxvPSpUR
         HFw0nllIO07M8h6dIlGGWyaY6QH6nK84+4rkKqv8GPjP9N2PraNh9HD/U+B32grCARjI
         o93iGFjSI+twxlJ545bIKNp5TUyZW/oFvTUJra/34wydXx52KLDdckeDBA54eMd5Gxgt
         oaT9nMnvWZnuotWuEQy2e6ZoU4om2CahC9PtfJAdGXoSYyXBUNOQzdvBfEvB4cfRIzYn
         vuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3RWZTrTlmetuoLNV2ZDm5Lkp+qABxyw2h/aIwZbrBFY=;
        fh=6ccQgVKBppmTQjiRwdQN4Il3BuDdwQdeL2fXYBPdnnk=;
        b=UiFt4Cka+wfZQOJ1Cwx9xl0Y2sBeXHoGbIegS5we/C1sGkzBJOr29OkIOi/RxCaUsk
         UO7n2YZYuqifv5AJLncUGSEAETb/xmlTWpnE7ppuUXEvLyuicGl0Ymxp27KnXl8q8Ryx
         Z88FxnQRCn6Bz6vg8PkBuWVAWLvp5wRbWBTw/Mg6Wnf/3tS4fz1UMA0913CC8upjfof1
         8BN4wVrJ1SPcc0joG5wDr6l4Xgd3wihkSHStNwY9qxG09CHrm0XOoPSe/b10qKufY+Wq
         a82ESkFoCR9VEoQ+/giCPug5h3VClXKa1Xkx8iPd/gJqiizsquk+IJ5CIKBvcRKgSarc
         uL5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779833297; x=1780438097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RWZTrTlmetuoLNV2ZDm5Lkp+qABxyw2h/aIwZbrBFY=;
        b=j3OH9WlQ1ts8QFarLZzl677pF+Cb0EcpAd6njbMGwZCn1CKHhxh7onbuZy02ufV6y4
         lsX+w4BSZmX0EtZHHMMuZeDbR0hSbcuxMCXOO42JnRG4+S9lMaitqHOph0X8eqXyu/67
         RrahF/8WjjO1RilA/zmXhL0JAF8Nij8KB/JUh2QI4PfJ4EWei76Mk4CjgNMVNgBelP+7
         qMtBG7ZH+xex97BI4YfEZSRTrDUhO810DOq/tQ3WFeNnOY+ANI0dT3afO00pzs+Wcm6R
         kj1dTTUqV55QRo+IgFgiMbhqgrvS6eqBwA/GNQSUDeEMA0828F9BHvtQkdpFOmZfo8tt
         C+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779833297; x=1780438097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3RWZTrTlmetuoLNV2ZDm5Lkp+qABxyw2h/aIwZbrBFY=;
        b=PNrpZmkBOWk/Cym5Es3cM8lfkEsIYM6D4phgVFancZm66OiX70BMex9/WGkhl4ofZ9
         weCDQ/1c3CcdKYupzd8/Lk/j5U3iBg1NMCKFl5IGhrPE1A6++ZNcs2DQdiXnWoOAHLwS
         TEh0Tc1M4CM4iyvYOFMT/JdBbW9zR076Wg6EnWXitQLHV2qmMPkHwSvfLu29/KVBaCsg
         jvp2iQbSKxHSyHK0Mqfv6wrl1ZBckgZ7FpZ526TKmtZOoLA7CGPnIL7LWK/HdFogzx3k
         OOna2HrwXtpKSMJ9pBs6plesgkDPvBjthtFnCmwuozKrvnOVwG+/ENkguCx1R/pVZGqY
         ejhw==
X-Forwarded-Encrypted: i=1; AFNElJ/LPl6HSasvnR03OyinyAUNjYRRCTs9Wd/UDqgiBkv30+v7dSGhe1Ma0iSlfGRHr/6MsH2X27rcE40c@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzt2gLhge2iqYOgXhWkUx3yWFU64kxx3rr/YfWdqN919lZ2nFH
	a5SICtDyN0dmuFgSjL++KZVaOFE7ZTdF75+IAqqk75v/SlYG/11w+S2o1fisQY6/B5M7Bb42nse
	EI1hn60797eyj7ITsxrWbUUp2y6fKMdw=
X-Gm-Gg: Acq92OGgRPP2ZrV/W3NGOHFJP6iNY/U3v0S/6/CpfqrLkccB0Tbx+8JpKDMd33IdWv2
	uzpwI2RCkZ0rqFkXxqEer8iBe9oXLTgGSiXjyICv5l2eUggWTTLJ4HDPYZmQZMXlCjnNp5wm3sO
	gyj9P/Hd1n3MWa51qu3N0/svvDo85uz++iQX1E3tUwSWi7P4NlGXWXtbmAoW3MADalaPRK+8D6a
	QuUFjJLFJGSgxgZDHWaYKNro1r8f8dCovSgh78MQG7E1s0lcN2Sg2dehcRBWUe/kBn1S4MHTIw9
	yuDuisMbznU5/2rae3EawzJLy6ySxkT88MI2LWS3oL0L20cTNpMdPdm6I7eMcXk0LZu/R+3C+xd
	CyoSva+izYHyB0ZIU2ByhATSj0YRI0kUx0/y7
X-Received: by 2002:a05:600c:4510:b0:48f:d5a0:284e with SMTP id
 5b1f17b1804b1-490428e03b8mr327634565e9.28.1779833297389; Tue, 26 May 2026
 15:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahWOVFZZScPjm2Ow@sirena.org.uk>
In-Reply-To: <ahWOVFZZScPjm2Ow@sirena.org.uk>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 26 May 2026 15:08:06 -0700
X-Gm-Features: AVHnY4L80QQm6oMmZo64_ik7eu9jKD9D8sG_L1XILYcew8M4vDIlUwIvnSeQ_D0
Message-ID: <CAADnVQ+yjm0SJ0UQMeuS82MLDeo1bvZKSMMDh-K8D9-PNu=p8w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the bpf-next tree
To: Mark Brown <broonie@kernel.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 5:13=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the bpf-next tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> /tmp/next/build/kernel/bpf/core.c:3379:13: error: redefinition of
> 'bpf_arena_handle_page_fault'
>  3379 | __weak bool bpf_arena_handle_page_fault(unsigned long addr, bool =
is_write,
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from /tmp/next/build/include/linux/bpf.h:9,
>                  from /tmp/next/build/include/linux/filter.h:9,
>                  from /tmp/next/build/kernel/bpf/core.c:21:
> /tmp/next/build/include/linux/bpf_defs.h:12:20: note: previous definition
> of 'bpf_arena_handle_page_fault' with type 'bool(long unsigned int,
> bool, long unsigned int)' {aka '_Bool(long unsigned int, _Bool, long
> unsigned int)'}
>    12 | static inline bool bpf_arena_handle_page_fault(unsigned long addr=
, bool is_write,
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   dc11a4dba2464 (bpf: Recover arena kernel faults with scratch page)

Tejun,

thoughts on the best way to fix it ?
Pls send it to bpf-next. I think it's fine for it to be in one tree only.
