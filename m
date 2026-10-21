Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792593889;
	b=zxrUbBbnkAXJdrFCzmez3EPZIl7kIK1BnJKqbDwvyNyprjIlcRZUVkIM/Jrv9eqK57wY
	 ymKJQ7ZessczbS+NIejvJC1RYJI+z3OTVoFJHuVogNd8DW4N4IwzgenmhnrUa29GxtsV9
	 wvrvzyZ3k9T2NdhlSo8ENPJcrZ2vT8is0966bvJf+kQYurEEYuVS190wYmkePizDp4+ux
	 ZcGuiVsfxv8mQlVp7zA8/JdgxQctU952/VX/Zeu8eIsfFIghWX3Qbr6Ssu0D56/qHUAir
	 p9iBuEcWeNxpHa14dRRK8Nmg1qrmnTJjqk2NSsFNngMdwZ15OLZrH77uWD0aW+33PRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/SdtQTNimM/c3u01Pfi/YBznj47rzAqOlWwKwD5tFqA=;
	b=DfwKfpBQ0FjN9QRF8yJZ4daNmEmflTQ1qVnVEOswAOql1+A0S+SFeNMpc98OCkPGAFfz
	 jhlUlk19HWdRgFJy8ZVd48/r9uG26PfZvhEI4Od0jExqnnZPcljEVqSfcc6AqzsbKL718
	 88bqsewqwAlu3cYOECNSaaxcs/Sbd2u3pyoc4+LtqEMBPGuhD4sLT3peYpBwrh+LZ4DBg
	 srXUhKriC1b+jIixj0V0ShxLC9dQXAuSL7ThFMx+YNT77vvqYVEtxusMcs5gMGvQcfYt4
	 wSkedrfrl5VF0fyP2iLth+9aPChYmCbGURVtlHp10clQN2Uzpr08rb/OTgws7YIs0qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nouA8OrF;
	arc=fail smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06888606A31A
	for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 14:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06888606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nouA8OrF
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so1000858a12.1
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 07:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792593887; cv=none;
        d=google.com; s=arc-20260327;
        b=Fd75suzuaI5aCqZ5u/D2nU5x73Bsm//PsD5d917UG+WktcVND9t/kd5Tyl+9upo+UX
         HqX5cmbElhbnTL4SU/LRfGeOXhhh73FaHb7S9FHP1MiVWkR3RUuAGsbVI1/grOPwoc3l
         swlM2PTzRsM75IFSCU39g6QD0ET6N8xomQ0axlnOVS+pi7bA5mdSa0ntHVYqldXGYXj8
         Tkkteh/A2r3/3/DE7tI+KRVc7s7esW26dp2j7km6ctpybo/S1TH854o/IX08oX9wiIRQ
         6pRsExEMczxylFKfwQ5x4Cmbbs44IJgjSZn8R0zkyY6cRUbkUhEG955tbkwNzCxQm6Ee
         Qu6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/SdtQTNimM/c3u01Pfi/YBznj47rzAqOlWwKwD5tFqA=;
        fh=nx62Ck509joGGTq9z+/26i7VKTti4engcFR1d1NnYNQ=;
        b=fPmRSv16lnr+EA2t4qhUav4zzS/7zqJSrvG5yS+aF8GrRoaF1zbuacHE8h9xipwOyk
         9iXLJkNFufuNsAGKk+OOmCg2gatgzHgJ6nHL8/gtUvcbCOgymMOQ6vpb5dt+KpKppiDd
         e3S+nTtkG82wpOwdYk9hupwyQTNgJAOG0vn5ecSHvb0Lmcf9/F4FsP/8bMG1uoY0pFxy
         67nfc+T+M7fklR6TP0aMR50HXfZ4v22T+YaWPAINEPvmiqjqKKxY+JlIABbfSqX+p2n8
         09Xu5xej8TFD9X35HY3hPkv7qaSNNGDlY1g9rw7lJeZJq8QFZCYNcZDZ5v8OEf6odi2D
         j2CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792593887; x=1793198687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/SdtQTNimM/c3u01Pfi/YBznj47rzAqOlWwKwD5tFqA=;
        b=nouA8OrFHl9fL+Lbh8UUUMpO7SjMwKij2146wVdw/8LZq1UUbu+8UIAa+Vk9Oz9N/s
         fHFJcw2EBJ1AqJ7qIiN/kt7dDUMJdbaeeFSyMam0lLrXPsQ3AFSlbHM6y9S9mkTDLsUR
         rq9+QlbcqzvtPCEpXU57Nltj2xyy+vGjTfByAjPGYvr+dXVBWcsP/PY4/Gwa8d5j0o3G
         vvrgpmDNWIW9WMitGh1inycGZaVfZYy1R9g+LkHa7aNdEzM0PNAv+TL5l8IJ9Ba+q5/d
         vE2aywY1pKC1tI3n2CivL7O1i2tKoqrqq8f15D8JnSiPql0b6gbolg7acmfuMJZQW4hu
         Gu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593887; x=1793198687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SdtQTNimM/c3u01Pfi/YBznj47rzAqOlWwKwD5tFqA=;
        b=FMPKDKFqtlrN2z807EAWCBZY3CNlOEaGQ+Nlr4F3CJ27I6dmfsInxlg8KCT8zF/U4w
         FBZlR3wMOejokoyIjO8mmJ1dH1Ud7S4qI2Q1HLdygGxemh7jMWz5VFJ/z3wO1N1+HzHc
         GucvyFWWIqejuPq7nQYmlsSkDzOSC7fIZDxkkh9dz6IOxHZvQeRKtbc90qELj4I1DJ82
         G0PYp4wiN0bp/tzDt/YKPPxawDgX8PlZ9VPVSOP3CztpNF+hRPMwNVovpiaVNNl+UDnm
         LKMYxEVazLrKHeO3HjccPcGfMC07qjflLnY+majpHRoLLsWul+HiakDI+zQbS1OIlzPb
         Nbmw==
X-Forwarded-Encrypted: i=1; AKwUvBzgcb9f7AiJse1lYzQe5gZdEN5Qfn2qNhV2/LSI7AGWi/ocL7lAZ5h7wjZQWxZJH6MhvwGTCKZoQ1eU@vger.kernel.org
X-Gm-Message-State: AFq9FYLd02iDl5IYUUcKrS6jFFnwBfo8YEnfL4b3Q7B5vlSyfPxpAUJz
	UqbBWpZZT0VQpkY6ioKprXYVn/EqmInGsuIpBsUs4YaVqB1IMBhnp6BjG1z/L5zTuu65YvcZRFr
	T7BA49yQgM8ht4ENStQ5QeJKd6nxAZPo=
X-Gm-Gg: AYBFou3x5Q4GKSYq2sgLI00wvo+8mIt4n3HzB6duF7Zt26v/JIispVrvIuL0Dm0vLVY
	LBzSoP6kEx5yyZ7agLsbaJb7pUkl8Yhd7yrRF1rG1mOAL7pMnkVxeR4Pje4e3Xa77aeGr7yplhb
	7XqKSW2izAAQMGQ0OQDt3RWSWbCU2AjbedsoyuMRJE/3hWk/Ue/zXrmHYruYaogOBFJ/bJC7D9V
	tBWeLahr9qtRKoaTj+bkh4ItLPibHR4tnmliH0UqPQD7H0p7/XPPUxXpZP5H7fG38P+fmecCfxI
	ayLpz6PioBSc+cZ8/J2duz6+jGziHqZrDsnXcXR+Ka2/Ub6P+e2m1S6xeb5khgJLBqAKqlvhB9Q
	gw/77mjBEa0OCgu2CYFP84IDPYKnC9/+T2sSGKdCWvc4cn5kpX2AsEnqzDAMLFR1Gin/XOA==
X-Received: by 2002:a05:6402:5291:b0:6ac:62aa:e3dc with SMTP id
 4fb4d7f45d1cf-6b408eb3552mr1639911a12.26.1792593887204; Wed, 21 Oct 2026
 07:44:47 -0700 (PDT)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ati4xX95dHM-JY3c@sirena.co.uk>
In-Reply-To: <ati4xX95dHM-JY3c@sirena.co.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 16:44:36 +0200
X-Gm-Features: AclHuK9-_oEVXrOAJj0SwuXd-a1VmqfYh3sfYNg3IqYu3jEkHopwEjZfieqzVbM
Message-ID: <CA+=Fv5Q5Lg4pS47Ki=Mnx3r9oEHrx9Fa588y8g6zmgSjjK3N5A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, Oct 21, 2026 at 3:42=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the mm tree got a conflict in:
>
>   arch/alpha/Kconfig
>
> between commit:
>
>   0d4c9dd06c364 ("alpha: select SPARSE_IRQ")
>
> from the origin tree and commit:
>
>   35e340a47888e ("mm: userland pgtable freeing is RCU-safe now, remove le=
ftover bits")
>
> from the mm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc arch/alpha/Kconfig
> index 8fafbfabd1e51,9063c7bda4e41..0000000000000
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@@ -71,10 -42,7 +71,9 @@@ config ALPH
>         select ARCH_STACKWALK
>         select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
>         select MMU_GATHER_NO_RANGE
> -       select MMU_GATHER_RCU_TABLE_FREE
>  +      select SPARSE_IRQ
>         select SPARSEMEM_EXTREME if SPARSEMEM
>  +      select SYSCTL_EXCEPTION_TRACE
>         select ZONE_DMA
>         select TRACE_IRQFLAGS_SUPPORT
>         select ARCH_WANT_FRAME_POINTERS

The resolution looks correct to me. Thanks for resolving this.

Regards,

Magnus
