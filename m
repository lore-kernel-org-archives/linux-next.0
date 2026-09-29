Received: from mail-vs2-f15.google.com (mail-vs2-f15.google.com [74.125.227.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458754C2248
	for <linux-next@vger.kernel.org>; Tue, 29 Sep 2026 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671718; cv=none; b=dBzfd9wnMA3T0sCqcXZRZ5z9jWkL06aw+EyH3gFmD8WYF/aQlAuEpKWVkCmGQIXwJQQz5H+tsilR2xv/7aER5N+lBJcJ2wqCKvUxkSithy6nCEoqm2Tz0rnMW6KTJlCgagTiohc7tXBzmI6mG3a43v/ecC62Nex7i3UGjjcd/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671718; c=relaxed/simple;
	bh=5mjNEd9vqE07TKBvJOnK2DOHELggk5u3L9fnCaDM24o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jML7+BOijGibSklzTboujOYGhtKeCSm4qK0i7FkyvrNGxobQMhi8+u9hJqkEZAjvPN1KeGvgi2R3nLgz0Bs8o0DSXHEpgUcDFRqU2num6LltUUlXXZF3KdsIOnFWpRx5oQt4AU8ZIB5QGh+y2kbYcOQ3km0j0ZBqz8Yy4fvOynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f15.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso2760676e0c.3
        for <linux-next@vger.kernel.org>; Tue, 29 Sep 2026 01:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671703; x=1791276503;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dW8j8ofdQzxSoT/SH6zMeJi1Fm1Ilqx1vsGdzoIEcYk=;
        b=ymHuKWEoQTTYVZ/izCEeDsh00RqUIOfIEbYWHzqDK5kdvSCq2Z4YpHywly8K2Ylg83
         +H8SmO3w9IjHLP8KKSstoc9ouQSG4IICrw9KbLkMucSfHbzBJ+aTljnXBgqZ2mNUxbtT
         GuyJwSMd0GjZTszRiFjIgRo92bdjq3j/MQAjzaEwPE2akFbsrKW29aHZfsIx9oxHRxNz
         9ARcHNGh9Uad3TV5kJJwudUSDVpDiwoSgBo3ycZvCyAP8snTCmFDLuZYW840Q7P7KRHj
         ooasw3xxl6suAOm/ZI75FzGUZPFTMowrsohbkhE2ACAQUX2m1OF4/jjG48tfoJqXiDLG
         SlAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0CxG4kQ4d3NrbEXSyIMUw25Tq07E7fL/Gt89bVGP698FkPQQFkX1r4OJ9oWp+yDqQQeo7iL42avkv@vger.kernel.org
X-Gm-Message-State: AFq9FYLaIb6YjdUMf1QLBXe2IKD3iLxw4OSseoUWuctK2woRSyDk+/8R
	k5eR+m5OvSROdzBzvWA0qk/OqhJKxZiOPYMlRQ58FTVNYFPdBee6D8zTeLSRNNmZy1o=
X-Gm-Gg: AYBFou22dVodA4XfPQ6VQNaVenagU62lGZL4UxleNn+pTG+6v4sUomz6KZm2nBQh1nC
	sOR8dleLh/sl5PENbZdzgVMDQ7dnTzDCv0nuQRheNznKF6ylp2ljPUBgQPuIS9wnC1z0X24hTeS
	hhdJdCiWaBeeP2UlSY4C8tsmGhu8en7O6rQWa1894THXlqB4+76b+LsCCKPZ5jrpqnIVHEGXZo0
	VP+4+1u+q1Ij8fS1cO+rrqp9PXHi2LZcJMeWW7KHE3ldrS3UwDrXY78oDovfIiL/V+OwcC38ROQ
	oujiqtSTs2qpVLXm6CEdRPdVWC4fY/3H3SfTZI02Q+7zCHbYBlFkWK5ORvxYvi2ojUHkGI8YJq4
	9Hwg9iKkgy86zG2BpT3yrjBiHg8ZdiHEH3cxKbtj+DrEhOSuxqmtkPQmhh+dtS1XM5HReTvK+FF
	VVxJ/RxsmrMCiazO9CSue/m5Um/XkYAR6eF4qYWQGXmAKYFxBXe99ePE9Xs8v0yUv+VYpCmZ3ks
	FygMU0XMawfV1METxwQsyIeWX97WaR87pEneg==
X-Received: by 2002:a05:6122:338d:b0:5cd:99bd:7c26 with SMTP id 71dfb90a1353d-5cd99bd7cf3mr3800074e0c.2.1790671702737;
        Tue, 29 Sep 2026 01:48:22 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d182d2394bsm3847028e0c.15.2026.09.29.01.48.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:48:22 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1866610241.2
        for <linux-next@vger.kernel.org>; Tue, 29 Sep 2026 01:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzEk8iwcBuwSd6rlf8FnPeqn8XLaotPdjx24zNC1FZ46o7Y3uGhEz8+gkbkzQRK8YOamnjORHI7MH7R@vger.kernel.org
X-Received: by 2002:a05:6102:f8d:b0:79f:5d5e:11bd with SMTP id
 ada2fe7eead31-7af1cca44e2mr6105354137.13.1790671701623; Tue, 29 Sep 2026
 01:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arp2hp7wRlcK_4D8@sirena.org.uk>
In-Reply-To: <arp2hp7wRlcK_4D8@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 10:48:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYNwi_MZtKGxnLLpUKDVAgRK8zT+2eaOcHAqcecx_LcA@mail.gmail.com>
X-Gm-Features: AclHuK9Cb76LyDcrljUmH7gWFoe6C0pl4IPhB7p8im6DJ1a9Frm0gtBPbWjipOI
Message-ID: <CAMuHMdUYNwi_MZtKGxnLLpUKDVAgRK8zT+2eaOcHAqcecx_LcA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the scsi tree
To: Mark Brown <broonie@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Chandrakanth Patil <chandrakanth.patil@broadcom.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, "Martin K. Petersen" <mkp@kernel.org>, 
	Ranjan Kumar <ranjan.kumar@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Mon, 28 Sept 2026 at 16:23, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>
>   drivers/scsi/mpi3mr/mpi3mr_transport.c
>
> between commit:
>
>   29e3f0856e854 ("scsi: mpi3mr: Fix SAS port allocation and registration error handling")
>
> from the scsi tree and commit:
>
>   0b5b2fb484f3b ("Merge tag 'v7.3-rc2' into 7.4/scsi-staging")
>
> from the scsi-mkp tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --combined drivers/scsi/mpi3mr/mpi3mr_transport.c
> index a3412cd4ca5bc,8ee7ce1480c8d..0000000000000
> --- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
> +++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
> @@@ -1567,10 -1567,12 +1567,10 @@@ static struct mpi3mr_sas_port *mpi3mr_s
>         }
>
>         list_for_each_entry_safe(mr_sas_phy, next, &mr_sas_port->phy_list,
> -           port_siblings) {
> +                                port_siblings) {
>                 mr_sas_phy->phy_belongs_to_port = 0;
>                 list_del(&mr_sas_phy->port_siblings);
>         }
>  -      if (tgtdev)
>  -              mpi3mr_tgtdev_put(tgtdev);
>         kfree(mr_sas_port);
>         return NULL;
>   }

Are you sure this is correct?
Martin's conflict resolution in 0b5b2fb484f3b kept the

       if (tgtdev)
               mpi3mr_tgtdev_put(tgtdev);

part.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
