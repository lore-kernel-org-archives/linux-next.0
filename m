Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E9E2F361F;
	Fri,  6 Mar 2026 22:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772837339; cv=none; b=OBGFUYlYRxgvY/TKpHDXUGwRD43Vk7z+XupP9xgo6ECZAXMGkbvg8+1yJVAcfOxOmW3qz98TbCQlgSnTKb/NKd3ottjo6qSjw4s3SFe1/iGG8Av8xwVOTwgpgkDYIWe7p7Ch6K62v5LyJhNFUnvrlkvKIFKvYbLLhxSZevm070I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772837339; c=relaxed/simple;
	bh=1Ts4AwDe4oHsn9QqMp8SRs1S7rRWi9rzrPv6rjkUmhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tz8ctpd8/W8FU1GXrgPYmSZilEIRYgTBiUcpRRUPcbMFIguUYMl3NLoQi+F8hRzg8rOpXGoosxd5XYj55e0Go409y6dzVNzIBXSufQVRQ6Zhmsyj5CCy67at7VJc9BFQRJIPyvRnS4R0ENNa2Vss1LVqOPGrbfB7OMaqHa2aCI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qo4o7rTD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qo4o7rTD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE619C4CEF7;
	Fri,  6 Mar 2026 22:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772837339;
	bh=1Ts4AwDe4oHsn9QqMp8SRs1S7rRWi9rzrPv6rjkUmhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qo4o7rTD9071Nju3C/b8Fy7tu5gf3Ri8XPWxpuqhhkpO6fFwvXuTW5M/UGPPVlw0m
	 ShRM1YM+0GNmfC/XH/NPyAaJck4t9kwGomHaVQkFriqFUefRuuk9w7gPHz+4kLTP/m
	 whszfot1lNBYhzwTu3n4JNBbXDPA6TlnzxW9C27RnrCRuHb60G5idAReGDb0bRUHuY
	 j5x2k/4IKi3OgZSczkOoDDjJ8JIVd2UTW7pebU4goweeKZ/oliC5rU/JsrQrHB9vWD
	 VkbKzz+eBvTPbdxy3CsOdd6w7XS8+iIy7VNPCpRgOnxSrYo3S3CB0GGZpWJPQl4xjh
	 ESH8ebEb6BPBg==
Date: Fri, 6 Mar 2026 15:48:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Chao Gao <chao.gao@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <20260306224854.GB2746259@ax162>
References: <aagjzN07Pv1fnSHq@sirena.org.uk>
 <aai71uI977FU6599@google.com>
 <20260305192401.GA1783111@ax162>
 <20b59abc-096e-4578-9935-0aaf80dc90d8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20b59abc-096e-4578-9935-0aaf80dc90d8@sirena.org.uk>

On Fri, Mar 06, 2026 at 01:24:34PM +0000, Mark Brown wrote:
> On Thu, Mar 05, 2026 at 12:24:01PM -0700, Nathan Chancellor wrote:
> 
> > This obviously clears it. Mark, can that be applied to whichever merge
> > happens second?
> 
> I manually made a change which hopefully matches that, your patch failed
> patch format detection for some reason...

Thanks, the version in next-20260306 looks good to me.

Cheers,
Nathan
