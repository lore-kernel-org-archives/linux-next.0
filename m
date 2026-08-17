Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C3839733E
	for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975420; cv=none; b=LFWlg5xf+VBDLypz0TRaGDB2Q+cyDzu64FQIhqRUHiwD1ojqQ5UBij4yu+cj4VJDYSV0fRTuLCXTIU/0nNx93oZU1V+cD2czpLATUk6goX5vdPof5tHVdfqaAh9iUcNzJCg9Ay5cPeGRnMzGAR0IbT6HM2jwR5G9N8eQBtp6H8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975420; c=relaxed/simple;
	bh=xwv+wv9cGCeevDWQgXAXAs9yzFDvRy9bue+MVB/DDmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlU5WCqYp1qDta4VdrzQwJ+/l+ZE81fEHmgHq1RolsstEptXOfmRlENclkkiXRy0teKgv6bvv/UO3P7FTzKkD6MdV5gB6F9p+lFtOwI+pdQqhEu72DtifF/SXJ62ipq+ahbOrf/TVovaDhyJH6HJC9GVrvZophzJm3MwGhePIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=IMKTe1JY; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="IMKTe1JY"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f3ece23165so1991998a34.0
        for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 07:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786975416; x=1787580216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dayFXk3I1VUoGifz4ZIxAnmlzh/MSoGWOYp8W7oi8qA=;
        b=IMKTe1JYeNdL1qwT4qY/pviNRcjNztEoKOnQq+1DEd+D6plEpssfLcnChrI9n/g576
         M/jyZ7XGVW6hK09kGpjCEjIKjZtRFZS3YkZZgbPz2BqtVry1+B7+8q84MSDcSp2G817v
         DicP82Rj0EaciZWgMWgSFY+xU5r398Xp0QPgj0Jci3cvmhkpqgWs5RAAsUwWFwagNf0f
         w8TWbVhoZKuZTs4LVC8n4nroY+NHmeWdDhC05qmicgaWuJkuc4gC8ouKLEVQEu6YbLoQ
         Cifpv1pogbNxHXgaRNKQWFv9WSRuKuJC5Vl6b234bNsZkzv5TPna7RNJXYK5D4xvJjuB
         p+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975416; x=1787580216;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dayFXk3I1VUoGifz4ZIxAnmlzh/MSoGWOYp8W7oi8qA=;
        b=R6sfyZb0RC5luGPrLoR6BVxxnr9iEGZ+rBxNJsefL5rj6IRTv4LZHZ07DQtyrnANlJ
         N49/QHPDRsi78gLAW16FsqUn1tLn/3WgYzsGhJixnO/0I+MUM8BGkS43v/ZBmsJY3V1M
         jy0EN0ooauDSIIHEgT5FBf1ZVKuarGqqzhMbp6rbmGYe1SZIs6T2MItSJVTIqWMUqYb7
         rsQRAZeaYiCZON29YCgN3MGjd5BFJfoCQdH8uMt/VjRzg0k8OOjifNk51YB6o+BjF0c2
         l2c+v9hF5uto+SMD7+m6gAcBleQFY7OJPtLxb+q6zTYEmG2QXM0QwL2a0lGD0mdTk88B
         I4Fw==
X-Forwarded-Encrypted: i=1; AHgh+RqcErbOjBjgLeDWRwyFCj9VcO7Rr30okSMNzN35uy6TgIQ9xXWrLnoSUrwKZV7ubpt+wW8E9buJpAlq@vger.kernel.org
X-Gm-Message-State: AOJu0YwVRh+Kdjha5e/BZ9zzZoJUVgK0G8tsHIxrqnFXYwxES56mIccZ
	5oS2YBw2ybcdIo1rfen7VhnJWyUnBaUY0aTinwmfXXkCoO1d2FLjomFEAk+/yPMasPc=
X-Gm-Gg: AR+sD12FAMhyUFsEZRlLEYgIXLq1LKZLZpLA3Wui5dPOU04m0JAeJmYDGYxxd7ZofZl
	LB24QlHAQhBuCjYrGPT6xa1tN4T4jCdLgSJutabfkvpPCZuFbTWIRrZBBvHwHt1ux9EtQJ9IaFb
	BICvrMIPSNWORlg8iQoD2lylcsdKhOI50u6CenWuVRZK/Kn7n3g3vSw1T/IOk1Ek17UR+Ux9W5/
	UzIts8Zdo8exDhPoERCnMsvvcDGAOMRS6XcgP6cORRDziwZif8b70DwT7kj99SEHV8a0A3n5ict
	FY8yAxO8tIqrT+pebLcM7iWVW5GH2FbJdr2oaCYRxbl1u/Y+bsr6ak1PalSGhdBRRBje32btNIY
	+4F/moiIdOieMrd65TFrtB6NqYOu/yUElDWgGlMR32s9bnQ9bqoJfT7VDEV6XDH/yB7Tt9iXEPE
	Ox1zkJsCrwqMJFO8fXBG2UcuQDqU4rOcA0HDzVTvIaGiyK9QUgs9dfpBPnQyNCxrioqJ8Mv+S9H
	VWwSXx6GxlI5szx2NmrzqI+ALhWKfe3bFMBa/N2Plpmevhy
X-Received: by 2002:a05:6830:2992:b0:7f1:ddf1:c731 with SMTP id 46e09a7af769-7f3de608861mr25049614a34.13.1786975416436;
        Mon, 17 Aug 2026 07:03:36 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f41c0f3598sm1796925a34.20.2026.08.17.07.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:03:35 -0700 (PDT)
Message-ID: <93c7c45a-09c7-413d-b83b-beab1d3a3a38@kernel.dk>
Date: Mon, 17 Aug 2026 08:03:34 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the block tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>
References: <aoMBWuoLh1bAEUYU@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aoMBWuoLh1bAEUYU@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/17/26 6:40 AM, Mark Brown wrote:
> Commits
> 
>   8ce883fd068b7 ("nvme-apple: Drop the PRP null check chicken bit")
>   ea2160c7b7818 ("nvme-apple: Require page aligned buffers on the admin queue")
>   69d22a6b2f698 ("nvme: Add a quirk for page aligned admin queue buffers")
>   cc0fec9b42cfb ("nvme-apple: Never set the opcode in the NVMMU TCB")
>   94dd5804938d6 ("nvme-apple: Don't set a DMA direction for commands without a data transfer")
>   87d5b9864c811 ("nvme-apple: Destroy the admin queue on removal")
> 
> are missing a Signed-off-by from their committers

Keith, fix your scripts...

-- 
Jens Axboe

