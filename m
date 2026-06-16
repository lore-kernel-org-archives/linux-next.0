Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBE1366055
	for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601383; cv=none; b=kmvydT6LNAniUF2lYqlSgtIGqswAo+q5cRkEJa0lONJxdVtP76S/vjRh1noWGtaZs4B4L1Pk3GX8QHJqJHirihcLaUzSsrNKEqFBhtdxRVz/9LU1M63MMEcuF8x5zx3AeNtBB4LgJQONrxE66GerT900+WgZHXrq/DdpeCA+PHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601383; c=relaxed/simple;
	bh=8ydt2llqh1sbTXxPXV5TAQbpDgBRHOuaE1eE1niasiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YhxzdF5P6h1ZJCTL3g1ng6FUSBBaTqL8o8fQBs1MuSy5XkAqsFytzuRoRijleTmX8SyOI6NVDWJgCQCtj8tE9DK8R0mgOCii0duw3lA9+ni3wv7Lrmuhhz1eMF7MDU2WyBUluN8BdO2gQGEqsB5xj6TOjfOGD07Kg6myYv8cSYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59be89d310aso3303589e0c.0
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 02:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601380; x=1782206180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6QcGlPDQFiHbxd4De/gInfn9HKdUcPfKNWsAjhcdk8=;
        b=ALO0qnmsdxjy7A1IpDLn8OiEnATMWgBqHf04qairzFbW+8hdczrxSiNKM5pIX6Xwcs
         0XS8UVPSRCGByymYQQMK92bLeyL6IfjPzY4XTxFpopQg2BcAXpeFuM3IxLkvmQtIJODd
         gHM8YzpGupyI/LvflxA8XDcluQ4cBgFt20NOaTW3DRbX/jmQCCY/P1BHbAsIp+XT8gBs
         QY2LatXOK0hvj/7H55mfQJv+GUkWfF4Cq7SAHQ4B5OfeGs+I8qmmhE/6Oa3KJ/sF3DWk
         3OrVMKSxDyUIg+fcyBIpcks/LZObEFK5pj909Ot1SqEPn8pt+dt0yVxcvLonlLVfOZaN
         fTpg==
X-Forwarded-Encrypted: i=1; AFNElJ/T73EvHmasvkSIP+YdT1/6/Qew/qrl/ZCMJMkjNs97vaePrWA+5bYdp7AEk/N30hdZDcMC93psWPsE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs7FYIhySLcVL4NcpQzJBi7NYr2SbOb9KoXOky464kDCWfDs/G
	DYj/B/WD5l4mMleZkmT7CbxExznxuviH/aC/cx2Ml8mM3nWypHcmZXyqEA4BshcM
X-Gm-Gg: Acq92OGz0c9bqjdhshSjfVDhJSdc/srFemojylk4TGcSdGQMu0HMc1FCP8x7lvlutUc
	4oWOPjffor//DPMH3MxFgYoumfKZNuQZfyeI2dzhOFDvasVSlIpQCXIWzoyd/tq7b5Cl7LXbLTM
	HE/23ubdczIMZxpFIJ4pbm+GfFtCrWW2X7DUyILFuUNm4yalI6sZQdJTzAgud3GOun1cOBaevUQ
	/VYC7BfnMUrFzE28CdG8zqVIR1OrgzKCjbMHcoHqFSGSTWAUBFb0cEr6PT1WFL5o2LJIV/cI98Y
	Zt7hHLrfYNqmSXgh0B0wZOyLgYFgaUDovQM6GiIe3AqRLi1R/NrBret6G45G1ftVLALj4NkXd7k
	jxrJHnSfT3O7y1EH4ZBL6QKWsktemsxuNTmFT956MXRl8IU9SNQpKMEvmyxG8vRbyEtY33hrZeg
	wkQ63etosq/sItPf8bylVRra155nx3iq5SinxUgqOdaEx9oN7+FLMOkfVT/XZh4C/9
X-Received: by 2002:a05:6122:8b83:b0:59e:453a:ed73 with SMTP id 71dfb90a1353d-5bbada94857mr1053938e0c.5.1781601380367;
        Tue, 16 Jun 2026 02:16:20 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966a0149563sm4770326241.0.2026.06.16.02.16.19
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:16:19 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59bf145a74fso3539408e0c.1
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 02:16:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8CYf4E/mJZeMZLQQASjw+LtMJUkdKbo6nSrHDBPdhwoeWE/lOa/HcSMgmzwtsZP6DbnUj6AAPTBTDm@vger.kernel.org
X-Received: by 2002:a05:6122:2390:b0:59a:7b23:16f5 with SMTP id
 71dfb90a1353d-5bbad8b1798mr1101874e0c.1.1781601379326; Tue, 16 Jun 2026
 02:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aiq-GWegHjzdYJ2S@sirena.co.uk>
In-Reply-To: <aiq-GWegHjzdYJ2S@sirena.co.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Jun 2026 11:16:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxP4obaZ=U6fudN3q_sFaAAYFuoq-L-dZ1GYgszw_ezg@mail.gmail.com>
X-Gm-Features: AVVi8CcR6hXTmkeMKxaguE45TU4JWmRqgQ7Cb_Qg-Nr7jquYVQsTuunb8azs3Jk
Message-ID: <CAMuHMdWxP4obaZ=U6fudN3q_sFaAAYFuoq-L-dZ1GYgszw_ezg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
	Jani Nikula <jani.nikula@intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Melissa Wen <melissa.srw@gmail.com>, Melissa Wen <mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Thu, 11 Jun 2026 at 15:59, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/drm_atomic.c
>   include/drm/drm_colorop.h
>
> between commit:
>
>   94ff735296d371 ("drm/colorop: make lut(1/3)d_interpolation props correctly behave as mutable")
>
> from the drm-misc-fixes tree and commits:
>
>   5164f7e7ff8ec7 ("drm: Rename struct drm_atomic_state to drm_atomic_commit")
>   0c44d8dc6df988 ("drm/atomic: prefer drm_printf_indent() over inline \t")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

You forgot to include the fix, but I can confirm the fix in linux-next
LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
