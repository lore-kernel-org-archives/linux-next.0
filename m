Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AE3CA4E
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775829106; cv=none; b=uVpUlWyNMJ/bIhQqxUDjXfLTY8f5bQqvSPLVH25tz7QM6BXn2iO5RB2/HEkRZp3jlhNhfwNfKMV1yezdQyhDxyxQ5VNiZlFWOwehY0dbJQnedinq9emcXgN7N+vO9Y//pmo5mG2Cz5u46iFDoOBb4CAvvOlqW5O0o3uHkAcDG+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775829106; c=relaxed/simple;
	bh=ACcZO3EePU25KWacwKzJQOi5PV9lda2Bq7XkrPXiH/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMLcCdAGU8UC3o93Iyph0UWZiXqR6oJluQJUoO7rtKhem6YwgD7Opgpgn2Pw2PyxLu6M06JkRiQxwh2UfoooxHZD+I6IvS7q6C8smb5TbghAjRwxkG49fW8a5tKRFBvgFBR/G2D093Hk5U/BXS2KorHDCTbGoyblYlPmCDU5iEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwRUpyb4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwRUpyb4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488afb0427eso26513535e9.1
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775829103; x=1776433903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HMPOMsQwc1kO6kdJkjDFsoD/CGVs5/MmxImAa5JhXE=;
        b=LwRUpyb4YenmYlWAm+BGdopg0oh8iFm27jMH6OSkCMAHg8NQ1bkdyPKMlyi+GDZTdQ
         HQYltLaSbjCIJFFwVbSMvlc7X2Xf4Lglb6bsjM0GlMM9bu+veJnOMi4AP+FHHEd7Gawn
         D35YFj+tmpZU3veqLkbNGJ/o7sDV+gb3d7SrI+CLX8le8CjGXUH9+EhqU2VmCckN/zCh
         cHyBzdSwQh+cxT0+pt5NZqXXKe7xgG/ZphLhL+kRVTv+rTlRaRzIgEVelsk8BZ6Era+L
         MVgJ9uYWgTgDweR83xTor2ibvFhd+8geIINk7Q++/m8oqkifEFnnIdmT9DnIpw/I3Hxs
         sGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775829103; x=1776433903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2HMPOMsQwc1kO6kdJkjDFsoD/CGVs5/MmxImAa5JhXE=;
        b=Hl44ET4TFFlvLAZ3NrCYywRadaii3njtNUOjk+lbnCD+dczZBpWrbS+X1+ZiXu8HOj
         H3DAlMTSef1iEHqlc2uhl8+T8xFNxxGgP4DXxe19bbdk2WbE2HT7cGEy0EM/5PBVoPD0
         UfrQkydkzpVOxzIKyzy7Wzp+ZOaD9LEZDFfFZIxW06qA93v6YSBK7WHENP+g1f9DIxiB
         OwSjd09yfSBw1zSuTgma+lqpnrBLFRFHXXGnn4KuDyOqD9fN2h1gvx1PgEi8BHrXX9wm
         eD6ekA516kr1/gBPKGeV/FlSZA8kcsecWmgZEqn4dYWQbbM8NLMT5OmuefUrD99/MuWm
         /peA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ3xNI1a6pPK5UTKvL7dAjwHfkwJC3c+pebL7r0GuN3LtTSDI032Zz4CSCI8wjK0iGH5VhuAIlrok1@vger.kernel.org
X-Gm-Message-State: AOJu0YyJmaKYXT1Z12VGjxVjNx2lLXM20vopeia6coweYoQW8v9Uak2N
	Y9P6PNx6NecSlOXZzWM4XZ5emfGcXvS4PoaiVxdh7sNPtv2zCGN5euhMhz4kmA==
X-Gm-Gg: AeBDieuWo3rsVHeFPItMhrtuIzlAvVVsJkKWzfwXOcyUGiDAYkRi/zrJ+UxntyFM9ou
	Kn3Ia5B109Iq8YciUBj0auPAyL3OZOIt8AXACAt4Qisi2kGRhgDgR2dloDt3+uwKbHaFj2OZSSi
	dthfsQVKlptiSpV4tuknwTCn3hw0d3PNG+js7qKjDBIrLBWZornASW6YJRY7PVMHNOTOEyz3B35
	s87VoimeLTTlSthr1Ws/ebpG9m2Tb5+gm2Y2YoYncIIHg5drQ8z5xxIYUkAolTjAVQc07dWeE3k
	s1IYA+/UeRz8bLc8dq3O2xV5bwQth+tdAOeZCCx5YBxv78UQmIHuqMo/fBGF3gBUD77hugfhAFB
	so1sLFxad2Y9mm2beiMmJRvQqmUz4TTloxg7wh2CsXXb6BERKzGpnsB2RmM6Xo9tZ1xOjiIXmo6
	F//iRTeqJtQ738uplqkh5XuCx7pmgB51dboelWmx6u8pdeMVDfY+6Ud0u2KQz2qV31niiv8XI8k
	Xj+YZ7nVVsT6myGDTqDN3bQuP6/ghW5Uh/Q5+7s0qRbtucd+hZLZ9fnNWvU3Ym4xZ2uFbEP75zG
	0jDnZLAPf2WX
X-Received: by 2002:a05:600c:c088:b0:487:338:b4f3 with SMTP id 5b1f17b1804b1-488d68431a9mr30002735e9.17.1775829103376;
        Fri, 10 Apr 2026 06:51:43 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58bb830sm74666285e9.7.2026.04.10.06.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 06:51:42 -0700 (PDT)
Message-ID: <cf8d351d-31f5-43aa-bf42-3e8c15650d78@gmail.com>
Date: Fri, 10 Apr 2026 14:51:58 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with the net-next tree
To: Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: Daniel Borkmann <daniel@iogearbox.net>, David Wei <dw@davidwei.uk>,
 Jakub Kicinski <kuba@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <adjrToW4h60zwxVG@sirena.co.uk>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <adjrToW4h60zwxVG@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/26 13:21, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>    io_uring/zcrx.c
> 
> between commit:
> 
>    222b5566a02dbf ("net: Proxy netdev_queue_get_dma_dev for leased queues")

It's the first time I see this commit, but the resolution looks
correct, thanks

> from the net-next tree and commit:
> 
>    06fc3b6d388dfa ("io_uring/zcrx: extract netdev+area init into a helper")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
...

-- 
Pavel Begunkov

