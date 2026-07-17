Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828913783AC;
	Fri, 17 Jul 2026 10:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285963; cv=none; b=SBCDU6JO7hlHsmspyEzF1rlN5bl1PYKDILeLq4ooavLnNbCsapDK4uUxzDlrlJN4yEx6jXhguEir0xj9uqGH7Q+cw0tAeKacNcvLyz2QOsWKsnyf2REHcmjOrAh0+LUg7o2EkH/4IraLV9MaHWEl/7j/StoWM14S2XnsLej27YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285963; c=relaxed/simple;
	bh=Dyk11bzpCqUlZd+IUeu068BRslSlo+MSfKQO/j2bXZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBlV3r9+dldgzvCWfpgjExMGluK/Uu0ELCIMYGlgo5xqXZ+UmehDpwA8FNmNriMjJ5z+9lpbt3zrDnxNGDfw9WwTyABrRnphHER1ctIF83RFk46WTLobVcqdsLOqELOUyYzwKVJfapKl9+dtMeSydmd6IwEzYrkl5rwwqTmj6P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=EqDIqqtS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L5vrdzp+; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="EqDIqqtS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L5vrdzp+"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0321B7A00D8;
	Fri, 17 Jul 2026 06:59:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 17 Jul 2026 06:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784285947;
	 x=1784372347; bh=5zlTkpmGsxtkwrMU1N5DstVNzPdB6TseIT6LmaxFHUI=; b=
	EqDIqqtSX7iOplTTqIiCzOaTLWWUFwT1PJZLiGGaOgxN31onqVdvUCVZ+hq1v4p2
	0tyhb0uPxzn3RW5ZvjoFXqeEGtICUm8mZEJ043NkDpeWGXQXoJ2oAEjVCFn67fng
	ffedQztYaPzNdsx8jAfz54pndHJp4SpIuZlD6i7tRfdNY4lqsyzx91Y/RXdLmpwx
	joSBkV5dtBQXoic0rGhlTd15gSV6bRmw7gnbywtWzwW4QCVxrs3wNETDLFLE9RJW
	weT9lI6eeJdILCWLc5o8NPP4BKWGbokKWEJWh5ZQkukW58ln6fesGlmLtsUFCzxy
	fW71zAoa2U4QbGGM5jgRFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784285947; x=
	1784372347; bh=5zlTkpmGsxtkwrMU1N5DstVNzPdB6TseIT6LmaxFHUI=; b=L
	5vrdzp+rG+Ohc5Gsw1N5hCVkWnXmihBtNhoBJQraLoVbhXsUX4TbMVHcv7jxTzPB
	Z5KJ0YYElDiQhf1SO7ltlQtjHE5+FgB3zJ016Mo7re3vBGVVkuWVUb3rhYNzzdYa
	OPbM6gNh/zK/0qBi605Cy53KmdQrh4wI+zhBikBnsUx37v4cvnrSBi/ndIfsEtlb
	dMLzlv8PZtduJx12qF8JbJOUKQIm4ufNgcJfJHB4Kz4ndNRSGaLNGH+FTnSy7Dkh
	VNC/7xYAJkBCUe/DMC3JLTCK2A44BWvBYK+RgUxI4QSXK41N/NdZV2trH14oX6gw
	awVMV3JnTf5NHO3Z04SFQ==
X-ME-Sender: <xms:-wpaaiwAawjwynKbvone1UCWtnPnTDvyk9BhfXBH1Z8RKAa4a45bEQ>
    <xme:-wpaaqJtK__he4Q0sXXHUnYTwXzZcgye0TjZojmZP_VVkUBL3Jnj96bC89DYSSDFV
    _mqagvDLvhREz3oMr36m3qVGFi4a0X7PAPzGhWHuHcxBEG_>
X-ME-Received: <xmr:-wpaahVVIAcJVVSfrV27RpnOIecQtcoUD3hKfjaLNLhGmrvGXmcddouvov1MoEQJ22hSyAVfmA2blBxadVH-AJckfw>
X-ME-Proxy-Cause: dmFkZTFlfD1An/D4CaTXrJCJ3KftAv4SMsHD0dweY6L1jg2LnZcDfJE93/RsM3txLl5djW
    NGaLvoAEVINu899kLMQzS8spj+VzQbGs88OFJwqjdiYio4ZCo/9l8sUNHEv6Kw9bWELgWG
    Iso8RK2cHvO0cndjLGebQDWdgn9exiEilSZ7Vo0Oq56LtRLLi3AMPOWEeBxeUy8/wME1/8
    IF34VOOCXlbhTdjxXJBM5DdDeEya3kz/rm6HhkHpXP0gyLhSafXlyvVV8yrHR/PnnrgLvg
    VM/uc8ymioc29nyIB1isF8kqmZCGltNggoKsba/F/VjkWUkJOSvPQC4YSrWGnxCoQBglPQ
    YlrfF6u7QfTAXrc3/j0HlTzWRsoXtZnsVFrziXNbvnJrl5CMnzwj5tR34efo5cFO353CT0
    onDBXrwbQdaMfZXdt5KJSxCFt+ch1WCOBLECVGkkz/9HvyRvM7uvffXs5cMaZMu2GTYXLm
    6vhgMEN90v2rW7gpkaT2n1Mm9nRHQPoHktgl9i7tK+l0Z2R2gsybFcbb50oq5PO6bOTO+9
    fQjWi9rsF7v2HZgwYcY5CJFpUgav9Rv5q8iQem+89vh+qcz1uSIqej4kQ/3mldQH/JkIpF
    Vx/eXBdbFKz2NvP2kogPyUM8SQZPqOWYYO1hwSs38bMrgjU0NOVsQVy3bLDg
X-ME-Proxy: <xmx:-wpaataCwncaFdPcDzCeOFwVrtW2OH2HZLyMF9aiw_HXTJBs7megtw>
    <xmx:-wpaaowy97heXnLsQ101oHC3fBY3ju7PukUYDUe4yh58nj2wPBldmw>
    <xmx:-wpaat2KaAy4APR3GUy9OyOZRSCnPOuxpzKaI3EHSD4cph8qPDe9Og>
    <xmx:-wpaaplEjCWlQBOE3UZVb9kVc-xR_hpO0FaqAmlYWArdm7zPL4cPiw>
    <xmx:-wpaaokJgOdzRKOC_Kpdr0VMpog3L6hnz69PJjLmRfnIAR9eK72ybWc->
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 06:59:06 -0400 (EDT)
Date: Fri, 17 Jul 2026 12:58:24 +0200
From: Greg KH <greg@kroah.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Message-ID: <2026071711-strobe-dyslexia-cf9f@gregkh>
References: <alT5UdRqcfFmadZT@sirena.org.uk>
 <12e1f767-d126-4f36-ab95-caf3252a5728@oss.qualcomm.com>
 <2026071417-fritter-mahogany-bb97@gregkh>
 <7fc86c5f-289c-4b77-b3f8-98dc30d89c28@sirena.org.uk>
 <20260716040347.GA1744016@ax162>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260716040347.GA1744016@ax162>

On Thu, Jul 16, 2026 at 12:03:47AM -0400, Nathan Chancellor wrote:
> On Tue, Jul 14, 2026 at 11:26:02AM +0100, Mark Brown wrote:
> > On Tue, Jul 14, 2026 at 08:45:54AM +0200, Greg KH wrote:
> > > On Tue, Jul 14, 2026 at 11:36:44AM +0530, Praveen Talari wrote:
> > 
> > > > I don't see these errors in my local build. Is there any specific way to
> > > > build to see these errors?
> > 
> > > Nope, I can't duplicate this either on my side just by building this
> > > branch.  Is this coming from a change somewhere else that modifies
> > > PM_RUNTIME_ACQUIRE_IF_ENABLED()?
> > 
> > It's something clang reports.
> 
> Right, this change is broken, as the cleanup function will be called
> with an uninitialized pointer on any of the 'goto error' paths before
> the PM_RUNTIME_ACQUIRE_IF_ENABLED(). This goes against the documentation
> in include/linux/cleanup.h:
> 
>   Lastly, given that the benefit of cleanup helpers is removal of
>   “goto”, and that the “goto” statement can jump between scopes, the
>   expectation is that usage of “goto” and cleanup helpers is never mixed
>   in the same function. I.e. for a given routine, convert all resources
>   that need a “goto” cleanup to scope-based cleanup, or convert none of
>   them.

Ok, thanks, I'll go revert the offending commit now, sorry for the
delay.

greg k-h
