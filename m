Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B22C32E745;
	Tue, 10 Feb 2026 23:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766985; cv=none; b=c4O6SgLkp1Dw71aXP9g8BfeIaJFePzp8xCYIfhnexRsBCD2t1teQdFCdF7XY0CGtprqtRRL8J4nMsxBVOHvjvDUK4olsu1ZUza/z7SAiITQ9xjrAm0tsek/GVn06zHN5WdHETh2KqLmnIc8qrJKwUS8zT2I20WPnFeo8qzWNv68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766985; c=relaxed/simple;
	bh=3p7Ju/F/kVlPo5wUaFO7BpMzgPYClr63rj4e51XtAPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvRKaq44dm/8xBY326d1hybdkTSehX6JGyV2qR1A6KQ81c2WiC8+0GD5fTNwH3CY5VFr7Xz/FHNkRhOQlBdkxxcNpjw4zzOBS7HHbd7PR+W830qKql/uVmmoZQqlYsJbgGXgIeAaSPAZc0Z4Jy1eBdm+FDqmyp8yO4+VZOPTl+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUGdGG+4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUGdGG+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D80FC116C6;
	Tue, 10 Feb 2026 23:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770766984;
	bh=3p7Ju/F/kVlPo5wUaFO7BpMzgPYClr63rj4e51XtAPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUGdGG+4DxfYUOE7JNvOkFfEbsfChM01F43EIOjM3MQjQYVEJJ98vvwdMmxtHIS/B
	 4GQbq9Ouz22llrG7xydw9MIc/UkCUHVsHFi/N65PDWuH+9LhEYb/CdV4SqP0UqX6/9
	 u0OzCgTU9PWWkznC5nEIbxxbeYxk2JB5VQdazDGb/OM81q3eVbbiE4Zv60sa7ASDjz
	 XQ7pVKAidct1twZotkSVmOJsvVMS5touCbd0e6VAtacPIHTp0p1oeIvE1pw5yiRzcP
	 6d1DwqfELSECmoxnjVelrd8fv1sj/TgQgTGEgIOWayfdIJw9roQsiTVEBzjG01BGqx
	 R2AYbFas8lMFg==
Date: Tue, 10 Feb 2026 15:43:04 -0800
From: Kees Cook <kees@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kspp tree with the origin tree
Message-ID: <202602101542.AA78E518@keescook>
References: <aYueRmtXzWX5UGf2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYueRmtXzWX5UGf2@sirena.org.uk>

On Tue, Feb 10, 2026 at 09:08:22PM +0000, Mark Brown wrote:
> Today's linux-next merge of the kspp tree got a conflict in:
> 
>   scripts/coccinelle/api/kmalloc_objs.cocci
> 
> between commit:
> 
>   bdc5071d7f7bb ("coccinelle: Add kmalloc_objs conversion script")
> 
> from the origin tree and commit:
> 
>   52d3cfa9bfcd4 ("coccinelle: Add kmalloc_objs conversion script")
> 
> from the kspp tree.

Oops! Sorry, I have refreshed the tree now. Thanks!

-- 
Kees Cook
