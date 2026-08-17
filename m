Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FE83BB12A;
	Mon, 17 Aug 2026 09:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960136; cv=none; b=J/Qb5XanIWbvrgWHcmohvWaNv1+AGRMWMUjAz2855Q9PKMhwrqblPPJ1JDVMDyXKwfbeSRFxJYFouvGhfXt9+9LjY56vsnKb3e1mWkxdhsbYl2E32lyzq72F43MZS+N1pSME+8d1LJdz4kBUxCB5HbecrBBtJLL2OQJGZY1zUDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960136; c=relaxed/simple;
	bh=VPj7tag3d2xse3AjORAdCzb1ItAXyEjrvZpgXdFKckU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UxBXV4+p0BvZMOr3Qn0imbmW7o9JpxFZJTBmaw10ptCg8vUo4tVLQLIxryC5tQAYCm9Jse331lHZijmou/o9O2GYuw7A+LfAcUuIHzl4RAUs94gcP+bEBy2/f9KXB0rBcpuFox3ieB+s6sBvMOO/SqQOj5n3seTlg3gwzKp7/LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=E7BN7u/N; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="E7BN7u/N"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 976D61D5D;
	Mon, 17 Aug 2026 09:49:35 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=E7BN7u/N;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id AC1631D1D;
	Mon, 17 Aug 2026 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1786960126;
	bh=u+jVu8SDwFnw9n3EUlNZNiD7Ux9lpFf0s8cSP93bjEU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=E7BN7u/NUXFrlnF77/CEQwEPSRNtYnuDGQkzacW9G6YwjOlvcxvu0uhwFIzIPsylk
	 hyPS/tKO6QSY4ybYqjFubQDmw1PmlfHZ2IMya/GxOmlEnlPJvVtxJL0ZmM+T8JnkR6
	 E3flK0m38gNPoswTZJ55HXUjjdRHGuSqENDS1LHk=
Received: from [192.168.66.128] (172.30.20.187) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 17 Aug 2026 12:48:45 +0300
Message-ID: <0a65c204-f485-40c8-9fc1-0cff73e385d2@paragon-software.com>
Date: Mon, 17 Aug 2026 11:48:43 +0200
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
References: <an7_ll65komhYG0O@sirena.org.uk>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <an7_ll65komhYG0O@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/14/26 13:44, Mark Brown wrote:

> In commit
>
>    b594c9962b005 ("fs/ntfs3: fix out-of-bounds read in read_log_rec_buf()")
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

