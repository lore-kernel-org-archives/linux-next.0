Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343FB30FC26;
	Wed, 18 Mar 2026 18:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773858057; cv=none; b=h/leZT8d5WLNU+gmU2oHO3iuUng2MExWtYYit6tAX0ex5lCwJVSCc9QLxteQR62pBrfyyaOMrejqZJypIIAe9LfboWIlgI6Q9IewKfKEvt6RaY/TtITfZm59Zuo8q4//wKo//UCVZpOGZY2xRqPt0j5WRpCysv7nmMvAWzq7x4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773858057; c=relaxed/simple;
	bh=Otyq5IMCKF3NfhxRL77MgdLZe6Iglf56XF0yqwLf3jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G09F+Fff/incEtKZ6JuSUBJjQ5WxsuHFraCNVwImooDnLtS7sDT53Nxm61jfZixSahQukaL9G7AuUHXdmc25twdIYXIqsLpOlumT1/S1mID5gVd6gEKo7y8MSBq5M1SJ7EiYczLwwUOFLhEDWfVglAwoS01i34u9MyhgDgn1Bl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Kz7gWbfM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Kz7gWbfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773858054;
	bh=Otyq5IMCKF3NfhxRL77MgdLZe6Iglf56XF0yqwLf3jk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kz7gWbfM6kkX3CwpU2QD/fzBLkSpLf3KkLUuJWwIqTdOFokX6CwiBxkKxB+YBLiqH
	 iYSnRODvLl/Hpkolu/pa17hSWRzpHDiV3voLECjqQtppJ8wEOV7M9tU6kVOS9aeDUH
	 HMeba71ZKprhg4Rd3Omx9cCiWYOjMv2asgL7W/1B29C0yn9LMwWB4zMxcN/QpjWNFu
	 yo2ZaegaGpgC5vxiIOQeSNS5xDotWV1BWOxGigH4iNuHMkZ+L2ozf7vQi+UBRbh2Cu
	 QIzhSYTJ8js8XO1VBAjyXNQWG9+xvycoIapTmtB/3+ElP6fkgeW9qeiTfTH6KQYG4l
	 LZ7U8vnVwJkOg==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0500017E0619;
	Wed, 18 Mar 2026 19:20:53 +0100 (CET)
Message-ID: <d13e23a3-af02-475f-ae54-3ce90968447f@collabora.com>
Date: Wed, 18 Mar 2026 20:20:53 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Dave Airlie <airlied@redhat.com>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Daniel Stone <daniels@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <abq4YV8QgsmpUoHI@sirena.org.uk>
 <DH60ZGTHFMZ5.HOOT9GVR0Q0V@bootlin.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <DH60ZGTHFMZ5.HOOT9GVR0Q0V@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Luca,

On 3/18/26 5:49 PM, Luca Ceresoli wrote:
> Hello Mark, all,
> 
> On Wed Mar 18, 2026 at 3:36 PM CET, Mark Brown wrote:
>> Hi all,
>>
>> Today's linux-next merge of the drm tree got a conflict in:
>>
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>>
>> between commit:
>>
>>   cffcb42c57686 ("drm/bridge: dw-hdmi-qp: fix multi-channel audio output")
>>
>> from the drm-misc-fixes tree and commit:
>>
>>   3ea699b56d31c ("drm/bridge: dw-hdmi-qp: Rework Audio InfoFrame handler")
>>
>> from the drm tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> The conflict originated as I applied cffcb42c57686 on drm-misc-fixes. I
> carefully followed the dim procedure as I know it, so I'm not sure I did
> anything wrong, but if I did I apologize.
> 
> The steps I did are:
> 
>  - dim update-branches
>  - dim checkout drm-misc-fixes
>  - dim b4-shazam URL
>  - dim checkpatch+sparse ...
>  - dim push-branch drm-misc-fixes
> 
> One thing with this procedure is that dim push-branch pushes first, then
> finds out any conflicts. I wonder whether dim could be changed to find any
> conflicts before pushing.
> 
> As soon as dim push-branch warned me about the conflict I tried solving it
> myself as per [0], but the patches on drm-misc-next (3ea699b56d31c) changed
> the codebase completely and was unable to sort it out fully.
> 
> I at least fixed the conflict at a pure patch application level, so I would
> expect the rerere cache would avoid future conflicts.  I was wrong
> apparently. It had worked in the past, no idea what went wrong this time.
> 
> Then, as far as the original bug is concerned, I notified the involved
> patch authors [1] hoping they could find out whether there is the same bug
> in the drm-misc-next code and fix it if needed.

I've already confirmed that commit 3ea699b56d31c in drm-misc-next does also
handle the audio bug, therefore no additional fix is required.

Regards,
Cristian
