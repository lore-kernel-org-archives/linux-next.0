Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAAD3090C4;
	Wed, 15 Jul 2026 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134478; cv=none; b=EDHWO6E7gvYOvqP/AHsPs9Hhr3whwxUQG23RncvHfzP/JsHJ07reFUrz5t5DNzHSbOc4JHao70iAmGI3R//wADTcMDOEjKYlEeHjG8HfI/eAH1+LCxtIib6d8IRwp8KCuZmAE2tLMb4X/vYTNJBA/IJS3zUb8XaK5En+Tt8S+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134478; c=relaxed/simple;
	bh=IAPFaCspD3KhGU7bjvzPhAgeASEF4aDRDE/sE2RiFkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pRf1pa1g68ATaSgqijTKviiV8SWeYufZf/qgZpVz17XObroeVLZ9V+LSZ1Zco/AsSBAMHtFZfXvxqwqqfWGcHHwknGknQtFwFpnyu8XJeGCKFy6fhRKmQqV1zNDV2QC5NOiBtVDltFUcCjcvXy4OOFv0o/f9EXBozT0dDMihvuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=uxSUgXf2; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="uxSUgXf2"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 189563AC;
	Wed, 15 Jul 2026 16:54:40 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=uxSUgXf2;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 6EF3F1D36;
	Wed, 15 Jul 2026 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1784134463;
	bh=/A7Bo5nhOBgufvH29OpUKJ0dEw8/1FtKpIOjUPGgOcM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uxSUgXf2DOAHZF2CgvXdvJXcJDxyfDfOs5WYd7CuWCI0nUp+8CoPgMWMJgFF8I847
	 GzVNd0UB5WfqNwpbA16pO1V3z+nZd4uuFi4/Bma8HGdBnboTjWBm0+5N1ZLOVXBqd9
	 KBBCL1canVQ66Nuqvh8IG2kyB6K9KVtZBYV/aXZg=
Received: from [192.168.95.128] (172.30.20.151) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 15 Jul 2026 19:54:22 +0300
Message-ID: <50304fd4-d8af-424c-ae8d-efe31e77c76b@paragon-software.com>
Date: Wed, 15 Jul 2026 18:54:21 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the ntfs3 tree
To: Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
References: <aldqIGRdMoJgNkER@sirena.org.uk>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <aldqIGRdMoJgNkER@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/15/26 13:08, Mark Brown wrote:

> Commit
>
>    f023839df8010 ("fs/ntfs3: fix out-of-bounds read of INDEX_ROOT in reparse/objid init")
>
> is missing a Signed-off-by from its author

What do you mean by "missing a Signed-off-by from its author"?

It's signed off here - "Signed-off-by: Weiming Shi <bestswngs@gmail.com>".
Or did I not include another author of the patch?

Regards,
Konstantin

