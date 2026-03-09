Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E993B52E3
	for <linux-next@vger.kernel.org>; Mon,  9 Mar 2026 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773064470; cv=none; b=MrlfLBD71E97zbFSRRK56sxaRYKHdDOky9WvIj6daZnVjlfHkuewTCDzFCVzwG1u09QhFgS8iqrJvRDvMVuYYP1UvD/Dzf6zmvLZVd1YKNfFfU+DngDYtF1ayVP2CEaNz2o2Vfkv+w/H2HpiVlcGiwzIjmjtfZMTZyWREadl2OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773064470; c=relaxed/simple;
	bh=1LlvxvsF0QvrHm77epReMusoSLHf8BWp0aiaNxMYoNo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=A72CbkdFZ7Xjm3d5xNBeV/HddPEFjmL/lljQ1ftxUzucKH10iFeSQCXp8G1vqLqZkTuVP3Kz7FmN5nWUziZ71K4wo9Q1iMgOmqvGTqVRmKo+zTJUJdzAYdPwNuE+EWgD8zYGs1dJMYwyTHRrn+RPfjR7pkXalVIM571uHHTARBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=B9qReZfx; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="B9qReZfx"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cd80f56b27so150808385a.1
        for <linux-next@vger.kernel.org>; Mon, 09 Mar 2026 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1773064468; x=1773669268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U6p0ArdPPU8bEagd1GFMi4HFit7cMcr++LbKn9/xzak=;
        b=B9qReZfxdaS7c3fTiz0mdNaSSV4HFVBrdlVkBHgHKXNRafYwWj3EcxJgE+290ZpuNW
         7ylf9K7DFzKRFjPSOGv55qPCyID2k3prCOPfWS8LCSr7jdhbQsA1OUueNK7AyFjmrEg3
         Hia3wlq9MiBKkM8wAzZZ2sakHmc/2yhIMYumSqyTrDT5JUPVmMsRlV+JjU4hgz+NnzyS
         xk8yvX7yWL4JgxEBSakh2tKR1gQOmWiiaL3f4mfH24PnmRJXzfsom4buQxzRSkZOEH+c
         eFRCh7O34Dwa6rYPAvVWGFC4dKvZF0zZiSaEQl6p2uIsB3S9nEzYh2Au11W8mD17qS37
         nMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773064468; x=1773669268;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6p0ArdPPU8bEagd1GFMi4HFit7cMcr++LbKn9/xzak=;
        b=cL9fCaOaI+VrYuju9GG1K1usqN8zdbqxwn0QtCPbi4FILxeXLRJqx1xD05P2E7I8L0
         t9cXlS2IdUfVhIbT7FWSK2a/0oHfQ7zwYxF8jqYzeeO9n+10ple8bKIMHQ8W/7TL8qjo
         ZimRe2inxLD0cGx3gHWCFbYtIQYxBhUMM8+ogGX2oDqg6ZB96fI69A5ac4JyLFs/w8UQ
         q3ovDmVXK9kKfvcqvPRYHKQ2DM/FL8g2kAQ7SE0eDsuRzcVPszq7m8v/PeDjumrEqXhe
         Au/WMoyXVicuIkATcgBbaZGa6+FA/P9eM04G2how/Zl/cvyq7zAgUaPV1hXJN2exo8rc
         Am1w==
X-Forwarded-Encrypted: i=1; AJvYcCV7GOVA8fneUXgzxx3GLW3HFIbpR0fb+IhHYx/NW5poDtfI99tFtyiQZmSCoHCi5YoAQAh6LuKqCgq4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw3G3TttwvRCzcYh1GYKK83meoqXAhzUkYpAiwzLUzbAhEdJzE
	9uX2PyKmos3v18udx/4y0AveVGdg0927znk+HTvTsVILj+88psqJPHNWbNwueE0Zn4E=
X-Gm-Gg: ATEYQzwlj5Pc7pxgu3tc5b2W2AK/Hv8Kjkmgjbw8KTKLEEnBGLZfh21D+tQnzkCJ7k9
	WsYxnLddZVCTlbHVj8iEUkWhH7xvevFh0MLRVW+DudEWSDSRs+d/H0bSsb2JO0sHzw2J75AegV4
	+f/4wwJTtfuhRubn/8GIOs36jf33LQRIbvcuPe+a/QqiaSCRgRCdmfvZwc0PwoUbirK/KMIfI6l
	ZZA4XhYMcb2p7eh6XxcEPVeFy8OnTHxX5wX1Z7o/iR14sdyPDc2sH5XQRXaP4OhAgRDxfDgnsuL
	UCMmUfRmIl/SWq06weKT0wtgcQBLYz5P3ccoQSSblDBvN/dWSXZfJwPjFcvfnFFyay0LQ6lkQQP
	AnDUQ9rpB4O8Vtz27QpagMmisfQCHy4+/GWX3XPCdBSWBy87CckCKhi0OXEUEep6xSEHtD1IbT5
	uR0ZWNH4QpvW0gW4NpZkLy2wq/nYztXl4XZMuY2jhEnDJBTo4VgQ==
X-Received: by 2002:a05:620a:40d5:b0:8cd:8d4c:aa08 with SMTP id af79cd13be357-8cd8d4cadcemr285982485a.68.1773064467593;
        Mon, 09 Mar 2026 06:54:27 -0700 (PDT)
Received: from [172.19.0.48] ([99.196.133.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd8641d344sm238079385a.31.2026.03.09.06.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 06:54:27 -0700 (PDT)
Message-ID: <8d82d803-4278-45fe-b64f-36c26807fd0b@kernel.dk>
Date: Mon, 9 Mar 2026 07:54:16 -0600
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
 <1f9467c8-6982-498e-ba4b-7a16ccdb4dc2@kernel.dk>
Content-Language: en-US
In-Reply-To: <1f9467c8-6982-498e-ba4b-7a16ccdb4dc2@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/9/26 7:48 AM, Jens Axboe wrote:
> On 3/9/26 7:45 AM, Jens Axboe wrote:
>> On 3/6/26 7:22 AM, Christoph Hellwig wrote:
>>> On Thu, Mar 05, 2026 at 10:34:02AM -0700, Keith Busch wrote:
>>>> Yeah, one of us should have to rebase to the other. Since mine is just a
>>>> single patch on the one colliding file, I think it easiest if I just
>>>> rebase my data alignment updates to the vfs integrity branch, then send
>>>> upstream through there. Let me know if there's an alternate preference.
>>>
>>> Yes, I think that would work best.
>>>
>>> Jens: is this okay with you?
>>
>> I think the mistake here is the fact that the integrity stuff got
>> ingested wholesale on the VFS side. That should've been split. So
>> why don't we redo that part? I stage the first 7 in a branch off
>> -rc1, Christian pulls those in, and stages the ntfs3/iomap/xfs
>> on top. That's how it should've been done so let's please just do
>> that now, rather than make an even bigger mess of this.
> 
> Done:
> 
> for-7.1/block-integrity
> 
> then I can either drop Keith's patch from for-7.1/block (rebasing that
> tree), and then Keith can send a new one on top of for-7.1/block which
> can pull in the above branch as well.

Keith, current for-7.1/block is now updated too, I dropped your patch
and while doing so also rebased it to -rc3, as we might as well on a
rebase. for-7.1/block-integrity is pulled into that, and Christian
already acked out-of-band on redoing the fs side of this on top of
that same shared branch.

-- 
Jens Axboe

