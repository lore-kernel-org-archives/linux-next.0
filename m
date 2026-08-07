Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC23C197F
	for <linux-next@vger.kernel.org>; Fri,  7 Aug 2026 20:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786135944; cv=pass; b=Q5uxuiD6MoCkhXkKYQJVzqUQr4lm9WH9pns/oI8PLJr1pt1pKPqUBJ8JKGFSUJMc9beiKAqPYO6cNnsf7hNEKNcebGsU5ODUIYdLh9TFD0Cpu/6vixU0PGNOTnqS0riWWXMJxpL8Zdi0kRH/W4Ztoh31QBmwNotvSa0W/dUgf50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786135944; c=relaxed/simple;
	bh=rxPCv+Y2aQjT7jov1lOBauad5ttogCmHcShnxJfkltk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlpCYiy2SLKzZCxBvHotLi/aA7b+zQXJNu7WRoq/tBzpOSpftvcS9eIHcDVEQGfpA1twPKP8rtcZRXBkZSJhNLLBbSzde+01so60IuZxvwWfDduHlrR1AlD8fn64WXNwoGeEdKOJ5LbhEi/GSs0WT4gLj1ucDq5KVf/Bvqtkvrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zsu7IzcE; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zsu7IzcE"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so483226a91.2
        for <linux-next@vger.kernel.org>; Fri, 07 Aug 2026 13:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786135943; cv=none;
        d=google.com; s=arc-20260327;
        b=bwIs/oxDhkrkODhMP4tlLYao/20BYnCIRYxvhhQ2Vqff5FBWJU8435R5gTRXbf55nm
         yvll3iya0Bggb+gFC/z7Bb+G1LIOe8zauqAbQf8NUgzShcFSa8evF5tzh8WcXWLjeKAW
         +aH7RjHbUmzZ2Y68KFwphR476SgRAVPJ5uVbvS7Ostr5DASYAp9anuYay5hathR3eHPV
         tEPvSeBWkKh4MkdR5+xoAXj7mlNTNbQlJlEkxlYWCoqqTVdIgZIA0+1UpNCCrEVn8/bG
         tPyrATSWFOli5wTjaDJsOFH0q3aiiipJFHizPdEdvOw3ohaugi0CerRUODqFDoRqHNj7
         9SXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BK/zEHP59zG1jivEaJdKbTYK1ZaxMZPv8AzyPrxGdV4=;
        fh=rUdNSZeHhSjOana8BrnKiCwsSx8PDWAJdlqEnaFZW0M=;
        b=ea00EUtQMqiB7mN65EaaAW/a4CpLTM45W4pfTRDQvtttYRzWG26bTaq3GYPeF3UoKc
         yRhX088w4PdP3wScWe8Qnmdfj+5722wzFKQi/mBQt/QabIhfzBQg3pGZbfYqMbr0nGTm
         A0nripmMzuir1GJvH8lT5c8J1MvmCYhDnFu7A1VEpIlpmTjeh2Vn+E3DMByqBXM9jGct
         gGtQMo3EtUoBAJTyUomvHI8cnh43cHIX49E4VEbmEq56MVxt9CGD/DT8d6A3vrv1G3Gs
         JhramEhZsoJW3Nz9nj8c8eo08QQFp8yr8HVywC/oDfSupdsSGNTNvM98X2Lvj19P+QVZ
         E8Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786135943; x=1786740743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BK/zEHP59zG1jivEaJdKbTYK1ZaxMZPv8AzyPrxGdV4=;
        b=Zsu7IzcErV2cmzr/mRiWEoXKw31XYFIqhsEGy/TR2AM+GuD1cJmtVdC3tWgWZXIkxw
         u4+AL3aNYIlaV29jIA0ull25wptc5X9xKxl/d8Mxx+B/B0OSKbFnsFDgAkikY/HUJzKC
         j1J2WpH/gd8J3w91U6vzFySTAsAJtIS7ehnguFcvrNBVGho3baWK3X6s3e0ZRQn3YXoR
         WBh6m0ywb4RV05fMnUgEi6Yj8d2FNxjH0O3LnY91Gh8K/7v0KbvP5cWrfVeWGKPD3XNK
         pnF9L90l5KzXuwjRRS6kB8/dhKUUapey0Y7ZYgZEMzZ/aE+2R4IoGCcDCWqTMK72dlmO
         wfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786135943; x=1786740743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BK/zEHP59zG1jivEaJdKbTYK1ZaxMZPv8AzyPrxGdV4=;
        b=job5qsvamWpyhxlR3Muizk1CPMXi9tYmF7xZRc7AyZuF+zbjwxJ5IuYhJRxjkAfoyw
         pruBfQ+EJ6qMNiWqpIcNXQ+IV7VRk0d9niIZPjoMHYKIne19DnwcfRNDVRdyTTfwhTnq
         PRxBjxNyQUY4cKSO0NIJA0rKxR16EVSldBMZoHt2XJOAujZ/cjURzh5RjZMRBdrNI98m
         rq7MqxNSdua8/eE+yZPtjXairRqj8W8Fzl3I41HNL0NWWYe/DEQnFiIcRMc3AMCXZDP5
         9qMS++N2pld6WDmWa4CudQ5WGFClXifZy3bZP8Gc0c6jE5RQdkmP5roqDoSF1G9BJ2vz
         fUxw==
X-Forwarded-Encrypted: i=1; AHgh+RosF/yl8xVBqfDJe8JaUCG1JmgGfMnTzTRApG+ajqvKF8b5NYHbSbrSq+T642Gxh0MuMyrIVBKZC3Fh@vger.kernel.org
X-Gm-Message-State: AOJu0YwppUtqsDGnxq7qTAgmUZTakZ+xep5klxVS+y1q7gNqGQIvE9OK
	P+JR8/yvnpEob94yDqSeaBa9P8ZGZ2QnE529zpaoHV3r+K3aZ+1T+kdcGF3gha//yWrfW55bSOv
	mcQI/tU4LxNDUTHSaO8Lnh2B+570tWVE=
X-Gm-Gg: AR+sD11s/coGkBUJce1EED0Yj8bYDNn9ZFe6Ir9UGyVRYQla3jd80+dbZYTLMuKeW8B
	BdzctmnqPr+ta+h9G0KosB11Z2kD/y66SA7bjRuRR8v6Euhn/il+gK9rYS6D70X8vyEJPVR5WH0
	vVkR/Q+TrEusJzIR0r8IXwp1C0fX2Q6heIw2siTuXFPMU91Zxs7jlAv4ekGp2+9SzTD+ZpKrtPH
	sGKUN+uNv9wq5sqHLAOEDQ2AlLRVlmO0/nY27Pv/+FFB9SjYynLAmDEL7F584hTJR+20dUp1zMs
	dytWnnPOOc/Ms3b+ikbIhQKA88f0rjkN8Z5nNTt8R+7Pt8uKZTlVEUInyxWMCl+fJ1r1EBj+1XK
	acmaqEQIoGADS+mKOmkWWZU0qeHyMXNrQhFP4Wkso
X-Received: by 2002:a17:90b:5448:b0:390:3936:8760 with SMTP id
 98e67ed59e1d1-3903bb0cf4amr19520140a91.0.1786135942632; Fri, 07 Aug 2026
 13:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <anX9ZElBEqtJ6py-@sirena.org.uk>
In-Reply-To: <anX9ZElBEqtJ6py-@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Aug 2026 16:52:11 -0400
X-Gm-Features: AUfX_mxuaBp8BJYWB-IVje_rXGq2I1gTBFVDslnaXV2g_J9fSytCD3jfkzbXHOM
Message-ID: <CADnq5_MnXMj31uNLwkjzjfzyzG_o3BVxecbBYpFW2esKwi7N7A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To: Mark Brown <broonie@kernel.org>, "LIPSKI, IVAN" <IVAN.LIPSKI@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <Roman.Li@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 11:44=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src=
/dml2_core/dml2_core_dcn5_funcs_mode_programming.c:11:13: error: stack fram=
e size (2400) exceeds limit (2048) in 'dcn5_mode_programming' [-Werror,-Wfr=
ame-larger-than]
>    11 | static bool dcn5_mode_programming(struct dml2_core_calcs_mode_pro=
gramming_ex *in_out_params)
>       |             ^
> 1 error generated.
>
> Probably caused by commit
>
>    992694ad28584 (drm/amd/display: Enable DCN6 sources compilation)
>
> though I didn't specifically check.  I have used the tree from
> next-20260806 instead.

+ Ivan

What compiler were you using?  We are having trouble reproducing this.

Thanks!

Alex
