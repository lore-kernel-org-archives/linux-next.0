Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D961248F72
	for <linux-next@vger.kernel.org>; Tue,  4 Aug 2026 01:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785808218; cv=none; b=sz2tck2bDAssffw3rsrcBGedOVLtSZY4g9dRkZs0zc/qW1lTFbGlZcBCNL/G7FRru3+Hpw8gdsrnh8bcXyF7Xz2eUuQ92ye5F9z/xRxr+bJz9scvlkdPODqCTjjkMV7u48pAGAjxcW8ciOHHNP9xdSiMu8Ro+KDg2Gii0hngaZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785808218; c=relaxed/simple;
	bh=aGWjf2rIwE2Pw0W1u0oFXrU2Xi7aiFFUU+puUWkUP2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrbkFIXdtGKt30imNWnw7WYVKN+a8K1StYr8yhernuu16fjW0fSFJzS7cQcCeGhxE7dpKX5vAh0E0vIcQUgz4vdvajliqtC4VPvb6KRYpjrmUDyJagdFZFcRF7P01nqpA92tqHaUODH46jUi0jzSSlG7gvzjYQo1pkaChDr+j18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=nR03o5YT; arc=none smtp.client-ip=74.125.231.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="nR03o5YT"
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-7eb36c2f2b9so589728a34.0
        for <linux-next@vger.kernel.org>; Mon, 03 Aug 2026 18:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785808214; x=1786413014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZtSjLe66WDshK1l19eq87lIGIzPEtGn0kgmfaVgorI=;
        b=nR03o5YTLQNkrKhZZTZrD4A/oOxRvhxalnwmyE9XQBHyezpjluH2QSM0P8ZpGWFatq
         MKENz2kd1gqj75UkgTEH44a9NYvaKl3puaT0avVa890YJSK8+xFNOchNidomi1k4kavO
         u8NXyjXhMSV/xYjwD7Zv8oCksbVCqUbbXyxswZL4lkrolx0ob31QqahWEMRi0ubMc6/+
         7z0Ucd8/BMK83aDJo5ybi1qR3212dZhgApmK0RdWDXfpedShzXORli8X/SLWrot9xgzV
         MTgYA1nYLPY0E9ZTbdLWKLhp6C84fXuQvjBu//CbDRqMQpbzlTd9lRkKQboq+2dLYICL
         6b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785808214; x=1786413014;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZtSjLe66WDshK1l19eq87lIGIzPEtGn0kgmfaVgorI=;
        b=Vwa7UT44GpOZ+Bc2WA+hPyv5X2zxOvyO+nEKwBFoBSkwWmCX0cDEC+BhWQl/BJCk4m
         rt17pveEpoWuf7Kt8ErnZLzvJH+JESor2rFWnvBIwviZ/TYeiJHJSPV4VpAhhmP2Pb4R
         Zoy3JI7iHwr5MRGrDaOX7qEnOT5PC1nr0/Sz/V91AZkIrsSP8ruSed098x9+hq/ITAgN
         lPxARM6EdMkVPRT8HpbW8RWtVzY137nUhQXCwo8P2BsJr0lAUOPFQK7M9HBN5m6pi+gP
         UZRtfTJdS3bJuqflTM1VnLpGExrStqcerHis3xWsF9PMx0gwL01JkUuBK3mYTgkZaZhM
         U13Q==
X-Forwarded-Encrypted: i=1; AHgh+RpNCXKCZKhCdk8s5onOHW32yPseEHivMonUFP76yTIY6lVD6s+KOg2cZwmym6wmkYtcMHLClwuFLVJ1@vger.kernel.org
X-Gm-Message-State: AOJu0YznKoEROMEGoqHFyOKVFOmatjZ5cJ294EWdveK5W8YFUOKlHR0v
	nZqbq/jgc1r5YCL9Qw9Qesrl206aqIcT1IxEh5V76nT+pnLllnHaTRvm4nu5foys2/k=
X-Gm-Gg: AR+sD11B/UYCWNo6OHgwU+TtV1s3R0x2rnxMlPjRijzgYNvuyPFn/2rc/oWoCTrBHE6
	hUQafJxyDYDcae/N5oeIHURBrw2J2NSEpf82NKhuNpM1IwSI6gwNU78Zx5H8Zthdi0wdo+3tfqn
	qOYePvzzbYCJ4lR67Sa045SRY+GFIlSj2PgwIj5mPvOeo5d8SqdESRJkc6fQSv/8sFwMX6bhiu1
	KdvEO4z4afuGo7S09punx3ymhQHko417hAo1u/WkvFEMvuq6sxKp2dtY5ktAtjRlZst3f0Tg8Bi
	07HSslRwWcrFKT4EjDb4NBPyt/eI3MG83IhL9RsLPp+pEESKumERiBD/TIWhKVmL6cnD0D8U/DE
	zWSkDP3G3NG6Ms7Nct2G0XVg/dzwXbUrIzXGUWK+bsgubMGNEw7cxdT0pU8KWuxtKa5GZoODzbA
	yEDMB5jKqaCCAa2rvtSweuyIMGhFKI+hdvmawNVsPxsum/+VFnryokn3zTZCJQ1Ecbr1g5ROX3S
	4cypOMms1psmHa98kiTFklHcbe4S/jRWhHgRZin+ghVaGs=
X-Received: by 2002:a05:6820:4b90:b0:6ae:85c5:cccd with SMTP id 006d021491bc7-6ae85c5d2f5mr1868636eaf.4.1785808213774;
        Mon, 03 Aug 2026 18:50:13 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f67655fesm9958161fac.18.2026.08.03.18.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 18:50:12 -0700 (PDT)
Message-ID: <b4447407-341e-485a-aa08-9decf9173c64@kernel.dk>
Date: Mon, 3 Aug 2026 19:50:11 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Fengnan Chang <changfengnan@bytedance.com>
Cc: Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <anDHU9Wc-EGV1KYL@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <anDHU9Wc-EGV1KYL@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/3/26 10:52 AM, Mark Brown wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build
> (arm64 allnoconfig) failed like this:
> 
> /tmp/next/build/fs/iomap/direct-io.c: In function '__iomap_dio_read_simple':
> /tmp/next/build/fs/iomap/direct-io.c:1037:15: error: too few arguments to function 'bio_iov_iter_get_pages'
>  1037 |         ret = bio_iov_iter_get_pages(bio, iter, alignment - 1);
>       |               ^~~~~~~~~~~~~~~~~~~~~~
> In file included from /tmp/next/build/include/linux/bio-integrity.h:5,
>                  from /tmp/next/build/fs/iomap/direct-io.c:6:
> /tmp/next/build/include/linux/bio.h:524:5: note: declared here
>   524 | int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> 
> caused by a sematic conflict between
> 
>   14b007e178811 (block: validate user space vectors during extraction)
> 
> from the block tree and
> 
>   36f199c8d0ee4 (iomap: add simple dio path for small direct I/O)
> 
> from the vfs-brauner tree.  I have applied the fixup patch below and can
> carry as needed, you should ensure you flag this to Linus when sending
> PRs:
> 
> From 5bf17d9828d05688ad4fd04cc07b64642d4ba295 Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@kernel.org>
> Date: Mon, 3 Aug 2026 15:53:13 +0100
> Subject: [PATCH] fs: Fix up semantic conflict with bio_iov_iter_get_pages
> 
> /tmp/next/build/fs/iomap/direct-io.c: In function '__iomap_dio_read_simple':
> /tmp/next/build/fs/iomap/direct-io.c:1037:15: error: too few arguments to function 'bio_iov_iter_get_pages'
>  1037 |         ret = bio_iov_iter_get_pages(bio, iter, alignment - 1);
>       |               ^~~~~~~~~~~~~~~~~~~~~~
> In file included from /tmp/next/build/include/linux/bio-integrity.h:5,
>                  from /tmp/next/build/fs/iomap/direct-io.c:6:
> /tmp/next/build/include/linux/bio.h:524:5: note: declared here
>   524 | int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  fs/iomap/direct-io.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 2b3e916dedc77..2aa71be36c996 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -1034,7 +1034,8 @@ ssize_t __iomap_dio_read_simple(struct kiocb *iocb, struct iov_iter *iter,
>  	bio->bi_iter.bi_sector = iomap_sector(&iomi->iomap, iomi->pos);
>  	bio->bi_ioprio = iocb->ki_ioprio;
>  
> -	ret = bio_iov_iter_get_pages(bio, iter, alignment - 1);
> +	ret = bio_iov_iter_get_pages(bio, iter, bdev_dma_alignment(bio->bi_bdev),
> +				     alignment - 1);
>  	if (unlikely(ret))
>  		goto out_bio_put;

Looks good to me, thanks Mark.

-- 
Jens Axboe

