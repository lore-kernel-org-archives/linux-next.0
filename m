Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7195725B0B1;
	Tue,  2 Jun 2026 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780430567; cv=none; b=Xc6cXNOmM1By7oN+bQt4UNUwkMsvRibsep9945JiyUcCHlwQLM7ZAwc6OJGEXLdsWc2v/4vRmWcTQsNssPdOAhxqLv8XH+E6+dBAsLAU1xUexbuOnZfK/s+2h6TJLYw0SP5NwlESAoTZacYfWoWKoEB5+w2bBiv72pfgOoj5u8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780430567; c=relaxed/simple;
	bh=F8RBkv8p1F/4hZuCeom0oGENQ2u52mJt+yTGcxkps/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8ZY1JOJISH3gx9q38U0ll2L1kfCpEiMumgd50qVCKX1TQm0hyMaraHbA1qBBWrCpimlR7NZdSkNNAnQk3imM0dpSHhSaaw3mvytCGklJMVr1A7Oyzu+YYCzAYqxOHcTsGBTEgk21njHXXrR3R4ZadtDHwtG4a5Ca+lIDWTE2tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=EDNpgrVV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QoZYslas; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="EDNpgrVV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QoZYslas"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id A8546EC021C;
	Tue,  2 Jun 2026 16:02:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 02 Jun 2026 16:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1780430565; x=1780516965; bh=dwj2wJKeee
	EuYMweA7oBfPjFAN2l0A6uC+ypFhhHD2M=; b=EDNpgrVVIS9Z096uDsWRclk2Jt
	1agR84FsnhnPnZQ1dCEpofwM5NzhuSkwWKmlNeFl7Tnlv3dPN+CW8syrBqB5ZIDr
	+z/lW2tqnErNsNIGL3vndOL43PHd6H5KN3wgPS3twNX9VsLx6LI88TLC61EA9Wvk
	KKl0qpLQX8320hT24ZCerqPfyMhsUdbMozjaeOGcr3jC4StcYnWnLEHbXCWafkN9
	WfICyqcXs9A/K53eO7I9PEFt9Il4S8SNfricKEakZG4i4uSEQUoJDvz5ZehDZVLx
	eAYjq9vIhpTai4QGztOiUifINdT3Qsfrxxa8ZYTCZPU0jAW1eYoWkCrnf3Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780430565; x=1780516965; bh=dwj2wJKeeeEuYMweA7oBfPjFAN2l0A6uC+y
	pFhhHD2M=; b=QoZYslas9labOH0ziKnxP3IfXzmoCkjB0QkfRzhZ8X9bS0G5pN3
	fgBYZ8kEeF2tK97F1MsOGkd457OSSmFZluYXg2JXeGVI2hkgQdbes7E21RYhsF+4
	8/1wQWsUOFK49dH/4qwL5tUfFOel3FLrPjIj49CmET5mdfeOq4zxPJfmPbwXmByl
	oulJLp8jDvQwDSiBmU//ctEx7thOCkwuHmPDbljg7hRxTcsz44y6VY+7HS/Mcmaa
	uI9EhPpPEhWrEV2lu6LRN5ylQkhj4yonNZywDC0ZoFjIjsugf1KFuysoC2f9ZlNR
	8IVAHEDMh5PyMcVardkklaEM+zDDRY+Ejug==
X-ME-Sender: <xms:5TYfakNAFDjjoKxhwlSUOoh_bFOyW8XFfdVXMlpPLEQexBrqaB6mRQ>
    <xme:5TYfav5DrHeJoPTFoS6D4kb3WMf-rJSNqKc7MGR9NAp_nu5WnBp5ZVE5WtiDoSxJz
    NQiTsdNd7wHj6AVwXVQXYVJBpDSXxhly5BpAn-4vJTHk5RMckS4Lko>
X-ME-Received: <xmr:5TYfavhWFy21PyQ1YZLuAYARKIBxvqCOK1kQ0EgljOFpv3NbcOtgJ4yv7OUEie7Vgcx_Ln8uACzG3EQW7-Kfe33yeEFZWUX1yrEbgYFGUg>
X-ME-Proxy-Cause: dmFkZTEUjOB+inYcjxT40RcVtOwQHzRo/DFPmHmN8SBql/gT0yPSYHNfbsczygF64G9AaP
    lT0azfudHAOyAtCsw1dA4YAfcKMvIUXqWsC2/Wy+vVfc3XqDh7AG/GXK2wROaiOmC8wdzA
    Z8QY/v0QIkTdQdDSrf6+inW4dNqGlXqjFBbMCGUQfayvhc5hUJMLMT28VOurbMP0IdJweX
    VBfSfqu+YrAS9HVFpJPl8WK6XOoECAKOoqHL1+oy5qyMvsb8VgLOz0bo6zVwRrlUPbpvhF
    B8sLIJSD5cOywERrMjkNm6raDuFvBukgfgVTCZ1UFBSZJ9vHhZ/utEk3THX/FDVtBJ+oes
    vdVucHbuM5UwxcddfPpw+EsJtsVNNX+l/AALOiLCFlW6gKPsQGAiNk4OKiLU23fVnC5RKh
    2Q2CKTBoMl/DNy2a5XeXnUazPVrjDlP6ssE8jAPyK8OFZ9IzhaEafeo4QsX1jOU/RZf53z
    QSzAvqlLrKREXJbzFQIWvWrM8Segx2K4Pc3C3B8xIR3srGqGkmI044jIOrzWzUB6IFEu6U
    Xh4M1LX/BPW+ojnVmoyALKfPDfz5VkGt4qxBhw9641aNa0MbBF9oFny/kbEgT7bRjRCnFz
    mE3MsSxapQumJqSwq7RR93wVRZhMypkuDENvpPSuHuCC5/csdnRPvs1hS2BA
X-ME-Proxy: <xmx:5TYfaseNVHk16fWW8XVye-AG5ei7gdRbay2s4dTeGC36Yl8X8krDlw>
    <xmx:5TYfavwj3K4iW4CTYOhH5uh2J32LTIx5DgAxXwgBDkgduNv__nIV4w>
    <xmx:5TYfaj2hK2j6huNb2wxU-aDj3oXcej1izemfrdzCmaMiJUGopbJQ3A>
    <xmx:5TYfatytUoutgXomjbDo4ulMALe5fLIquv8ph2ks7iY3w7z8sCtH_Q>
    <xmx:5TYfapludGxeF9yC7Mr9wgc8QA3lo6OdwNPelQ91JO71XCwnYGrQaQ39>
Feedback-ID: i7ace4b6e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 16:02:44 -0400 (EDT)
Date: Tue, 2 Jun 2026 15:02:43 -0500
From: Ira Weiny <iweiny@fastmail.com>
To: Ira Weiny <iweiny@fastmail.com>, Mark Brown <broonie@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Ira Weiny <iweiny@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the cxl tree with the nvdimm tree
Message-ID: <6a1f36e3c234b_5020c1007d@xwing.notmuch>
References: <ah8GDU5JoXYr1J0x@sirena.org.uk>
 <6a1f36341a07b_4fbf910098@xwing.notmuch>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a1f36341a07b_4fbf910098@xwing.notmuch>

Ira Weiny wrote:
> Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the cxl tree got a conflict in:
> > 
> >   MAINTAINERS
> > 
> > between commit:
> > 
> >   a6e0072cfa82f ("MAINTAINERS: Update address for Ira Weiny")
> > 
> > from the nvdimm tree and commit:
> > 
> >   43ad501987391 ("MAINTAINERS: Add CXL reviewer")
> > 
> > from the cxl tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary.
> 
> LGTM:
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

oops...  Best to match the email with the one I'm replying too.  Old
habits...

Reviewed-by: Ira Weiny <iweiny@kernel.org>

> 
> >
> > This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --cc MAINTAINERS
> > index ff2abbdaed574,158dc82dd3076..0000000000000
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@@ -6505,8 -6431,9 +6505,9 @@@ M:	Jonathan Cameron <jic23@kernel.org
> >   M:	Dave Jiang <dave.jiang@intel.com>
> >   M:	Alison Schofield <alison.schofield@intel.com>
> >   M:	Vishal Verma <vishal.l.verma@intel.com>
> >  -M:	Ira Weiny <ira.weiny@intel.com>
> >   M:	Dan Williams <djbw@kernel.org>
> >  +R:	Ira Weiny <iweiny@kernel.org>
> > + R:	Li Ming <ming.li@zohomail.com>
> >   L:	linux-cxl@vger.kernel.org
> >   S:	Maintained
> >   F:	Documentation/driver-api/cxl
> 
> 
