Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4849363C59
	for <linux-next@vger.kernel.org>; Thu,  2 Jul 2026 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011048; cv=none; b=BQ6v8pysCS4/1ECJx8YRqtgo6Q9AqEI8mdBSIZveDpk/UioSdvmeZpkonGYY9d5IbLPNJBqLq0z9Nzga00SI2GeoRjAQd5jV9T4d/hnbJmOvNZ4tW1G4eELOMGYaQ5n2wy6Mm1twvB9NF5U0u8AoV1nXtTE27V2g4PwL5ybvZi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011048; c=relaxed/simple;
	bh=rmbg35dWPVoLpr3BlibLjSHtLqkhuVeaYCpTImvrfng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYyDAn27bRMghJIbeFG/FmXHvJ5pqn3Bre5MWP21+5nOcWehY+XNGihVIW2VG7taHRCnZK+LsfoGDaXkvuIIfNQww2sMEacGXbfOoImbGkCJ2mZUUKwgdEYVQR+g21CfcU5N6/fTaHopaxiARKqDHrJPDGAjB59+Ng5MhnhEgpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFP0+WMI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFP0+WMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC031F000E9;
	Thu,  2 Jul 2026 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783011047;
	bh=nGjcRh592sot3B+XVG5UHCjT2GpEKkBEy8/RVkxFLJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LFP0+WMIHO1Hcxo6WYGFPItSA68KnTB3IHVCfJbwywcP1Vw6cyAgW6RBF45f7MgVO
	 tmFUwv5AWn/l9FZ4kyZcXN15B39zPFm1f5WcucfM1qDGWXtQSvlECfnEtE70ctYPZF
	 v8rGLmrz5N4n7NTBKFpt+gBiCWEAWtvqdUrXiFEyIGIHqf0HINu2Zyyn+V9dgQ4P8E
	 bHqb4h5Kci82gm0d0MNct7fK+oHn+KnMqUli3pZ7nYL5voeLt4x7Mmm/IZlUyPZclU
	 ADxT5X3ttRk4r7xOcvN8+AZ7qqETIomABwSwPR8hNlkPCS/be5/7D5twJrhc0kUK4w
	 fSTsZ0rP2djcg==
Date: Thu, 2 Jul 2026 18:50:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next <linux-next@vger.kernel.org>
Subject: Re: Update i2c branches
Message-ID: <akaWcTjDlww10fsR@zenone.zhora.eu>
References: <akTXuDVi8jBVAwWu@zenone.zhora.eu>
 <117e594d-28b0-4bac-b245-66cf2ac6c0f7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <117e594d-28b0-4bac-b245-66cf2ac6c0f7@sirena.org.uk>

Hi Mark,

> > Please include:
> 
> > i2c/i2c
> > i2c/i2c-fixes
> > i2c/i2c-next
> 
> > The latter is normally a merge of the first two so that it
> > doesn't create any conflict, but very often it contains more
> > patches needing some special dependencies.
> 
> I'm not sure it is sensible for me to merge all three, if I pull both
> i2c and i2c-next then I'll end up having to redo all the conflict
> resolutions you've done in i2c-next.  Potentially I'll get conflicts due
> to doing something slightly differently, or the additional stuff in
> i2c-next only overlapping with conflict resolutions.  If i2c-next
> contains i2c it seems more sensible to get i2c via that instead and
> avoid the hassle?

OK, sure, you can also only include i2c-next.

Thanks a lot,
Andi
