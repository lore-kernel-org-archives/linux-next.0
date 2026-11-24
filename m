Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551513;
	b=eNqUiDQHmwb52AUdBYU5/1xNiLSNgiYr4BDamo5iIaQ9P/VM8ECvGWw8PZ2wOez8UAIj
	 bCoOJAQ3MFdrSebD2ZngGh6wVsDoN9cGt9PQteLI+wGkZXsSWPp1AqfYJBZ2Tj586PcRW
	 G56JurlfuHVz5ZdWJI+hWy4uTq1beYIuRwYMLaK1c9SHvUBMK0bgVuVjof3xq5ciklRdl
	 GSLcEGu8LFyyBvMHTCQ/AOwrGXxjm1FkuVhqhOrfrUkzIGw7Y5ypw2HeH3TtoagWJvpeD
	 L18kF7n03ROInOIkG4nCSBAiqAf79kxjCYVByy61FJnrxJPjOhZc8/VNMsj26YyY0vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551513;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=4puQvfklgbgZN8wo3WRm6SzX7yDftXFTvRpNjUqCEMk=;
	b=je8mQY8vn/FUIuz/XaT0wvYrBSssfXumIfn2c/XUWqx8VCQ4cIX/VFX5WHL9YAxWxetW
	 D+/M3kpzaVdsCOugIfBw1vicQv+cbVzC9NorTZjaHp/yzpaQiJq41DgKcI636i6O8iMC+
	 b9vykfDHI3YVo1JdyoYva0EEqnY0kZfr6FWQrhHd9j5Xx5Dm8JAoolSCjR/Purk6CM9LS
	 /neiHSDJeVT5fyvnJlpqUXxrm1hDhet30UaYxFgGFlq+9xeMv50AdPPea5sTFi0Zr7LAZ
	 tyAFOQ7yfFl07RmYFO7c3tLiZu338Y/+OkJRAUitOa+Ctn1dE6UPMT1NTPutMXNa6XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=u5Bg2Jp4;
	arc=none smtp.remote-ip=195.10.208.47
Received: from mout-b-107.mailbox.org (mout-b-107.mailbox.org [195.10.208.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFB5606A32A;
	Tue, 24 Nov 2026 20:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FFB5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=u5Bg2Jp4
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-107.mailbox.org (Postfix) with ESMTPS id 4jYvJg2lD9z3ySt;
	Tue, 24 Nov 2026 21:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795551507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4puQvfklgbgZN8wo3WRm6SzX7yDftXFTvRpNjUqCEMk=;
	b=u5Bg2Jp4KrgVJtIxR/vBm8BPjV+r64hSI4DI8oyKcMt8WYCDmjdIaoyWWTllbvRRQiPBj5
	hjqnwdUqcvohM2cmAc3x5KS3ckZn2yHMsGbn8ddmFthivZzuATHwG7i9x4x846wsx3aJzk
	qt6gxJhmbMs2e/bhJx7A1A9oRKWdJS6BWDDVkEf7DLdOo3GqFbIYxNrIala/xz81YcaQEg
	8YlRXPTWGzV3w1GJV+bUH7lDyaI40zIZ9ajREo/82sAi5avLPL9Rn7o9QnXx+7IN4V4aiO
	/3l7GhgHcJGR6oLlQSbOVdWoqznWzn9/wdZHPzuncwR7e5WHJsLSRNwC+uVQwQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of antonio@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=antonio@mandelbit.com
Message-ID: <6dfdda89-8fb4-4a5e-992c-c59aae18f37c@mandelbit.com>
Date: Tue, 24 Nov 2026 21:18:24 +0100
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: semantic conflict between the net and net-next trees
To: Sasha Levin <sashal@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Willem de Bruijn <willemb@google.com>, Jason Wang <jasowangio@gmail.com>,
 netdev@vger.kernel.org, Linux Next Mailing List
 <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20261124145649.3656145-1-sashal@kernel.org>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Organization: Mandelbit SRL
In-Reply-To: <20261124145649.3656145-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4jYvJg2lD9z3ySt

Hi Sasha,

On 24/11/2026 15:56, Sasha Levin wrote:
> Hi Mark,
> 
> The current net tree has a semantic conflict with the net-next tree
> that breaks the build:
> 
>    drivers/net/tun.c:1881:11: error: no member named 'ops' in 'struct ubuf_info'
> 
> 3896ae4adf5f ("tun: complete the zerocopy buffer of packets consumed by
> XDP") in the net tree calls uarg->ops->complete() in tun_get_user(), and
> ecca9bb2c855 ("net: skbuff: replace ubuf_info ops ptr with type id") in
> the net-next tree removes ubuf_info::ops. The fix uses
> net_zcopy_complete(), as ecca9bb2c855 does for the same call later in
> tun_get_user():
> 
> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -1875,11 +1875,8 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
>   			goto drop;
>   		if (!skb) {
>   			/* consumed by XDP, after copying */
> -			if (msg_control) {
> -				struct ubuf_info *uarg = msg_control;
> -
> -				uarg->ops->complete(NULL, uarg, false);
> -			}
> +			if (msg_control)
> +				net_zcopy_complete(NULL, msg_control, false);
>   			return total_len;


The resolution looks good to me and it's the one I noted below the ---
of my patch to net.
I build-tested net-next's tun.c with the fix and this resolution.

Thanks,


-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com

