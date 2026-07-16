Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D5CC14A;
	Thu, 16 Jul 2026 02:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784170127; cv=none; b=pZ7keyjQ1CtsTfrB/2d2C3Ei+2wHZPoLODScCRxCsNQm9zB8VxM1DuPJWfZkR/NVfMRIClQRDMlxy9XuTFv9m1C7zMlb7MaqOEjXajs6/qMKUz6xmhplsfpdYamr8NgsX6/8BavWblRMNHkoAWRcjWVGkbMOlU+G3ynHiv8uMRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784170127; c=relaxed/simple;
	bh=Lzgm35McCnffsD/qELYaFG0GgJELy5BekMeHS/VMpO0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JROSzUVodtOvR5lHnKh8VpIJNS61WZr7qClVwpbwASpSwKYjz3bgPjqNWwA9JWifwJ3jLp98KqXFdwYPAOIqYrBKCIzm4iNhY4DREZK7VRsdMcCzHBIztWNi+GRM4GLZo28c0VFg7tf4CgSodU7yC1XI75uXzxcWEEmivNBOr/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=mrydiaBu; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="mrydiaBu"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66G2mQ6S13329391, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784170106; bh=1DOPK7ePEZGH7W/EGuShqxNz6N9MR2pLzcG1mC8aG+M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=mrydiaBuGjS3kItmU381qcwCxKybthTM4tOmtNwe+P1dHrIEFEqlkdfWJcnqcNhDj
	 54vQq1sPyIF5mttCE3ZIWZ3vZLaZsrPKtethPmh8n8DlyIOu6K8mpwDIJrIWlVde9L
	 qGnA0r/VOfreoh3oAbBRA0K/tA//1H80onk6LfWyHz9ZKBnKm9EcK22R/UeU9hoUSZ
	 88+PxOPh91fPuFB497NAhHnx8sEzClV7kGvdvi9X1w7CjZdMKBnUqrFMuccIJLFnUF
	 waBhGNd/Vhb+6XuUQYCJHEcskz1YVSTju/qu9w/WA2yhTdIdRhQt0eQHNAia7mrIsw
	 tMZrnHvEMB8Hw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66G2mQ6S13329391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jul 2026 10:48:26 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 16 Jul 2026 10:48:26 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 16 Jul 2026 10:48:26 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Jul 2026 10:48:26 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <broonie@kernel.org>
CC: <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
	<linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the realtek tree
Date: Thu, 16 Jul 2026 10:48:26 +0800
Message-ID: <20260716024826.1390099-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aldqwEDCi6Ae9qOn@sirena.org.uk>
References: <aldqwEDCi6Ae9qOn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

> [-- Attachment #1: Type: text/plain, Size: 128 bytes --]
>
> Commit
>
>  18a9dade373ef ("arm64: dts: realtek: Add EL2 virtual timer interrupt")
>
> is missing a Signed-off-by from its committer
>
> [-- Attachment #2: signature.asc --]
> [-- Type: application/pgp-signature, Size: 488 bytes --]

Sorry about that.
I've added SoB to the commit and pushed the update.

Best Regards,
Yu-Chun
