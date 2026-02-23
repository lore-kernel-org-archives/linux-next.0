Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7EC36073E;
	Mon, 23 Feb 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771850786; cv=none; b=rO1R1trKv/ibdW5phYxbGtKkc5V7DULKab4i5O7Sqtj/+wdMDJ9j/NtnS1Vn4lBYPu87YPAwspK+7VeYj6V4Dvq45YYWvgvnxdk46z0ZOG3qKQBZnHd12iWm+iBQKW7+nJ/EwbPVIv/kUTFEO/Turo+LeqZexHI+KJWH5Uh3IQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771850786; c=relaxed/simple;
	bh=pI3XQWYcIJuq3tnndLuTIzmpaX+xphaJA4vftOmEn6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7nOfUiUIiUyjFfW3YOlQXjXHo3AU8CT+7dchh/cYH/arJ3CRTaKpzWFtcEo2XU+AhpFyp8FUqzWT/UN4BPBKkgCVbh9ReLBb49ZYF0MUKHsivPPy+AUj7f5olU5fkQYHqM0txiQz8LDL2lK8G94ypVgyTp4cBS2iqAnv6x7QFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 61NCk7Xo054711;
	Mon, 23 Feb 2026 21:46:07 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.10] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 61NCk75G054705
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 23 Feb 2026 21:46:07 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <12e21542-d402-460f-ab32-a6ecfbe1ee0b@I-love.SAKURA.ne.jp>
Date: Mon, 23 Feb 2026 21:46:07 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the tomoyo tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <aZxFe2cmZS2Eu7St@sirena.org.uk>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <aZxFe2cmZS2Eu7St@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav403.rs.sakura.ne.jp

On 2026/02/23 21:18, Mark Brown wrote:
> Commit
> 
>   af5c75cd122aa ("RDMA/core: Fix stale RoCE GIDs during netdev events at registration")
> 
> is missing a Signed-off-by from its committer

Thank you. Fixed now.

