Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84FA2253EE
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 13:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828249; cv=pass; b=JsmuzahwEv0ifEJGqW4NJ1i+XgwMA0aTFuln0jnLId4b6ZqyVmNijizIZKn81+F8hrwzjjTScekrylbOuAsTNb4wRmakHMhKnMH6t3lmi2vOoK/RWnyKyFo5grH/4Dd8gwTO747JGoOKkw+VCND7VKe8AS4QBqcI/DyBiKtVdrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828249; c=relaxed/simple;
	bh=f8FfsoMvinxrZ9Fv2I1q+HusIRnQuu8YobPl8yM/ZBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+OIpyG9pL8qcWzVgRqg1lvUUfpCpgz0vXhEWLqypuwP/o6qxK/4OxrjLfq0qv55pVSaGCPlH5pOf0aSUFRjQiDred/pfZ9O/C2XoEp5vELZdMzoyW04f5+yjzfvUO7abN1A30VsX90kCAq42Yta0/BYJxnQDe8eSqgd8rc+M1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aex0QFpX; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aex0QFpX"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3870778358aso18425181fa.1
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 06:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775828246; cv=none;
        d=google.com; s=arc-20240605;
        b=dKnqrb2ggg7Vk+v02bLgbQuP/vTWCEnQZR7W+ceDub6UCenmpuOjz+ZB4SqAEO8cgT
         dXJFrlOamjc6P1Wak+ON035czntdjt98TUC2sA/+kFe1+wLBPMMbQXL5u6XA+Lm9ZdXc
         PS5l4KRQ+3jbgCoLGqqSKu7O6B3ALoUtSQoutUdbuBHt8aEYMuQyvpRH5RKI0ky1ELYI
         Fq6iD0QNzOWlF4/wmRML/T+D/51tBJhxfSqJ5uddTiPYYnhniEZd7Z23WHBDsvaVID32
         MJ4epoLMvtx9z11dI9xc2PHT6K0AtFulYCjEZ9Z8cxmpvaNp8kbO7h1/v6kCNSj0P9a+
         2apA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7gIyKB1VQJzCaYK8m7spRBjkQ7tU0QCZBHuu6OkWwzI=;
        fh=PkHBYl0VoSb3kAXAZiOBDtt+9CKFExy1aq0lfeq1Byg=;
        b=fnHdldPtXFOooMfOLL87bJZJne00fyIf6JSYCX6d9MpMmlouG5WZvkm7sTRc8FQ3lc
         bubzn3qpwiUjIaFjFBxfG5fkqQjrVWlIK4QUs8wg/iGsYmXsWL86klR1jutOv0kL7Jcu
         0vBwgy8l9R6sJs8j8Ra4gUdw8D8O7As/XUuDN1J8FtJx1aYI1kx/eAee6+r7spRMSgFJ
         Yo/MUNt+svCgIpshCJ13UTJWINePO/FLqGo/x+tuLvBsUr0B/ndpjVycHBrMAPPfxwqS
         7+8zh2DkOsH7i1ewEiYUEftjAQGrXucge5FnM85Q/hwIG2muT94syrHuQqHztUQ7VUIf
         /iYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775828246; x=1776433046; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7gIyKB1VQJzCaYK8m7spRBjkQ7tU0QCZBHuu6OkWwzI=;
        b=aex0QFpXzIOMPnu2cWoJ+oRQSh3ZsnkiAJhub0bpPoVwwpP5t67dC+hEqyph8TCSe8
         dpwxNlw98qnDtTPl2Hl7/3++lQuNYRHrcwsKveBN6xnnufrI6q5gxtgWEtHEWfSFohkL
         0sM7mX1oHwwOBl7yhldDDy1mQ55aBgLgsdEa+4iJGToXNAsaPrrfzKfmyomqFeom1evH
         sm61oQ43tiiiJT05h09483pucw04iGvVUtn//TADZw8iPOxWwBNhhQzfFShLXdDcgDFf
         SSPqJmLrSY6VKFiBp+xya9moi81y4iu/srRFmZdI4NEM/+WUyMQE6ftQXZwJuqOxZQyt
         PAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828246; x=1776433046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gIyKB1VQJzCaYK8m7spRBjkQ7tU0QCZBHuu6OkWwzI=;
        b=i1AhcATO93EacnZhwkHrniPn5D3G1yQUjdjV/qAY0lvHlY5tbuTCk+hxSVSxmKpFKG
         O0+sVBZkZd6z8UY3wl1zZ0fRxCFvDfNc16ilhBG1PaAfYT7N8U1MvwHxKOU6/ISmBe3s
         p4XaqzBfMi9fIeyXZK1iaH3wAroY+WoWGziJfvd0OD1Nf4DbLgaXhzltga6a3dHNkrnw
         m0m48dx5fq16BGkWaTce1US/95wduaf4BuyOHMqqh9EPI/fH8+aa9vbwZuOGZWkcdzE/
         +4wTX10GKF/6k+hzfoBU5bHebLAt87xSy0IubdQR+YDOovCdipRdKVC7+n5hs+ebQre3
         jneg==
X-Forwarded-Encrypted: i=1; AJvYcCVL6PE9L7aYqEkhWUYFOsJiV+4AR8X0/bpdm7XsmjIPLw+sc+L4W4nRpzk/c8NeM02waW40SZl84cXp@vger.kernel.org
X-Gm-Message-State: AOJu0YxxbybLuGdRy43lFt2XB6/weZlLwXBoMOimfk9PnHas3X0Tw38f
	RkY0keQIE8kSwV3iB6i+PXaispCPxIVhB3RqvhbgnJhjNkvvb0BnKDNzCGR7gB0MMBzoTvJiTLK
	tIH0+iZHGf6i57a80Y1kItfLb8ttvNVwfgH7mow2OHg==
X-Gm-Gg: AeBDies8T0x2L1NTMbwvhFBcnCbFulKLD/xqKCoIo76JoaedZ1mOEfFMAonWrIeHwra
	n6xgNDN9W5ARXKc6RW0DS5UAlYK6C46WPlrs7/pDmyAjF25STlE6USrCToTfX1WYaZn8LUQYi3K
	oVIkgJ8gwjC6sU4KoiS4WeuOQoI/gtr7Xmua7/Q2hZI66Nx4Y1+w3WIz/DrQZFMrCGCm9LckKtW
	YMpd3QYvnVr3OJatDtI9KyIUl1h3zG0ND4sAaCw/UXiE2EVyF0Hyig/XeGth2SOha03y6zOzXJV
	Vce8/yn8
X-Received: by 2002:a05:6512:3d88:b0:5a2:b4c3:d88c with SMTP id
 2adb3069b0e04-5a3efb43b47mr1170544e87.15.1775828245679; Fri, 10 Apr 2026
 06:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adj61MnOca5D8-rA@sirena.co.uk> <adj7sSzHRAPGlVpT@sirena.co.uk>
In-Reply-To: <adj7sSzHRAPGlVpT@sirena.co.uk>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Apr 2026 15:36:48 +0200
X-Gm-Features: AQROBzAg2KrRYSVuDt3tigSLIxTSoR2YxI1nIZB2F1aDowBRu7YTxe38Gk1ygrQ
Message-ID: <CAPDyKFq_0+5gu3OEuvXSxnkVVxY4wKd6iHTFHMHJrXJaRkjfmQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pinctrl tree with the mmc tree
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Josua Mayer <josua@solid-run.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 15:31, Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Apr 10, 2026 at 02:27:48PM +0100, Mark Brown wrote:
> > Hi all,
> >
> > Today's linux-next merge of the pinctrl tree got extensive and
> > concerning conflicts in:
>
> Replacing Linus' address.
>
> >
> >   include/linux/mux/consumer.h
> >   drivers/mux/core.c
> >
> > between commit:
> >
> >   993bcaf32c4940 ("mux: Add helper functions for getting optional and selected mux-state")
> >
> > from the mmc tree and commit:
> >
> >   bb23f1b8c28be9 ("mux: add devm_mux_control_get_from_np() to get mux from child node")
> >
> > from the pinctrl tree, I'm not convinced that the latter commit is ready
> > as devm_get_mux_control_from_np() appears to ignore the np parameter.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > This fixup is very quick and hacky, I don't have huge confidence in it.
> > Indeed since making it I see more failures due to devm_mux_control_get()
> > not being exported, I have a hard time seeing how exactly
> > devm_get_mux_control_from_np() is intended to work given that it ignores
> > the np parameter and is just a straight rename/reprototype of that
> > function.

Linus, if possible, I suggest you drop the patch from your pinctrl tree.

If it's urgent to get this into v7.1 for pinctrl, you may pull my
immutable mux branch from my mmc tree and let the author of the patch
base the mux change on that.

[...]

Kind regards
Uffe
