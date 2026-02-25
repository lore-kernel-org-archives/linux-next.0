Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D663203A0;
	Wed, 25 Feb 2026 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032006; cv=none; b=VDIq2AO2owVlwp4zypLQ9Dc5IEytwDDalz8HcKh4AIU0xShJX5668yx2nKYE+QKOl+NhBy+u+qJ4qhBEH60/+b1qWSc9rCCqchL1Na5ssGXrS6HLxoUP/1JPrIMr09W5C09xLzBrCWKO+zsm4WNvGwBFXuQByzsE9vwzBCIuyi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032006; c=relaxed/simple;
	bh=b+RpQyUFFeidIm7YFaZTNEH4Dt3yvuRtoH+lxX7YIFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jggTSt5PxeXyZbzEnh7KiqjiFSngpS1swcZy2SP9vIOpzEq0trssk84Iet9P+nkL4kt54DJt5+5tMgcIljEYsFHVmQFWjlMy4RTV3umC9vFa4T6ApWHnOJZNzUp7v7mhq1NOp3YPvnQMQEmEXq4YhO26NYGdQPjVQfBiifw6sMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IFkrttNH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IFkrttNH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC433C19425;
	Wed, 25 Feb 2026 15:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772032006;
	bh=b+RpQyUFFeidIm7YFaZTNEH4Dt3yvuRtoH+lxX7YIFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IFkrttNHkg5LKpUzw/xMW94e2D7R6OOR5KAbMZlQImqjlQzpZBasd+EojMWkUVRzI
	 TIOZ+FrSyiP1RPy6SKhy4axmbWXHy32Yog+oPBakFxYQTdpsXYPYUALd9pyXSC+wQE
	 2SrqpkJ35W44yl5YqH6Te3/7tGdFIf16odyreO04=
Date: Wed, 25 Feb 2026 07:06:38 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Message-ID: <2026022533-obliged-acronym-3c23@gregkh>
References: <aZ8PcvFgmYITOmjg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ8PcvFgmYITOmjg@sirena.org.uk>

On Wed, Feb 25, 2026 at 03:04:18PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> 
> between commit:
> 
>   f0109b9d3e1e4 ("staging: rtl8723bs: properly validate the data in rtw_get_ie_ex()")
> 
> from the staging.current tree and commit:
> 
>   0c9d1b56f9af0 ("staging: rtl8723bs: fix spaces around binary operators")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Sorry about this, I knew it would happen, I should have warned you.
I'll take your fixup when the -linus branch gets to Linus and I merge
that into this branch.  Or I guess I could just do it now to save any
future issues, let me go do that...

thanks,

greg k-h
