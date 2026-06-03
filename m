Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575939B482;
	Wed,  3 Jun 2026 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497672; cv=none; b=vFJAMXg7FOu17rZumzzuk+yHi0wwn3wUmHmXRe/JNKZ5hsnd+7cJj8SgGRh5oleRSZKeNfMnvBVm+ZBm8L7xYH5BHyDepaTHvWpgXLNeBMyOBUcoAI116Q1mcpjg4s3fN5oOWXnogvScMBmPH3kebcN/1PzAAyPKstzXUa48/g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497672; c=relaxed/simple;
	bh=FBpj0bA112LD7VJ8cqIIf2MersRm5eGlOZ9F/HTYGZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IviDgHPTF33PiKAY2Gi5+Rdn81Nd1lBX/Xyi/RIFLbGrSgC4sP+8XY16mh2ssKluPAa7Z/zWiZ20OufdqNOif7w936Dfa5maVeXcsy4Cb6a5IgdBanCFisu8X3J9kwpljGfJqY4h6w7Z/7IRb0P12F1Us5Y37oCB7c6sr1zkJ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=QGeeBWGj; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="QGeeBWGj"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 1ACE91D40;
	Wed,  3 Jun 2026 14:41:11 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=QGeeBWGj;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id E41E0223E;
	Wed,  3 Jun 2026 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1780497665;
	bh=mrH9944rBM6j86enKnNkubFmt/KaZ29IMnMuxf8c+MY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QGeeBWGjZdcUJ85eULkyhPin6J3Agb8wp8OIIGsOxQN08Yz/hZnyGgxyOqmdQHLhd
	 SHaiF3QZXx9up/H0ejsdgsgUEeyFoIIWqmRMzNItiFiISBt+PEJZUBDzCKImG9FTgj
	 Qy0HRgRPKNlE3L4MydwESSSuUFD6KoIWwVvlRfCA=
Received: from [192.168.95.128] (172.30.20.205) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 3 Jun 2026 17:41:04 +0300
Message-ID: <09981200-06aa-4e10-8ac0-3b505c77cbed@paragon-software.com>
Date: Wed, 3 Jun 2026 16:41:03 +0200
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
References: <ah_U4Bjkpnue-YZH@sirena.org.uk>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <ah_U4Bjkpnue-YZH@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/3/26 09:16, Mark Brown wrote:

> In commit
>
>    236c81b8fc4cd ("fs/ntfs3: bound DeleteIndexEntryAllocation memmove length")
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

