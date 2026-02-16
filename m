Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBCA17993;
	Mon, 16 Feb 2026 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273632; cv=none; b=uXpPPXcsfRYbtmhKpYeYu65IgicTsuUWw/DAeaYB+CAL4HNVq2K75x62U154DRL6/kLCDyWGBf+pWWDV/5X7ZzpXLDWkBWHnKOx8NICK2+Fhvq5rC8C1e57+GQCYUwE0A93LREhYXITmckt8oViZtyrW2ZbQVHkgKiGdSbeKOfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273632; c=relaxed/simple;
	bh=zftin1qNkryo8evw1MT9ZwraKBthnOpNIr4aZK9c/hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PABDrtQDnLZ0KixwPu20nGOpWFVbf9ttIWUoWV7dsrKS5Ho/ml4XtY6ap2A4nlG/Za/QcFVlopvqGj9c41i2TGbOn1ZmMPM6ys1UWpEgGOmcw0EjD0dochkpgmUTU7QNqXDlBh7KcfPucoNgWo+PGCEEIzH91z5vkJMBdm9vmIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QE3UZZaB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QE3UZZaB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=BByMJOVxwigQG5kI5Vp6wuzkz1gC9hzYh3kHSZPVwFo=; b=QE3UZZaB+xrC6g47P+u4QSNKmT
	ZZpMudQK+QvORfdamRCjvKgObXF+/aUbtNG3LrtYM/lGaUtV2m0kl/F083l53Lb5+cFyhG+lVtIrd
	80RvLNEs6Mye5kRfLu6dE4YruWwWtuCBEJBRTWHgfcqDpvi8zlyL03ddG5rJkZdAsgWpmCvYXwPYB
	XUq5+VKLzgUUytrXxhISP6beXoQF/SyDU31AX0Kn6DoQ0+324OmTF0AsjNWA25apin0rTwE1hnkl5
	oHraVy1g2irAcPrLFdNzbB3+HrF7OYux1YeZLI2T8YME+nLEfTrNb+HDzO/6iH7Adu0Dh3/NcnQKW
	xc7ZcxCA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs5BU-00000007FjV-3XzZ;
	Mon, 16 Feb 2026 20:27:08 +0000
Message-ID: <504f4452-ccc8-4794-98cd-b5e76700a945@infradead.org>
Date: Mon, 16 Feb 2026 12:27:08 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CREDITS: Add -next to Stephen Rothwell's entry
To: Mark Brown <broonie@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
References: <20260216-credits-sfr-next-v1-1-5b6563b29234@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260216-credits-sfr-next-v1-1-5b6563b29234@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/16/26 9:28 AM, Mark Brown wrote:
> Stephen retired and stepped back from -next maintainership, update his
> entry in CREDITS to recognise his 18 years of hard work making it what
> it is today and all the impact it's had on our development process.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  CREDITS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/CREDITS b/CREDITS
> index ec8a2acf1947..324959909603 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -3489,6 +3489,7 @@ N: Stephen Rothwell
>  E: sfr@canb.auug.org.au
>  W: http://www.canb.auug.org.au/~sfr
>  P: 1024/BD8C7805 CD A4 9D 01 10 6E 7E 3B  91 88 FA D9 C8 40 AA 02
> +D: Created linux-next and maintained it 2008-2026
>  D: Boot/setup/build work for setup > 2K
>  D: Author, APM driver
>  D: Directory notification
> 
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260216-credits-sfr-next-388cb85c12bd
> 
> Best regards,
> --  
> Mark Brown <broonie@kernel.org>
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
