Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC03CAA59;
	Tue,  2 Jun 2026 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412937; cv=none; b=o0PKG5WsPYMlZz3/RxHb7hluOqBGN/Mx7gzOjNxaEn0XwAPy4JTaXVa34BxpkO5SLg8GEehKVKfiX9NSWYQMLfZhXY8Bz9E+ZoYyRcTr+kWvmbeMu11HYnVbpvMMKjZYNmDEbbfi1axZdTKyfHdSRWRXVy0Z+bHEX3jSLL6DPwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412937; c=relaxed/simple;
	bh=OWoThOBkYqr1eVo3vh+LJLoQ+2lIW2bLkuMVIOwtkaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HkObiVLnZ0gKAp1A4sTKrQ77RXcm0qmLL7+sZZ17N89nnpSMZ+cgS2Ya5mjQqr1cwmjFrienpQnqhG5Ha7RTICjNbhOwQk63lu74tllTEPn4iGcVHBXnNmIDUZhgWoqvTEUqyudKDFujW8f9xjX7GUHfvm9sb6iHRbPUYU4Xikg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=K/hBaMj5; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="K/hBaMj5"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 0FFF61D3F;
	Tue,  2 Jun 2026 15:08:56 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=K/hBaMj5;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id AACA221AC;
	Tue,  2 Jun 2026 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1780412930;
	bh=CjZqtpolgzcPDNb/LVnKrTR23NZK1FJR8eSZ7dUAnLs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=K/hBaMj5w5AHmnIkU8iHIGXN9YC5N2VaAP/KLkyNtMmsgIxcSaIJa21o4mGGsU4KL
	 aZD6OOgStMvJ0cH2DYBgFVgYZMCZmxO4hUk2n15KTMmTR7tJ1iC2cI6AYO7gUyyTgC
	 9Ew3bGwGTnfIkhIRe3veHA+UdWKHHZqYFjvL9tGw=
Received: from [192.168.95.128] (172.30.20.149) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 2 Jun 2026 18:08:49 +0300
Message-ID: <33e659a2-7300-42af-8820-2fe906e12c71@paragon-software.com>
Date: Tue, 2 Jun 2026 17:08:48 +0200
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
References: <ahl9QtsR38b4FuXO@sirena.org.uk>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <ahl9QtsR38b4FuXO@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 5/29/26 13:49, Mark Brown wrote:

> In commit
>
>    6b6fbad790ef1 ("ntfs3: Allocate iomap inline_data using alloc_page")
>
> Fixes tag
>
>    Fixes: 099ef9a ("fs/ntfs3: implement iomap-based file operations")
>
> has these problem(s):
>
>    - SHA1 should be at least 12 digits long
>      This can be fixed for the future by setting core.abbrev to 12 (or
>      more) or (for git v2.11 or later) just making sure it is not set
>      (or set to "auto").

Thank you, was fixed.

Regards,
Konstantin

