Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6147941D13B;
	Tue, 18 Aug 2026 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042426; cv=none; b=cVu/jH95Qfqkh7ud6SD431FrE1k8LY0CRKup1lwJFbIUVIYIRcAwibDjklXF+UCloJHRWZVwwMdXfFaTAga4YIC3iewOtJI1HjCLCAGSsxLTvdhj0pd7cdGnqCyyQiCEZAcVEmZsqKtHLfldVUzvKG3aw8tmINGH0oFFnX3Uy1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042426; c=relaxed/simple;
	bh=Zq+bidDgjuagOOYnSbtUagNCBX0rdfiOekmRGVR+b1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kp8p9vxvmG+U4Y6an5+WjViw1FCzpYpr2RhtgEgPEGJfhLiFFRBNvCMP0iILmnt/RqdpVSH6nemOx5seuoGS24IKZnNmQb3FwL6HjeOyGGJWOUNiQEMwcJZWxTH5aptOFtUFaU3NmKHzBGv3ehdfd/eF8Yfju1Dzeny7aiCMGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=ovXqpnY/; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="ovXqpnY/"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 503351D27;
	Tue, 18 Aug 2026 08:41:12 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=ovXqpnY/;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 3AC2621BD;
	Tue, 18 Aug 2026 08:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1787042423;
	bh=rx7DwMPvh0Ve5TjcFqwF2QBX0puqDlMN1yi9k4nDxko=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ovXqpnY/jMo00c/bx15JnFjWkkz64ycQ4A0aeRHiA2yyRSGB2L4KYxYTTco7Fy42O
	 IrjkqPxZbOOEVn0FE8UYg9X1fZB8wk0ilSGyZOkhAeue/Af9XyOEtOnl0a79zGawo5
	 CduJv+vKyJYC9UkF5QpMtKmdit6UCzVvPZCb0MjM=
Received: from [192.168.66.128] (172.30.20.177) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 18 Aug 2026 11:40:21 +0300
Message-ID: <25137e25-2aa0-466f-afdf-6bf48d5456ba@paragon-software.com>
Date: Tue, 18 Aug 2026 10:40:19 +0200
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
References: <aoL86l8BmU7b3_oh@sirena.org.uk>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <aoL86l8BmU7b3_oh@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/17/26 14:22, Mark Brown wrote:

> In commit
>
>    d18b300d80d7e ("fs/ntfs3: fix out-of-bounds read in read_log_rec_buf()")
>
> Fixes tag
>
>    Fixes: 20fd9f64c005 ("fs/ntfs3: Add NTFS journal")
>
> has these problem(s):
>
>    - Subject does not match target commit subject
>      Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Fixed it, now subject is correct.

Regards,
Konstantin

