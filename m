Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D47E3DB641
	for <linux-next@vger.kernel.org>; Mon, 14 Sep 2026 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393394; cv=none; b=UXyE3BNCwyrGGv7d7X5VmNx6RuZmZW4R5t5wZzxYKTItrI0plbny4Y8y7qf3jrUtrC3dfOhkVnEe0nie6/iMeDD4l+/7EFlg9QwdcVC4E2Yl0ZnvD7J56VGhC0ROEBYrtcVTAmbHvNGTBNpJgbJaJROYfxJupO+OCltDdvW6z8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393394; c=relaxed/simple;
	bh=1Fc0KyZHLk7ULyYS8SIQV3M35fMzcsUO/lWfP2TzYWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJMHn/H9y2TtPz+XuotabUgogKS9x+vveY9AxMPyhlVvMkrNjuh+BLdcK2dkBKrMduZ9Hve6r0zIEYxj1dygNjjLX8Dqj5MAvyQXDkfVQ+IUzervP7UkpOjhoNFWESnS8sKeWTSxMzPpTLsnhnn9qBcB3OV7DLP2yr+59CQttNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Po3m6xoh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Po3m6xoh"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-485850cbac3so1794676f8f.3
        for <linux-next@vger.kernel.org>; Mon, 14 Sep 2026 06:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789393389; x=1789998189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ONs8JfteApgzfSxnZlkhUCoBw9wJsvGngg+TCpNbLU=;
        b=Po3m6xohTvb/Y1G3DiBSTGXmfbEDYVivNLxOzCpeTtGqt0Mzhkre7PS2GsMyoDX20m
         FmdAWeCwoXKPL0QbypACWmHCuEOUgLrPs8UyCG5T70y3FjxrlAt3iYgRivgsGnaPAd5Z
         Bu9yT5oorRnbu06XlBTSwj7P0JQKCZNXzuS3/9ST6nlYMx4WNshawvhi/ipsrkLkedIi
         EP1Q8WT747/WGBUh9i7GGbclHbBllwP81a2oMavxag1IdylaTefFpPVCe082oaYoyRFd
         CdWRWHtjnI4DF0F149dtSp283kmsUpD5x2Xb5UEVSV0dYnaBCNkCtaTqDUYZdKfwaDLd
         ijTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393389; x=1789998189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ONs8JfteApgzfSxnZlkhUCoBw9wJsvGngg+TCpNbLU=;
        b=W1KS1E+jZkQdzFGZCfLQL9qXvjHfLs1J7TnDa0az/DM8Vq6qK9dOwsCnIlNAYUC+YP
         f99YDSwFrxBZYQ19V+iAsdWnouFlAAetfqZ121ISM/oYLBWkC8hsMrfJVquk24W/2OS9
         b8farGYE6vqrAXNeB5Sc56VOGvImetH6hgawoLw30agYPhsJIZuavdgZ3bBhzUl/1gQr
         Ycddz/XlWx+etSgLRHXrxDx5p1JfGseqy5w2lw1VBf6OPswFnVMyVvVgBqUjXs4Iic7s
         4qX3uHO/HtE5345yEy+1qWUHQDLEqxJEhb2ocsm/b94Gdq/+1Y0mFCF2wvbvbAk0Ga4b
         wwuA==
X-Forwarded-Encrypted: i=1; AKwUvByzm5Mepg534AzvPZ2u9xhVEW3DrbIDil+o9eqsX1ih3IJi+IQxfMVinOb6PkH51hmPhjbPFsTPpwVN@vger.kernel.org
X-Gm-Message-State: AFuF++nYjSnvO+q3jWabnW3vuTxkPe06+N6FtWp9jcagwU/WJ55qsbYg
	wimrbVhXAtTQybCANQFiB3TdqzsEoavVXek6vvg8squt2KDZfRx5NKE4KXuWNm6z2N0=
X-Gm-Gg: AYBFou2nmcPvlVh0C09VRZJ1ut/8BH4HiXrEAjrQciZ+BqAoxUX020gOA+VhUBif8k5
	IGheOz96tDXQHyXSZfX41R7xlR2dIqB/blNYWGKJMfniCp+MSS0A2QRA4ayqmUEDHd8v4G9yYMG
	dexRIhV971uXf6voQUml4mQ5goZBDMa6bCz50J7YMYgXGpSy1rC0mpaxIx/L4fgHIsKI4fSOvk9
	ro9hsLAP0zJ5tbjoYhkyPBylI4+scKIxWdfTO5nU2YB7JM2S1I8k6bC8uw32PV8rrECTiKOfolG
	azApIpscV4POheDgT6ZxTAgY7O1Yf0aHsBDwwwr6EPVOdCdruAaFmVbbQfeS6nijEIxnz1Jz19e
	0LRJdjF54mzDke/5HLto0RrEojqbccZ0Gm0sv+YuOlQDLG1IOCrB2okGeE2CMbnEDPd+uVvR9hp
	j/OYSAezuc/YJo09qDUYdYlh4rj6ZXeZDBZ+vSFX0uWJBKYOPHJA/jprDkme0zMYX9OqAqb+/qC
	79QdYPdFeIRidsZT4EEbjYCvxEWcSH95qTKfhUAXEbX8XN9UsffXtBHmWX6vv6Mq/Yi82aUsP8N
	ma4O2fyE2POid8VV1HceT5skA862EIKLPCIIcA==
X-Received: by 2002:a05:6000:460e:b0:487:4ba:97f1 with SMTP id ffacd0b85a97d-48704ba9a14mr431505f8f.7.1789393388928;
        Mon, 14 Sep 2026 06:43:08 -0700 (PDT)
Received: from [10.160.16.196] (150.red-80-32-100.staticip.rima-tde.net. [80.32.100.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm28007119f8f.13.2026.09.14.06.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 06:43:08 -0700 (PDT)
Message-ID: <e39b25a5-6b53-4fbe-9185-9be66ed47df3@kernel.dk>
Date: Mon, 14 Sep 2026 07:43:06 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the block tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <aqfBpkMSF1rFicSh@sirena.co.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aqfBpkMSF1rFicSh@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 3:43 AM, Mark Brown wrote:
> Commits
> 
>   0d337c5d5a6ae ("block: warn on too larger integrity allocations")
>   080f146f067f7 ("block: pass a maxlen argument to bio_iov_iter_get_pages")
> 
> are missing a Signed-off-by from their committers

Oops indeed, now fixed up.

-- 
Jens Axboe

