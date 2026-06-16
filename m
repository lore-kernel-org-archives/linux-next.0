Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFABC351C17
	for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618696; cv=none; b=AJeI8kSeakviFv21XK5w4sfZlB9um5ctPkC5z9MM2hMjgidxpjHvAqV7M0feI2K8VAKb756z92jkGo+Ynrw4iojee+4pIQrDU7Tb06IxYzMTGzRwz6j2PJmHWn1pd0G0DJf5eNX3vooxS/WeR27nE6C/lf1oxoxGr2QgzvL4eLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618696; c=relaxed/simple;
	bh=378kAbgeCnIbzZ/wqhDIqSSmOdHgI2On5iClxbt7uIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBYCqqgBqbMltsrGkiMi9CfAZxF6O+CDDChxoHA7ayzOELKTNT36Kwoyq6/9lphHscLBgvVkljwjvJqQFxOlznzo2G9SDPR9pjkZkPeWY67tAzseppVOntwBx1gPxfElnXRr5rdcoutZxuifozNTUOYdjCXbnXdyw7/dHusPvNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=o0/DnJFO; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="o0/DnJFO"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-43cce7db292so3404928fac.2
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1781618692; x=1782223492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ewgAz/3P5lAWARWYdlL7x3t/u9xX4eostMbpnjsAEo=;
        b=o0/DnJFOwoiaBPb0gruQVfztmbYJ2sGWbY/MkX9TieS08sWx/L/FZNZT6ycEo2MrF4
         AbtlTsAuIEf/Dgox+MLwvGM45pLXQrznkbqLYQScBx5xEuWOKfuLw3ae7hJIAAczGSGM
         vPckSzXmRPFbw4pkJaPaSCqcTdfAXUyFPDZLkyWAXMTzzpsfi2/Jb8Hurid00gEADDdn
         MDrJXoI9WmadPDRWs8Dgr6mO2UTfXJ0agbsTd+y0I00tDUOnRe7v8PtR4KzRgyGSgo9g
         09lgH5yaMH5Lt9K2JtJB58KchvwuJCCn3xzDCsY+3AIcmai0pcQ3k26N50Eaa9Jw6RBV
         4c5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618692; x=1782223492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ewgAz/3P5lAWARWYdlL7x3t/u9xX4eostMbpnjsAEo=;
        b=IbegcXBkZLHpBqa5BTmv7fYTdLitqu7IfrMzcvOiX46eEQ9tD2gLHXx72SDOPOph4p
         VQqqsN92YL+RyoqlOCnEyeddCg8SkUMwuSaYZby2GqXkYY6J6S/93edKUiuftPNwU/ko
         OFzVT51Fbh1qGKsVxhzg13++2ZUIUDXhJH08+lTVQcOp6rvHvV6cIGYDitIs8v+ua3cw
         vUE/ShHMvJjcfZ5b04GDFUxAtnBfjlkpsdG1aIgs5DynU7Tmj1DQJwTVWKnKFBNiCChd
         PRnqbuquk88pNtntPpT+SEQwoODXR+FXClDDo8Co0Cljwq9bZ/PEgHJwFFyiRag5rSaL
         iPEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zuhv8+P9VkEz7L9bzJA3WqhLzrYQ4+nSe8JQTiVHu3eY21CZqrrfPZ5XSGh4LywNrA/13vp2RT3az@vger.kernel.org
X-Gm-Message-State: AOJu0YxP46VDJgCaj8XNICOrS8D9GMD8lM71NPXCw0xggdiSBdrs9LCP
	hxn/tBP/cJKHelf+oPNy+NFsLylXBAtLpyOx9HCxf2qxKi8frgVqZe33TKevSZpCfZ8=
X-Gm-Gg: Acq92OHPTOfhKeBId5k8J8mXujgy3r7HVbQHyAlR0rMi7W+rWAJr7iLsMJbkQ8tc/sx
	y1Gp7TwAd60UdxqRm8f8qfZ2mQ4qEHsQmdizlYDj0G0FB5LraBJy68wA3HufAEfiDeaNwPpnfGE
	0lgFf+vZF9wogX2FVpiforlnY6kShIHpNw8uJjnep+zyb8JzEkIbqQKoiwT48gFtQ7K8h2L8b+t
	zJ/8e0R5JvZweO+JBE2aSyocBp4uakk3TpDGWvbr3ruwVKkLPB1pEh9pTO6wB1QKyn2Wgdev5iB
	8+o1ZcT9t+lyxk/OIalfTyPU5esRxBUyHA8hJ9mcWTJEBaE4R2qoNfX5ixGb58eTLK6gscIzaYw
	SYt4DUj4FmSdu0oj7IVTC15tm+MvpTgzwOt1GpqS8wRI6T3ME4SNa0ngj7L0xIs8+H7twHbpbd3
	tty1I9BDqkgktocOx+DbPUK4LyBfzOEOZtxPR7YcH2464lzQTZZVgT7CQQ+UJ7stngIxESR2oBp
	AXcNMScwen5UmDA2KAK
X-Received: by 2002:a05:6871:7c05:b0:442:ae3f:f22 with SMTP id 586e51a60fabf-4430b67f960mr2983986fac.23.1781618692574;
        Tue, 16 Jun 2026 07:04:52 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44308fd68d9sm2272443fac.14.2026.06.16.07.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:04:51 -0700 (PDT)
Message-ID: <d968a9de-df62-4120-bc95-21483a15785a@kernel.dk>
Date: Tue, 16 Jun 2026 08:04:50 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ajFXBeLQC96YuC0p@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ajFXBeLQC96YuC0p@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/26 8:00 AM, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   io_uring/net.c
> 
> between commit:
> 
>   9b40ba14edcdf ("Merge tag 'for-7.2/io_uring-20260615' of git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux")
> 
> from the origin tree and commit:
> 
>   c59e546eda5aa ("Merge branch 'for-7.2/io_uring' into for-next")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I updated my for-next a few hours ago, I think you're using an older
one. Regardless, it's fine.

-- 
Jens Axboe

