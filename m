Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041D91F91E3;
	Tue, 28 Apr 2026 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777397205; cv=none; b=owKgEUfMKNkRGRnZBOFPnkEBe10ENAOB5GQW2Q9M4VDElTppg3/KdpIhDONb6dIjw8JdZfJX8l85GPGOIWdemopEIaberT/HsmVmxwD5JbqP+i8KTt7ndtOWjr9sNvl8P6++OOfPWPphPJTG4ZMoSE6/R14Wj823bX0eYax/KIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777397205; c=relaxed/simple;
	bh=IAeXHQNIPMwGtc7wDAUfPabQ9Td3Ud/DpsxGS34la94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/9enHmUCI2yjQn1BclaRCZS+NuX4AgkrA3Wi+Z6+tMrzzVVtu9S0grDQosOIeBMYngHaJQLBmfHihI+0ko0xXI5jTSNc7mlc+sELotPgV/2p/0GuH5DPFRn90Y2CNxsxponaDoDVu8lbo1mOEhuR6sXFF3N+xSrYBNuf8Rv9ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HHPp+KlD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HHPp+KlD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xv4pvbi18GiL7sIHV71zeQ8uZGRfgExwMryIGqrntj8=; b=HHPp+KlDoOc2WUwqvF0tDtrBzh
	ruCGzRE21RNQxrGh9XywLjfwp32+7hIpEkfvnml5e2Umgu32Qh/uVl7FRrg1ti7FgkhljsL1RixqM
	oVySYlj+1qMcadCpgJJIxD9FxDpupMOQ+vYEVpbjFE3aAtb5KyCz5mAIura9wewdhMVBMTbhrSEo1
	drgJZhqHZ4ZYzN1R+f/qXx02rOUBOGR3xxd0tF5xLM98i008fXe3oZfGimoRvNbqFeVqLU+ueHNWz
	srOp+obsR/RPL96+lVd9o5GN4KK/bEay3UNPBe8s4hQMV7w54uhUSXJeM3JwaFXpEdgo9V73QK2CI
	CPKFszcA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmCn-000000021DH-0tpk;
	Tue, 28 Apr 2026 17:26:41 +0000
Message-ID: <47db4aad-fd19-4cda-969c-5768c8f2b869@infradead.org>
Date: Tue, 28 Apr 2026 10:26:40 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 28 (docs warning in drm_panel.c)
To: Thierry Reding <thierry.reding@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20260428124827.3910282-1-thierry.reding@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260428124827.3910282-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/28/26 5:48 AM, Thierry Reding wrote:
> Hi all,
> 
> Changes since 20260427:
> 

(new docs warning AFAIK)

WARNING: drivers/gpu/drm/drm_panel.c:119 function parameter 'dev' not described in 'devm_drm_panel_add'


from
commit e43a8e3ad8fa
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date:   Mon Apr 13 17:05:41 2026 +0300
    drm/panel: add devm_drm_panel_add() helper


-- 
~Randy

