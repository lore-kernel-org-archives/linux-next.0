Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ECF1A9F96
	for <linux-next@vger.kernel.org>; Mon,  9 Mar 2026 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773064135; cv=none; b=g8Anj9COgs5vAh9I7qVF/M+n0NjYtLY8SzOdMtKSK5epMDluZyY0eOMoC2iKAhOdGdIDerlYo4OSQrySFk1knL917r0cLmStpA0xJXGZNe5pTyT8JFrA3qa6Cd/8WElCI6hd1IRfKIn5rUq50yesB7qdFOteb8JDXD1mtF+zC6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773064135; c=relaxed/simple;
	bh=GSFXjUB+m390vt7Z3IvZQhfiMTYRluDhgK/zA2/rw6o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RXr7/2qcxpQE5ICq8HT1Wn5ms5zpRmfTiLoViOUMK94XH99vrv+hBl98FusZ7O9MRyLXVpvDRodWmn6lsXO1GIe3ELwX9MpB0gTDpsJ+CwyH7foLhvk+RtJjEICFijjsCWOErSzwQzEX70+SqbR/9pKnZ3/oAW/SBjCAba28tqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=KSnSUTZx; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="KSnSUTZx"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd8d97aa2eso92333585a.3
        for <linux-next@vger.kernel.org>; Mon, 09 Mar 2026 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1773064133; x=1773668933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YsYlOiaNs1y5LexayiBUguDYXpzcPBMKJuX1K8m2N14=;
        b=KSnSUTZx5h+BBJ0rlHP+l8D3trvGOmOdq3QWdCk5JbHctqUObMQndcI/QpGCF0qxgb
         YbMfwBAqbAPU6IuRqr+2jg2Fz20V48/q4tVS78NR4dCtfuf5JQt4oaTnAI2XJKm6Tpu+
         G2bBmEjxCfB26XCG65TFqOekmeru1fSMsneQl0gF0y/dPd8c1W0TYsj3o3+cXm8TyG/q
         gmFBcgwU3C4tuk6ZSapOfH+tOgaD7k0hY/fJbLcsfIK7t2xuOIaiclIYtSUThWojGamo
         FC0smmGGbgq7Ba/F9JEhNWuhgCqCVCqqVMp7PqOk3p+K2MrDSl2UqKAHxs/8UCiAPa1J
         i/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773064133; x=1773668933;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsYlOiaNs1y5LexayiBUguDYXpzcPBMKJuX1K8m2N14=;
        b=wxlEF6BtzyCznpwhzjqmoG/xgxEoi4fDdtfUX9Z12SNE5uizWLctzukDtBFTmyx4Ks
         BH0Jk04jR5GkmO+iqpURO1tSTl1yyAuBjLzm7Dum78CSYX+V18nWlnaE3m4bcwY4sHMR
         Xj+bx6U+r7X9UmoLHCAawxeXvVcPCSVbv5JMeW8Qed22wf1HM+B1gZsD8wIdzLEvIsrW
         Eggt1XfRPMF8IqMinO4aSNLpGhAH8Z/JCSppb5IBS58OHxG5rODnlfS5U5AArWPW4J6n
         udQQD/hKk7ItYL6RIPA/U8mc/ckaYCjMW+kHbu2TwPy0SLS+23bmp5raaVJMEqUDzxgn
         v2Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWGurVsoDeVu9y263UNyF76w/NID3RpxFqMM6nAiJgxHTdxbf6ikQlyQCnSpKKcSGetVMkmOlUiu6xJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzR9Aq33v7kKCQ6QfoM849tYQN9hmbSFUnpqJyJK88AhBHC2RL0
	GkEBbVkSeYWpG+wW9yzWmOoP6cihDQzxYj4+suhvKfaO17pXDcz8Z27w6PsxSKaPrzg=
X-Gm-Gg: ATEYQzwACHE7g3tegm481grvIJFtjFaEh8zLsFqEp0rW3xrblmeC9X7CHQYEo4q0D+c
	y76+Q5ixmv0jbpYsfiqsJyTjISR2uKwbbCl1IhJURkLH6LSb6vlCmYeoNei+VzbJRAXmK6ESx8k
	0u9WZf7FeC9B3Yt8oCbM0c6h/YbtOkgJfMfnP7WmjRvIAy9l2qOIFb97sg3Hi7o8xlIaP9Xw18d
	yntO6sW9lu0SRCZX6J7Qwo298trCMMGLnppU8nLuxSUy9N3GzxoVGY7iU0XQwvWx9JkT6+97I93
	D7IeJ0DyeNkG4XPrfucPEXoyhszudH4cRm6e2XnCToVN1Hcd/RMvTDVQHjDBhKjnleWAFwEVmtW
	F9Cp6z1ieOL5+PfMVqcYJXsbfJzgB1bjIU2RlVaOacWIGjVs6Tke0tbiXfBObb3j8SYodYMwzLB
	srfLlSHwTV94QwPG9NrWSbG4ONjYtOJEure5LtdmSSUwmVXhhpew==
X-Received: by 2002:a05:622a:1a86:b0:509:d0a:564d with SMTP id d75a77b69052e-5090d0a6076mr85237281cf.54.1773064132737;
        Mon, 09 Mar 2026 06:48:52 -0700 (PDT)
Received: from [172.19.0.48] ([99.196.133.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-509177723e6sm23225241cf.0.2026.03.09.06.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 06:48:52 -0700 (PDT)
Message-ID: <1f9467c8-6982-498e-ba4b-7a16ccdb4dc2@kernel.dk>
Date: Mon, 9 Mar 2026 07:48:41 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with the vfs-brauner
 tree
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aamIvIWiZDDCmNYG@sirena.org.uk> <20260305145428.GA17884@lst.de>
 <aam-ijUWoOP5hhAr@kbusch-mbp> <20260306142257.GA16612@lst.de>
 <fd00969d-15fd-4ace-942f-a2664e317813@kernel.dk>
Content-Language: en-US
In-Reply-To: <fd00969d-15fd-4ace-942f-a2664e317813@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/9/26 7:45 AM, Jens Axboe wrote:
> On 3/6/26 7:22 AM, Christoph Hellwig wrote:
>> On Thu, Mar 05, 2026 at 10:34:02AM -0700, Keith Busch wrote:
>>> Yeah, one of us should have to rebase to the other. Since mine is just a
>>> single patch on the one colliding file, I think it easiest if I just
>>> rebase my data alignment updates to the vfs integrity branch, then send
>>> upstream through there. Let me know if there's an alternate preference.
>>
>> Yes, I think that would work best.
>>
>> Jens: is this okay with you?
> 
> I think the mistake here is the fact that the integrity stuff got
> ingested wholesale on the VFS side. That should've been split. So
> why don't we redo that part? I stage the first 7 in a branch off
> -rc1, Christian pulls those in, and stages the ntfs3/iomap/xfs
> on top. That's how it should've been done so let's please just do
> that now, rather than make an even bigger mess of this.

Done:

for-7.1/block-integrity

then I can either drop Keith's patch from for-7.1/block (rebasing that
tree), and then Keith can send a new one on top of for-7.1/block which
can pull in the above branch as well.

-- 
Jens Axboe
