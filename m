Received: from mx1.manguebit.org (mx1.manguebit.org [143.255.12.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FC428F5
	for <linux-next@vger.kernel.org>; Sat, 29 Aug 2026 00:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.255.12.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787961961; cv=none; b=mqD5IUbKLq2o59zeCHbq84fPVrsZHLFWUQcHTq12ASQANBB4ZBZVdOho9wXiqoaPRGSVhgeBWdfeirf7niq2EvIsiqgCNFLhLClioxd5KJJQrBPhbsPnC3SRLBWHGczr+WfUz2KvcaE30CGWcXHn4DhRXj46OS5W1rDUPlRYAc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787961961; c=relaxed/simple;
	bh=dc+M8bT533lUgNdI1CJPcGXe8RulqjlUPvBFRBEBZ7Y=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=sIlTZSXIbbGMP38P1Fj8KiB9eWDGbEc5Zp1tueF6eTPr5U7vbPMtKuSzsbOnon0btJa+QYHLmNmHkbKZf07MzV3iQ3QOKw3lGdM41TiK4B1/eAbK0ETiC+9Dgd1pCDRR1YT/VVY1xHV+faEuG3pRkqaeY4HDfPaVEFjH8568SdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.org; spf=pass smtp.mailfrom=manguebit.org; dkim=pass (2048-bit key) header.d=manguebit.org header.i=@manguebit.org header.b=LKh17wRe; arc=none smtp.client-ip=143.255.12.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.org header.i=@manguebit.org header.b="LKh17wRe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=manguebit.org; s=dkim; h=Content-Type:MIME-Version:Date:References:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oc0Vacopu6C3Akpd5IxrTUp/yKbC9r23ziFbWCIFDq8=; b=LKh17wReFEYa3zdBKc69bkO6vO
	tkz3fwW323GQJYNGXjdzZ0N+bUdNvK1Yf27erAafgOiYTS7JUmYrx1bBpKO7L8rvUXZldokbf1qHZ
	oJwUyMR5PFVJUyJJafHCBXWqTZJpvzrS4JIEWvtV/s/z0AlV/oywFugK7RIDJDvyzeyVXu6dFgODn
	N3Xo4Ty0Lh57Dwz0XHSFEfzeptdqBYp0X9B1tHv2eP9Z9Ypm6Gew3vAbAnMhm1nchyImo1zJXRmja
	1IkNGsSq0EYj40HaJew0hKKbLJgmwOCLZq8QLMmtcU/9KkmYRxQNh9Y7fvuoFTGLDvdpoqyIJ9+gX
	Fnip5vrw==;
Received: from pc by mx1.manguebit.org with local (Exim 4.99.5)
	id 1x06a5-00000000CUK-3O3A;
	Fri, 28 Aug 2026 21:05:57 -0300
Message-ID: <752329b497166aed63d62ceb9c663012@manguebit.org>
From: Paulo Alcantara <pc@manguebit.org>
To: Mark Brown <broonie@kernel.org>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org, Namjae
 Jeon <linkinjeon@kernel.org>
Subject: Re: -next for CIFS
In-Reply-To: <e2f818f5-c2cd-4975-9be8-f73101a36081@sirena.org.uk>
References: <d6f9af6b5fb15945b594c5fec0ad9d7e@manguebit.org>
 <e2f818f5-c2cd-4975-9be8-f73101a36081@sirena.org.uk>
Date: Fri, 28 Aug 2026 21:05:57 -0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Mark,

Mark Brown <broonie@kernel.org> writes:

> On Mon, Aug 24, 2026 at 09:42:20AM -0300, Paulo Alcantara wrote:
>
>> The new -next for CIFS patches are in
>
>>         https://git.manguebit.org/linux.git cifs-next
>
> Thanks, I've updated and will use this tree from tomorrow.

I've noticed that CIFS patches from

        https://git.manguebit.org/linux.git cifs-next        

aren't still appearing in linux-next.

Are you having any issues with it?  Please let me know.
