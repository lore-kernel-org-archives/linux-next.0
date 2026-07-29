Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25153B71A7;
	Wed, 29 Jul 2026 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318156; cv=none; b=S8is7ZeUoaWb0u5XJK7EK/JBw2GKw06NA4y7TJlCVyZixXbDuYy/6w0qrAQVBbYsp7xT7NGkkmQQoAqnwSsc15OKr0BmUkmwVn4z2nKppD/ydrnDPukmrA1iGwJ3uBSgPxs0I5o+CMXnkpo74XxfNea44TwgagkoJ54bRUZRp0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318156; c=relaxed/simple;
	bh=S6xiGbCSLtnbwihVgR9ihmvTQgO0HqAvCOAlamMA5WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbnwTH0/wZOIGqH+rsze/EKJ0BKh8yzLwJitubCS7TyLHnksg+7ZZ9iDgiKwxDbvlDowHqxyEJgzOixxM6BOkHx14PVo+XRdKgS4GWlT3nvqexXARBn0ziMufkcMBrIUGmCGN9VEmrrdPxActC4XyZJdObFhO4YvvfnxPcn1yhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=XT8PeMl7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PtBqhlzJ; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="XT8PeMl7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PtBqhlzJ"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BEA2B7A0068;
	Wed, 29 Jul 2026 05:42:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 29 Jul 2026 05:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1785318153; x=1785404553; bh=HNyexQWqZW
	MlDrb/HcoolK5FR8COZcasl1zFgZ1vBlA=; b=XT8PeMl7gKlA49+kd63xdBFhSQ
	HtrVmXd0HbS8JgdhZrtrCD7Pfs3tnDGUQq81VyCUEVKz5fqKTO6p9npdbOEhQ3WH
	UcbWcS+5pM7Ztr5eCPmO9hwMO3JvyyNcUJ6WXqueqFlE5qpoauE8Uch58L68eksv
	JIgTvveqlMsGYRTERROfvrwXkqV446S9ar2ZvT3/yLqNgdOI/pgD24G+Tufxgpxb
	hukjhlLBjrmGlReJE+ARgK4IJfw9Rb7komXbMxrqjLxxaoK6LMmZxEWJcnUEuOgO
	WUfVz+lV6YyNIdtNgLdgXrIZU7YOT6D4GqS3E3S2On2GoxBDS2WMFv6H8R7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785318153; x=1785404553; bh=HNyexQWqZWMlDrb/HcoolK5FR8COZcasl1z
	FgZ1vBlA=; b=PtBqhlzJZ+BYvoNlEn+SlNhXQ0TTDUwYOcKEf+rLFpPHeomn2Rg
	vXe8JOTJsodZa6IyFgI2pB7Uqfeh1MSH+xCBzZlJuZXuMsaawx0X2ETDUYF/DKs1
	X59Os2j43TTTufKeZ9LCJPVeComkkIjuQC9qGwzeOoctKHXBK/14w1JBvBWuVeG0
	69I+R1mtRd4Zh3rrh9RgDvQGVBVggo62E733W+uWEyZ3FhPLBbvrtnPLEXGJ6w/t
	h2CFHofRk1lAB42RhsE3uPqCqRF8OAKkgfEEqxXP3b+K3HaZep9pGdbbgp/jDTou
	R/OgVxCLrr3I/37rXmgF0y/eUjYbekkAedw==
X-ME-Sender: <xms:CctpatdsRM7GDRPm6Hho_aujpDwCJeaJfc5aMcD2oOquZt0sggwExg>
    <xme:CctpajaSkde-eUzwBALVOsp5Ee5DveOkWAs3XA6cZCMoe1-dpw6IN1f_bkYNFRlTq
    1_wu0hoppGqtIZLJDH8wnz4LTB1BHgRGqYsw8mMnqLnEydR3m8>
X-ME-Received: <xmr:CctpaiGHmrkBX0kPDL-tBykP-iOVhBdz5JmzuGjhk7fdU8fhnMkmhPjPgMNYoSFcuLamJxdxWP1VFIpFoWMkV4RAea8WOTYM41KSHwbzBZA>
X-ME-Proxy-Cause: dmFkZTF5Es4xMRNbm+GoAXoArup7aj9K1Gq0+S+9T86IkWUx4st4xnovk0SVpl3lRJyg6U
    xprTjnjkI++koZo9UD8AO9wZ98yyomaY7xcxWsIxgz/yxS62YKBcd01ZGgZbytZUyvtaVY
    46JdiA85qGZYJp/9zqdLdhx8XwiLBYXW798ANNRDQz0ZA4ZxsQTCYZqV5lrQiohInX0ksU
    1QPinqOX0UODbJLh8CFGLmV0xWaavuvI+cHqc+djv5lyqycwWqKEVEe8Qic+e5oj0Qr9Jb
    VG3kxSpnm1NzRSsaeOPSaZkeYvuUABL5zNDhYrR5f/9u9hti8JmmoSccLxUVv/uhGj/LF9
    li2zWYgavD30SkLdRkyKlfgX4o8aOIQrUtn/DBqZjbNmaqP2URk/PiI1rHIqv2on+tC7Mt
    KxFYCdUl77L6dvkl52uZErCyzr2i/+/8zl76eQ/tAy9cQNV/4v5Vg00zWeA84p6n3ZZHks
    UVjZiOE4lGTv/APtckQsFV6SVWpryl/PCJowYxBP0oFH0LJfClNyb3Z2cDiv/XEm0RAk3C
    /TsM8cs2aidZx2LegSiTQ4+iVO9fJCHgFcAVu/H5fbkjT1O7mN89R6oUb4URQZSKBh0y5f
    3SAxcWIEJmoG43YJkIBht5z1dTXm9ldQlmL9Lg5BomBZspNFX52O6wFHfnWQ
X-ME-Proxy: <xmx:Cctpahm1F28rGC1zETN3h6qW7D7-Ly7Cp9SFFkwX5Y0YaIgcNQRzYQ>
    <xmx:CctpalfVJjLtzVg9OT0QoSgIoSB0NJ4nzsI2Mh-3TocKNVTxBsnL1Q>
    <xmx:CctpavHSTVOVUsdYP6PBYlKWQ1XYC5wN1uGbuF00jDmfsLdZwwMFLQ>
    <xmx:CctparhxnqehiC49HdecMHZrV_0jQVKEDHUeIWUEPeZbqX-rAdYDZQ>
    <xmx:CctparhyWlnZBSL0kLlPOatCHe37I5Eint2pyaxdFolpnKU5vHDCZFW7>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jul 2026 05:42:32 -0400 (EDT)
Date: Wed, 29 Jul 2026 11:42:20 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Eugene Mavick <m@mavick.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Message-ID: <2026072914-knelt-detract-e21a@gregkh>
References: <amjpRIA5G0pnhhyr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amjpRIA5G0pnhhyr@sirena.org.uk>

On Tue, Jul 28, 2026 at 06:39:16PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> 
> between commit:
> 
>   ae21407350151 ("staging: rtl8723bs: fix OOB read in WMM_param_handler()")
> 
> from the staging.current tree and commit:
> 
>   6e68c64a71f70 ("staging: rtl8723bs: remove unnecessary parentheses")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index c614c0b4c792d,8b0502a1881b5..0000000000000
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@@ -666,13 -665,10 +665,13 @@@ int WMM_param_handler(struct adapter *p
>   		return false;
>   	}
>   
>  +	if (pIE->length != WLAN_WMM_LEN)
>  +		return false;
>  +
> - 	if (!memcmp(&(pmlmeinfo->WMM_param), (pIE->data + 6), sizeof(struct WMM_para_element)))
> + 	if (!memcmp(&pmlmeinfo->WMM_param, (pIE->data + 6), sizeof(struct WMM_para_element)))
>   		return false;
>   
> - 	memcpy(&(pmlmeinfo->WMM_param), (pIE->data + 6), sizeof(struct WMM_para_element));
> + 	memcpy(&pmlmeinfo->WMM_param, (pIE->data + 6), sizeof(struct WMM_para_element));
>   
>   	pmlmeinfo->WMM_enable = 1;
>   	return true;



Looks good, thanks!

greg k-h
