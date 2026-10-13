Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B959397B1B
	for <linux-next@vger.kernel.org>; Tue, 13 Oct 2026 07:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878171; cv=none; b=jMGz64uqzUDMhQ01MDnZFn9AbX7smCwTnjvXIGVIXMmeuR3We+nr/OpGm/iCftYhnZ4x+dGluUEHoHlMNNNHccS49uJsLAO0d9UvuDcv8I22Zzg2HJ5AIQ8TfnP77SG8UyeslKpw67EjgoT8w975IYy7z8pvAwvul61dYK1cZeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878171; c=relaxed/simple;
	bh=FPqUzrLz5+Mbic78aW+tIjOGw4jxHiV4CV8UNQpyUKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRiR8tzweMks4XaGnUEYU0BpEIHmrl9dJYy/czcCRVQAVJZV1teOpQa3qUvV+YYq1BgSTG4PO7h2pA22P2PtyCTFG/F+gKTYBtHoIyLqoZuy49RPJbTunNaM8vmS56NISJketfvFqIlbr64Neg6Zf/EQOfyQIt/YAkQBsdTEqbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5e37ce204cfso2879714e0c.0
        for <linux-next@vger.kernel.org>; Tue, 13 Oct 2026 00:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878168; x=1792482968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9fAWZ7x6Dy4YpG9Dduo7Jtd1E0y1cfkP0evcWuU7n9I=;
        b=0qbk/P9K56hO+RTgY/K2rBvW1k0hoOjT5QFNxl2jsAllJzgPlCIP/Qq64zxRuk2qBb
         Uy01EnwIiBDaZGUDUADGrIiEvNSE9AZIS3h9bSNotN1ZXx3YFfAuoIX2TYbuzOOU/mHO
         JhgrDvqjLT18t0dZcWfAe5rZ7A0BGbNIR/rW4pWdu0wvJqbrQzq1MwrDQCsux9yHU8x4
         czFJ3VAtdodGiOTZUjqx3qraSaQu+YarN85L0HIfT5o5JlmmzqgeAqsgtUZ+cvmDcFjj
         M0xEx3a4aRawl/Sy8tZAOGjdjFJm4aaz7G5rJPRKxZubyrqE87GxFAGhAluqJ6acJjiH
         8pvg==
X-Forwarded-Encrypted: i=1; AKwUvBzeFgkExNBnnnJ1BckovvjXs/3L9h3WHY/jkJef8pFEqnUa0+YA08U8mpkENTf2gYuUdyfYQtZ//ycf@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/nNYY8pVFzkbIfpl+DmBdM7lQnUShS/yUwntqotv1QYebh7qo
	224LaxAg0aQ80o2J793WSdRahUFLW0DxAXPjYXHFPiHEOk90/4PPp4iRXoSEf9Xu
X-Gm-Gg: AYBFou1LPX69COl4E5Oak0jn1i2wSYj+fZpMY8tapgo1lg5RSXuBiJCC86y5Uuv2kCD
	bz5/NDxCSQd6Bs2mNbezX2G5XrbTBNpTaz9axTy6tPkQWHzfzzorhMZK5FWgfOEOOLt3lvtVOdZ
	8qwhtv6si3OvpyFU1IUuXW7tikR/hTfi1Yb3u8xCuf/CT19asoMlM0KuwsRis7GK9dbqTuYffw1
	VDsoW3zhBdkuRdEZeDMlw1Jbk90fYQ8KPM34YDZdN23bgM+HlZ/M4JVLY1FyTbHKdvpHKzF6voU
	bIsR9h23Sl6d6kEMlJnhc5q6fDTZz8d0dy6uOpY5EUY0SZ4Cc1Hy6A/bFqPht2rHczOSM4guPGP
	5kvoH1DV7WJLec6C6tj4v4zT9HpsF/LoGEPXM2HZRHhGxQip/yTlUJPZbY6cgaBNQie3HB0NYok
	GBxrEJlF8xY13lfJpDtYVQswd6M/Qrj7nlzI2T0EO/0soggHRNQzMoHwjSjQa+q4DhGFNvoJCUl
	SbYJjTfz5Y354M7Q07gwuObw5OTGVXS3b9dWV3cXZzdd68=
X-Received: by 2002:a05:6122:3c4d:b0:5e6:cac7:9ff7 with SMTP id 71dfb90a1353d-5e91e7ad625mr3198527e0c.21.1791878167912;
        Tue, 13 Oct 2026 00:56:07 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cab57c8sm8479163e0c.5.2026.10.13.00.56.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:56:07 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c33cc572e6so1919829137.1
        for <linux-next@vger.kernel.org>; Tue, 13 Oct 2026 00:56:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwDCzNZ7utSK9vd6p8agrY88apGKwweOu0579qgzlV3SLpihEXoTdTvv7NoCa8pEpzCNUj6cuwa7GP2@vger.kernel.org
X-Received: by 2002:a05:6102:44c1:20b0:7c2:37c5:dd21 with SMTP id
 ada2fe7eead31-7cb39ffa0c0mr2123690137.17.1791878166862; Tue, 13 Oct 2026
 00:56:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aslAEm5Qsgp-9xD9@sirena.co.uk>
In-Reply-To: <aslAEm5Qsgp-9xD9@sirena.co.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 09:55:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRP2RaDvX1-usBjiYUW0sCaCccd64a=rAH-LubYMkTyg@mail.gmail.com>
X-Gm-Features: AclHuK8bLxOSxcXpfIpgmHR08UPT6dIGR9_XUIdBL3o1cXFtPLMptGHwNPscJlA
Message-ID: <CAMuHMdVRP2RaDvX1-usBjiYUW0sCaCccd64a=rAH-LubYMkTyg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pci tree with the pci-current tree
To: Mark Brown <broonie@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Priyank Rathod <rathodpriyank@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 at 21:36, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the pci tree got a conflict in:
>
>   drivers/pci/pcie/aer.c
>
> between commit:
>
>   79c168e2aa957 ("PCI/AER: Skip error recovery on false alarms")
>
> from the pci-current tree and commit:
>
>   d4c842c3af5bc ("PCI/AER: Fix memory leak in aer_recover_work_func() when pci_dev is missing")
>
> from the pci tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc drivers/pci/pcie/aer.c
> index 922a726a52a50,c376c3adbefd2..0000000000000
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@@ -1393,15 -1383,15 +1391,21 @@@
>                 ghes_estatus_pool_region_free((unsigned long)entry.regs,
>                                             sizeof(struct aer_capability_regs));

While your resolution looks correct to me, it can be shortened
by inserting

    if (!pdev)
            continue;

here, avoiding the need for breaking long lines.

>
> -               if (err) {
> -                       if (entry.severity == AER_NONFATAL)
> -                               pcie_do_recovery(pdev, pci_channel_io_normal,
> -                                                aer_root_reset);
> -                       else if (entry.severity == AER_FATAL)
> -                               pcie_do_recovery(pdev, pci_channel_io_frozen,
> -                                                aer_root_reset);
> +               if (pdev) {
>  -                      if (entry.severity == AER_NONFATAL)
>  -                              pcie_do_recovery(pdev, pci_channel_io_normal,
>  -                                               aer_root_reset);
>  -                      else if (entry.severity == AER_FATAL)
>  -                              pcie_do_recovery(pdev, pci_channel_io_frozen,
>  -                                               aer_root_reset);
> ++                      if (err) {
> ++                              if (entry.severity == AER_NONFATAL)
> ++                                      pcie_do_recovery(pdev,
> ++                                                       pci_channel_io_normal,
> ++                                                       aer_root_reset);
> ++                              else if (entry.severity == AER_FATAL)
> ++                                      pcie_do_recovery(pdev,
> ++                                                       pci_channel_io_frozen,
> ++                                                       aer_root_reset);
> ++                              }
> ++                      }
> ++
> +                       pci_dev_put(pdev);
>                 }
> -               pci_dev_put(pdev);
>         }
>   }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
