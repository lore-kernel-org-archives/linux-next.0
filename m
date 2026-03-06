Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D5429B76F
	for <linux-next@vger.kernel.org>; Fri,  6 Mar 2026 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811760; cv=none; b=d/36FS3/dbBbihtVOsOarGldY/dqESXpDG2roqPbl3ehGZJDK9FOjUQwsNr0PdjRcg1Tq6yP94DtPfXtvvjCJ9AxhfEPSG5/usukC554c9LsAQbpxemuQR8OJB7WNn2HkMwZhAS2JkmfjiOa4oPY13nxCKKu2AcrEJW5oFSgOAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811760; c=relaxed/simple;
	bh=zbnb9qEu4r5kFGVjr4gr25RHs/KZHxbNqBZ3W/oYT04=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=OYa9eG/qs9gaFOhtBIGX1SWwzWeg0G3Dk6CEgr/sQx08osIEeZXn1vwZCgJQpFLaLcgh5ePFJjy2KobpAFdjMSr91StzMvo45y6Bf6WRlN6CSk3Dq0U9iWJwfI7EbaSZj88+6k44WM4XVUtTQtQzofnzGzTU1TrcXx+7b0X8xkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=HdYNzaEo; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="HdYNzaEo"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d598f60eeaso7040415a34.2
        for <linux-next@vger.kernel.org>; Fri, 06 Mar 2026 07:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772811757; x=1773416557; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sO/bBNwgjxlDIgCtRV0T8xOQKKnpxyENZ3fIK2wOD0c=;
        b=HdYNzaEoiAv5ndA2+fzYnOMqmxnmfB6juJEp0RMO6WxGa8rijojrzm9yobURZ+ikxG
         lT30nrtPojuEN2ZAuiT6Rx/OxANH8sZb6lWXqojXjoNMs3POoxNxr/WOKzKkEuKSYYBD
         Iw7+DoZ6xvolxW3G8PpC0u2TKiWyl2B69vAk5NkDJd1KKb1ZDqEQSUZwqfMX4ry68yv3
         a3nApS/HOF+yI3MEYeBzxXljqNRyoVJIBxddpWCv+2/IbKZMH5jCOKHZlH0af+vfxis9
         AKDmz1obgGDQYmp1e08FHg2IQFobWcuVvFxUvIFKBztnswke/SSVdzYN46noAIRYEGAP
         ECVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772811757; x=1773416557;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sO/bBNwgjxlDIgCtRV0T8xOQKKnpxyENZ3fIK2wOD0c=;
        b=rBeI45JHxadYYcGVnaBIK1QggdS+tucw5dOPx8SRobKRoOfP7w3kAzMShkC7vaOkSn
         W3WGeu/8kj97s4ObCgwiV+39SeRFb7lGJnn5EXh+IOGOdDJhk4UfY5AhTQ0ml9E8SSky
         AHDAjlbW3II8k/X6jJypSgs0x6rcCzIGyLcZy4jlBc/2e4ZbuV8nFFGXCTIK511i2tuw
         jU054JPXNJR1kBcKO8D6XwgNaHjj462RXBKfa4AgYleEUcKpG+X/0pV/hL88YLlu9TTu
         NW46GjXj+rq5Y/7d4VTUHLo2tpVdWHOencids3KPaUTibBPdmHLoJNG9PFJxBxdrEb2C
         mYuA==
X-Forwarded-Encrypted: i=1; AJvYcCVdy3gColPGX14EoTqzmQVWpguXniBaFBcpw/NOoMNxYNSVg8lwllraVrEFJOrEN6cIMfrEPRFpHpnW@vger.kernel.org
X-Gm-Message-State: AOJu0YzW0Tu2/qE07YE4okqDqo/Ybed20LU5keWAcwFwinQJPpOREp57
	4fzu3E/SEpBc3xAjmXbsP+JGgtsrzbKkHxq9JUhJ8ukqrLsz6dSIUAKuJHblJT8Npjj+3SjtgW1
	1hiWH
X-Gm-Gg: ATEYQzy7lILOIOFV0E2x7ceLqLGLj0mBXQudIw3HOeSgetcF16mONZ0xlyBnUrIRmEW
	lyAom5COvYpNDXI+Xq158noc0Gvyq8tE5YAbWNvIAmesH9oLQL29tKojDOCJji9GjPs9jFjO+hV
	TU4lKJ4rmuqcoCRgIkO+avsRxNgaqLx44XbILXNF/evoHH3ihnmIeLIOKf9avIAlpX6dsVbg7QY
	W57jjb/YFusY1fLTVv/s2WnwPdlRwmW4TBJxCvDyLjU194L9CBFbfd1Q9UIqmPw3LMYorwos4QP
	hTutqbPivEV6WhTwzvnlm5h91jQlptI330WUQrZ50Zxq5OuUpQNSqCiy5YBs+7C6JVRRLayqxwC
	ySngsaGUVGAiz6PDx+tBT0zc9a9skPqFM1juWd9xcll+Bm74Ktkbf4kqfT1Xuahb+AjIAWVGoX0
	+Y08GWQd2JhccWNTF0CReFNUL/oM2wYIxfTBfEpRk5/wUjGCTF/f/199v+wXiTIy4T5eUL1y7ka
	g1A2YtgrPcKfdicCF8jJwgqBdhN4Bh9Tbo2SNQ=
X-Received: by 2002:a05:6830:3811:b0:7d1:9572:9111 with SMTP id 46e09a7af769-7d726e73cbdmr1647778a34.1.1772811757387;
        Fri, 06 Mar 2026 07:42:37 -0800 (PST)
Received: from smtpclient.apple ([2605:59c0:119b:6708:954a:2978:67c4:6498])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d728d12337sm1060250a34.14.2026.03.06.07.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:42:36 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Jens Axboe <axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: linux-next: build failure after merge of the block tree
Date: Fri, 6 Mar 2026 10:42:25 -0500
Message-Id: <19E0B569-A6C2-4DE4-A010-20F4E199198D@kernel.dk>
References: <e7a09f3f-777c-446c-aaf2-0e01ec45b48f@sirena.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-next@vger.kernel.org
In-Reply-To: <e7a09f3f-777c-446c-aaf2-0e01ec45b48f@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: iPhone Mail (23D127)

On Mar 6, 2026, at 9:29=E2=80=AFAM, Mark Brown <broonie@kernel.org> wrote:
>=20
> =EF=BB=BFOn Fri, Mar 06, 2026 at 09:13:33AM -0500, Jens Axboe wrote:
>> On Mar 6, 2026, at 9:09=E2=80=AFAM, Mark Brown <broonie@kernel.org> wrote=
:
>=20
>>> I suspect I ought to be applying a merge fixup however since the block
>>> tree obviously isn't intended to be in the state it's in anyway I've
>>> merged the version from 20260305 for now instead.
>>> <signature.asc>
>=20
>> What branch are you merging? rw_iter is just a test branch. Next should o=
nly be merging my for-next branch. I=E2=80=99ll check later if I messed up, i=
f the above commit is in my for-next by some accident, just drop my tree for=
 today and I=E2=80=99ll take a look later when I=E2=80=99m on my laptop.
>=20
> It's the for-next branch, the current HEAD of which is the merge
> e356b1868a62cf4a650b451a7296ea4762038666.  The first parent of that is
> the fixup commit, the second is a merge up of block-7.0.  Looks like the
> fixup ended up on the wrong branch perhaps?

Yeah just have! I=E2=80=99ll sort it out, thanks for letting me know.=20

