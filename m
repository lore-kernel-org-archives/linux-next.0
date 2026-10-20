Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500320;
	b=QxzoMAiguXoUYk6JKQaYVJu2VGWyddPD4iZAbgc9MFXVNSsxqEQ9nHLUWOAvlCkCD5lt
	 81T6F1IEoAfQIsK329qVdK+upzhItxrtUtpDAXEe0tXPiA9GQPgr7Os+kiRFbqCUyJyGA
	 QFQGzo2+p9BeZg7DwtFRHYuI3cHkVRp6M+jyIHUN4qWrrLZcuoaNpplEzKSLp78bh+z8U
	 9hzWWnA9AkJvd91L6YLLIo4XZwcBo3e2tnUgrU3WTv5+U+eHaRVXLv2PzQcsk1A1xibIr
	 mWVWTQuqu0y2Ygqx9KPWDGkfiWk7+Ki4olZl9muNFAhAer4YzE1V2BJaRE/99n2RPZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7bQGV8m9SsQfHL9PiSrFtM1am6ugdH42awCUmoZInsk=;
	b=GdNQf8LQAjI9yCX486b0S4Gtbl0YDyj0xuXjS311GkRMgZcOOH1rNGSuggWB3BYMKIS+
	 XjtLw+hbOM8Gf7ITp80YTRf/Sv38v2oU6/OKTLsjUW5g27WyUvS3VMVaKVmUKe1yWMV0R
	 NhiwmjjRunu7hPFy6nkZmYROu9KtrzoFnfEmkCw7OHh3yOxxXkpzlPoM5ChtPJ1THuiH2
	 lOtlIwxyT9KNtcbi7zj3+8dEiXviNLONZZiYTfkTP7AKDjtxCJa9DhoLbZs9dbZ090raL
	 Z2nE7yBr3gZ8FqPFtRpFoSUSLU8t6aOqk3WTUAY+M7NsPM2I65324RbPrWHw2k6+grQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=iPYiimNr;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D04A606A31C
	for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 12:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D04A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=iPYiimNr
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso6039837eec.0
        for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792500318; x=1793105118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bQGV8m9SsQfHL9PiSrFtM1am6ugdH42awCUmoZInsk=;
        b=iPYiimNrNKUnQFF6EfnBirVN5SyTwPwcokjyTTsZAxkHg7iXLU21aSOOZFBHDAP8u9
         3iYTvA4g7ng3KwYx/yFVBSv5C07YcYfo19cF+hbGw/NclQD2TRB8lVcN+HRr5EgHptvl
         4zUgletCd6fsOpHHiY6XtlyoiaJY1sgSabSdEpy6SB/nlD1y3t69+bA/A1H8lILbFOxx
         ogvQlDc3bDKwLxyyopPj1KELtVHfFhC0LcFgcRr0Ek/ED6FRf9v2zP5iRiBGu9UniKBP
         2IzDLDs2qbcmKErG7BMVpjwBYcYyPHF0IAq2F/t8dzSiDtHFoln+7MFmwfSulEUREOdb
         NTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500318; x=1793105118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bQGV8m9SsQfHL9PiSrFtM1am6ugdH42awCUmoZInsk=;
        b=LZZm1sNubi6qPAmt8+nalrqp/oshz1AI2ELMfLq6XJ+T7BfMwhFB63gHMsho2m+4YP
         ZAXOcF5cJpxV5AU1ihh21WECHsFOUYvSdujA9DhWvPmXvzHtjrAc/HMNsvyyn0ZhmhBr
         SK4+CVBdt+5z2EdbU30fvHLPsrDgOjU0NnT/tOjq23kkjTzg1lT5qlZCzQff1mnuI+mJ
         BzhVOJABbYzyOytXuUP0YwNTrGb3RBzRFbSZdtRRUVp+jAgIk0SzXuMvyvGl5c3cr/Vr
         1LvQNRIRTy+26C0A7Q8UPoBojepIPNhEB5t07tfoExEmCj/QSy6effvavDA3w1LEObgm
         f+SQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRXeHw1FR+C+UZTeYYjCRhbtyqyySLdYRD5v3sNrR5unsjFSXImskjk4sQigEUraDAKzEIC9MdApRU@vger.kernel.org
X-Gm-Message-State: AFq9FYLiPXULxp8Sp6DoXXpT5UWjQ5o2F0eCBfuyJ1+LwY16evGllvAS
	GmE+BtarO1/GwN1QKEO8ZhmoMhYCNu+/SZawfiyVD9kZjXIEL0YalOM4QCy15PvrwN4=
X-Gm-Gg: AYBFou0W6BQoDRomnQDy/ZnW0j3Y7Er8dPP3MJJefrBcCUaywhzBb89wz94QOADbizv
	GFrXPnefBnYuw1JX3FejHT1zHYavPJrAaL+K8TLriAiwmZM+an0b6mkvJCJjNO9TSKjB4ukHefX
	QDZpB7qllhK6pjXh/6wtxOCcC7sdxaBq5I+4L/ntkvZNVKKg/EvOVG1Ihu99gTJQjL1JayVi7MX
	AYYDmDDsxlbdVhEzlM23LO2DZcyb21CfRIqPp4WopOjmV2Cr9jvmw647ijrU9ttfbL1Br086+uI
	Io0e+MoVOciZbNoqmI77pq9tZteMgjCSu/h5HQnlNAxk3ew2fSb9J+c8bMFSSDxNaWupeWZzyF5
	5fy55MoW24v1UtlxYVPoN73ldX5zEBqSoD0GjoqUj5RZVxFqvQDA/4pQtePwEwo+mkdh8/YAS7R
	nvKHfWTnER7dIgYvFdTWZ0cYIIJogSiQCz9o5+ezN5oB10CjjeavGHDyUYS/zbDedYRxIQFzd+c
	SowBwJA/Vfgdv4Hza2nq+Cg5j41AZ6pEpl7qULnszf7DACxlsJlHLWrOf4=
X-Received: by 2002:a05:693c:638e:20b0:366:2893:7422 with SMTP id 5a478bee46e88-36628a2bad9mr2496843eec.22.1792500317990;
        Tue, 20 Oct 2026 05:45:17 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm40483258eec.14.2026.10.20.05.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:45:17 -0700 (PDT)
Message-ID: <553dc087-b5d4-4aa0-8e84-4de6eaa45847@kernel.dk>
Date: Tue, 20 Oct 2026 06:45:16 -0600
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
Subject: Re: linux-next: manual merge of the block tree with the mm tree
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Tal Zussman <tz2294@columbia.edu>,
 Vlastimil Babka <vbabka@kernel.org>
References: <atdeJ-91RQrqLke6@sirena.co.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <atdeJ-91RQrqLke6@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/26 6:27 AM, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   block/bio.c
> 
> between commit:
> 
>   d4ee6948bcabb ("block: restore the iterator when rejecting a misaligned bio")
> 
> from the mm tree and commit:
> 
>   73a0ff6030afc ("block: fail a short atomic pin in bio_iov_iter_get_pages()")
> 
> from the block tree.

I suspected as much when I saw Andrew pick it up. Andrew, perhaps
let's queue it where it belongs?

-- 
Jens Axboe

