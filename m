Received: from smtp6.goneo.de (smtp6.goneo.de [85.220.129.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9AA3396E9;
	Mon, 23 Feb 2026 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.220.129.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870727; cv=none; b=G+DNkhwhTUaw0XpJTNzJdOJECU08W9cG8tAAD7gtxBLW1tUpCWqleZUEj4ZGi7nAbyvJWKiI6oob2iGkonnJn722TeyVML/YvcVJO3AVaOmyyscZoRK1D3wb2hzRdgsHIlZoZE2hULTfLK2JdcnF+Pny1KBchS8Akrkd98PLdRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870727; c=relaxed/simple;
	bh=wI9zV2lfvN7SHgvqkGv/swFRTetbqLneNnhYz0AjVkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNdmFyoHjGNMb+6FnHb/g3g9h684yt/uawZukPdgS5baTb0FNW+bvjMFcYs9HVfr7W4MyPObvt/euaTahABVkd0Qyahnip4b2hH6v7D6lqQezdNVvvevIEBMcUt0rF6A5ePTCbq1JbpGtz/5yMAKK+2zwWKytodanGS815CqADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=devpi.de; spf=pass smtp.mailfrom=devpi.de; dkim=pass (2048-bit key) header.d=devpi.de header.i=@devpi.de header.b=Gs+NVsst; arc=none smtp.client-ip=85.220.129.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=devpi.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=devpi.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=devpi.de header.i=@devpi.de header.b="Gs+NVsst"
Received: from hub2.goneo.de (hub2.goneo.de [85.220.129.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by smtp6.goneo.de (Postfix) with ESMTPS id E401F2404B6;
	Mon, 23 Feb 2026 19:08:34 +0100 (CET)
Received: from hub2.goneo.de (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hub2.goneo.de (Postfix) with ESMTPS id 4B32B240123;
	Mon, 23 Feb 2026 19:08:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devpi.de; s=DKIM001;
	t=1771870113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GlZkdgh+0RXMt11PcYdBb1OEcUpR0hv/k9oD3/CWmRY=;
	b=Gs+NVsstrcdCeHZw3Sn0F7fyfp30qFHrajiZomcgH+7gbWN7+q2uVQUYs76VKaS0NutZFm
	OqfP4A9id4wN1EFUwjbQgif2AhMymtgiMWShPoKg0e4hzjqUa3hccCVn69QJ/n6AXD1+0i
	NWOw76tCy0WrNOXBACSQKUcGheXW5YBP4/JNbdSPTgH+hw6JboGtyyY+r3DSmhOg9OcxtJ
	uwol/wgno9I++TtqzaRGZQynAYmyR1uBzPHytwsKJ9pVCTrgXIY9lKDIT4dETG+lp9NwXz
	tE29DLGivu5Yd09XY3/W2EKJrdXJDbxKGqa8nh8jzldTEwjnUpKPjzqjk33jeg==
Received: from [IPV6:2001:9e8:7344:c410:f6a8:dff:fe29:81ba] (unknown [IPv6:2001:9e8:7344:c410:f6a8:dff:fe29:81ba])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hub2.goneo.de (Postfix) with ESMTPSA id 0113F240027;
	Mon, 23 Feb 2026 19:08:32 +0100 (CET)
Message-ID: <5386c18c-9326-4df5-99d9-30727b0c48b1@devpi.de>
Date: Mon, 23 Feb 2026 19:08:32 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the hid tree
To: Jiri Kosina <jikos@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <aZxFiDybKKxezaYc@sirena.org.uk>
 <70o4n987-9s87-rrr1-qrrr-r351qs44957p@xreary.bet>
Content-Language: en-US
From: Julius Lehmann <lehmanju@devpi.de>
In-Reply-To: <70o4n987-9s87-rrr1-qrrr-r351qs44957p@xreary.bet>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-UID: e96bf3
X-Rspamd-UID: 9da1f2

On 2/23/26 13:20, Jiri Kosina wrote:
> On Mon, 23 Feb 2026, Mark Brown wrote:
>
>> Commit
>>
>>    6b409da663270 ("HID: magicmouse: fix battery reporting for Apple Magic Trackpad 2")
>>
>> is missing a Signed-off-by from its author
> D'oh, thanks for spotting this.
>
> CCing Julius -- could you please provide your Signed-off-by: line? I'll
> take this as a sufficient reason to rebase the branch.

sorry for messing up my commit, has been some time since my last mail patch.

Signed-off-by: Julius Lehmann<lehmanju@devpi.de>

>
> Thanks,
>
