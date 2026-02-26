Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822073B8BBC;
	Thu, 26 Feb 2026 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772119316; cv=none; b=A3eebUNz/URxcPnc63bA3kmPdnVVVtVdXzqWME4IG6s54DT0rozwz9cthr9B8ZcaQF8clynWSE/pw/GwB3BnHReXfgqJIYT2nYYdGfPHXcC1H5zA5mvv4Xm2v/1CUAK6p2pYAUIKzMQwIRotflGIDKNSdepki2RAPkolrib7wqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772119316; c=relaxed/simple;
	bh=4OzOGG2asiG9m4pJm1WgoEgUjaPCthWFYsxLQyx4hdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlV1LTrAw5si6njSioFhWJw4b+kxQ0HjElmH6C+Z6fX3gU/4fUDjLCClfhQBjFRWn5/i8uji2Y5nYXCCUdmBMXSqNV6iyEvgNouu1UoP37G2ophF+kjXBeQgYyUGsiEhvjVPkThVSyxW3SD9UI1Gx697SsvhXCmQ1FCXpQC4w3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cc9lB7Yy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cc9lB7Yy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86ED9C116C6;
	Thu, 26 Feb 2026 15:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772119316;
	bh=4OzOGG2asiG9m4pJm1WgoEgUjaPCthWFYsxLQyx4hdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cc9lB7YyZVPInNduZgIRRFI4qvNEOhG6Vqyrrs5icSu7Wcy4nGMsavpl+7SX1WPB6
	 aAkHj3DDQkwVlHlCYTPPA/bD5sIBM082aFwzyVLhXnLfqrObIA3UfhdyKuV2YDkULf
	 zNRF8nOuwIqrsqVMsXReQ1ibtjGGmRrNWBt2E2y0BZGqiTnTAUcqkBl9U1MmAIVVU6
	 VULRFM/b2nrXQ5HC5zVgbUexG986Tng0pBUdAQrDcHDQm0CjEnUqFyz+MSA2GfeaPJ
	 2qu7gjIbaXi9YoFIaCC0ueP/rWbn6AEXdfDw9guC7SnwUen0KT6mybS4eLCvBps1LQ
	 SOSgyv5EW309Q==
Date: Thu, 26 Feb 2026 20:51:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Fixes tag could use some work in dmaengine tree
Message-ID: <aaBlEFHX_QoAD-pH@vaman>
References: <6e72cc74-943a-4321-9be0-8347544165e5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e72cc74-943a-4321-9be0-8347544165e5@sirena.org.uk>

On 26-02-26, 11:05, Mark Brown wrote:
> In commit
> 
>   a1adb6de361be ("dmaengine: dw-axi-dmac: Add blank line after function")
> 
> Fixes tag
> 
>   Fixes: 82b5c9d6d4de ("dmaengine: dw-axi-dmac: Add Intel KeemBay AxiDMA BYTE and HALFWORD registers")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist

Thanks Mark,

The right one seems to be f74b30255060 ("dmaengine: dw-axi-dmac: Add
Intel KeemBay AxiDMA BYTE and HALFWORD registers") I will update this

-- 
~Vinod
