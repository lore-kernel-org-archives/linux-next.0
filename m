Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10B23264D5
	for <linux-next@vger.kernel.org>; Thu,  6 Aug 2026 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027720; cv=none; b=Y/mXdTH6gs9yr9/Hg0IDYY9uZE7PZ7OstQLd2btLGxHmfQHowurgsIdUnDKLPHTdfxJb9xHQCpMOzLQepwiNWh5QrMFBewd9GbkceR6KW7qgK6WMGtk+jpANrPbosMNFQj/YZHyKhdzOcqnRVMGLGVRZgIrOLdHqvIp43SLFKZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027720; c=relaxed/simple;
	bh=ulyqk7NZ3+QFtU68zIwIuhYDDl17Wu5uLVd81oEdaWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+5szET4RBIRhh33oLABprm/aegNst5L3tt6EFEzQ3cFvAPIi6m/ppd8Sbe5jAgVg1r5jl3MukuSYU34QzHp6hyOv4D6u8RJcZKbGCgIc1b/LgPXjT5NTjKwNGnR7UK38CMDBZEY7gYQv33c94tRu81mbUNEIHpduT6Tn4dd0Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NFL3bvsK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NFL3bvsK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f633e6058so1952929f8f.0
        for <linux-next@vger.kernel.org>; Thu, 06 Aug 2026 07:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786027717; x=1786632517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QNwXSUgKoPcyqn+NrBsrVopGu5vE735KoQi9uCLWNww=;
        b=NFL3bvsKUjEwpw7GsuCx2SpHfsXrqWWQO8GCWs4YDKeWlp9TGXH6b38jD+gMH4T77l
         wer3IgK+bN7fIX9EglG06gV+KvofvS4JEhN+VGroX+siXUznw38D79RNcd2Br7vzEUDm
         wdpa5keXWDpJICn8+PbI+exlQ0G2n7nwq13lElW+ihQNVMKFxwe+N56J6LHifWbg3/hy
         J6LLoz4ftO61Htwy9a2l8SpBneVfgigTyYJYhIpbH1Lx5rhzrpaNKCvkE8Ow3STXDPVW
         pyk1xyb82F78el9Jf3tGILnh74o3B8MSD3aPodOWsRICFn5CV4WidLJglc4tJhBWO3fH
         XPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027717; x=1786632517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNwXSUgKoPcyqn+NrBsrVopGu5vE735KoQi9uCLWNww=;
        b=W+J63dwcL/+7SgIdBEolno9jVvueysQCDU8bqs2cVHye7XukVCm+2uC+kkjycK8EZg
         4tN+6foP9vpayI5eomyK19OXTchCbLx4XzMu0MG2xUP18KNs81LF8Z6GKbdeZaqxt1Wq
         p1jXGfDwBNceqgKwiEeTBQnL0ExI5KqzQpHN+k22KwnM8V6abz+5PdIStayG6yZj832C
         AtKF+K73OIQy80FYF6xoyTu3aAPYNCY59nK2MpoTm/eS2BTfDFPNL/mBI9KfLN3l4/Ti
         WcWkulzR2T9hhjf/7sS0dpkmvT+4hwML+SaU3pXIgMtpWlm/TB/Q8LoseHPOidBDfQsZ
         DHeg==
X-Forwarded-Encrypted: i=1; AHgh+Rp15vPNO4y+BfsqUI/AE7cluFHH7ssmzEfrXOF1R2lnr7pZMf/bLBvYvXrsGCybNao8NBZXe9xs01q0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5QmkthL0xEc3vmD/BMOrexzq7mfLnNHbl4lTkFTiz+FalPo6k
	F7Jxjj0GZ2L6tZWO1wnhEB+GJRXu3jCjUiZXDK0dV6F3gV0SAIfeND6eKjwj3tL4XgDWqkZb9Mu
	3CAYhWUs=
X-Gm-Gg: AR+sD12J4hKGsG6rox+gJQEWGGCdupJNbPQesWPu40E4op8s4Vsh9pj1P3/iugw7Wmb
	DksCFYB6M3wk4MrcasaKgJtJNCjo3krxJ31Zroo3fIgK1TCruHpduSv9nHazjt4GhkuaNRkhIEw
	BPabzAlRF8bBz4D5NfAug8i8P0zE1zqbCC+FljXHcYQRdTfr7Sxhbylmrt4uqzxTHTtu+r40150
	9Y+590kJJWWvdUoAM9MPBfm+xjLUSu8gN/eXeeh4SVROP0w03YRKKHr1vD8QlgYA6jW4OU3wchM
	iPDyzgAqLDTDJVT3eSRVZiOUHZcB9AgZPDlnJ2DZrwRVAQV3mvpUy311xHvSVd4/KBE0PvnlLQ/
	jNRGSueJl15sjaIAfDQrgCkmoHzB3RqcAHf3QDANcw3UQBmzMn75ZK74bbQ1rDHIRgEeAnpV0ZM
	HhWjNSpowqUkRRiwnXchwiPxiHTNxMHsl37D+NJJqO0TXN+jGZ3ZGKOt+kf61/Dck1KRyqLQxoi
	FKU8DW0WSq7B4IRIBrLeotQ8g==
X-Received: by 2002:a05:6000:491d:b0:47f:ec8a:214f with SMTP id ffacd0b85a97d-47fec8a2195mr24915601f8f.15.1786027716768;
        Thu, 06 Aug 2026 07:48:36 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b18374sm6932705f8f.23.2026.08.06.07.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 07:48:36 -0700 (PDT)
Message-ID: <b68df62b-d032-4e19-a4d0-c3d13b9d49ec@suse.com>
Date: Thu, 6 Aug 2026 16:48:35 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the modules tree
To: Mark Brown <broonie@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
References: <anSYivRW4p13OsDB@sirena.org.uk>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <anSYivRW4p13OsDB@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/26 4:22 PM, Mark Brown wrote:
> Commit
> 
>   ca2e2d7b6e758 ("module: validate string table section types")
> 
> is missing a Signed-off-by from its committer

Fixed now.

-- 
Thanks,
Petr
