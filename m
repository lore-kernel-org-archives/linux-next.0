Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B734B19A;
	Tue,  2 Jun 2026 19:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780430393; cv=none; b=N+pF6Nf1XxHUpB7oqoqEyZ1R3sjg/yLaD3v2lxnWe7fHNJMFm9Mbghpx1/5TXryhabAPrcIkP6UhzH4ipgd46SvVUlfKI5Ty5Hr0c3ewyb6er6FSiYd5ROl386KeRS5oBAUy+HS4oyHHqn5ORt7coxRW78RHifUVD3UvuhewKoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780430393; c=relaxed/simple;
	bh=xl4r8RXeCPtWYdTxra4adPZJJ1x8crd42CVv/BGkG2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=powT0zzOk+TkZoA+i1zw6zBnzzLP4Jo6Jf7HoqVKJM/1zvkXImv419rA7p6SJKEF99z7k6Q4QWd8ZmVqv0bKn1FTqsUA05gIFW9nhptodIHSsfZVQNn0L8fMilGnYnz25SK6g2QLX3r5dozOStbB3IGdBcMcMvfaZ2zDOc36tWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=kjm71O1r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jEG5aY3l; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="kjm71O1r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jEG5aY3l"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 6E286EC069D;
	Tue,  2 Jun 2026 15:59:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 02 Jun 2026 15:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1780430391; x=1780516791; bh=mc23YKtNUF
	hX/YISwtWepfmpFGfv+fw4gNRQ3brVIOw=; b=kjm71O1ry15J5SWpo8aUwoW/fB
	GAMsVUpCFNnpdBOCy+suQr7xa9Y2k9GUJGz/swOEJlpjJ3SfEmLEx35vEc+Ganev
	EjzOFq4s7VHqFn2WW2/OddEtOIPPb+VSBoAT4sG7f8GEqV4fFY0PaHeXKm1LFu3L
	abiMf6dVtf+aGXXVrEbNwJBiJWrVUClUvKT8XmSEgS6lg1GswSeoO29lCVDuJiWR
	ACfevxKzYofe+bGDDqavZPiUj5bEqm7NAVi3hsiNxEczE6WfRyVT2OTmg7VYJPEg
	dumrijeqWj8d3I2b22P8/9mGJVpwZLd4Exwj3lta+DwmJXjozJLLmwLbFlQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780430391; x=1780516791; bh=mc23YKtNUFhX/YISwtWepfmpFGfv+fw4gNR
	Q3brVIOw=; b=jEG5aY3lBoV0k1MTWnE3azHj635CXrdU0vtjEW5yT20VpSKyui9
	qglceib4JCKOLSrPPwSPlYwRiynicr+7BZ7o+S0/gcTVEv3ZoQmSeV67Uj4wPngU
	D8AVT+c2CkkAXdJk8blOdLM1nQb2KOxihVk/Kyl7yh6VlY2PxnZ/lN4nGY6u90qV
	8oW98PqWBdcA5puMBYTi94OaUgf2SB84k5QLRpS9nk/fh2ukdc7HRdVJ8bRP47rk
	Ec8MwIf4aR6BonnoMts2E6uZM2LxXZ0Zil9JpMWCJrBaaqsF/pcfAaEQ++hr2L/5
	VW/72570Hd8ocB0x4wzzbnldeqUEnwcPNXg==
X-ME-Sender: <xms:NzYfav3O8WlPLmUaGs3qZ04Jbkg-wsHet9EABuPNDsiiwEPCuF_0Bw>
    <xme:NzYfaoGNEQhI4wlpmouKD_qtT4FYkkApGaQRBUJ33NnKg6k6pK0tYSXFLNT0izOZU
    fCLMM7D7-45Y3zMLjSeL-A3o3CXKleeHd3zD3J0WJ_XqElM9gnSOYiY>
X-ME-Received: <xmr:NzYfami0xa1rCBJJW9sEd7Xpy3uiOK5agVlOKJ3W6R_uxUAvyYiTfiIyOkaHNPzrUBptgzQnDBuvNarC5r8qIAJ6DJfKNbKzsoHWNKqNDw>
X-ME-Proxy-Cause: dmFkZTGPtbgZwHNlmhwOBgNbdWGgsOo1T7jSaLog/l0K4yWSwgsyZ2aTeoenPn5Hq5hEka
    ZHOTgw0y6ZiWgRk7omAHFnml/qxppXC8HbMsv9XSbGuFIzb1ubixAMAbrc7tFO/Ujvvixc
    aZG+ap3SZJl+PRta3bJcu1xgLim/3hEk3U5FyMZccCT3MUwWG9FFAr1XeIiJEY12KjmNxw
    i4W1KkPBMlv29c+lZZegVTLFxgu4ALOpIBrPV4qYnU6a4xZmh/q0OxOg7f3yyVfC86v7W9
    GTR64dHfqkZ/1xE+I8gGVP+LTrC57bd/1Dtq0YEcjagyBJi23F0UC6yT0D39JhjEhEMUlO
    Cz95/UQ8ZwQGevyXBSg6wOF9mdJZlZJtipt9dHUGxlDHyUeLAcTzPH3/7sTVmR08VD8FDK
    dy+WgTESbtJqqYiyPoZxcrm9rg6JootB06/WMKqmFg/jjXeOvQJ9xIq6wVwK91pWTEJ2RJ
    vcIEO3bmxNDmmkNlavD9m9vzmidY9W1cckZHtuCaUPCgKjbw3a8rD2aUd0UaU+swg1n4ud
    I3mgd9aUYAtT7GhrSTI2bX8hNjTwLS8AD9a48D/+BZihaeQtzf22fQC7XbTdatqRUNWjEd
    K2gbM6afrlCDZyZztHZMRCVQFXFsUVu8NyvgpyTEoStRmP3ThnBCBG+x3Jqw
X-ME-Proxy: <xmx:NzYfajA-2_2DauHRiBuW-WUzPvN3pJspJODMldE4fKJLIiCuSBnLJg>
    <xmx:NzYfagTrO4dcJx6UnpUj75CNgWNY5ZloOgBIfEJQX3Fmr7xIUHfl5g>
    <xmx:NzYfagWJDLwZtwlpfnf9tQXQQrXNk7U5V-kp2zKlTpdbwmTf1YCPGw>
    <xmx:NzYfaheqKoJgfm6SWLvqMrLMW7onIiSbP1q469l1vGEiDNEukUXITA>
    <xmx:NzYfajM8x5kqe-y9L84ITXp_UCtjxLGNTz8-ICHPxX0enMUfAWOcCPKL>
Feedback-ID: i7ace4b6e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 15:59:50 -0400 (EDT)
Date: Tue, 2 Jun 2026 14:59:48 -0500
From: Ira Weiny <iweiny@fastmail.com>
To: Mark Brown <broonie@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Ira Weiny <iweiny@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the cxl tree with the nvdimm tree
Message-ID: <6a1f36341a07b_4fbf910098@xwing.notmuch>
References: <ah8GDU5JoXYr1J0x@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8GDU5JoXYr1J0x@sirena.org.uk>

Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the cxl tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   a6e0072cfa82f ("MAINTAINERS: Update address for Ira Weiny")
> 
> from the nvdimm tree and commit:
> 
>   43ad501987391 ("MAINTAINERS: Add CXL reviewer")
> 
> from the cxl tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

LGTM:

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

>
> This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc MAINTAINERS
> index ff2abbdaed574,158dc82dd3076..0000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -6505,8 -6431,9 +6505,9 @@@ M:	Jonathan Cameron <jic23@kernel.org
>   M:	Dave Jiang <dave.jiang@intel.com>
>   M:	Alison Schofield <alison.schofield@intel.com>
>   M:	Vishal Verma <vishal.l.verma@intel.com>
>  -M:	Ira Weiny <ira.weiny@intel.com>
>   M:	Dan Williams <djbw@kernel.org>
>  +R:	Ira Weiny <iweiny@kernel.org>
> + R:	Li Ming <ming.li@zohomail.com>
>   L:	linux-cxl@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/driver-api/cxl


