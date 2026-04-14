Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02D130F806
	for <linux-next@vger.kernel.org>; Tue, 14 Apr 2026 03:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776135630; cv=none; b=kxp5+QpwbScW6PlUhii1c/Fx4NwiVS+qZREZnSaKoHDfLxufAdkXN3zocefD99DBMW8N8SGPiF7g1dCj4HKVFhbOpx3cC5jIrHgI+3rGPGkhn6ZsXpfVdlhx1ZWcnHUNHed5LTWPvrx5oqZArj75+wkbz6t4NwuRaT0sARpicGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776135630; c=relaxed/simple;
	bh=qXSPLJp3y0cI4w40AM0U1rhCylz1/nEBRmZxLE7VAMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPDibLGSbjp4TmQ3od8xU2cGZiWHJFPYzTQT7QOwJEg9+OL4gt2yJAcodNAiC3Q/u3O7TOZpThUbbbt6EKAKOY2ABYsAOHJdgTPWvukFQWVXyYohyNSlE28D2NwBpjmQxuOMHgxg/5ZJb1fZuFTrcgSrLCJY/srd8MUXOcXYhLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HLXJzEjd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HLXJzEjd"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so701494066b.1
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2026 20:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776135625; x=1776740425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqq6V0aXBulJSsEzfaNQdOcL2ZbSvoH/w7ZAJ/kpC5A=;
        b=HLXJzEjd9zhWMlnqptbIYO7cFqE4WZttx7SO47IK6mk/5wgjLVTPOcdZP3RMGkExw4
         HLo9q3oXIYjrtPUfIQhTzRggpy2DQZaUXx+Myk0N83ZQikbeUefYPd6hMS+g51pH3QeC
         JE/KcRAlT7J1v5nHUMSY7H4LIrl3WFWBQAqxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776135625; x=1776740425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iqq6V0aXBulJSsEzfaNQdOcL2ZbSvoH/w7ZAJ/kpC5A=;
        b=HhbN/W89Vp/WB9eg0wlcp69eTevWoClPpvPf1MGwJH8+smULVn0C9+0etuIiuXho1R
         A72gBxa91CP4mYzRaaJEIAO9b8mOUUXOStemEDIvyHW/kIo+UD+ycEkdTAbozowtB8PA
         A4d0KWy/lo6Y+/CoMdqKA1RQ/Ldl/gyRrWqOZQDaMlAH0X1Ca4TegyAcVRzzODt79rPZ
         Lg3D6Cgj9mvC+TD/3aUCqRedsDJDkii/zLQUTq95wb4myXjQB6LF+7VrfuJZWG4+Xx8O
         tbnZ5oTV4BSXiJcYK1CXw3jQsJ1/vOBiSFaA9/+LDo//AI5uM2LgQRYygI8nfAVM3ArK
         ShZg==
X-Forwarded-Encrypted: i=1; AFNElJ866P9jDhhyM+TMhv612I8g/6z+jUVuGPltI5ke3AHq3C41p4GHz/DZLSILMFSn+Hf6U2/fWm04xgXs@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx+neHaNleb4YCL87p9ZnswMgIQSDBbjmU6sFOk/2Qi2q4SQuz
	owFDyQSKXFvzBtWi+0NPSW/Py/feh+kmLBZdxlJfdtam+4dTsSIxsNc9+o9rWG5QYDF68xxdC3A
	FR4M3Kg==
X-Gm-Gg: AeBDieubIxtpGCCfJT0cmzId4XTKEC/6kywXuKtqwtyMa/4jQBOFRXVe2JjxIPsmLHC
	5CQtkNh4QlcRIh87XzWiPYjc5s4ZLtwlK/vWfrd+Cm9cn5wlGFyCyds6Drwnns1i8qJBtRrppjf
	NHumI0KUEgARkVHKX0YS9tJzc8RzbsWyUOPsaSTIQ4xLYkrvbUbeXcXY8XzA05arnhIQlhcpK6v
	M72u5jZKzBYPEerbIGQoYHMq2BfT1o+OLy4FGiWM8xMXkNTaZ7gAfDiYMAgL4eN8b1XggZ9dxET
	WOKKrt5SDc8dwgOAkC3VeFMUOG0U+b2LZHwwCYMyh6yFuHji+ZLY83ROQAWmhlupwpiw5c+lA1i
	YXOPYk4QdW2OyUxDnWrmbbeT4+vnlJkgnNYgoLUYQJ3j8mZuv3jhNnPXrwZsrPf0D9pGkOokIMQ
	id9VWOW4dXjhypIXyvZgNyYOeXNhQIlD3hCHV/AHc9fMYIlbGeDwydaP7i2uY3/vUgd5NsuiM2
X-Received: by 2002:a17:907:2d89:b0:b9d:8697:73ad with SMTP id a640c23a62f3a-b9d86977702mr841413266b.26.1776135624880;
        Mon, 13 Apr 2026 20:00:24 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5457sm353525166b.35.2026.04.13.20.00.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 20:00:24 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfd832155so3453761f8f.1
        for <linux-next@vger.kernel.org>; Mon, 13 Apr 2026 20:00:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/OwF50bKR4x/BRfgH9OHXAnF+XJiTdtLi5kLzxK7O/gDFBfuOBggOHooPdm4YzAwXPuR/4gntBp82p@vger.kernel.org
X-Received: by 2002:a05:6000:40ca:b0:43b:3bed:f3b with SMTP id
 ffacd0b85a97d-43d642be135mr22750973f8f.34.1776135622646; Mon, 13 Apr 2026
 20:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ad0SNjugVvkAwhok@sirena.org.uk> <f318cd43-81fd-48b9-abf7-92af85f12f91@infradead.org>
In-Reply-To: <f318cd43-81fd-48b9-abf7-92af85f12f91@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Apr 2026 20:00:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBy4NyQwE9vmLt9pggkC5P8fZ=OXoX8ZxJCoRo7ekZkQ@mail.gmail.com>
X-Gm-Features: AQROBzBuADOQ6WA9255mMu_BarbBrcndl3pWz00tQJk7YMJhBGnTWP7C3N7gdxo
Message-ID: <CAD=FV=XBy4NyQwE9vmLt9pggkC5P8fZ=OXoX8ZxJCoRo7ekZkQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 13 (new htmldocs warning)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 13, 2026 at 12:25=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 4/13/26 8:56 AM, Mark Brown wrote:
> > Hi all,
> >
> > The merge window is open, so please to not addd any v7.1) material
> > to your linux-next included branches until after the merge window close=
s.
> >
> > Changes since 20260410:
>
> New 'make htmldocs' warning due to:
> commit a2225b6e834a
> Author: Douglas Anderson <dianders@chromium.org>
> Date:   Mon Apr 6 16:22:54 2026 -0700
>     driver core: Don't let a device probe until it's ready
>
>
> WARNING: ../include/linux/device.h:519 Enum value 'DEV_FLAG_COUNT' not de=
scribed in enum 'struct_device_flags'

Sorry about that. Fixed:

https://lore.kernel.org/r/20260413195910.1.I23aca74fe2d3636a47df196a80920fe=
cb2643220@changeid

-Doug
