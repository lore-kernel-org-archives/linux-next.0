Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B2F21E08D;
	Fri, 23 Jan 2026 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769154463; cv=none; b=G2gnFxmrn/PnkwidnPa1yqgyn+kqD9RZB7ClBvuTvgcxgY7WxR0TTLLo1l+dNleY8V38qg7L4/iZjFfZmkk+wRTQWVe40jgTFnwqQgZDg2dLLWrsD2w/jn2uWrGKueOVxWBOdE/Z2qJZBmR0vENvbX9HRa9REnmDKZ2yOQQHKy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769154463; c=relaxed/simple;
	bh=itGC6XX+xUZaLKENewRgRQRokudcAT3JDT/sCDN7FsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJVtYKNuDUYFmf5e7BAN5qliH2ZjWA94+wY4+eaRaFbx7w967Mjfnb2eitU8yuUP8FDWEkr7Q2o2cUYePKqf0hg2U8f23S4cVPHGzPquY22VKJjgGLOayXDl8xNEtqK4YJy4Cy89ubWLA0uhfvVl8AFHk/B0VfO4dsY4RfQ2jkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JH4KbYUX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JH4KbYUX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=9Vt7yVFoK4bmwFtBayugg3Mesk0IO0qQaHoMpLPENbQ=; b=JH4KbYUX058ePaxG6Kq/vBj54b
	/MAUT+kGOgRDN4c008Mc0ZPESCgDWRiElC1DXnKT9IIGfTxJ5gEcqspiIpTUDk/tyjMSz3p61ID83
	W4BnBU2b1J81QI0b/QFUMuqbMMDwXwySQBcf8C5RLzOWtVVx0O+SCZd1pSFsrGLh4b/9eKvCQF8b0
	HY2hWFvQ4XMgdq3d/pPoe6ur2I9WZR5G4coBCCTptXYq5n048Q1qjkFfhfWey9Uow2ZzsRqpdE1gV
	WNSUwxNI+BoitoRa0vMMjiGJTpH/ZjZvgyCm/80lUV8yyzS9OJQtWAE6Yk0FwRR//jtwi/l+x18GE
	SexraFLg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBtM-00000008OX7-3wMq;
	Fri, 23 Jan 2026 07:47:41 +0000
Message-ID: <f07d721f-ac80-4421-86a3-1f7f76ea8e6c@infradead.org>
Date: Thu, 22 Jan 2026 23:47:39 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [next-20260122] Build failure on IBM Power Server
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, broonie@kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <43ea0202-891d-4582-980b-5cb557b41114@linux.ibm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <43ea0202-891d-4582-980b-5cb557b41114@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/22/26 8:15 PM, Venkat Rao Bagalkote wrote:
> Greetings!!
> 
> IBM CI has reported build failure of 20260122 on IBM Power server.
> 
> 
> Error:
> 
> 
> ERROR: modpost: "phy_get_rx_polarity" [drivers/net/phy/air_en8811h.ko] undefined!
> ERROR: modpost: "phy_get_tx_polarity" [drivers/net/phy/air_en8811h.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [/home/upstreamci/linux/Makefile:2040: modpost] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> 
> IBM CI has bisected this issue and below is the bisection log.
> 
> 
> git bisect log
> git bisect log
> git bisect start
> # status: waiting for both good and bad commits
> # good: [24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7] Linux 6.19-rc6
> git bisect good 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> # status: waiting for bad commit, 1 good commit known
> # bad: [a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d] Add linux-next specific files for 20260122
> git bisect bad a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> # good: [2574bcf1765ec13bf3ef469aa5b15cce293aebb6] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
> git bisect good 2574bcf1765ec13bf3ef469aa5b15cce293aebb6
> # good: [2ad38467d20c16f38d0cffad711ef4f4acdb8b29] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git
> git bisect good 2ad38467d20c16f38d0cffad711ef4f4acdb8b29
> # good: [a954370fea56ee1bf995524255a34da7a1ddb524] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> git bisect good a954370fea56ee1bf995524255a34da7a1ddb524
> # good: [c7ec480f05dd0185a26f190471905ddf1215bc52] Merge branch 'staging-next' of https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> git bisect good c7ec480f05dd0185a26f190471905ddf1215bc52
> # good: [4427398fed2b8e07a62fd4f3f6fcf9ffcf56829a] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> git bisect good 4427398fed2b8e07a62fd4f3f6fcf9ffcf56829a
> # good: [852ccea1ca3144beb7003976d4fa04dbf81b307b] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git
> git bisect good 852ccea1ca3144beb7003976d4fa04dbf81b307b
> # good: [f174dabd307dfd92edacb34e8bee0384daa1bd2e] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git
> git bisect good f174dabd307dfd92edacb34e8bee0384daa1bd2e
> # good: [e31f3c967c66cf03eecdf50fe138d05f635e3698] doc: Add housekeeping documentation
> git bisect good e31f3c967c66cf03eecdf50fe138d05f635e3698
> # good: [0cc83fc23debf3e2df19c4510a77fe2d60ab2693] gpu: nova-core: don't print raw PMU table entries
> git bisect good 0cc83fc23debf3e2df19c4510a77fe2d60ab2693
> # good: [75df6953fed6b7274f9c5080925ae4c8d3e424e6] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
> git bisect good 75df6953fed6b7274f9c5080925ae4c8d3e424e6
> # good: [086714bbb96f63785da251e1f8d1ce3e716a6e42] Merge tag 'v6.19-rc5' into drm-rust-next
> git bisect good 086714bbb96f63785da251e1f8d1ce3e716a6e42
> # good: [6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331] drm/tyr: use read_poll_timeout
> git bisect good 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
> # good: [b956937ce78fae5fa785f6a95f291e2137502c5e] drm: tyr: Mark BROKEN
> git bisect good b956937ce78fae5fa785f6a95f291e2137502c5e
> # first bad commit: [a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d] Add linux-next specific files for 20260122
> 
> 
> If you happen to fix, this please add below tag.
> 
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

I don't think that bisection helps very much.

Can you post the kernel config file?

-- 
~Randy

