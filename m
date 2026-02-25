Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBEF225390
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772023584; cv=none; b=eG94isMSatjsErN1L5+oWCPZNrGuOP7f7/5KTFuJ+rwso+hacJM4dVxziBXAoy2Y7F3szxb6sFDPzfznvTv5vyLHvDPlxIhvZNbOVzMLO/fuLvI1wDgW3Y+TXd86yzu+nlu8f6bscr/TvXXY34k8W0sG8W3kLEN2SsRUgBUx11E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772023584; c=relaxed/simple;
	bh=yoP33XFHjj9ErbXdhVYajM7vuXNNvjeT/NEI814iX6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fo+2Hed4IIKkvC2L2s7Ozkk0JhVBF77PdRMLcPoG49CSUYmwv+6VS2aBcr8yBhWqfX/JXIvozlMBvp82oN4VcdsLVrhCJ1f2Jmn7gMMK4A+esko1xFBTs87YN5eEQd1mG7Asf7yWKMtnZAFM+SLxZPDpx4hCyHz5mcAx6PlWat4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKkt0Kou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKkt0Kou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504FBC116D0;
	Wed, 25 Feb 2026 12:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772023584;
	bh=yoP33XFHjj9ErbXdhVYajM7vuXNNvjeT/NEI814iX6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OKkt0KouzU8ZF343NC7I0F3CPSXqmBiP3qZf6sJnL+mQOvLTiDjQ8KHSVTgU1wzJP
	 zavVWZ7a2iTFdJJ+zUH5d81qJVxEMo05ufP+GdFIbXxq08vLlol56lZczpnKi5XG3o
	 klKjkJ9qDFp5IMIENdzgaK4JhsReOZ+Q3aoBsV8ld5IuWn0ZVh9lUvVg2tOsL06wCa
	 w1L6qgLMEI9+wCtvxeTYPSmdaBtwAqj/bfKzazJoR6vMcUnehW5tHVSBUnGyxtCPxD
	 wqtznHVgmL3pkm5MTFC59Bgnuvze7pko4XL+QFTg8wLz2bOIPFmn3LDaST80aR1x+/
	 C7QTAwjE6D/6Q==
Message-ID: <dc81bd41-3957-486a-8a8b-272798e49341@kernel.org>
Date: Wed, 25 Feb 2026 06:46:23 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Include Altera's SoCFPGA tree
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <537c455e-36bb-4f80-a910-10a58247a67d@kernel.org>
 <42b96da6-ffb3-4fd9-8821-9093a323507c@sirena.org.uk>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <42b96da6-ffb3-4fd9-8821-9093a323507c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/25/26 06:37, Mark Brown wrote:
> On Tue, Feb 24, 2026 at 10:25:58PM -0600, Dinh Nguyen wrote:
>> Hi linux-next maintainers,
>>
>> Could you please add the SoCFPGA tree to linux-next? The branch contains
>> patches intended for the next merge window for the SoCFPGA subsystem.
>>
>>
>> Git Repo: https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git
>>
>> Branch: for-next
> 
> I've added this, all being well it will appear in today's next.
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window.
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>       * submitted under GPL v2 (or later) and include the Contributor's
>          Signed-off-by,
>       * posted to the relevant mailing list,
>       * reviewed by you (or another maintainer of your subsystem tree),
>       * successfully unit tested, and
>       * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

Thank you so much!

Dinh
