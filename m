Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D799C8E6
	for <linux-next@vger.kernel.org>; Sat,  4 Apr 2026 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775314273; cv=none; b=PXtYwWXgWtRCEA4PuYkiH5CjuhvmaQuxOtV5w+QslPN7y9YpXSbxi62T71tOTTNj44eoNxgwmm2bEk5k+rg2d3ySve4fnpasq72SWoU0inBrTl4JxvrGvr5GyTMZQTB2pGHU+j6/yyHEtxkGjP7d2pYqXURucAVx/mkK44aCzb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775314273; c=relaxed/simple;
	bh=eXXGY65yQbjqTCJAdffT5TRfg0jKNW9bIdNInhzDrRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3KrnvgtKnIGSyCJqqdhSN/j2Tk27Cam3LAK5PZv/oKARjxlNMeHulWeLjQBg9vM5rCJbXOyfOJkSyk7/6UpkYMENs3Lhd6ix1d8i+ef85lpCkzSvbNQqCHwXxAooJPBW3nzsmL8PrLXOBZIzX0JIMBg2u+OB2x4VkrO2ovYWuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W+J7XWyS; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W+J7XWyS"
Message-ID: <e41bf6d6-810a-455d-81cd-9104d205524e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775314270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYHRYlnSBx4/kcPH5WdquDIpIV1olp37fUOVSMfoMPc=;
	b=W+J7XWySSqmygWJf3mqeQ0lO9keWCTazufEKjj1smyHIzkUNPVqMqx19P1YqE7EtaGR2U3
	4B5RGYNQm0RYp7DwqZlDFQ+i9w55qKyzkxcQjmTp/CUGTshfbYVsSyTUdtnDdO9hc3IHa0
	gEHx2amdjNeT4gmNXutVJFddzAGAq8U=
Date: Sat, 4 Apr 2026 15:50:59 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Please add rust-i2c-next and rust-i2c-fixes to linux-next
To: Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org
References: <02908210-0ed5-42a7-b725-8bf70f936828@linux.dev>
 <20260329105919.73dea963@canb.auug.org.au>
 <b239bb2f-15d3-4d30-9b3b-8008864d8d62@sirena.org.uk>
 <ec1752c1-a170-4473-9ecf-d6d93b31dcd6@sirena.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
In-Reply-To: <ec1752c1-a170-4473-9ecf-d6d93b31dcd6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hello Mark

On 3/30/2026 2:12 PM, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 12:27:55PM +0100, Mark Brown wrote:
>> On Sun, Mar 29, 2026 at 10:59:19AM +1100, Stephen Rothwell wrote:
>>
>>>> Please add the following tree to linux-next:
>>>> Tree: https://github.com/ikrtn/rust-for-linux
>>>> - Branch: rust-i2c-next
>>>> - Branch: rust-i2c-fixes
>>
>>> Mark Brown (cc'd) now maintains the linux-next tree.
>>
>> All being well these should be included from today.
> 
> BTW I note that both trees have the same content and that looks like
> -next material, I would expect the -fixes branch to be based on Linus'
> tree and only contain bug fixes.

Both branches currently have identical content because they are newly
created.
If the -fixes branch is expected to be based on Linus’s tree and contain
only bug fixes, I can rebase it accordingly. Please confirm the preferred
base branch.
Thanks
Igor



