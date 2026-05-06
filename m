Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4E126ED3C
	for <linux-next@vger.kernel.org>; Wed,  6 May 2026 01:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778031747; cv=pass; b=qsBMrj9f+jo3jhYUg9s0h7OawJm2VlpSkRjoj8cYfg5Q1CsVAX8uDGntS2WTOTlzaExa6wDGw5pnZZ8ckrLTUm+XQ38KIHND5oWlw/1ggkwR91ZiGdZB/eXXDbl0NnYLYJic9Oje2SsfrlqjsU/gRQgRddJL9WiTZEhJgpygz9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778031747; c=relaxed/simple;
	bh=pdfD52TAmWkGXpasqmHSj9hDvpRBoEHSkR5QcZThBHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHvrFzGAq401wNW8jY81/br2QDgI+6tJendUuCc6d9IUrj9z8XSDKdijeI1P3CTzMH0FFsB5NWsW0excFTe84wbDHJeqP9S9H8TbxzR/Kls2yRDjcnvsZ/eOj4Hl4J2dyywCFV6AX5E2A3bxurLYAXgaxfhnyb2E5+T7zdfKJj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuUJG27J; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuUJG27J"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8f0a87e23daso589793685a.1
        for <linux-next@vger.kernel.org>; Tue, 05 May 2026 18:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778031745; cv=none;
        d=google.com; s=arc-20240605;
        b=f7JL6MsBNOpqvzlFLjWN6TJBRmLkmmHEkxMAYtaKiPBenKK3+q71j8o97NMpyflzqT
         lHcwPsYeFdV+izmmijyaquL9XyRkd1ule+Kmkc57Ut7KmjRY9hALgMppxn7K0FjHILPv
         YN1u6r24UL0DzwKeFlz0/o9kDJmmc0q2YZRgeJWU4yrTBJWaFHrZAd4gZAGPyxU+ns6H
         OnoKfxonPWP2MoygV3LGbU5PAOD6eYRyeeC9dawIYqkWngMq2Z2nYFN6EmPiZ9YofYE/
         bbaEZwxzfbz/yR/R2v7tUsRliTWIOZGxMNPGkypPMaFvcH8IF4kWK7R3xpIDIcY8skJV
         r46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EN3POji8Ptv8pq9FbWY1N6uNRjXtcQOLJtybMOZu3UA=;
        fh=Q6J0pRN8Fv3j2fvSG2tBpMPl/n4EWIM6IdECgtuFmD4=;
        b=dFOlSVaRU6iNNDIbH6+DgmE/yGGdyMbnRUhNWkcSrG73hTaqHM5C9OcQ42v0kkrK/M
         vcskpG8Sg8braKXBg8en/0eI7vunUvn1hqvzfWhfCdvwvDYmfsO+KhuubiMTjfFDPK4B
         So5b+2ZhSen/tlg0BrPsLVfd8ELbN/akCgAmQ7W5SFMb8YwdEt0g1l3whj4+TIJ3xLHq
         xzFcDodYfJwBOsshj1nczQfrz1aAiKpUocZ4ogdBXXok6H9CXqYHYNUMpZTeXZDXgYOr
         cHqdeE0QZ6T2oagUoCNu1bIOnYyobocRGsh+rOHqRd9CPie8xeW+PdwnCoQUYU+IW+OC
         qiZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778031745; x=1778636545; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EN3POji8Ptv8pq9FbWY1N6uNRjXtcQOLJtybMOZu3UA=;
        b=PuUJG27JfVo/DVXDjLxt1Br6MMz9aRqERUW9HAtYk2nkCa2TSAaK4hLOLr2yJ9xowP
         zZflaaYnjJJzoMZI5yvvDwMurzsBgG38HiKCXHwOiofZ3V8M0LUGVqiZZh7TNU9T86Se
         ewnd7hecECOhyaFOgDaLNrAyXCt9H1n7yW6djg8rNFkD0gMtqFQ0pVczzugnq15DfZ23
         tovTgzHVTrUaSRSAs2SAMVilHI5BvIQJVKm/w1NrzrLy06v4ITxD9Xm6vXzyXDz204Nl
         3x4atYMOYgnlWRJJwvXpkWz4bRnvEwwqlmD76GiNbP/pZ3Lwkt6PDt4N0Tylnoln941k
         /3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778031745; x=1778636545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EN3POji8Ptv8pq9FbWY1N6uNRjXtcQOLJtybMOZu3UA=;
        b=SVoIu59NRTUTO5lbBKOU1u9pCgeKhjQhydGIsM050Ba51a653Ke2AqM1l51EarXtsF
         XQTsoh/jgRwccO/Np15JbZokmMU43nOUlneVKGpdLPPx6d57GCflLa9cSTTWqJZDam+R
         KOBY0BBfbAh/aA/V3r/jlPVLrXTQTL/atq89d65+WwXioON357JCrqUqPrSVNRdlzrEk
         pMHBG6+J7URdJqddw7aX1VuUZdYrO4VuwMY7tgURn1q/rk9vI7BrOx5FfIQVsiLlDBn0
         E2GW8RJ9uRgGNJTyPNlx579YldhUchWjlva5AKL/Aouugfch3ar8xdUeoMl61agQbMv2
         NWHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MVmAqnIMywvSDtwVGfSQ+30f+Tt3TH1eZAx7ud+aDnltJ9b0pR+i9m2KyBTPWkIURKLMO5H8be6Hm@vger.kernel.org
X-Gm-Message-State: AOJu0YxnOxR6U04iPgyZqjVKlqeuvJO1rukNGRwDhGBGS0fcApz8lq+E
	9QNcUDvV4+pJgAyAXPqHQIWxUTcF9H2AdBxrh6zTOrGR8gncbUYJsNhaTzyI1LeB/PCfPTFMOfc
	sxw2X95fnv88K4sNWYYbWiVAngvCi5LcKSDIjNCE=
X-Gm-Gg: AeBDietiqgS5Is+uCx3Z0Tq7hTLJYtZB+vPQXeuKkkx0hvG/yxJkXtLdkCVsm/Xcxjv
	e9PZijRGgD1K12ghX2Ve1nZKyasveWGi43rgZrVCm98LE1KfpjvvvbXWKsEJcxdxKJuXygeYCmg
	m+tBQ/EtmkYBVEuQE2mvqZHeXejkPdttQ/cN30PmUB1ezBMepnrszzTsrTrobida3F4B8EQ1Jb6
	t5eoYGPtyiAtUgCGzp5rhlLoHWBVIlb9J5TMFGnFNWQrGUfsx3ZawFm0zOoi27nY8D5G+RfHHXb
	8KKkhMxNrHnrpYmM8jx7sxh3elK2AUUHFLo3WaCy3KsBSpeU7TDw8WDnI5fXZU83Xoo34zzd+bR
	jZw==
X-Received: by 2002:a05:620a:4594:b0:8f8:8860:fb8b with SMTP id
 af79cd13be357-904d69d9e87mr244631885a.52.1778031745287; Tue, 05 May 2026
 18:42:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c36e7dfb-cf62-4d21-a3b1-f54cb43e0832@infradead.org>
In-Reply-To: <c36e7dfb-cf62-4d21-a3b1-f54cb43e0832@infradead.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 6 May 2026 11:42:13 +1000
X-Gm-Features: AVHnY4J4iD5smXrIpAMHJFcsa01tqBk4AJ9BDVgb7geE_sA9sedvb_-AQbfyQag
Message-ID: <CAPM=9txXGY7Pv7ge-x3roA422c=Ycefc7Ens20dEiHuKrKR=3g@mail.gmail.com>
Subject: Re: does DRM_GPUSVM require hugepages?
To: Randy Dunlap <rdunlap@infradead.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Simona Vetter <simona@ffwll.ch>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, linux-next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 3 May 2026 at 10:03, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> In linux-next-20260430, I'm seeing build errors on some ARCHes when
> DRM_XE=m (probably just "is set") but HAVE_ARCH_TRANSPARENT_HUGEPAGE
> is not set (not selected) by the ARCH.

I'm seeing this locally on my arm32 builds, Matthew, Thomas?

Dave.

>
> Does drm_gpusvm.c require hugepages?
> Or possibly DRM_XE needs some kind of restriction?
>
> I see build failures on ARCH=alpha, ARCH=openrisc, ARCH=mips (32-bit
> or 64-bit), and ARCH=arm (without ARM_LPAE set).
>
> Example:
> ../drivers/gpu/drm/drm_gpusvm.c: In function 'drm_gpusvm_get_pages':
> ./../include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_361' declared with attribute error: BUILD_BUG failed
>   699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |                                             ^
> ./../include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
>   680 |                         prefix ## suffix();                             \
>       |                         ^~~~~~
> ./../include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
>   699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |         ^~~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
>    40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:60:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
>       |                     ^~~~~~~~~~~~~~~~
> ../include/linux/huge_mm.h:113:28: note: in expansion of macro 'BUILD_BUG'
>   113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
>       |                            ^~~~~~~~~
> ../include/linux/huge_mm.h:120:35: note: in expansion of macro 'HPAGE_PMD_SHIFT'
>   120 | #define HPAGE_PMD_SIZE  ((1UL) << HPAGE_PMD_SHIFT)
>       |                                   ^~~~~~~~~~~~~~~
> ../drivers/gpu/drm/drm_gpusvm.c:1560:52: note: in expansion of macro 'HPAGE_PMD_SIZE'
>  1560 |                                                    HPAGE_PMD_SIZE ?
>       |                                                    ^~~~~~~~~~~~~~
> make[6]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/drm_gpusvm.o] Error 1
>
> where include/linux/huge_mm.h:113: says:
>
> #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
> #define HPAGE_PMD_SHIFT PMD_SHIFT
> #define HPAGE_PUD_SHIFT PUD_SHIFT
> #else
> #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; }) <<<<<<<<<<<<<<<<<< line 113
> #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
> #endif
>
> --
> ~Randy
>
