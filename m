Received: from mail-vs2-f27.google.com (mail-vs2-f27.google.com [74.125.227.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BCD3C4577
	for <linux-next@vger.kernel.org>; Wed, 30 Sep 2026 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752349; cv=none; b=KVRb5VrgytDYm85BHYErghbB2cTWBhi8vhh7D5eOS3W974+j8+nu8UR2OuQzeT0mdrSkDkoYoS/j9edwmzfLmTb5D/eUdnwgyxaZ3FI4p7pvZUQVaf/oIjuwPLg0VJsr6bHDfsUM65XSYy6lrsS2Yf3bgDckFZev9SSmZ7tIC/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752349; c=relaxed/simple;
	bh=8IWokZ72tDwDWq2sw9b629Rjub6j3ctTrOYI2iTwHJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHbJZYomHKmvdSx039EtuuWvFDfp1PeQDyr9gX1TGGVOOJxDUZruVulORaGakTJehlAsEVyNb8vD6X458F3fMQlp0gX7AXzmOQsWgVZwOLeF/843LSWfwsYhP6ZHJMpJ8rFN+aJzbpdPs1Gr3GSVnCRwzEEVVfwvpyIhKe4Nyq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f27.google.com with SMTP id 71dfb90a1353d-5c963d7503fso1735173e0c.0
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2026 00:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752347; x=1791357147;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ndpnvvggs5Yyo8MyrvMBjpbgjCxaohPqITqE/XVX+nc=;
        b=fSumsDT7LeIOPkKAq9XNhPW9gXfc3YXauUtNTyDRsnXxsemg0KN1JNHDUkGVFgWF2f
         F8lz85iWXd5Dh0VC26R5LP71glO83TkXgxPsprtojxXcuY88d6bX6OeUWK1H7n4lYxei
         YlMYxsdHkyvEDVy5mK+oFOgABo5RGE/V4hvMxsgRYQC62VUWQjgzjNv11gbCTM2Kbh6k
         y/FH2DKi+edX0eIgLTcdcXnYtWMUMkjr2UBBJJLJBQyFUJPv7bmtV2T57MmxEm0VDuJw
         s/RMl1urB7Epcz/ldRnmEWXaIJaxW16Sr9oeIP+MPlp9GuK0WupoqHQ3MEsFyshGLXJj
         pNIA==
X-Forwarded-Encrypted: i=1; AKwUvByFn9R38IpmsR05gtG6GWFSV1d4ofHQZwXn/NkNPl4ozDLb8uYFGZUkfiPFYIJasaF5EPTLGPY14xdP@vger.kernel.org
X-Gm-Message-State: AFq9FYJF8/jSRpZgExffMudD7zaC0brnLERYlejAjRrYfuRKUTeJk+vZ
	hygRQjVUAuwYBL5IngRM8EPBysNo9CQcVKX1kyNnBpZ2+rs6r6W12bdrFp7kmbWt
X-Gm-Gg: AYBFou103z5l6fBsH3iOq1qGVhTPTzx9+6eTBd49KUMXLmLrU/W5CM09WsvO3ZziIE5
	stopDjBt9a7NIm6StFqqzVR+UKO+99Of0w1Q6hMiWKnTokzb/vPm0x3igqmlmBPSySYqe5lHLzl
	nJg42x1hRr+SS70FbRJoqG2zflhJ9z1XdW18Fwv9H3XcN+BodTQJCbrXrm0CJcbWh54pwagjgnl
	ocRVFpX+KwOM59nZqDIHJlyCrVseX0hH59AZG5Cc7z0jS8bEnZlafjjdNSki1On9eaXsrhkwZFr
	dFBf0tusBQ/95GZ1g+A3T44kcqs3nf8pwM5+hpE3nXKcUKXDBK/f8RGvXm2nUgZsk6GPpZ1zhoS
	wLA1zoHPBhOEtTrb3BbVUu6rmgsANV26ZZqT5Twv9/gCx2lAoKNzVX1pAEtF8FO50b9gYoUY6XY
	Q2ycJ8V1IwEVWeGJw/z1TutBcgurCBkGonHnaJpzrQ1AWlrnfYnKbFncdcm0/pgc6/mZPPwUXaL
	aUSAmdO57LlQweqhFICHrsCW8w3oKkHcfIb
X-Received: by 2002:a05:6122:3114:b0:5c9:a60b:e5d7 with SMTP id 71dfb90a1353d-5d67c8c7d32mr60190e0c.17.1790752347196;
        Wed, 30 Sep 2026 00:12:27 -0700 (PDT)
Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com. [74.125.227.37])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d612e6a4e9sm832389e0c.8.2026.09.30.00.12.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 00:12:27 -0700 (PDT)
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b9c8db8c4eso592397137.1
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2026 00:12:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZD0PBUMoINCLGm3JrSBRZB3LJ/8ZP1dLcgCfTonj0tS/0/OGpx949lQVySSEgboX2/lN8LJU/j6Dt@vger.kernel.org
X-Received: by 2002:a05:6102:689a:b0:7a1:f9df:e35a with SMTP id
 ada2fe7eead31-7be73c8805emr49649137.33.1790752346870; Wed, 30 Sep 2026
 00:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arp2hp7wRlcK_4D8@sirena.org.uk> <CAMuHMdUYNwi_MZtKGxnLLpUKDVAgRK8zT+2eaOcHAqcecx_LcA@mail.gmail.com>
 <3fa086ea-2868-4cac-a34b-2389355c31b0@sirena.org.uk>
In-Reply-To: <3fa086ea-2868-4cac-a34b-2389355c31b0@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Sep 2026 09:12:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZpKLzvmRyJ9=jhnT8OhXtTRsHYOAir4S07mzrEa4mkA@mail.gmail.com>
X-Gm-Features: AclHuK_W0Im8-5f3DLK8-gnVMzw5yRpsmUbP03nV_v3dMuQ6NkoOBdVKvbTWp5g
Message-ID: <CAMuHMdVZpKLzvmRyJ9=jhnT8OhXtTRsHYOAir4S07mzrEa4mkA@mail.gmail.com>
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

On Tue, 29 Sept 2026 at 13:07, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Sep 29, 2026 at 10:48:09AM +0200, Geert Uytterhoeven wrote:
> > On Mon, 28 Sept 2026 at 16:23, Mark Brown <broonie@kernel.org> wrote:
>
> > >         }
> > >  -      if (tgtdev)
> > >  -              mpi3mr_tgtdev_put(tgtdev);
> > >         kfree(mr_sas_port);
> > >         return NULL;
> > >   }
>
> > Are you sure this is correct?
> > Martin's conflict resolution in 0b5b2fb484f3b kept the
>
> >        if (tgtdev)
> >                mpi3mr_tgtdev_put(tgtdev);
>
> > part.
>
> Dunno.  There was another put came in further up the function.

Right. So Martin's resolution looks incorrect, too, as it calls
mpi3mr_tgtdev_put(tgtdev) twice.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
