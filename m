Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A49E423160
	for <linux-next@vger.kernel.org>; Mon,  3 Aug 2026 20:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787846; cv=pass; b=qMYNuzYfxhI3Oywwk1A0X796btA5bJkOenT1QfSJFQkOvaEzIpBtlgToX1TPW4HLR8/pAz9GmfuonJZomHHFMw8HIE8YxGn4RHWLf84h7gaBHVqBUXj2L7u5vCpxLN9/SnkWNjk7YiSc4zocaOg7hzrUBTuiKHNpCcOIfADiTTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787846; c=relaxed/simple;
	bh=yE4EwCQrkXlFctZl89cEfORwn+um7MwgGT0lNHpkVuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QTPMqrOF437p+QLwnjTyCDQ+RUzLL29V1ndH2SbLfyW1iDUXOAHZyuwrdAzij/E9FUVGmoZHPJCDFrMcp0We3DvCZz0aiRH1wdOkUpm0ohSmHonBc1uaQe3D2GgTb1F46dzUdfd3kJlsq+kM1gQOuUpJB00/HUkttSuWY5x8jdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s16jQowG; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s16jQowG"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e27035206so4186607b3a.3
        for <linux-next@vger.kernel.org>; Mon, 03 Aug 2026 13:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785787844; cv=none;
        d=google.com; s=arc-20260327;
        b=h740ejnT9NLH6id7guBapYtMrAOxfjDROg9dn4WYq1c0Sd130/S3tHi9n7qeRTDY+J
         OHu2jj7IMy2pUZiKDKhp3NTaNaWERAb1HGnv4a8v8Et3RXxF02YREZ7ja2MXIa3/ASwX
         wt2+Q2qxLaxNjNWEjYYOgZ1D/cjwCVBVR+vRYXlA31jFH2ZKPqDeOkIe5vriNMR5mcYz
         9aHXFLQl7LmwQ8gXPk75E8nMk6yOdjXtbB6Q+ujCXTyDDUgLgKYnBMYOZqBRvGzPsk/4
         tw0bA7Px8Ic2ILutAbtcgbn3MJM/WW6hHzYJbwMiLThex71RqzTobQUg10jdyQ8ODy2r
         D+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Or8YB/iS1IR9SFO+eCt6jFUyhlxTtdwHdXKK3jrL690=;
        fh=xYtQVzoT6JbqXmYGe7GdHkpnAu8oE5u3pq5e/5i3Ipg=;
        b=qN9Rb7V+nLEWUM3sYMpIHB3GIn7ymgUw8bmtKl3OVTUoF/khc2CVlWdHthFDgmTGeg
         uA/0R1qven+e3TSF6TXj+0lXeQgBfVS/37MIeCC2OXDPTNcjToYFyRRYB72s3ck9aEie
         NP53MwJGGORHzpEmu3TNW42VpKcAPyL+NQgCuTMSpRauy9lt92urAL5FlnADlbObu1CU
         Va2kz2WdJZf6Pu1j+lAo4oC2+HGEBGRFvhjnbBB0Z8TfhQ1ktQHV1Brm9ciOJihrr6I7
         dGvVQsN3v0Q6znQAe0CBVkFjD25fJQa/WE/5Y76kGtyjicW3cijmh9YGw9y3od7Ov4w5
         8kJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785787844; x=1786392644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Or8YB/iS1IR9SFO+eCt6jFUyhlxTtdwHdXKK3jrL690=;
        b=s16jQowG8x1icf+2NoA+4KEZhbF77g1wsebQNsHoVONq6MqqKxHQjPpaDoUqADn+Hg
         bmW6GwuMOKnT5YMgYrkzpYcUVZnt9F5h2WS/F+cXspwLQaYUtqnwe4wCuYLTUNxQcktN
         /6rfj4m8yG6dRn217Gyxk5YWU5J5X7wfKnorB1gJ+MNnkst12AyrIU1xUrHsF0rkEngA
         9a/1ttordOqqmicOEWQzRj31BmERbN6H+kcczZcv/k8qzmpeua+zASuz9QVBohED7rMj
         vy78101WwWSFPjxM2u6+0JinOh7FMEgk/lKIs3Zc8+FkpZM6vEXebOmRkzTJcMSg2CXU
         H/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785787844; x=1786392644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Or8YB/iS1IR9SFO+eCt6jFUyhlxTtdwHdXKK3jrL690=;
        b=tViMl5D8eGkgTt/xLUHA9BO5hALtShhj0GUjtnHm+5TsP2k6i4afoj433ZwnB86nIW
         ya08WVyqTavkZLhRTe24r8j6mJLMnGUvRfzGPMuoqD0U5LPdbcU/rWp3Kade7rJgtU0E
         MN/AJlbq8gcbCcKiRWpWKpcJmDXKqG56f6ilRxa+D3OsY01VA/Nu1G6og2Q4a4KJIlFY
         M2KR6hpxg2+1nN6/E6CdMa8GX1LpzLIFOKTKE6J+Q/Lrr3sxgm2IzaHwwXW7xbqifllX
         gPoSxAX/VxECAasmTzHaN3SPSWQ9jtUJx7HD9u3drabgalo4f/IsuOKCqlm9azQnVb7x
         md2g==
X-Forwarded-Encrypted: i=1; AHgh+RpDI9LVxhLRN/pljWJW9AjyrLna5qMzJzo2vLJHccEmQdIDe2W7Fx2Oh0Z2ax4u2P2X3KqHZcHgmeo+@vger.kernel.org
X-Gm-Message-State: AOJu0YyxL4pdbkfP6IPSWeazFNMebxI8i/Ep3xLDKVGhcM8neWFOS+PS
	hG+G04hEBc6qspRsZ/ufJeQIb1UNMdmPJIS/H+dWPbFXxER635SqAEd4IhnSAFKech6Mf3MYq5G
	aM/w90ezUwgy2Z23neDABqD7+yzorBbo=
X-Gm-Gg: AR+sD13aa8r11J/RRQGBtb567WzvQKm3AhX88+8r/uQ2pUE+g1j6K/UDuxNyb4Bg3Q7
	jRIDYhDpiI9M8ZUtRep7DrENEeq0mqMYO1Eo+IUzVu3UFERU11Spt0JiJVemNme4F4ZLoSZc8vo
	VujvSLm4aRYMAn1vC4hJZEWOUR5uv47hpBJtViEspCgTGUd7pU3UpG5shCKsfTj1mBHkybCjsB4
	u8UMm96+nZDytYEMDBZ9+ps9vfiUvzZJbrMK9kPonveWTHPfyQd7tYC3HvKZG4/ktRzxGa3uq2j
	f246WZhz+O4FgzzF3I0HocuO5iycWjdRBpzGYbTxRRtWP6vsCmQ3sGx50IJ/nEidgbiVCWISOgy
	JPz+K7k4yyKV/X9WsuCmb1UOURlmsu0sfjiIL1S/ISg==
X-Received: by 2002:a05:6a00:410a:b0:848:2f84:739 with SMTP id
 d2e1a72fcca58-84ee4960de6mr10407856b3a.76.1785787843886; Mon, 03 Aug 2026
 13:10:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-b4-fix_btf_tracefs-v2-1-6b66da8dc103@meta.com>
In-Reply-To: <20260730-b4-fix_btf_tracefs-v2-1-6b66da8dc103@meta.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 3 Aug 2026 13:10:27 -0700
X-Gm-Features: AUfX_mza3LRmAzFtia5BzQBO5N5wE20rFpI8s-AgwGjpL9M0w6YZNe3TZXihsm4
Message-ID: <CAEf4BzasGK651xFBzSXgqzkiqrui-U0a+pGkO6E=Mim9zAyviA@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Make per-template BTF id lists file-local
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org, 
	daniel@iogearbox.net, kafai@meta.com, kernel-team@meta.com, eddyz87@gmail.com, 
	memxor@gmail.com, rostedt@goodmis.org, linux-trace-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, broonie@kernel.org, 
	Mykyta Yatsenko <yatsenko@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 5:18=E2=80=AFPM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
>
> From: Mykyta Yatsenko <yatsenko@meta.com>
>
> DECLARE_EVENT_CLASS emitted __bpf_trace_btf_ids_<call> through
> BTF_ID_LIST_GLOBAL, i.e. a global symbol named after the event class.
> The class name is not unique across the kernel, so the symbol
> multiply-defines whenever two translation units instantiate the same
> class.
>
> Switch to the file-local BTF_ID_LIST: the list is reached
> only through the event_class_<call>.btf_ids pointer, initialised in the
> same unit, so tracefs readers never reference the symbol by name and
> resolve_btfids still fills the now-local .BTF_ids entries.
>
> The handcrafted syscall classes are the one cross-unit consumer: give
> them their own local BTF_ID_LIST rather than importing the generated
> sys_{enter,exit} lists.
>
> Fixes: eadc0725ab8d3 ("tracing: Expose tracepoint BTF ids via tracefs")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/all/ff58b01c-3f5e-4d55-be82-609d2faaf12e@=
sirena.org.uk/
> Signed-off-by: Mykyta Yatsenko <yatsenko@meta.com>
> ---
> Changes in v2:
> - Emit the per-class BTF id list only under CONFIG_DEBUG_INFO_BTF;
>   without BTF the ids are unresolved and BTF_ID_LIST falls back to a
>   128-entry (512-byte) per-class stub, adding hundreds of KB of BSS
>   across the ~1000 event classes (reported in review of v1).
> - Link to v1: https://patch.msgid.link/20260730-b4-fix_btf_tracefs-v1-1-5=
f10b728f51e@meta.com
> ---
> Changes in v2:
> - Emit the per-class BTF id list only under CONFIG_DEBUG_INFO_BTF;
> without BTF the ids are unresolved and BTF_ID_LIST falls back to a
> 128-entry stub.
> - Remove verbose comments (Andrii)
> - Link to v1: https://patch.msgid.link/20260730-b4-fix_btf_tracefs-v1-1-5=
f10b728f51e@meta.com
> ---
>  include/trace/trace_events.h  |  7 +++----
>  kernel/trace/trace_syscalls.c | 27 ++++++++++++++-------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
>

LGTM

Acked-by: Andrii Nakryiko <andrii@kernel.org>


[...]
