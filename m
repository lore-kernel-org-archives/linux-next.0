Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0672636402D;
	Thu, 23 Jul 2026 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818598; cv=none; b=ejKpBowRsdEgtEwaNVOrw4i3k8NmolWtlCcvRPjPJUda+5O4GV4RhoghbZxgSIM7lA0/HB6BLx/CBw4XbCUOGInbt3vY0/mZRQiymXyloX2NNtLfDeV6d2lqLzRZ9/oCcmX0wTwOO8ywOSlhyzpFX2SHAVHMRb75Lfe0gMz70w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818598; c=relaxed/simple;
	bh=wZhUPShmrlPjQKZfdrFYE7oAbTuo2b11nH/LPi6LR/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lRYpRx2G/wla713oOJM1gBCmYhB5Ophsf16VUgDgeN3bVR6Y2OrttiEcvAV9L5g3wuhMxDs5s/TuuRNa1bQ5N/y1/XsTqxlU5iCNsgvWrxnrczsWNrQ+jIvTADDJo2dH/l2D01jmd0LJrnI4EMlT4mXTVXWRKNDcRhN3oq2zgAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=CwheoAf9; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="CwheoAf9"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id C27471D3A;
	Thu, 23 Jul 2026 14:56:52 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=CwheoAf9;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 3C02B21DA;
	Thu, 23 Jul 2026 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1784818593;
	bh=Ii4RXDlJVppVSCaH16Av67eOYHii1gDfVL7Atyux6K4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CwheoAf9/z61n9ENI4YxqbrgXP5sUsRHQKv49a0Iocru8z00KRZtmebircNCxELcz
	 b43oS/fU9Du3o6Edrdgx74fZnEs/I0NTX2aqQEkX/LI9MmPwuEhcNiqtTZWaunGllX
	 IU866SZ+0d2TfLvWtIM+qULbf/z4lv/9MA9zPcgY=
Received: from [192.168.95.128] (172.30.20.158) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 23 Jul 2026 17:56:32 +0300
Message-ID: <3b593ff9-02ab-4ff2-abff-d689e28e59c2@paragon-software.com>
Date: Thu, 23 Jul 2026 16:56:30 +0200
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
 <6bfccbc7-2b99-47ce-bc50-9cbb95b8969c@sirena.org.uk>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <6bfccbc7-2b99-47ce-bc50-9cbb95b8969c@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/21/26 02:08, Mark Brown wrote:

> On Wed, Jul 15, 2026 at 12:08:16PM +0100, Mark Brown wrote:
>> Commit
>>
>>    f023839df8010 ("fs/ntfs3: fix out-of-bounds read of INDEX_ROOT in reparse/objid init")
>>
>> is missing a Signed-off-by from its author
> This issue is still present today.

I see. I'll fix it, thanks.

Regards,
Konstantin

