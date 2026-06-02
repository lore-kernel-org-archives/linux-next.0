Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4EE21146C;
	Tue,  2 Jun 2026 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412912; cv=none; b=I5Uf8FehbiVdHu+/juFqnO0kYqD5H+oYqqZDykGOHJUf6U4liAYZclKeeVqaQC/DLoXYfvVeHGJtLqJlMohWPbpr855MsNzjO1O6B2jWAQ9hEnz5WuAIUcyPn44bf8CtCuWaIXdnbKAUssfnxTZ5rR9sy1Czr/a7HXwLS/FFhZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412912; c=relaxed/simple;
	bh=zl3GpbeqxfwbIIMUY0Ay80dAEAFB5/YrpAv3mBbOYQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=llxECxJH5DT3nov0NLrSEWFQfHuZwZPyaGfNXjKoYzsRk+PGo0vs1rjV6ei3GYSQbWGk7sc3DoyddSfFzIMB8Amv4Pd7Bq0FMmraU7sXuPXOlji3/3IJijCZEVckueGzqWhNjhlEVhf3lnRPtQm29Te97TqTXBnwKzmxEBt7q+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=V2R7NOdR; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="V2R7NOdR"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 12B8C1D3F;
	Tue,  2 Jun 2026 15:08:31 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=V2R7NOdR;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id A4C0921AC;
	Tue,  2 Jun 2026 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1780412909;
	bh=EK5BGJgMnpdQiFBgBX/9CvJIw4KKEAD2Ejgml9FL/c8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=V2R7NOdR9RGO0rtWwNczMCUIBmHXPXAH+nzy2WFo38usBfpG+WQVU5Jd7/CbZS2vX
	 hq/slFkbfu8u8LUlaanmPtGn1TTHQ66v8s7Y7RvkIDnshPEjSgmxisMDgdx6+sGq9b
	 gyTYK06rEqOIK+EfB+tsoCCKH3c/dLw+EjeNZ7is=
Received: from [192.168.95.128] (172.30.20.149) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 2 Jun 2026 18:08:28 +0300
Message-ID: <12ac6a3e-ea63-4f83-921b-c5d22ca709fe@paragon-software.com>
Date: Tue, 2 Jun 2026 17:08:27 +0200
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
References: <agrJnF8Gro7PUXV8@sirena.org.uk>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <agrJnF8Gro7PUXV8@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 5/18/26 10:11, Mark Brown wrote:

> In commit
>
>    4160f74379854 ("fs/ntfs3: add bounds check to run_get_highest_vcn()")
>
> Fixes tag
>
>    Fixes: b62567bca474 ("fs/ntfs3: Out-of-bound check in run_unpack")
>
> has these problem(s):
>
>    - Subject does not match target commit subject
>      Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Thank you, was fixed.

Regards,
Konstantin

