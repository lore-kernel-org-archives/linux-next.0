Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF3243CEF4;
	Wed,  1 Apr 2026 13:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051048; cv=none; b=W5OMuvePZNXrmoWiI60mGe3qaXl8JR3qK4sse0y3Bs03CpOvUzD1iuE3yGkP0Z6zUld3/vFdLUig50L3XRCWwpama/NKJ6f7tUzjKMyPodOLzMSifHlEjdxpVltC7CdfznVHGrVfFr563az6BcKTFEOBbpQt53QS6MpZ4QEWj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051048; c=relaxed/simple;
	bh=uw7gfym3VGZkaS5710TC2MJa3Nr2KDmXcigMRf3btZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjF7SdUqwFOpSxLoqISmsjOvBbgbMAukwl/3W9X0hZ3pr5ItDwCVeV7xvYuRYxjZQFK56fisPCF7BbwAc2ugeYb/SU0KJiyCo589DdwCuBzFLnTPmOSid5f88xzSDZAmg4zAN+U3sYjbJamqa7n9XKqOqdcXkqxIKr62+JvE6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=RvO5Lxf2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OZIZ+AH1; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="RvO5Lxf2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OZIZ+AH1"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 69A4F7A01D4;
	Wed,  1 Apr 2026 09:44:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 01 Apr 2026 09:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1775051043; x=1775137443; bh=HLZ/IazVKJ
	LiufFHi3jGgQqo9gXbpLuOwKcjIsYDr2M=; b=RvO5Lxf24AhEdX51DxaeT2NTf1
	BGwgFGf6s5UVZoZlkjbFuPd8/lZHXnkEcSFCU7Zxw+sTiocDpyBMIcPf1N2xGCv8
	5TNt9kCO3Lr72T+UduTDji5jsjscfezcMgBv8rqXCcZlAeMvGJOqJFDN2OhPHNcY
	UsyFrUVch2Q4e+mL++WKadueuaMFgRmdyoZ/7RVrcWMhRwMkiPYVWXpK0ri1b7xi
	vxEW35SPDNR2vS5oZ0bu83+HDag0W0+HerIp5Df2RcGBF8rRF7hNkRf58Lfckak/
	etIiZvOm18vetU92JweHdvfnvrpPlItdyGdW0rvfbOH6xDj5hxsP4RmBiuUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775051043; x=1775137443; bh=HLZ/IazVKJLiufFHi3jGgQqo9gXbpLuOwKc
	jIsYDr2M=; b=OZIZ+AH1kuYxeZ5rQww0SlAWTcq0xUMxUTkoG6pXpeIXNnyQ/HU
	5I9Q9mZhMAxTw0RJc0/fgvjpDerIibw4uAcoeUeuAReHXOv8TVDtENbPWWhKYNbM
	AIUnXWHC+s2b7eOcsbLFAphISR360J6XhmPIVQA+/qhKSjkWevdWdSqaOrYFHpea
	hPhlhoFuYeb82wBvg8wJyhqZbnMMCAZFg0vOlOd7q9OpmP36McM4VSS5UxNwddrE
	FGRBNGtQgl25+zT81ho7Fo8TqBAJamVcpCNUiFlZlBOfNqqfT1Pmvi32m794nbrW
	W9k0s+4ycAja4VnUdmIZpfpm7sU6fubbTFw==
X-ME-Sender: <xms:IiHNabldF5Xo9Vd2O1NRPOdG4DDeyTTnEsj0gFU1K5_mdUj82PVyBQ>
    <xme:IiHNaXm52-rQkLIYuhsThKS0sPcsT8YwtbPJ4EjmirXnbinmyvueBwpLdKphwbOK3
    415Z5_fVOLbwBrQtVRe3q0MDXwt4yne3eXZMyAkKuxRrK4l>
X-ME-Received: <xmr:IiHNaQXOW5womJJ24_BoQymAB73BkWqQ6NUc5BsIxNfMMXWyvIf-zVSBf5vTJ0AIqFwmOBgFMVHKxP2Lpf_9q7s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfmjfcu
    oehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvdelje
    eugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtoh
    hmpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    sghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghmihhtshgusehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgt
    phhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopehjohgvhidrghhouhhlhi
    esrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlrdhrvggvvhgvshdtjeejsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepshgvsggrshhtihgrnhdrrhgvihgthhgvlhestg
    holhhlrggsohhrrgdrtghomh
X-ME-Proxy: <xmx:IiHNaV_N5bKiDfuL66oP7B8T1lajM-T9VKQMMxuPnki6tPGujfZ0bA>
    <xmx:IiHNadqKpvPFoPoQIihjB2gJHfhP7XUORlFe_Y_yeDUIrzSebJSAlA>
    <xmx:IiHNaXmxl2-Q2Tc4C6WXxf96_NRgjo4UkAmXQ-Jjic7UpnmQGTWxDA>
    <xmx:IiHNaRZQO2wIBa0FgBDsxIxXY6GH5OBB4P_rhiA5bnV8-VZU7AF8zQ>
    <xmx:IyHNafwPcaeZOYer7AaOwUqdcPGZueyWS7A6f6sRxbK1pqahT8sj-n4O>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 09:44:02 -0400 (EDT)
Date: Wed, 1 Apr 2026 15:44:01 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Amit Sunil Dhamne <amitsd@google.com>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Joey Gouly <joey.gouly@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michael Reeves <michael.reeves077@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: linux-next: manual merge of the usb tree with the battery tree
Message-ID: <2026040150-hacked-quiver-10e3@gregkh>
References: <ac0aJ6jpCcSaemt7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac0aJ6jpCcSaemt7@sirena.org.uk>

On Wed, Apr 01, 2026 at 02:14:15PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/power/supply/Makefile
> 
> between commit:
> 
>   0ebf821cf6c75 ("power: supply: Add macsmc-power driver for Apple Silicon")
> 
> from the battery tree and commit:
> 
>   70d7dd27f6dc9 ("power: supply: max77759: add charger driver")
> 
> from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/power/supply/Makefile
> index f2efbb82707c7,6af905875ad5e..0000000000000
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@@ -129,4 -128,4 +129,5 @@@ obj-$(CONFIG_CHARGER_SURFACE)	+= surfac
>   obj-$(CONFIG_BATTERY_UG3105)	+= ug3105_battery.o
>   obj-$(CONFIG_CHARGER_QCOM_SMB2)	+= qcom_smbx.o
>   obj-$(CONFIG_FUEL_GAUGE_MM8013)	+= mm8013.o
>  +obj-$(CONFIG_MACSMC_POWER)	+= macsmc-power.o
> + obj-$(CONFIG_CHARGER_MAX77759)	+= max77759_charger.o


Looks good to me, thanks!

greg k-h
