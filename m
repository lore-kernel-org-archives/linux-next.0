Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E243EBF1F
	for <linux-next@vger.kernel.org>; Thu, 12 Feb 2026 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770895398; cv=none; b=oMWCoor+Pa1jch0OYZEXX3JmxniNSwQxGCse4xjUre/xO1/UayL0ZzIRLBcbqDmbxPrySqunh27Yx0Tkc1GzzqOZ8YllnklYqVlHVnXcNLcLKYYm8JJyWPhViK6A5N3RoZkgBjVy/dST5OLyGTbOxj4WWMn69l/pyT9SonIpju4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770895398; c=relaxed/simple;
	bh=ELesR79nEgzbYvbVtbkai+gF5L9OXkkQBqsB+SAv8Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWQubOrM61ilHoP9p3iJxf7XVn2z+QIgVI8YhKhsxbvZesVKpx3mI+748ilP6k5DQDRLGMQUyHZawWWn7MPWYuFN2O83JDsY3anFL7IfRig68u65sgtb5MOZbEdNRA/8XRY5mCRNY1fTZd8MCFyTc7b/IS4+CYjai2/U04Tw550=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SK0M10Gj; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SK0M10Gj"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dd784efddso872090e87.1
        for <linux-next@vger.kernel.org>; Thu, 12 Feb 2026 03:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770895396; x=1771500196; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Te28COGsJvbZjhoIswrSDU/sOtkJ6DypnGTOIiAuYoo=;
        b=SK0M10GjV91hNWDo7SHphAJ2V6YFF43eaY7pIqimxdtbDBxrLoFIqHi6cpePsZjLo0
         Yu8NlGAksUR+zt4Js/TsR6Q56jQ2peHk6fK8L7t+uw0Ji2JcrecXIfswUjQ8JVMJlLm0
         4w4vMVrPBMeYatfWBgX3vQ/fEnZulj1XygeVtnQlG7UqSfNsmrEhwEG8UiMLbUHbmsoK
         uWC6j0Be38ob04OHAGulo3kcpga1WURZnjQlCQcW65ix+TJKw/L+cHnUgDjYe5YtHi48
         vvhlOxFiSibOCjwTzu8e6fUuUZJOViMD5gBAyik85+SRMc1PhHw0cEiVdqu6ny/sE0l/
         fRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770895396; x=1771500196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Te28COGsJvbZjhoIswrSDU/sOtkJ6DypnGTOIiAuYoo=;
        b=b065ALiohW8YKCqe+QfERjJUqSxRfFu3UAeTyv30yCEd/Acb8YkilSg9ycMdENbTCv
         yQjgPOT+d7u8bxayZ2drc8dvfagsxwCT6Vzzcq68vy0zX2v4l70tikpE9m7CNju5Uj1B
         X/8pNGHJGCfD3NIsevsxLiDydoz1IGxDuG2ej26YZws0Jv7LWc3e8Ek7IuNwxt2rdRDQ
         CPc/Yu6U99HA0UpF58LMx1X7t3Q6tccHHGX+iRlfyjY+9PEGS3xEF1x3qpSVaEa7wfQS
         MQaEy+oZaYS4DnPhZkFp4aeFy5v+eN9i0nVTT/BUaHu+Zroh1IYmnPOSZ6JsRBZ1KGLr
         hKsA==
X-Forwarded-Encrypted: i=1; AJvYcCXQkteo+KNWAYTAKWqlndt0yHBtA0Tvw208ymztr9CLfWBv4K7hP+Nip752auJTWpf7NyzUwOq9w8ce@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj1tJp0QknCAyv9W5kKtJhCjlwIw8HKPt6fhQZjimet6Qb6aNl
	CCXYsyUwUNfUVHM5VlhyyAuFDGChFBCyaR/lYlbohcewSMB/cxtAAqfV0OOVrQ==
X-Gm-Gg: AZuq6aKgnMOp+j+23rd+3HgsLW42NbEOxapZLM5zpgpEDisz5wzrgTcMaBpPu9Lk8Su
	zfPNXB/Pi39BqvRiyN6PU4zhH3mndXMxxBuKJwhqRBI7Raq3V/2CnyjH29pOd61LU+zJ159REkB
	U0tX6kmhdYJDCvntZniMQV40UmklfGUd1r9RCvlvQsMufcAjJxfpt6VDMFyLQtcoyGOMdsz8Kiv
	v070VUUw+DzEsdNxQNNCEQutnt6QL9aKLdYYD9ysMochxe5xEkFrsnKdyansq+v2VKe4BNT5m9f
	6hnrlqo9CwSZ484GhI6+C6GiC7viOUJD3S/Si0hiti8dKBWNIvOK6xfPM8KzO6YWBquMWtjf+Gt
	6G2PB9m9fwUlBXQmbnGEXXb/Fj/XItEPhmGOPYTQo4y67liQXRJ/WRlQGJI1ODSxXDDD7YDhexB
	2YAw9JzgF5j7WRnhw=
X-Received: by 2002:a05:600c:524a:b0:477:7a78:3000 with SMTP id 5b1f17b1804b1-48365718323mr18483945e9.6.1770888685036;
        Thu, 12 Feb 2026 01:31:25 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:2f75:bf70:f0b9:4586])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d482480sm215126875e9.0.2026.02.12.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 01:31:24 -0800 (PST)
Date: Thu, 12 Feb 2026 11:31:21 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local
 devm_mux_state_get_optional()
Message-ID: <20260212093121.2c6o6pkk4riphbel@skbuf>
References: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
 <CAPDyKFpY2X8hephSfHq7rj_DaKX76ZSkWSCYXrGTEBUFHkvOzg@mail.gmail.com>
 <aYyrsPTH1923jV7y@vaman>
 <CAMuHMdUHNRuMmHU2ACX84nsZdXn_-fSamnF+LMFvZS3vkHnEWA@mail.gmail.com>
 <aY1eIG_U_GBOFQGt@vaman>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY1eIG_U_GBOFQGt@vaman>

On Thu, Feb 12, 2026 at 10:29:12AM +0530, Vinod Koul wrote:
> Hi Geert,
> 
> On 11-02-26, 17:30, Geert Uytterhoeven wrote:
> > Hi Vinod,
> > 
> > On Wed, 11 Feb 2026 at 17:17, Vinod Koul <vkoul@kernel.org> wrote:
> > > On 10-02-26, 14:34, Ulf Hansson wrote:
> > > > On Tue, 10 Feb 2026 at 11:53, Geert Uytterhoeven
> > > > <geert+renesas@glider.be> wrote:
> > > > > Now the mux core provides devm_mux_state_get_optional():
> > > > >
> > > > >     drivers/phy/renesas/phy-rcar-gen3-usb2.c:944:1: error: static declaration of ‘devm_mux_state_get_optional’ follows non-static
> > > > >      declaration
> > > > >       944 | devm_mux_state_get_optional(struct device *dev, const char *mux_name)
> > > > >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > >     In file included from drivers/phy/renesas/phy-rcar-gen3-usb2.c:20:
> > > > >     include/linux/mux/consumer.h:64:19: note: previous declaration of ‘devm_mux_state_get_optional’ with type ‘struct mux_state *(struct device *, const char *)’
> > > > >        64 | struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name);
> > > > >           |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > >
> > > > > Fix this by dropping the temporary local wrapper.
> > > > >
> > > > > Fixes: ad314348ceb4fe1f ("mux: Add helper functions for getting optional and selected mux-state")
> > > > > Fixes: 8bb92fd7a0407792 ("phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management")
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > Thanks Geert for helping out!
> > > >
> > > > > ---
> > > > >   - ad314348ceb4fe1f is in mmc/next, and a PR has already been sent
> > > > >     https://lore.kernel.org/20260209133441.556464-1-ulf.hansson@linaro.org
> > > > >   - 8bb92fd7a0407792 is in phy/next
> > > >
> > > > Vinod, do you want to pick up the $subject patch as a fix for 7.0-rc1
> > > > or do you prefer me to handle it?
> > >
> > > Should I drop the 8bb92fd7a0407792 and it makes things easier for
> > > everyone and then we can pick fixed commit for 7.1 cycle..
> > >
> > > Does that work for everyone. I was about to send PR, will hold off for a
> > > bit.
> > 
> > Alternatively, you can mention the semantic conflict in your PR to Linus,
> > and ask him to fold my patch into the merge commit.
> 
> Hmmm, that is also a good option but might leave Linus a bit grumpy so
> bit reluctant. Dropping and getting right implementation would be
> better. I think it was a mistake to pick or this all could have gone
> thru mux tree.
> 
> Thanks
> -- 
> ~Vinod

I think with Linus' refusal of the mmc/next PR, there is no longer any
need either for this patch or for the revert of 8bb92fd7a040 ("phy:
renesas: rcar-gen3-usb2: Use mux-state for phyrst management").
http://lore.kernel.org/lkml/CAHk-=wgnRQiKqWVrO_uF1btYM2K8r8xL95RGdKU3QLe8B58nrw@mail.gmail.com
