Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA45E2FE575;
	Tue, 14 Jul 2026 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010891; cv=none; b=XiUUZnIwN8HgYeV+doCKVIxsfxT/4jNDAyMe20LAsQsMDvpZRtEuR4H6mZCruYNqC0MTtSPL3g7OoXmoKgUaxZSgRVkh4MgKNz02a5++JiRhvnDBC+nedp0Hs4RDVSNnlhL7eNtloHJDETMKlJwApVubDgm7CYz7vtuPia/fuM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010891; c=relaxed/simple;
	bh=wzrwlo1M8F7hrCd3l+Uq7G+whWh6eEI9sbcG8Q6d5iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvHxc7aJVCx6UGHBlybuxYioBPmSGOSlkKddIuUYhTlFJkzkow6T5rkSo020WJjMeUdgZsori2OcfIt0FO7AyrbgLjn5lyvPPJy3AqlnVX1wVuO8lZ+PReLAN1e2Ns4APFLh53nEMXy33rGhvVNuU58zO4y+BrmNHyWkQvtNTPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=P/xvWpDy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KfbsV1bK; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="P/xvWpDy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KfbsV1bK"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1292F7A0157;
	Tue, 14 Jul 2026 02:34:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 14 Jul 2026 02:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1784010888; x=1784097288; bh=d03KzaDWW7
	iSRnNCNj9/qVwiZf3Iq+ComStounyyKbM=; b=P/xvWpDye8SLdHeA+S4axV0o8+
	U4pbUUF6uBj+Qx3mLpRGMriCeiPaRCCUbQBkO4ZUHpNldxgIP3mAKCRIRODAR2Vx
	vgEmZID4M8nMURJiSetBU9tSJ1kcO5a+GcpInnojX2s6NekzBMJFwBg7ZGVpTq1L
	R3wnrlzcJ4xrmj1Ph/B26NRmDvrh0MNoV+D1aGfSm9aZGaWyDulEhK/+Lb3/L7E4
	Tylm4fMrSrXw/1BSCkkAocVIEQmKcW5XVlR2hW733E5f9rB5WijlU4jRXz4RlNAj
	MPX1QbL9LcflIoA95rImhzj1woDERVkF1LArhCvEKYrig14gHRVMNB0jPahA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784010888; x=1784097288; bh=d03KzaDWW7iSRnNCNj9/qVwiZf3Iq+ComSt
	ounyyKbM=; b=KfbsV1bKpFFnW+uHJ/NqaaMxhQiRchvnWhUoUB3HEPjqXIwIY0C
	mPgXI3s4DKtESD2hC09WQz48KTFJsiDdDITUgJwxRAJX5eBrRgaUZHLAxiEX0TCo
	7K9bvi4tnyfGZW0v/yeXGEqDpEna7NRZekbzmntL3YTjs9PtQ71CJ4njRsF13AGz
	x1/6ku6RmGszFbM9tkSze84fbpqUr+fV7JABLch/LEht5D8x7+HsBn4yHzMtfyQn
	tlbdVSM0nRkgC9nrot+wSVvI0+pAciFcMdGVjog75yPR3zWc3iW2xfvU01qrHAcf
	3GvhSA5VhzCn6mxWVyQjyP6Dk506I5nZIHA==
X-ME-Sender: <xms:iNhVaj00Andkyde8FBmeQAAlxb-Sp00beHgp16E1hGCEwttewY8oSw>
    <xme:iNhVaijCvMbREsZeFQ8DQyPafm4gB1za1uZlU7IlXpbmufF-auj5a6KbgNkeR4OpW
    4USN56H0g8_eQ0brdeBdPuK9O5TfAN0G6E3g4bkG-exSep8pA>
X-ME-Received: <xmr:iNhVakmXtaprrHGcYdSEZN0hudHzg54VsSYs62svHTrPfIk7r8pcrJjQdzVLAMIVif0lq3sQgksTvak_BLJa8Skp_Q>
X-ME-Proxy-Cause: dmFkZTFhs4VWW/LJQkF20M8bldU820sK5tV2sFePhv2sXqsRxiPoA6wDjCuEDa94e1dpjO
    F+F9xg0Mfq1cNmOeVWlUC0l6dLf4LzYttVF2zkJX7SRKK+MN0vT1+x4bwuQXe+455yb2V/
    rQ01seElnlcp73v7xTLSpJTprGBO5phJMZyjKSq9aq3cXNaIoY0Mk7gNHsOCy7XAKKvYyc
    PbHj0CcH2rWrttX7XKoiTLsl6C1Gsl99m1u5qVSTRb/S7XhxCsltpj8QqORNeNgLvjOrmP
    HUMdWomKMxUumtufsPUkLzVG4iNtyX9o1QfC29MQdVCVLcUfcS8PG7Q4btpgk0Rb2YywhV
    hIOaXRJzL931ZAGDPlLeySfbB+ROmI2/+ahYH6/NVrx/le8eRY8GG/Wu7gyPjztQvbYppa
    Kg+WBJBPuMoavG6ORjnM4TwsbrJM73Lq2MA7ftEqJTw1DBbFPL0h9STr3Fpnnb7OSPC9Cb
    rDTvTWg1c1FheT70FftoqQe1kylpWu6t68VaXQZ79leCsm7+5eK2ZGcSJor0mplzBkUJD4
    BwtEOEaOSzUerB17il++2LlE/XnnrOd49vJo0oVU+oegTEMYt4VYVJdzlRWwmhnE0egYRK
    IWGPjCqta68VjQiATzyna516VfPPnmTNF/Nb+Ga6Rl8s0wzkQszG6zmQlxXA
X-ME-Proxy: <xmx:iNhVagbnVBI5V9mFG1z6EI3xU67YkdhxdcGAsL4GO0qFS-r6snqBHw>
    <xmx:iNhVanH647Y6NZ57AXvTzogdawk68qRK_Vz2zEgeEcOA6n_9StcyzA>
    <xmx:iNhVanYptMClMgkolDW9VXfxICEVPP01o-2Nhq5SKv3rRKDjG9ezig>
    <xmx:iNhVajyD29LtCJtw-pQSIlB_Lm7iJHHybWaBIaMI8dccfg-qqs_AMA>
    <xmx:iNhVamM6XSfvNw-PN6N-ItQbm_Y1fjTemQNO2hSbi5VFR227tO7YV-68>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 02:34:48 -0400 (EDT)
Date: Tue, 14 Jul 2026 08:34:43 +0200
From: Greg KH <greg@kroah.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Message-ID: <2026071426-vindicate-entree-4ec8@gregkh>
References: <alT5UdRqcfFmadZT@sirena.org.uk>
 <12e1f767-d126-4f36-ab95-caf3252a5728@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12e1f767-d126-4f36-ab95-caf3252a5728@oss.qualcomm.com>

On Tue, Jul 14, 2026 at 11:36:44AM +0530, Praveen Talari wrote:
> Hi Mark,
> 
> On 13-07-2026 20:12, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1925:4: error:
> > cannot jump from this goto statement to its label
> >   1925 |                         goto error;
> >        |                         ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1916:3: error:
> > cannot jump from this goto statement to its label
> >   1916 |                 goto error;
> >        |                 ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1911:3: error:
> > cannot jump from this goto statement to its label
> >   1911 |                 goto error;
> >        |                 ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1887:3: error:
> > cannot jump from this goto statement to its label
> >   1887 |                 goto error;
> >        |                 ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1881:3: error:
> > cannot jump from this goto statement to its label
> >   1881 |                 goto error;
> >        |                 ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1872:4: error:
> > cannot jump from this goto statement to its label
> >   1872 |                         goto error;
> >        |                         ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1864:4: error:
> > cannot jump from this goto statement to its label
> >   1864 |                         goto error;
> >        |                         ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1848:3: error:
> > cannot jump from this goto statement to its label
> >   1848 |                 goto error;
> >        |                 ^
> > /tmp/next/build/drivers/tty/serial/qcom_geni_serial.c:1931:44: note:
> > jump bypasses initialization of variable with __attribute__((cleanup))
> >   1931 |         PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
> >        |                                                   ^
> > 8 errors generated.
> 
> I don't see these errors in my local build. Is there any specific way to
> build to see these errors?

Have you tried 'allmodconfig'?  I'll go do that now too...

thanks,

greg k-h
