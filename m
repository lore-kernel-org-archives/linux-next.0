Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F7835A936;
	Mon,  2 Feb 2026 23:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076125; cv=none; b=WkBbS2UM9frWVboRXPswfCBIo1oe8fpmsA+HJ/CFNboUK7Gp9w2L9h5iaLrMh8XA2WEIVYdt/gt0ZKpAI7urAXuExTHUx10AkcLYAt2w9lxre6OK81amuWJoNTIaQDQquxn1G5OX673qIRxBiP2cus57jhG6UWagjKwjF81Z7rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076125; c=relaxed/simple;
	bh=oBmjb42nXkY5DZ1gCF1XyNBRo4afUVVrnWe1Li9NLm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SH+7sQL4XlxdjosXlzOAjyv9mktef2caXto0KAtJmS+L6PJ8JhOgTHxjYcgvsY1mmWytLw799U++lSLw18gUqZyxQU6ud3Ozl4iVvW5xqx/eFa5gnV9Gi298FwFd7ot3K+MvxZA9JqEDQQTsBkT7haOHd+reuAQaOv0leBmKSoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boxXZdnR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boxXZdnR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71026C116C6;
	Mon,  2 Feb 2026 23:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076125;
	bh=oBmjb42nXkY5DZ1gCF1XyNBRo4afUVVrnWe1Li9NLm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=boxXZdnROYL3EkGmYivMQ/eGnS5O2YggQ8fmzTwtewJ5qs5Nhdm4414U1rL/EDjtT
	 wTxsmlP7IX/QgYOJ7j9C/vusGdt3nVkq/qszKttP+bMW2Vb+RfC7DSLAQJB+o3z5et
	 MqpJ/VQVM868Antz+97TcZUSetVrPn9oJ/j/EO5t/ReE7EKiC+uDkQ1/1XwI3rUrCN
	 5yCLm6FYEVpkE4TTxu+EYIqplF2VH2V8UDQJIGFQ0NSRANqmz2Q2Qtk3VLjgTuOdSD
	 gJpySHA95BIYGH9UvmZV2CTCXJNSc8LxyU9bUNlsTeYpdBnPzz6CyL/fe77zLDJOtF
	 aanFy5LoQFkGA==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Brown <broonie@kernel.org>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>
Cc: Jonathan Santos <Jonathan.Santos@analog.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the iio tree with the tip tree
In-Reply-To: <aYC-dATLw09TXP4K@sirena.org.uk>
References: <aYC-dATLw09TXP4K@sirena.org.uk>
Date: Tue, 03 Feb 2026 00:48:41 +0100
Message-ID: <87sebi4sh2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 02 2026 at 15:10, Mark Brown wrote:
> Today's linux-next merge of the iio tree got a conflict in:
>
>   drivers/iio/adc/ad7768-1.c
>
> between commit:
>
>   c04731b5f1502 ("iio: Replace IRQF_ONESHOT with IRQF_NO_THREAD")
>
> from the tip tree and commits:
>
>   ff085189cb170 ("iio: adc: ad7768-1: add support for ADAQ776x-1 ADC Family")
>   ac9fabd578a03 ("iio: Replace IRQF_ONESHOT with IRQF_NO_THREAD")
>
> from the iio tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc drivers/iio/adc/ad7768-1.c
> index 84ce23c8e5782,fcd8aea7152e8..0000000000000
> --- a/drivers/iio/adc/ad7768-1.c
> +++ b/drivers/iio/adc/ad7768-1.c

That's an impressive fixup diff :)

I'll zap the iio: commit from my tree tomorrow...

Thanks,

        tglx
