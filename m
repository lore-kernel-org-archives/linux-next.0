Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E94D1E9906
	for <linux-next@vger.kernel.org>; Sun, 15 Mar 2026 21:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773610124; cv=none; b=LhDsYn60XxgdfouJKzji7LodFi2xTdeS8RreNEtbAPKypChokI7E3zYjKppv1zGPL4O7qMuL9ByW1RXAiI9chZVaAAfwSy3bPXTiux4K6LAgODrpeE6SKZ+h0zNPyccwZTY3cY9U0MqrzJuCek/CStL5c/zXjmY42tvj8neM970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773610124; c=relaxed/simple;
	bh=33Ei/Cx6y76/GuW3dHB8xRGpWvu57XKkBVoDSUz5sis=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=mWTyoG5FQRRqQtPvEXjN8hrk6gusom6EzUlY2o8E/b5OAuK7r6nIpJ7h/xfQR/5tyOf+6C6TI9GzDxgVZYP1wQEeP1DRPjxpthkgw8JxyxJlC4TZSG9Lp9aRhW65fta437lTQQuRPh04T6udjKKNu5kly4CnuaSeFZrtaY6yatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b=VL2p1ZMz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="VL2p1ZMz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso32673245e9.0
        for <linux-next@vger.kernel.org>; Sun, 15 Mar 2026 14:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1773610121; x=1774214921; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jG1xuOlr070uLd7cFXXjPHwDtRI7u7J4sRyqYVKjVY=;
        b=VL2p1ZMz27160PJuMSEFd59lrKtRxn1OuvdGami6uy5KFQ4oKE16creuXzO90QfMJ0
         0m5OaYk31CqSpjAiz2U7idx6U8ckNTTC3bWDScrP3aXxlWoP6pkPxS5AfNC7MjMzM5G8
         G8AqzMC3kjNdiPJluR5H+A2N0HnwAOZia2HRkjrP4q2WSo74NZ7m4/y/gFD+zsH8oNPo
         OayTKwPmcMpFPPkSAqvM5bCdS0cYcOoORHWfUA0SQEkpfgYSt4Q+59a6Jmes1EE16I5O
         BNNI5NCphEAmrm4hegf8zij6/hGmd2UBMFPvgXM19SljLoGsN/RcQcrzmVGe2hZxurCy
         YXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773610121; x=1774214921;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jG1xuOlr070uLd7cFXXjPHwDtRI7u7J4sRyqYVKjVY=;
        b=QW4/x5sNCvDsJ5pD6h8Hh2XLLPYgDtEX4PDslgvdfw/ZkX7SMjrobrBCEQAvijReOx
         1XSXLVHu3HUx3/6TW0YL2qpt/ua4sChmkQ/zXlnmvU2kZ/zJbcjTbJuPoj63mJIyu1hW
         RwErDWeUI0/bCPHE7WiK6GfhfTDeG7bgZGDLnDro3ZXh0VKlVmIM26v7Zk09qz/JLBnS
         c0j7+NM6V5pKlhwv8fAiucuJfi0AQedYKeYJT0XVDb3hPDdLTRqDqANgcTZ36FlRab2e
         /b09O8pcpySA4tlxV4Nf+yhbUXszhG1cdtAL+Xi4DAaxR8k/Vwy5JEfsw+wZ60+Rzv35
         N/jw==
X-Gm-Message-State: AOJu0Yy9EpnyapEd4XIgmbPo85uhDhkJKeR/ZmzuWsOidhmSE0wTihRi
	OJ9GNv/UeDRRwZthFE58kNlj+DF06l0+0RhcJZnMyAXcGk4NqjwZRmHirYuZkw58UUc=
X-Gm-Gg: ATEYQzxUGvAj7kP/Ax7ZKDDWQe3ybF4Z+2uiN8ar9+1FX+ETVDwTvfD1vux44Y/u7wi
	vN9wI0FV+WT+2Lsh3yJu4kVxo22sLZ1fhRO0zKN9TL7JAPk1QsSgFKGlwsEKXX3QNCD54Qp65et
	+cFE2Yl1/HvvIjf9wkKkLf17uiolQaz1jMi6WIaZuzpsfBmmU3VD/N3CMLVkVfO+wqHA2xeJn3N
	YMkTxS56kBDB7FyNnYwcM15IAD7YVgtzxJw+eo+apFEz1/ypO02IQ/DY3Ojrv5B2F973/cdoZ4M
	Ngu6ioBIkqDpCiqs15KjmVJQpWKXnqqSakAMXWdGK2jIKIfuAQwZGP/HskfQ8TiLfg3+k0AJC6S
	HUiIU0NjyU30yaddmLRcm5nlj6Zv7e4k0GNBBr36I30HS4Qk0pplqwEHB3A9Md6PP2q9+hpmYul
	wh9ofwakOyVTpw2kDYXUfAer4Ie3JrQk9+siOMEjvo0eIW3MW83/1ONlko01+dZPa2ffw6wgCE+
	iiJFbKmbx6uGmY=
X-Received: by 2002:a05:600c:4583:b0:483:badb:618b with SMTP id 5b1f17b1804b1-485567050e9mr189048065e9.24.1773610120286;
        Sun, 15 Mar 2026 14:28:40 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at. [82.218.28.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm522921465e9.9.2026.03.15.14.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 14:28:39 -0700 (PDT)
Message-ID: <0b11c582-ef6d-4998-94fb-3ff606903481@linbit.com>
Date: Sun, 15 Mar 2026 22:28:38 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: linux-next inclusion request for DRBD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

we are currently in the process of getting version 9 of the DRBD driver
upstream. As this is rather complex and requires some large changes, we
would like to have the tree added to linux-next first. The tree is
available at:

https://github.com/LINBIT/linux-drbd drbd-next

We will keep this branch updated during the next few release cycles
until the patches actually land.

Please add the DRBD maintainers as contacts.
M:	Philipp Reisner <philipp.reisner@linbit.com>
M:	Lars Ellenberg <lars.ellenberg@linbit.com>
M:	Christoph Böhmwalder <christoph.boehmwalder@linbit.com>

Thank you!

Best regards,
Christoph

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

