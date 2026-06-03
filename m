Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E77E25B0A7;
	Wed,  3 Jun 2026 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497692; cv=none; b=UScVzlw7L6kxR7VpytglFYXPHxDKWKD8TmA3INCChLzCq4bG3jddzggMMLsqqbgglRHR8qa86cuOclwSrZ7P/X0nC9ZHg5USI4aNRqvBXWll6rHIpmFIPYfnVy7ld+VIaQdGKNpnukanqFz5jPgnlIYPWRCB+5FhFVaX9Z9FNBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497692; c=relaxed/simple;
	bh=8iebmDfoTDocqkKXUfQSbiY+ST6O44gZ12sirCfW49g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cbURBBeCHAiO96FDQf/EgFbLpc8BBWuSKmgU02WecMesV+cakjbkwJytVT/qfGVO8MSB4BevYeG3hw8mKW83rIR2HxM+7LAOLtGqxig40kCy/tMc8uMOEHYnT/Z0eSjYG+i5GVYnfO6h/yeGmK9np5tBDf4xnVJsAGR/aPU7h5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=SkFzs2fa; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="SkFzs2fa"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id C6BA81D40;
	Wed,  3 Jun 2026 14:41:30 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=SkFzs2fa;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id A5E9B223E;
	Wed,  3 Jun 2026 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1780497689;
	bh=g+At4xO+7/z5MFUZuZmJIYOdH4n+Ot77sgHAKp4HkoA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SkFzs2fa2//8ZYLg7won/B/0w27Lte0smelRx9O6PNNdmN7ulIPeGrjI2Wp7fMJHh
	 Mr3pTRPKvNOOzYiPvIsBGfwsJ7F+lZrAXGDPU1+Z8IwCW2lgcQIpgAtq4KL3+5u7Nm
	 m3REo0nQYl99SJOg8fCEHU+SxfmrZSZ4Ad2tsa6w=
Received: from [192.168.95.128] (172.30.20.205) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 3 Jun 2026 17:41:28 +0300
Message-ID: <d214dacf-6ebd-4855-8064-e6d8bba8a91d@paragon-software.com>
Date: Wed, 3 Jun 2026 16:41:27 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fixes tags need work in the ntfs3 tree
To: Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
References: <ah_U9V7DvgTYVsOp@sirena.org.uk>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <ah_U9V7DvgTYVsOp@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/3/26 09:17, Mark Brown wrote:

> In commit
>
>    149a4d9c78020 ("fs/ntfs3: bound attr_off in UpdateResidentValue against data_off")
>
> Fixes tag
>
>    Fixes: b46acd6 ("fs/ntfs3: Add NTFS journal")
>
> has these problem(s):
>
>    - SHA1 should be at least 12 digits long
>      This can be fixed for the future by setting core.abbrev to 12 (or
>      more) or (for git v2.11 or later) just making sure it is not set
>      (or set to "auto").

Thanks, fixed it.

Regards,
Konstantin

