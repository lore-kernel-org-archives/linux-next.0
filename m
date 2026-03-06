Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EFD18B0A
	for <linux-next@vger.kernel.org>; Fri,  6 Mar 2026 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772833547; cv=none; b=Q5kUoRmgedWS7DtzS4IVWSe2xXTFiRuWQ9wlKY5k0YGpxXeb+64i738EBq4a7J2mhAnMi7LaDOAgBMb48VPBsE/oWPwGAWGAyWegwizJbNSI9ZwWUHBqkmyLwvcVibcludaqkLCs5ONPsl2PB/ZmmEbueiPhNfV2OrTyzhAeyU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772833547; c=relaxed/simple;
	bh=ygiioQO7YI1Z6+YdsvW6u0Sg9VNyGI3V5/zfCTppg/8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=huHlsEFTl3vu8s4NbZ09BZQ59nKTXbw62BFYdt1WO/uogDVeZ9peFKu4tF7vTLnB75UGKKQWhX7NGz0dPvLwyhEsTVgiKPI7CKfNcuqkPp54ZDnwQm0m+XxH3xiS4qFnYFm7Z+1TiJIwF5COLcQwWSuJLGdZy3QL8Siz63AR02Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=HXM4gRak; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="HXM4gRak"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64aedd812baso8728107d50.3
        for <linux-next@vger.kernel.org>; Fri, 06 Mar 2026 13:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772833545; x=1773438345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FUeQCHJX6OavYXwy7bj/hOulhUCnwzMyCKLTg4avOsk=;
        b=HXM4gRak6ooehdTKLWKnpRQYFt2TbAI6pllfdiSbjMJyxgZPODcdqgLYsCfMwc+rub
         /8617/X257zld3mOXbQLL+rT+Vmdv7wwmhBh+h52BNFgmds/0d9lZcc55GftgZj/Afsc
         vlgTMxET2Cy/sWGnBxkf0bFWwG7opQcawuGUFqs5usyovnaAK7llf5WIkdfNcvRIrmey
         /qFffgDiMFGf3gt7vSZfG2HFf2cGnzrW16x3fKT7ea8LEt803KrIBNogM6789BFq25YM
         saHo8B4HGKFDyxyU7uavf4rKj4Nqzh4t4cw/H17lRGIJb2bii/hJCmrZNjHoDDb4pgnU
         JFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772833545; x=1773438345;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FUeQCHJX6OavYXwy7bj/hOulhUCnwzMyCKLTg4avOsk=;
        b=tgIJN1u2Fx/BgNCYZCh/3xa18eQQmvQBga3n+2IztjQK61QttK/Ckv/s04fwDCjuxy
         6TpVEd0UkmAAte5bsBZBpMtf1uHsBR0VTL7bq28remvv2W4URSUG5bGs19mClYSf7Igg
         YAbfhSbUI/e3fY8v8h190+n8BB2JYnNBIJEgiEWxt/CKD3E7xfn+myoBJT74xYgxu6mP
         aG+WXy/GSbVJcwuK55U/nnIbdknrxyHxJqs6dfc1mfQdOWN9BD/bxKyT26ShyeYCo4Np
         eOc6cKGT10I1H8Rd2fVu+42zMyYD0/EV+DlRSbtND63cyaYaJuv3XpyL2wes+mA7G8JI
         FaUw==
X-Forwarded-Encrypted: i=1; AJvYcCW3KF0bSKxJJTEwhcX+NC8Napyb/2j4cmgPDUZXInjGmetGwBvuCwOKG12jcXnvuUEnKgVWn/I95Oqs@vger.kernel.org
X-Gm-Message-State: AOJu0YzejCrGu/vzV00WjfwTmj3qsr1/DPe7J70Fhuo5PNH38Opdw3bV
	SKuj0lUyo9h0LpKaqVbOqI5W5HvlnUE4+VFGsnHiW6HYeHwurkzlz1CDiGLp99WzO6Y=
X-Gm-Gg: ATEYQzxZPiQGggbtUS+u575rYVGPcNeWQkhVO+IDbxHYrjwhJ76C++3t8V/HebH0v5E
	vbXlDbkvR71dCehpPZfKr4TmmqGHdf5M8WValccM30CxnhlDV31oVswn5H3yeJDTIzcQgXUIQjD
	YOWGseOS8gGyz/L1aFB6XPhAxZDQ3P5xMWAVPFi8BfaqG9xEF73+tVQButFtafwnFqN6ZkW+1v9
	Ofih0RhISExKzrKZhbfJaldhjAWQS83Q2XoOMVsHMuGoE2Me5zhwT09DM+CIXOG/b4nJylh26eE
	DnnpXTa1J3SWRWCV7uKR6uHguDanpW9pJbjt6F8KAukEMUImTRGogdnUrMUoXPXw9fc9HALYRRx
	V23J+wkp+VydYsS80N6mH0IlBasVy1l8Gocj++4fzwwRlNbhIMG6rdUtZDIs/IbMpfH63d3WjU3
	VAhD83/cluk0VYWuuqH0ul89EJ+biYCZfHxc7qf5/BPymJA49oPiXZcFX3t/h8b6L54DKG0FjLh
	L5orxp4rYoSySur3w==
X-Received: by 2002:a05:690e:1510:b0:64c:9a36:ffe8 with SMTP id 956f58d0204a3-64d14203ac0mr3579672d50.39.1772833545340;
        Fri, 06 Mar 2026 13:45:45 -0800 (PST)
Received: from ?IPV6:2601:703:4183:37b0::7115? ([2601:703:4183:37b0::7115])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175d325dsm1278141d50.4.2026.03.06.13.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 13:45:44 -0800 (PST)
Message-ID: <d6867023-20ba-49fa-bca0-3837389a5588@kernel.dk>
Date: Fri, 6 Mar 2026 14:45:43 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
From: Jens Axboe <axboe@kernel.dk>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-next@vger.kernel.org
References: <e7a09f3f-777c-446c-aaf2-0e01ec45b48f@sirena.org.uk>
 <19E0B569-A6C2-4DE4-A010-20F4E199198D@kernel.dk>
Content-Language: en-US
In-Reply-To: <19E0B569-A6C2-4DE4-A010-20F4E199198D@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/6/26 8:42 AM, Jens Axboe wrote:
> On Mar 6, 2026, at 9:29 AM, Mark Brown <broonie@kernel.org> wrote:
>>
>> ﻿On Fri, Mar 06, 2026 at 09:13:33AM -0500, Jens Axboe wrote:
>>> On Mar 6, 2026, at 9:09 AM, Mark Brown <broonie@kernel.org> wrote:
>>
>>>> I suspect I ought to be applying a merge fixup however since the block
>>>> tree obviously isn't intended to be in the state it's in anyway I've
>>>> merged the version from 20260305 for now instead.
>>>> <signature.asc>
>>
>>> What branch are you merging? rw_iter is just a test branch. Next should only be merging my for-next branch. I’ll check later if I messed up, if the above commit is in my for-next by some accident, just drop my tree for today and I’ll take a look later when I’m on my laptop.
>>
>> It's the for-next branch, the current HEAD of which is the merge
>> e356b1868a62cf4a650b451a7296ea4762038666.  The first parent of that is
>> the fixup commit, the second is a merge up of block-7.0.  Looks like the
>> fixup ended up on the wrong branch perhaps?
> 
> Yeah just have! I’ll sort it out, thanks for letting me know. 

Sorted out now!

-- 
Jens Axboe

