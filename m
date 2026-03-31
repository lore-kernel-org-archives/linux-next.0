Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC830F547
	for <linux-next@vger.kernel.org>; Tue, 31 Mar 2026 19:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985811; cv=none; b=q8wcc3mP2HZGN7slseRbMuDdaCJTCey2Irrt/rxyv/YSXM8CJwxASeLGFhUIpu0upfSiopikWRtIdAqd0DCx1xRtQvjaS3dAoPboqbBeQxGV0A7yqYLJgh766RNlEeHCcDBUY7l6Kveb5KCMwB0pkgCZK7IB+irIcclYsQSnjUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985811; c=relaxed/simple;
	bh=DSrqQ534CljeazP/nPXYZmMW7uPdF/jOSZwZJBmlHxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqMD6stswUB5mI1lHpHG7LvmX3iWZwDwZGVWm++Kb6gtLnGwNS441sZ8nkrsVs8R0lBjlvHDtETbLZNc7Oh5eKvHrDzX/GIAUvLBmC1SB4BEojhOiUTYD4x88xEbOojUNxfxy8f/UOv3S0wmDFWutnI2j9wJXA8kmTdLQCQZwXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ce3qZ9Qz; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ce3qZ9Qz"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d91f82d819so6033453a34.1
        for <linux-next@vger.kernel.org>; Tue, 31 Mar 2026 12:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774985809; x=1775590609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A90LZMSYKf6cGqL6qcGM5v+MFFuW+IR3WAmImhN0MZw=;
        b=Ce3qZ9Qz99WUkK2SWn2WiCWth2GD4Pb3nLW3qcC+NRmnU+MG/xq4UMNiU283QQWluO
         wuDLqDw5Dk2PqccL4a0P8xtXGKC0vVkQl4mUH1Jf7BxhXhRNDbHe6d3VtA7dk1tXZmrH
         Bu6dwQLA40yaHSER2PVf9dRgmYJDs4k3If2Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985809; x=1775590609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A90LZMSYKf6cGqL6qcGM5v+MFFuW+IR3WAmImhN0MZw=;
        b=CNY0DD+v70aYhClnuFjIJK/6JiaFvDhTMYFGzPimhP/azXjEg9FOHOKg75Vp/j2ZYE
         J9958u1KHGPuM4iiEB6jj9NAWYnpx44gK2mXN+Ng9Wb2kFkadfzIYgG7vb0iDvdVZ330
         QMrsundXoQmQHyNbgsPcmIlqaMSBw25V8rhdSOdJVRbQv9VAm8B9gyILHW4NxR0XVU+o
         VcidNzUFW+hdFUHP06Im+ucis+HeqFJUDmxNbhRT0L+tdQJWPeM8TR30cYpVuPrMrxk9
         nb7o0rfFNhM8Olexgr5gV5UlmihZF4tQifkeOQ6szrVRjd+RPdjUvr4kty/ANakij60y
         1F/g==
X-Forwarded-Encrypted: i=1; AJvYcCWwi/dzQ3oovx9pcxDulRzAdb8o4SUz7sdXtelJnWA+6BK531gbJHPvHvzhk1TKN3nU2wBJi7a6roG7@vger.kernel.org
X-Gm-Message-State: AOJu0YwgdfYzlAkyRUkOyCjjgxv9NfgffNUY7oIeZjnu23EVbfStZG+G
	u9HHzMUdxkX5GibFgfSIPPDg4i5JLpDkR3s6FOhOA1dyW3ZzW3c+4VfcZJnsJ5biTs7Er1alAne
	7LF3U8c0=
X-Gm-Gg: ATEYQzwSYsUExOpWOzMZboDtOhys6SYwZGT7d1qUbHikGwlaFrlXfy2kd6x3sNfcdkB
	FWInMnjcyVlW+H6lDqGYOrO8OwKQuyeSRv/HnLUhxv7AR5yeEdy7VvFtrh2KvAbYGKPUJGLnU+/
	7Q2CM8O02d7eMY1wJ3qu9THCVaUstCZsY/Seyh5XXeZa+tJdbvCKXwa0b6ZgcXDw6AJ9LHFM0ld
	Hf0AWCm+ZLvW5T9+bZt7bFV7DIiZ0UsOk0axunwa5atETj77V2wCc4k6Ar6n8gTyWm99KeSkiyo
	GN0yEJXTzn6eR/z6fe3BqsiAMIMfRLA4SyMVJn/R7VgBb2JPhTpuRae7PPJIbURfY2TJyBHs/W6
	rRh6qJsDRBFRjnzRv3qEpEN2SPkG50T+B1hk8S+IRECl5LGt3LVQQSl4zbKeDp+sX3S+6rVti3+
	TCOKDN/O1B3nBT9e/fOlBaLS366y3BMRSeGBE=
X-Received: by 2002:a05:6830:4c0b:b0:7d7:d50d:b088 with SMTP id 46e09a7af769-7db993dd8d7mr567040a34.28.1774985809135;
        Tue, 31 Mar 2026 12:36:49 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a3b2e37sm9077404a34.10.2026.03.31.12.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 12:36:48 -0700 (PDT)
Message-ID: <fbf16249-5b2d-49fa-aaa6-95e0e856cf66@linuxfoundation.org>
Date: Tue, 31 Mar 2026 13:36:47 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kunit-next tree with the
 kunit-fixes tree
To: David Gow <david@davidgow.net>, Mark Brown <broonie@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuvam Pandey <shuvampandey1@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <aabpbnOt9nCuQrfu@sirena.org.uk>
 <e305159b-13fc-4084-bcbe-968388575627@davidgow.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e305159b-13fc-4084-bcbe-968388575627@davidgow.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/4/26 02:16, David Gow wrote:
> Le 03/03/2026 à 10:00 PM, Mark Brown a écrit :
>> Hi all,
>>
>> [I note that Shuah is the only contact listed for the KUnit trees, is
>> that right?]
>>
>> Today's linux-next merge of the kunit-next tree got a conflict in:
>>
>>    tools/testing/kunit/kunit_tool_test.py
>>
>> between commit:
>>
>>    40804c4974b8d ("kunit: tool: copy caller args in run_kernel to prevent mutation")
>>
>> from the kunit-fixes tree and commit:
>>
>>    7e331b560a76d ("kunit: tool: skip stty when stdin is not a tty")
>>
>> from the kunit-next tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> [Sorry, forgot to diff - it's a simple add/add.]
> 
> 
> Thanks, Mark. Shuah is definitely the right contact, given the KUnit branches live in the kselftest trees, but I won't object to being CCed as well. :-)
> 
> Shuah: I suspect the simplest resolution here is just to rebase the kunit branch on top of kunit-fixes. But it wouldn't be a problem if you wanted to shunt the stty fix into kunit-fixes instead (though that'd still require a rebase for the SIGINT handling patch).
> 

Apologies - this got buried in my inbox.

Mark, Can you send me the diff for the fix you put in..

thanks,
-- Shuah
