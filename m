Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A510036B04D;
	Wed, 18 Mar 2026 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819457; cv=none; b=mJOZHXRbTHWU2kyi6SecPZbeKH7eQqZ+d4SXRvsT+KJPx/m4NX6ehVDwO5aJHruZRc0DkG8Zq8NbrH2jK8g6YYDA9oBksUIJvoXCDCi5ZFh4UsISMUYgRgrrxcEefEwyk+IFkPORcRvkmRqQZc1x8TZywvX4oDy/ilpNtB6eFJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819457; c=relaxed/simple;
	bh=lCj3TPDc9see1TZLDPe8eMXO3kMJqmIn9vxCTYJI7zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLsggPhRsknP0tVyII1uGPSCxmEUJ7kdNfjru8/6dcUFrWJB/4mfIR31CP8/5vsoKIBbId7y9Nlr07MqV4PM1NMrLurlK86z1FMINd0hYTJRTuxOxT8vQBA++75DMYfSsv4SfS4LIeSHU8r7nlQmUqFG+/eImsxsB12HWjIWOUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=UmpE5A+M; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=3Qe9KqMj; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="UmpE5A+M";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="3Qe9KqMj"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A0C381400205;
	Wed, 18 Mar 2026 03:37:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 18 Mar 2026 03:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1773819454; x=1773905854; bh=P99+ZcPxNY
	Xl1RambXle5Wga2OTjjaAnQG9RiueLheM=; b=UmpE5A+Muz6VA1bOnYTDwGpwN8
	bJKCitnnn5U8j/pnwla2GCA5Xzf3aXhFdlDicfdfk/21EH+Nps4aR5esEqHVIw7f
	qJdSFQBqdWS0KEnPYB840tTsk/FqViigg2v/USLurtQbGZ627KtAaUgCSuD+160g
	+DyHBl45XUaORHGhQ3V5H5aXNtJlRYQaca66CESl8L61kfEEzqTTG/9L5UhmZNUn
	/umkqjmso51B6T/QidsnrRv4VRA3GG0vXLPsMZTFro/h29V5GSK+mAUvwO/7M8Hp
	ktFdR36jRIdTDT+I87+QYWyexR+BEups0IqjNOs8sneDDUQz3nUS6/KkizHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773819454; x=1773905854; bh=P99+ZcPxNYXl1RambXle5Wga2OTjjaAnQG9
	RiueLheM=; b=3Qe9KqMjXlQii3P0ooEMu35PabStIHkU0xtlotjMpFfUeRn4Yqk
	1S87rHh6WG9/eQXOVaZWrZnTfB70vbqol5XS2T3F6KOFtAZLXKUBwlHTK2EXkw62
	NBrGJIhjmaYBexjOMFqXzjXxWrsHfeIT8oKAoWob9u7jaNYbHTId2MMMJCI71S7A
	N/3s5e2caRN//BnyXqU7JvHCthZSlm4dKyjA3c8TBW50rgrfo2TGKCO8Aa6Ds1re
	QcTyv6H1yRBWmNCdACtBjPY8LoxscT5dW4XkZarnymzQ+6+G0txqj7WmWozE3ml4
	Nx3H5Rkia1HJoVDOe6TTxyHlutTCP/eXxMA==
X-ME-Sender: <xms:Pla6aYymBr0h3-f5vSSFXS0yFH2PB8AKBZwmrRyeywE_eX5_zAZ3Ng>
    <xme:Pla6adMvv6L2QmYxvuu-NEmHOClsBYf53MTIty9lPNMPon9IqABn-S0_EdJttkZ0K
    W6nCA9oXq6f1gStF7AS9ytVLAsEy4RfjqIyDziBOnOU5VXhPIg>
X-ME-Received: <xmr:Pla6aar0j_-0RwIzzJ5K90yJHPcHKrmUEdv6WlJAlPdyVItQ-GTUCSrYNc7wX-j9oCgVObsdntfAWgNy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdefheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkihesohhsshdrqhhurghltg
    homhhmrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghr
    rdgsvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Pla6aU-yVcyTjdO9L6mlR9ql0ySz6K67_qvApX9ieotCtkTY_OvzTw>
    <xmx:Pla6aQ2IeZvQzp71dBbmZHS_olxCQ9UneJj-NAlLUDZ8gPojUD1UtQ>
    <xmx:Pla6aXBaO15VHLBRLPwGpM3e6tjWFy_2M7vV6DHKrqYYbdt5BNXCag>
    <xmx:Pla6afC9p7T0G-kt3FaWaX8HOVBjS036f1sR6LgnQEgCPRPKwcWuUw>
    <xmx:Pla6aa0EN50aEUfNaQ04ncEsxiTWIuCd2vl_Jc9EmpXqyG-G1nUSzYTX>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 03:37:33 -0400 (EDT)
Date: Wed, 18 Mar 2026 08:37:15 +0100
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 devicetree tree
Message-ID: <2026031803-chirping-promotion-4c3a@gregkh>
References: <abl_FcMjGGAf1YHt@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abl_FcMjGGAf1YHt@sirena.org.uk>

On Tue, Mar 17, 2026 at 04:19:33PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/of/base.c
> 
> between commit:
> 
>   82b6c1b542ea0 ("of: Add of_machine_get_match() helper")
> 
> from the devicetree tree and commits:
> 
>   59621105ffca7 ("of: provide of_machine_read_compatible()")
>   c86d3b7b847cc ("of: provide of_machine_read_model()")
> 
> from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Fix looks good, thanks!

greg k-h
