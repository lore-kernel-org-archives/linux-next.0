Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14354224234
	for <linux-next@vger.kernel.org>; Wed, 11 Feb 2026 16:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770827423; cv=none; b=drKpKeRbij1k/OzV3knkYSJYRUlwOs81Pg7p3JoJDPy8h1/pwGbUhuuYNvZKfVcsCSxZmUI3NPgG1vIURqkCEsnEggw5+kXuXXWGNU/C//49Gq/e/3jdf/NYMCl82QUKZKS2rKUc/0WPVEEHODns9T8Uxidq/VBZ9UyUf8fcjsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770827423; c=relaxed/simple;
	bh=cMeZSP4ASQ8GWND8BDmf5TSh+qhh/ToWaWSuqXzHvDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpPDrz7DRfTaJPqLOJ1zN3RXI2+9Yedk7eNvwT4ciARfIBypon7Vm9G9Cw+EPMjlfPHgZi6Kg4ftQLYBkkPyR+5Yd5NPIqnjXZlBMTxf9UMDLLMNiPSJrzYBJCZkYX9RNTCZMX2MoYiBw348mdtKhhYjNvEpydNDxLv8ShaRg5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-948aec218a2so1454736241.0
        for <linux-next@vger.kernel.org>; Wed, 11 Feb 2026 08:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770827421; x=1771432221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B4ogstsr1LPrx78n1KJ8ejaHIz64tROV+G0WDoBzT9Y=;
        b=qSWXdMDmrWPRQH1cpmZFJb0Hn00AA9eji3X8/KVoNbU6HlSNHiQxPi9M5Bt9Q4rue4
         30nYXrk5lbRwg2aqSGmT6crkkbvfkRv4+Wu+7A1H6eua3LDMph4L6iIbAqsmRK9Uxsa4
         GIfId+sSqDXDJDelIMrheKcYYp87g0UM3yDCOkKKHtS/X5M2fZALo1+fwah5rCYPlr2b
         R8uEfzoV7UDVRq0uChtK5wSbQbY6T1Uj6EJzMg8GhpIVY8kp1xE9lOQfQ0EN7+b8q6bn
         dJS0FMYaM6+OcK25ychmHh6tEhVWVwHGT76EBYRdoMqL1VI1AzlOsc0u6nLRBDHv93kx
         rQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+RTweYigcbkYjp4HZqOnrGThoEjAoWy9gB2kjHLVyaWNrCZj5GyjwL5Vbmol6ua4UMBiRevOMpkvw@vger.kernel.org
X-Gm-Message-State: AOJu0YwrEri9LE+IxDgfW0OC/3d+r8xNXF1dABxa2wgaZpQSLCWScikZ
	Gq+aJ0xIaJ5SptGjXopoRP/ccTgSAPkXVNwNBrxyGsQ9Q9cRwBkuNkTwQflQeDZX
X-Gm-Gg: AZuq6aL2NHJk4dNujW+YPqNVTNQdITKX6kQtZotNCIxKW2tF2qY3i4BVuaK9OgeVOMz
	WlHJaqgAEEsskLGmprDWhhR5FbhIETka+wf1/a17dXD01gWfhFwXlQoTKN//ojat8BQ2Ex2gJ77
	tijRY4YjisZXvRySVQc5O5RLgm2qOxy3PEqLwWfnpxEbndQaegOF4pC2o16J0W3nwBuCInQUbvc
	BB4ssViQCxYPTStAGFGC8LTZWZuwJeFHPdsdHkLSv+ZF7250slUsa6Ulfss0VlBVagHkgFeOCif
	/AB309LMwuWzcnV8ENMNNc8T+YiY3yXicEvX8d+Un+irsmHwheNnbmExQeXVEwGxr/4+ewTF5yW
	Md/+FmiNRZ7+Xi11b9m47FTEecSu36zjx10U7I42eJQQwxiKik8kTkilGxYbL+vhxIeRiw53Guz
	2qIvhyuvDY+3FML+dicrrtFm83Gmnutt1C7rIborC2lw0CXyCwLxpi2qtFb/Qf
X-Received: by 2002:a05:6102:2921:b0:5f5:4d10:19c3 with SMTP id ada2fe7eead31-5fde9063b80mr782758137.2.1770827420102;
        Wed, 11 Feb 2026 08:30:20 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fde8853847sm837667137.4.2026.02.11.08.30.19
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 08:30:19 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5faa8a9d7b7so2013528137.0
        for <linux-next@vger.kernel.org>; Wed, 11 Feb 2026 08:30:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWDsx+3g0bNFbY4ie7KvH7pka71Zz1UnnOCBpdmy5tCcoKumS4IHwzwzRCC+wAJRGQY3j4NeV6Px49@vger.kernel.org
X-Received: by 2002:a05:6102:4421:b0:5ee:a8c4:18f2 with SMTP id
 ada2fe7eead31-5fde93f801emr629474137.26.1770827418853; Wed, 11 Feb 2026
 08:30:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
 <CAPDyKFpY2X8hephSfHq7rj_DaKX76ZSkWSCYXrGTEBUFHkvOzg@mail.gmail.com> <aYyrsPTH1923jV7y@vaman>
In-Reply-To: <aYyrsPTH1923jV7y@vaman>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Feb 2026 17:30:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHNRuMmHU2ACX84nsZdXn_-fSamnF+LMFvZS3vkHnEWA@mail.gmail.com>
X-Gm-Features: AZwV_QiOx-vNn3RXDRusgjf7_W4m-z1gNAHOmJNuwbjVfchz_J9gD3jZ3pe8F9o
Message-ID: <CAMuHMdUHNRuMmHU2ACX84nsZdXn_-fSamnF+LMFvZS3vkHnEWA@mail.gmail.com>
Subject: Re: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local devm_mux_state_get_optional()
To: Vinod Koul <vkoul@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vladimir Oltean <olteanv@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Josua Mayer <josua@solid-run.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, linux-phy@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Wed, 11 Feb 2026 at 17:17, Vinod Koul <vkoul@kernel.org> wrote:
> On 10-02-26, 14:34, Ulf Hansson wrote:
> > On Tue, 10 Feb 2026 at 11:53, Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Now the mux core provides devm_mux_state_get_optional():
> > >
> > >     drivers/phy/renesas/phy-rcar-gen3-usb2.c:944:1: error: static dec=
laration of =E2=80=98devm_mux_state_get_optional=E2=80=99 follows non-stati=
c
> > >      declaration
> > >       944 | devm_mux_state_get_optional(struct device *dev, const cha=
r *mux_name)
> > >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >     In file included from drivers/phy/renesas/phy-rcar-gen3-usb2.c:20=
:
> > >     include/linux/mux/consumer.h:64:19: note: previous declaration of=
 =E2=80=98devm_mux_state_get_optional=E2=80=99 with type =E2=80=98struct mu=
x_state *(struct device *, const char *)=E2=80=99
> > >        64 | struct mux_state *devm_mux_state_get_optional(struct devi=
ce *dev, const char *mux_name);
> > >           |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > > Fix this by dropping the temporary local wrapper.
> > >
> > > Fixes: ad314348ceb4fe1f ("mux: Add helper functions for getting optio=
nal and selected mux-state")
> > > Fixes: 8bb92fd7a0407792 ("phy: renesas: rcar-gen3-usb2: Use mux-state=
 for phyrst management")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks Geert for helping out!
> >
> > > ---
> > >   - ad314348ceb4fe1f is in mmc/next, and a PR has already been sent
> > >     https://lore.kernel.org/20260209133441.556464-1-ulf.hansson@linar=
o.org
> > >   - 8bb92fd7a0407792 is in phy/next
> >
> > Vinod, do you want to pick up the $subject patch as a fix for 7.0-rc1
> > or do you prefer me to handle it?
>
> Should I drop the 8bb92fd7a0407792 and it makes things easier for
> everyone and then we can pick fixed commit for 7.1 cycle..
>
> Does that work for everyone. I was about to send PR, will hold off for a
> bit.

Alternatively, you can mention the semantic conflict in your PR to Linus,
and ask him to fold my patch into the merge commit.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
