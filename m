Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E0E3ACA6C
	for <linux-next@vger.kernel.org>; Tue, 20 Jan 2026 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768951994; cv=none; b=RUMMfhRaQ5PVI+zB7Dm/HrdwGcL/0C0J7cpJP5Um4f373JMdoRnt6af/9bFJ2pJ87i3GH0EfZFRNupdAvJ5gtiEBW62vZhoCA+cDk5ZZqOJqotL4JZ3+n8cVYWOjeHkD/1lPbrdlWAk3x9A4nthZgzaQehUhxydgplId40Oc+rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768951994; c=relaxed/simple;
	bh=iKhM/x7gQHmun+/TZcTN8LpnwZ1oJ4H4oG0z1Bgw/Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCUlNYfJxbq9/8KalIR4foJHQEBGUfFf1RGW38Ru3Y6UAH3QdKDg3mV1qNpnvqvXwUbCu+kDVV87bXjlLplFRwPO7CBcdA86a1k+wx4371ww2UO5fIBmiRHCkZ9Pk+NzTFNBg4ZXxng5sv1pazFswke+sTRQFogiZVfbUOvu8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KucL2TWD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KucL2TWD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so39831635e9.3
        for <linux-next@vger.kernel.org>; Tue, 20 Jan 2026 15:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768951990; x=1769556790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gRSyiv+q0ykG1uHygozoaN5UIXoutL9qeV3+AwotnBE=;
        b=KucL2TWDhtbAp5FZS6A/M1Uapg/gZZuFlL4Lui1wJZ3UyMdtL4lvPVb62qjwCPDAlS
         zvm4nuHlK8uQkXt+hus94LZ334j9WlpCxsV0Ct/uT9Z77vyANND5NcO3HF6AlfW2TavJ
         //n/+MDIDMQEwPXZivn6lwsndSLN/Mo9FslDIblduqlKlUaXlzeWwLCZ6wR4zeXywcWc
         3VXFJnI68BDt7g5MvI+ORVZr9Ll/jR/iwg/uPgVVZuTzDX74fHCNr+fuzNceR6wyJY7l
         k2gGcAkfh3NK+jy6l2mIMsg5L9Rdz6f3EhCUsC+QmjibaWJp5ERjM/1pdQli7QgU10OL
         NJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768951990; x=1769556790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRSyiv+q0ykG1uHygozoaN5UIXoutL9qeV3+AwotnBE=;
        b=YdGyjV48zeovPR0VbflgO4ZW2/XmTYDlpayJXfqkF0QIILsnpG7L3EVBmwvKFQ5ksp
         h+DHC7Dtnki2drOnT7bdiB35zubnKWX6q0lZaJ2hjJ5Qi8KrViPhc96lvEkQ8giV13jw
         ZG1k6NkLZcJNS4WPMPTgMFemyl75+RTu6D9rIFLw5ram/k6DYgTkC3oNjmFfmvisLY71
         //QttTBpv2rAXRXjgl3afZCA+2AD0bzNvdYBTn7YybdZZp3BTVoy3EtnwCGa7Ssoyp1+
         7hG53l6mq8sR34X/eekg7Z7VZ3q3jTCZItb+0geLAv69zhB4yf3oKWgQQzfUk6pr8ug5
         /5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWqZhAghzs7hA9iLi7pMpqgzzqfX2HEgh1dQEp6CGpIBCBppOsId9PKJ/9lRnPykhkAySLHFyre6t29@vger.kernel.org
X-Gm-Message-State: AOJu0YxOLQ43pK0waUp0cUxbpJCLen16soiH+ksndfU6gL5YibD3Ae0C
	6qSZKlc6IuBEWGaHB34FI+ij72utMMvBFNzDfoSXlTbEnPnr9sbkeypY8JA7/gbIQX8=
X-Gm-Gg: AY/fxX4Q9+oV/rPw/BDPh4rGZyDsoOYgtC6kWAziHgcPZGBrbHNdS947n5OvllsonmW
	TH9ipf4JydPhCRHH4mbuNmC0tls7cwbSu1sMbiFJlymnBPS0ZKoc8GkuwVoariiS6jT7kVThiQu
	Y8v5iLwV04DC7mLueo3oLSFBzFDht/GjKvHdbvDwAaA94s9i1uLEnnfqTXPYTZJIOSTlJSMJxnA
	UKZgwkP0P3QdgKbkY0mzyMHHFZPt0+UxqHe/X8dJQ3p5lv6+h4j+VPwAkt6cDk/nOWElMs9WHZB
	wLXYkNN2thPaAIhAW4OqpkYKd9baIRn+blrNw0alWao4QF8C/iyE47/HrM3Ea1rJU0j6wvu8vEV
	y4t8UR4luqw/e1iNJN6Ek6oYwS4DA1n51ft+i31CMWA0MjetgPwQya0uGCY34ptGujmUJdBnpsa
	sEIcmG25ZDlODCdZEiv+rcTnaW/2egtLgEgP6tbjc=
X-Received: by 2002:a05:600c:1549:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-48038b7872amr96058785e9.27.1768951990132;
        Tue, 20 Jan 2026 15:33:10 -0800 (PST)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a719107c34sm122338785ad.44.2026.01.20.15.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 15:33:09 -0800 (PST)
Message-ID: <33551776-18b2-4279-96c0-b7d1aadc0319@suse.com>
Date: Wed, 21 Jan 2026 10:03:05 +1030
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the btrfs-fixes tree
To: dsterba@suse.cz, Mark Brown <broonie@kernel.org>
Cc: Boris Burkov <boris@bur.io>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aW9wHq0fs8KpLCyj@sirena.org.uk> <20260120161838.GD26902@suse.cz>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20260120161838.GD26902@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/1/21 02:48, David Sterba 写道:
> On Tue, Jan 20, 2026 at 12:07:58PM +0000, Mark Brown wrote:
>> Hi all,
>>
>> After merging the btrfs-fixes tree, today's linux-next build
>> (arm64 defconfig) failed like this:
>>
>> /tmp/next/build/fs/btrfs/free-space-tree.c: In function 'btrfs_delete_orphan_free_space_entries':
>> /tmp/next/build/fs/btrfs/free-space-tree.c:1765:9: error: implicit declaration of function 'BTRFS_PATH_AUTO_RELEASE'; did you mean 'BTRFS_PATH_AUTO_FREE'? [-Wimplicit-function-declaration]
>>   1765 |         BTRFS_PATH_AUTO_RELEASE(path);
>>        |         ^~~~~~~~~~~~~~~~~~~~~~~
>>        |         BTRFS_PATH_AUTO_FREE
>> /tmp/next/build/fs/btrfs/free-space-tree.c:1765:33: error: 'path' undeclared (first use in this function)
>>   1765 |         BTRFS_PATH_AUTO_RELEASE(path);
>>        |                                 ^~~~
>> /tmp/next/build/fs/btrfs/free-space-tree.c:1765:33: note: each undeclared identifier is reported only once for each function it appears in
>> /tmp/next/build/fs/btrfs/free-space-tree.c:1817:1: error: control reaches end of non-void function [-Werror=return-type]
>>   1817 | }
>>        | ^
>> cc1: some warnings being treated as errors
>>
>> Caused by commit
>>
>>     7fcf8455f610b (btrfs: reject new transactions if the fs is fully read-only)
>>
>> I have used the version from 20260119 instead.
> 
> Sorry, I'll drop the patch from next-fixes.

Or should I update the patch to use traditional manual path releasing?

As this one may need to be backported for older kernels.

Thanks,
Qu
