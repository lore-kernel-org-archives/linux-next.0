Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C612322F75E
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 18:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020084; cv=none; b=DxSx9/DaFPF8D+BAn/vlNS12dqDzDs1TrvJBF2qbIF6+LICONPA/m5OqfgMgE7wz4j2JSQS2YzvGjocVd4X2wvfkGQGJR34DEEJJoMDk6d7BhWkjouGgEyU6oMIfBwigN1SB+uoEJ6lOcRLnN7iRqqgxMG/YJK36WARde4PfSq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020084; c=relaxed/simple;
	bh=9+yIZ1ZnxavmKKgrX9+10mOSVOef6V/raGl5vjFl2ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiucP9bdkAt4tfX8gZeK7vVw8HX+RjgEI9y/OHdLZtvKpGYOa/IqEDml2yE4orn50QgZQrYigYMaVmGv3GkSQeGmLRZ8Gqdl5smwUVFQUxDpi6Y2IrqCdZi0akbBqxk7zwaRQIYeWrX3nmjrLiZy6o0Lh2PG/WYq36cL5RaKLM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pq8bBNU9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pq8bBNU9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DFAC16AAE;
	Wed, 21 Jan 2026 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769020084;
	bh=9+yIZ1ZnxavmKKgrX9+10mOSVOef6V/raGl5vjFl2ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pq8bBNU9UER77kXx1mmMHY1bvcbpeQPs7tYr2CbWZVhJxkCzUpqohWVttGMwFFyyB
	 V7duFzYS6xGgSZhW6Q/0/25QthTU9I0CfQzTeF0QBrjMptS2+xfKsrX7Cjc9W38TB6
	 2ADObFEd3U5CSEKw0wOxY7I0FyTgyboV8wqzYG5kT3AwW90lwHto53KnfbpcBVX0Jr
	 G5cPoOGkwwVO+1v/zwM7Le9YgMmQCrUo/OnzuL/Ob6d+3gcIOsBglNaJXZ421RH10O
	 yTsyWwpSwEokQDVOgjYpUbnl0NU6eJizHjj8NzLKb+oNgIny3CBCya+3hSwgux7GRM
	 j1/n6LcfmA2Ig==
Date: Wed, 21 Jan 2026 11:28:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: panel-ilitek-ili9882t.c:95:16: error: initializer overrides
 prior initialization
Message-ID: <20260121182800.GA241748@ax162>
References: <CANiq72mRp62foTCstQxYhVBdh6y_W27wEjWSRX9_kqShuueaSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mRp62foTCstQxYhVBdh6y_W27wEjWSRX9_kqShuueaSQ@mail.gmail.com>

On Wed, Jan 21, 2026 at 07:07:22PM +0100, Miguel Ojeda wrote:
> Hi,
> 
> With LLVM 21.1.8, I am seeing in an `allmodconfig` for next-20260121:
> 
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:95:16: error:
> initializer overrides prior initialization of this subobject
> [-Werror,-Winitializer-overrides]
>        95 |         .vbr_enable = 0,
>           |                       ^
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:90:16: note:
> previous initialization is here
>        90 |         .vbr_enable = false,
>           |                       ^~~~~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:97:19: error:
> initializer overrides prior initialization of this subobject
> [-Werror,-Winitializer-overrides]
>        97 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
>           |                          ^~~~~~~~~~~~~~~~~~~~~~~
>     ./include/drm/display/drm_dsc.h:22:38: note: expanded from macro
> 'DSC_RC_MODEL_SIZE_CONST'
>        22 | #define DSC_RC_MODEL_SIZE_CONST             8192
>           |                                             ^~~~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:91:19: note:
> previous initialization is here
>        91 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
>           |                          ^~~~~~~~~~~~~~~~~~~~~~~
>     ./include/drm/display/drm_dsc.h:22:38: note: expanded from macro
> 'DSC_RC_MODEL_SIZE_CONST'
>        22 | #define DSC_RC_MODEL_SIZE_CONST             8192
>           |                                             ^~~~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:132:25: error:
> initializer overrides prior initialization of this subobject
> [-Werror,-Winitializer-overrides]
>       132 |         .initial_scale_value = 32,
>           |                                ^~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:126:25: note:
> previous initialization is here
>       126 |         .initial_scale_value = 32,
>           |                                ^~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:133:20: error:
> initializer overrides prior initialization of this subobject
> [-Werror,-Winitializer-overrides]
>       133 |         .nfl_bpg_offset = 3511,
>           |                           ^~~~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:108:20: note:
> previous initialization is here
>       108 |         .nfl_bpg_offset = 1402,
>           |                           ^~~~
> 
> It seems that indeed the variables are duplicated -- something seems
> off with commit
> 
>     65ce1f5834e9 ("drm/panel: ilitek-ili9882t: Switch Tianma
> TL121BVMS07 to DSC 120Hz mode")

I have sent

  https://lore.kernel.org/20260114-panel-ilitek-ili9882t-fix-override-init-v1-1-1d69a2b096df@kernel.org/

for this, it just needs verification and application.

Cheers,
Nathan
