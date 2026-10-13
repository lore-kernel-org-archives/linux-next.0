Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361555221C0
	for <linux-next@vger.kernel.org>; Tue, 13 Oct 2026 17:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911286; cv=none; b=r7WFn9e46wWJ63Kue4cK1XXirm2kIdq/xpIxAkeC384mUyBDgb4ZF1rQ98DM38WgaSbOy+8X/IX9bHUe9c786V25MI/rQfST/+v7Oq9UAYw0Hwpxkjf5mtjsM9ixSNt5xlqZWgOq7YJ0TQ6ZNWb2ROVFHYgyHHXgWbcJ5NZ0Vgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911286; c=relaxed/simple;
	bh=H+mktQSwSWS/TNQ/7JvvWl1ODGmW6A2QYJ4wZMlQqQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xu9OU/cKqcaMxPjxhTs7u3mLUe/OLcfgpFfROzMvTNxzOfpgrieFh8uGuTS4vm/Q1i4sWJhwG5v6d2baebF/SXmXbGxc6gfFVBXi7GfDw+1AmR37yB6rGivZOiVuMTlY4cESkQOtx8rJWWIyKKqz/0rJORbMQwEhzDNJSJiT8js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=pekAajx3; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="pekAajx3"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6c8f6a53fabso4364146eaf.1
        for <linux-next@vger.kernel.org>; Tue, 13 Oct 2026 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791911284; x=1792516084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2ZAjGaDyphTw9+IrUM4dBvnOm/hl3BRvnUqFuOU0Qs=;
        b=pekAajx3lG8Corz1o9rtDrF86Q4hT1G200KFLhZfOnmKmkHdLmDISODeuUoT+w0DHc
         Qdb9RCE8wujgJYbAUifeXUHjWp0MpTEFIKVkDZqHi7pjuSe/uLi9oULtTGKx3iHEv+tw
         KgJqidoD64r+LBzmA3AQ3MBBoZiW+IWpgwqFTvSdrd/I0E4Ya/mX36MuC6gfspcwW2kY
         C5By3zcRtHo4lOzv/GwaQQfiOnombC8BbQWOaq5L3cmmwSgC0g6l+3tWrqTmBYJeDlZY
         MuXp+PDaj21CdzTw2a0ds4qehbkNHiFB+HFzBmW0mDEA+oGybuQG5ewCV3PU1y9GgDb5
         ShDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911284; x=1792516084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2ZAjGaDyphTw9+IrUM4dBvnOm/hl3BRvnUqFuOU0Qs=;
        b=o42BNHG0D8buhJY+RVLlLNKT0r8HXTYaz0+3b4YYwfOEQSkVpP3Ru4+CbogulYOFwe
         IeidQ5XE38+CnoX68TLTABLoRp/u1mRjZhb7yn0Q8UguJXZKfdGWOAldlMvKBg6pYCg6
         6Zhfinf6UPAIccmwv18XERHMn2D/Bugac0uPFF+j0zoF72erKhcTkSgwixWLIj+LEquM
         9x7Zlbb0/rTxLFpxwtJzeyNGAnVVhNe6qN9tcdyaGJYjaEHMBNH9weeQbSS5bADx/n1Z
         tTjyPkd1Fyn0lzNvcsuhHl2JRck5+9SN0JxiakDKLz1Pl86UBG0k4pozg+S4F2G/wQob
         uQ4w==
X-Forwarded-Encrypted: i=1; AKwUvByGq8+ZMCSzczNLbJnMR+X8UGeHm+2qdV52sbIIvYPhcgl8zOoYFJEQBo1rsbaRX9yFH3jQ4QkDrCyO@vger.kernel.org
X-Gm-Message-State: AFq9FYK7BNZ9UsJ74zgwnR9v8kIsodXl7wUuYKz/QJUCPueMrPTFa/zv
	ve+OiniyjnqTzpudEHuc5JbZk7TvQUiBOyd2JPOVpJCB7BnCHYrbjd/iqON13nX9zQd2n+7TGId
	qsTfF23g=
X-Gm-Gg: AYBFou3Y8s7m2uOiFgtiCMQs211Cv5x+sSIxuSjggcqjFlSq1fxhdFjfRHPBOa/vOmx
	nAeQZ4uZ+IXgGhdDC/kHFrTxfbd2MrMH4fu6vdrrnJPYFQR9CRBsF8aGV++G/ngt1Mr/malHVcs
	XBHx4lN6+LIk89AZoX87+eyHwcWGQV93Xvd8kkcNBJ0+5PufeYKdOti/+IqSXnAuMKKYjKWqfPr
	EVviwWXDI1TKQdpxuir5LzsZ8/V3/BVqHgYXg3HZkJ1Ickf7uzGImKYvGu3g+IOtZcOI7elmvJr
	Uqi+ajdnJt3rSZZec2+HsXBIocLvBeJRzz8th9S/64Rt400XrHMJaX5NQzzEMkOTpmo+gQ+eOKA
	0sFKubWSajk2ygQAz7qrPFQPc5BgyamD8/jXeTVudRhvJn1rXqP/Gfb2ez5iEcGMFgSQQ7Lxau+
	nnGa0pd6A0ZrsdwVYqmL7Bxf0oEqZNpAyMFt+f7i6u9Zw5C6qaJJqOCdqUGmo8/bBXIln11Vf+q
	v4KchkJiR66WYspW0lUfJ+ry2JfrOYlw48pMXl6m5RuDTJasVgw4Nk=
X-Received: by 2002:a05:6820:180a:b0:6d9:bad0:837c with SMTP id 006d021491bc7-6ef0fdaf56emr6801193eaf.40.1791911283515;
        Tue, 13 Oct 2026 10:08:03 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6fba22b94e2sm519970eaf.8.2026.10.13.10.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 10:08:02 -0700 (PDT)
Message-ID: <3ebc7573-59a0-457a-a9ae-104c56010837@kernel.dk>
Date: Tue, 13 Oct 2026 11:07:56 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>, Pavel Begunkov <asml.silence@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <as5jnDJEt1iZZqZk@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <as5jnDJEt1iZZqZk@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 11:00 AM, Mark Brown wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build
> (arm64 allnoconfig) failed like this:
> 
> ld: Unexpected GOT/PLT entries detected!
> ld: Unexpected run-time procedure linkages detected!
> ld: io_uring/rsrc.o: in function `io_sqe_buffer_register':
> rsrc.c:(.text+0x1a9c): undefined reference to `io_register_dmabuf'
> 
> Caused by commit
> 
>    4bb7978523289 (io_uring/rsrc: add dmabuf backed registered buffers)
> 
> I have used the tree from next-20261012 instead.

This is already fixed, which sha did you pull?

-- 
Jens Axboe

