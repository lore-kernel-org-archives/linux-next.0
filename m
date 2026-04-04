Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1311E1A0BE0
	for <linux-next@vger.kernel.org>; Sat,  4 Apr 2026 15:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775316779; cv=none; b=fE3T9IqyWGW8UDmLT4DuOddeZcdNuqUWMIRHOPv77xLsV18GgorDTsnPhkqBNyYP6N8GLysEDQq/xmm9QD2x1yQuH1ASWt6IEKPKTVCnxQCfMjcp6rr5yFb6iwplC27NTmXBShp3nYjhzmiaU+8uEI26kvif2k18bXQBKYMV9Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775316779; c=relaxed/simple;
	bh=uG28wDleKWFRonmByDELZT0fQIPp1Q0F+cWKlZ14QEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZnTOP4CBhvUl8LvQ3RtcMcsa3BFMxHDyFIxGmuiTqm35jZIk2roWgInMZNdcexRoIZ+WNn7cBM8OIgHRVzgGfQ6iNHL4iklRe3UNx9oo1t8ikXDl7KMgF4CudqH61tDmo8vndyagj79mgJfDXjoABbpuevKye2XV4orkrycBfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WfTWEfWl; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WfTWEfWl"
Message-ID: <01c295bc-4718-49b6-a358-bd7da3e83169@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775316774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXQqkhJKWgqvFQ5WKuFHdeDNTPYi1IdPSwwN78Yqw88=;
	b=WfTWEfWlhRrqQjDfyVAMgzUS4qcVgfpJh3Jz6jmLR8pBkXJOWRfU3v/YH0AaA3xuhor7mz
	8FDZ6HLenVJuMEbv2hu0s8J09cX/OfJOpSZwQ/JjOMAJcEyEx3xPiv4Ij9/Wtp6UgmWJ9d
	A4o0PFYpLOMMlgx4S4+/ayAMpfKmP0g=
Date: Sat, 4 Apr 2026 16:32:51 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Please add rust-i2c-next and rust-i2c-fixes to linux-next
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
References: <02908210-0ed5-42a7-b725-8bf70f936828@linux.dev>
 <20260329105919.73dea963@canb.auug.org.au>
 <b239bb2f-15d3-4d30-9b3b-8008864d8d62@sirena.org.uk>
 <ec1752c1-a170-4473-9ecf-d6d93b31dcd6@sirena.org.uk>
 <e41bf6d6-810a-455d-81cd-9104d205524e@linux.dev>
 <adEovA9D9FxlZbbq@sirena.co.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
In-Reply-To: <adEovA9D9FxlZbbq@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 4/4/2026 4:05 PM, Mark Brown wrote:
> The fixes branches are generally expected to contain things intended to
> be sent to Linus' tree this cycle rather than material for the next
> merge window, they are merged first and published separately as the
> pending-fixes branch before the rest of the merge proceeds.  People then
> take that branch and do testing on it independently of the rest of -next
> so if it starts acquiring material that's not a bug fix intended to go
> in during the release cycle that might cause confusion.

Ok, I've rebased rust-i2c-fixes to point to 
https://github.com/torvalds/linux.git master.

Thanks
Igor
