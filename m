Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3AB262FC1
	for <linux-next@vger.kernel.org>; Wed, 27 May 2026 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887776; cv=none; b=PlFcylnF90+XDFykxOMfZJfsdzhDUltezB0Upqa6CqYv7xoOozpQxn1v63uZITiQvZ+htC+5rsawQNIGnd9vtXH13vw9hn/gQCWBmibJDWYprzO589MK6PJLeb4DNt3bu4KiYbTRDf1kOsbfnDrDqR5Wk/ardYyEzD4wkxaXIfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887776; c=relaxed/simple;
	bh=SRmk+8dKQHv1TNh+dPFDr7WBjwn/lnlQ8ebct8h++U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVFCqZx3Lv2KvNw4UfZJQbgWS66TrT9zqRBq24CKb8OkRlXurWQYgdaLnmVH8IJo2k+VnluGYtmzKcCLW3bcmBTvY+v4CW08BNenbXkgbjdWW6eDIz1j7kZv9A00t2u3O+FwpsYo54sr1NntAJS95KvcKnSeFuzHXI1nQkkiy44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=cuLyDnXl; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="cuLyDnXl"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1329fc4bf77so246085c88.1
        for <linux-next@vger.kernel.org>; Wed, 27 May 2026 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1779887774; x=1780492574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+lmAr4thq2tof1olIb/7jHlzqPnQwHivVehmpTFmxWg=;
        b=cuLyDnXl2kHWJw3kvaJ8XNU7fgn7zWqyf9lvtNzsjFvaLODZlmz9prlKjeY7KZ5uju
         teYX5S5IhRnTqSMynbVB44v4fnigdJSltDJ2j1YAdWffzw8iebECvhHVnONwpTGd3+/y
         E3HY4J/sNhPq9DV0VlytiM4QTxPYS+RjOzMV5WEpM2MVZ6Hi5l3bGBL0p0AIckEt348v
         Kzxf4jiSmUMGoZd7d1GlvIJ6Fs1mxGc04gKKlXxVyp6prU0aM0a131kAcWAhiQ5s7QP+
         iVJ9YzJFJ7pXY2ZiEsAE0aT2XdmKfLb/tGM17su21yuB7ZW6RXJs+cwFeMK6Y0Px2fpX
         fG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779887774; x=1780492574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lmAr4thq2tof1olIb/7jHlzqPnQwHivVehmpTFmxWg=;
        b=mzeju6m64tPhqdiWZpoEu3PM4wu1qZcNqLY/bFXSNTEjhnOwU0RFjOpkEbq8q0FndQ
         N1KC3jrMU2Nj5EeKm4d2ksVEdehcJKQSrqSQfFoN+d2EXIB2dLOcDZ/o2w7Y0+kiQqNC
         viboxpFPYjUFN1oCFrPEGEaNQxReXsLYEGQSxJmVqmc81hr8fwvn65wyKuK3osQmd10z
         qXwQMzusTQvvnV3RgVtZRBQVNAEUeQ1+paTcoNtusFJd8QOWUJPVx4ll9EkLYPsAAGF0
         cfAG3s00JANuPhOezly8kL0J2Din+hm25+3xlSP6UTnkly9sHZl6licoaci0tluWFxq0
         Cdag==
X-Forwarded-Encrypted: i=1; AFNElJ8GQO7Z/ErJg/RLYEPu/ucW00HxoodtTjC+qon0VJTEKEtJaoxFTKo9FIqdydjVrXmH8jE9T0e1v09x@vger.kernel.org
X-Gm-Message-State: AOJu0YzwbskF+5yDoViDmG88dLq8NiHOJ1/vhzIS6YrklQzamJQDiSf/
	zqH3LyHchoxTYT48xrquzGXvAcuBC99iENtRm84SPh9aw9313EoZAvjRayhaOTmP2MAdYC/rjqd
	LYru7QVNNkYk=
X-Gm-Gg: Acq92OEuyRyTDKmLC/S5Bx0tXVsrYURZD9UTbqPzKLmTsm8YqrwAU8H5UvzSV6fZwkh
	lj5d557qW0ASwVjsVsywy96yAbTYeLknaeYU2jQQUPN/JTJjPN19+/+fanTUabBInl187cwByvM
	BiChof8rnczmU4sQuNWfIy/h7k/UP/dnwgdkVftuzu4v4zMEimBWc7cPztoO/3csPr0ByTwukDm
	6UQjjJg6Nmea7IA3ZqG29aUr9sYcjs/thh9qPAsKm69IASVU1iWWi5thUStLxhD9FpKjjp3DMPQ
	APbouRCdQRqnbT0itfjzaEktpO5qbYL3zISzmRCzNAs6jqHI5JbtrK0ZfnR62gBmotWls/IAWx8
	Z1diWvZ437YIuXvlT/uVco2f17sQfnIfh0fTArO/sC3EsYwjzmR/2Wrp6UqMPOciSy+7vjK2rSq
	EpGCc88H3Nq0Hz4TPbv6PMHzo6HG27fvrNUj3e+EqMjpX+CH2Fh4Mdy6PDHUKuOjwNm3dGRj/20
	V+xc+JyV6aelO7WyZlAZ2UtKM2XcY9zvA==
X-Received: by 2002:a05:6a00:908b:b0:83d:446c:2a8c with SMTP id d2e1a72fcca58-8415f406c9amr22485922b3a.25.1779887401663;
        Wed, 27 May 2026 06:10:01 -0700 (PDT)
Received: from amutable.com (2403-5809-a2fc-2-a90-9fd7-aedd-d405.ip6.aussiebb.net. [2403:5809:a2fc:2:a90:9fd7:aedd:d405])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6eb0587sm2355259b3a.21.2026.05.27.06.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:10:00 -0700 (PDT)
Date: Wed, 27 May 2026 23:09:44 +1000
From: Aleksa Sarai <aleksa@amutable.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, Mark Brown <broonie@kernel.org>, 
	Dorjoy Chowdhury <dorjoychy111@gmail.com>, Jeff Layton <jlayton@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <2026-05-27-yapping-angled-spoof-tunic-AYfaAV@amutable.com>
References: <agruPPybCx8q2XcJ@sirena.org.uk>
 <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
 <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
 <e221b631-00bf-44b5-865b-ac970e6cb11f@sirena.org.uk>
 <1286370201.1726989.1779131564699@kpc.webmail.kpnmail.nl>
 <4bd253fa-c363-43cb-adaa-0248ac707a0d@sirena.org.uk>
 <12198575.2129298.1779371885282@kpc.webmail.kpnmail.nl>
 <20260527-bordstein-reizt-gemindert-a76319be86a1@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527-bordstein-reizt-gemindert-a76319be86a1@brauner>

On 2026-05-27, Christian Brauner <brauner@kernel.org> wrote:
> On Thu, May 21, 2026 at 03:58:05PM +0200, Jori Koolstra wrote:
> > 
> > > Op 19-05-2026 18:24 CEST schreef Mark Brown <broonie@kernel.org>:
> > > 
> > >  
> > > On Mon, May 18, 2026 at 09:12:44PM +0200, Jori Koolstra wrote:
> > > > > Op 18-05-2026 19:13 CEST schreef Mark Brown <broonie@kernel.org>:
> > > 
> > > > > Figured it'd be an arch specific version of a similar thing - I didn't
> > > > > audit them as you can see.
> > > 
> > > > These confusions with octal numbers in lists that aren't even ordered is
> > > > why I would prefer to use shifted values instead. I don't see any reason
> > > > actually why we should not just convert them all, apart from churning and
> > > > perhaps not doing it correctly (which would be bad). My rationale for mixing
> > > > was to use 1 << n at least for the remaining bits. If I remember correctly,
> > > > this is also what Aleksa preferred.
> > > 
> > > Yeah, shifted values do make sense to me as well - other than the
> > > inconsistent style the only issue I saw was that it's a bit less obvious
> > > that the values collide.
> > 
> > Yeah, that's unfortunate.
> > 
> > @Christian, can we get rid of these octal values? Or is that too much churn?
> 
> Do it.

If we could also get some comments in asm-generic that tell you which
flag bits are "cursed", that would also be quite great. My impression is
a fair number of people forget to check the arch-specific headers, so
having a note in the generic one would let us avoid this issue in future
(and IMHO will be more effective than just switching from octal).

-- 
Aleksa Sarai
Founding Engineer at Amutable
https://www.cyphar.com/
