Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9DF47DD50
	for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071206; cv=none; b=auI7AXqjq4SRqP5uhSu4xA7vq4JEIVpO8LxigmAe0NyyzwJAE5AmAQc2f8z1kzIVS5yLTiffaHzu08ToAl7mJXhubJMUl0d7cmfnzH/1Mq+Str/OTzJQEpNA4g1PdOhgaaGCPihJ0fFOj3PCp+da47KKQWnHO82hf0t4VwYmvcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071206; c=relaxed/simple;
	bh=LxXM6f8LvRMRdaBDCJgDddGoTAOWqIikLb7ZtyoSRlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ay6HaqFBrpFF1JrJHSZsUoBB7zsmp0rMbx6ZzCglgzX75Ikpy4a31Ve+X+Ik/Q51dBCv5UkePtHei529e6o51UjSVQuhWkzUHNhQ8roq20VSBVZv+oSRwSmMSvZGxOiT9mUZl9Gu2CB3SzIQXjb7huX1nMRm7MGhkqionOQWgKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rq3Mtxxm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=s4RZnbO+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rq3Mtxxm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="s4RZnbO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787071204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2qGVQoiDTEX6X4G/Zfh7d+QhMF+J7FSivQNa20/i5U8=;
	b=Rq3Mtxxm6sjoc53ZG1Tyr1lxjWaHXqxEP71z6Y/gKp+M+AH9Jm6mvG+FtJhAbtmg6cjyrq
	4bZOYidyvHcDNSyoFokTuDzZ50RwjjBu32KPo/OMXYGNwrJwwSu72q0gCzyi4/8zTdchcZ
	uAhR8Bh4tKnXEB8ncLEGiRnaoZOceQs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-XFiXsvSAOtukvlW9EcOTMg-1; Tue, 18 Aug 2026 12:40:01 -0400
X-MC-Unique: XFiXsvSAOtukvlW9EcOTMg-1
X-Mimecast-MFC-AGG-ID: XFiXsvSAOtukvlW9EcOTMg_1787071198
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4954dcd6131so328325e9.3
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2026 09:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787071197; x=1787675997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qGVQoiDTEX6X4G/Zfh7d+QhMF+J7FSivQNa20/i5U8=;
        b=s4RZnbO+vv0IoQsnW8fsrriq1Hn/W3XbPQiNee1GKNzJ6HCWFf/dozRyaidTLFInk2
         jMllps55Y0KsOBcaUapxRyOMgyxG+mjbmOxFGrvWXCWFxMVCC2ODvp3JlgqqdhKNORAU
         r1m8BX7hmWUOiI6T6RVWzjLw5AAr0cGOVEnPiZW8Dg3X3Oo5ZKWSr8DtFfp9ECNATvT3
         NO+Wx0olxUlomvFp+agrc+gjM0zCyE3B1WznZOihA6c52d+/9B9EBlhvPsbnGwhIXSQN
         0yMdhUo71g5ev1wONWxRyhp1I4bQRorBipLF/U3BJE1uru4M/rPjaLDtgn/ufxkb40gf
         Nlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787071197; x=1787675997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qGVQoiDTEX6X4G/Zfh7d+QhMF+J7FSivQNa20/i5U8=;
        b=Jh16nfbGtX2qqFAwGlyCtvrff4bObDhXifVwOW4lXny+7aEciu0OrNFCvKdLlpktDj
         I17sdDILAR/f6KevvG7di5FOkLtMsXn1hudCRk9FJr+0S7jIX8XpYMaY4yEMm7YbtYtr
         tDosm+C89ZZRxp5RucYzGxR1lVwGDp/5zubhKNASwxCgTtnFoBJqRpL54plqzzu1tHpD
         pgVcGfAhC6IqiJr4qLqHLH/4SSlntUS3yMtgYZMk8p4+2nGTdCslcSqNRCkFXcQxAkmo
         1TBdtKrgShHi1F4KQeUgLn2o66hyRL489ymRn7OGzE/6mChtRD5AX1Z6/fg8DuZ70RUv
         vnxg==
X-Forwarded-Encrypted: i=1; AHgh+RpjZuR4DTRmUw1lVdPfeoKPsr0BvpFgZ//AWLaJ438hVMlItPmaCXbeUVsryzbabc+ncGDMZXVZPK3f@vger.kernel.org
X-Gm-Message-State: AOJu0YxsNDnvCcgU7dZMNwg3Z7Ff8sFdzK/y8s3NVY6LXExoh5OIQ1hV
	Ib4HNCaBcPxu+N5I5D+drKnJH5GixJV9Xl1LObmvOiQUdZyDyUCJqHJ3QWUkiQKE9opL/ywikLz
	NH/PSLFCDv17ME9jIk2jKeDbiupEjRe9SgQENjhf/RH5SibBhC/IlQHJlSJlm450=
X-Gm-Gg: AR+sD10Cd/1vEq6nQapl3ZCNEF1s8zAwg/JRlhvHoBDwxSIZKjBP8MAcsagi9iOEVpf
	1Q3yfuDcUdan23UJrRt4L/aCJSs064EaJBR7vMtAc7asUfGMo+Zx06q2fgzZt3qumZFE5TiDbhU
	FckkB/NPEjAZe79dEU483WxalNh0PrePwsoshe0xd3G9CYbLG+7pz8Rr0auFZ4vVHjWfZHP2ByV
	A+SwJf51VL/uTbE+jrM0v9cqTB89yz9it1m9Kaxd52S8OF3q2H7Udg7PFbEctomOlNHULfAE61j
	lHgqZVs5ai3NUMuwkdDQuF315r4ReY/OYnD2AmUEY2CR0Fk3aVrsESvYG6kftzSh57Kyy1ljbw=
	=
X-Received: by 2002:a05:600c:3b8e:b0:499:a0f3:9d5c with SMTP id 5b1f17b1804b1-499a0f3a47bmr140515285e9.3.1787071197514;
        Tue, 18 Aug 2026 09:39:57 -0700 (PDT)
X-Received: by 2002:a05:600c:3b8e:b0:499:a0f3:9d5c with SMTP id 5b1f17b1804b1-499a0f3a47bmr140514605e9.3.1787071197097;
        Tue, 18 Aug 2026 09:39:57 -0700 (PDT)
Received: from [192.168.2.83] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d0fb85csm191570345e9.11.2026.08.18.09.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 09:39:55 -0700 (PDT)
Message-ID: <42813a1c-969e-4d7b-af4d-83fda6226e1e@redhat.com>
Date: Tue, 18 Aug 2026 18:39:53 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
To: Mark Brown <broonie@kernel.org>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Networking <netdev@vger.kernel.org>
Cc: Ivan Vecera <ivecera@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aoR9VmKllVGwmQn_@sirena.org.uk>
Content-Language: en-US
From: Petr Oros <poros@redhat.com>
In-Reply-To: <aoR9VmKllVGwmQn_@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/18/26 17:42, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>    drivers/dpll/dpll_core.c
>
> between commit:
>
>    33f016b23a219 ("dpll: fix NULL deref in dpll_device_ops() during teardown race")
>
> from the net tree and commit:
>
>    b1d0c412088e3 ("dpll: add STATE_CONNECTED_OVERRIDE pin capability")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
Your resolution is correct, thanks for handling it.

Regards,

Petr

> diff --cc drivers/dpll/dpll_core.c
> index a320eeb829ad2,245f625f4b3b4..0000000000000
> --- a/drivers/dpll/dpll_core.c
> +++ b/drivers/dpll/dpll_core.c
> @@@ -882,7 -881,14 +882,11 @@@ dpll_pin_register(struct dpll_device *d
>    	if (WARN_ON(!ops) ||
>    	    WARN_ON(!ops->state_on_dpll_get) ||
>    	    WARN_ON(!ops->direction_get) ||
> - 	    WARN_ON(ops->supported_ffo && !ops->ffo_get))
>   -	    WARN_ON(ops->measured_freq_get &&
>   -		    (!dpll_device_ops(dpll)->freq_monitor_get ||
>   -		     !dpll_device_ops(dpll)->freq_monitor_set)) ||
> + 	    WARN_ON(ops->supported_ffo && !ops->ffo_get) ||
> + 	    WARN_ON((pin->prop.capabilities &
> + 		     DPLL_PIN_CAPABILITIES_STATE_CONNECTED_OVERRIDE) &&
> + 		    !(pin->prop.capabilities &
> + 		      DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE)))
>    		return -EINVAL;
>    
>    	mutex_lock(&dpll_lock);

