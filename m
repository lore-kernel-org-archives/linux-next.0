Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C33D669D
	for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 18:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781634671; cv=none; b=LWJKOOJK7fbOWS2KCi6uL9I+D00rGbS8WG715y0UaTthi9CWirvXeXIL4x7G3mpE82J0pmDgs1h3iwFjT6kJ2R9IpNS8dbZqWtj2EE3oV/k7SvmkPPm/YctUOg4qcOpcg+zyk1c35VtJHMtvcVdSTZdSy3VG8n0bSjIVQstKk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781634671; c=relaxed/simple;
	bh=UogYtRqBiVjHWJC7z8/Zh+EB+hJzxz738BDN0Q4YOLI=;
	h=Content-Type:From:To:Subject:Message-ID:Date:MIME-Version; b=Ylwk/N1J7EdUyIXMZWyr62FpJcHrx7K9LJyd2E2CwRn5HH0LwmuGOzNdST5V+l0efi9qLxWyZud0MlHI7ioJVcnn1LBG2EOEnmrX8Ed2/WyeiH6PGEFDEcjix0JkaaH+mXaVaDzptHo4t5mbtbwdR4QIDoF64gk1YHfQYMP6un0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAlKbaWK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAlKbaWK"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef5146b56so99859f8f.0
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2026 11:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781634659; x=1782239459; darn=vger.kernel.org;
        h=mime-version:date:content-transfer-encoding:message-id:subject
         :reply-to:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UogYtRqBiVjHWJC7z8/Zh+EB+hJzxz738BDN0Q4YOLI=;
        b=oAlKbaWKUc2nSytXGspev4Z5GUxkv7rWgKhmiI5gys6otbeoLcLKZAl8M9foNQ6k8K
         8z9bVcH135/l96hKKVXVrQndElHB9i4QSVIzzJbX14GbMQRKpteHjo87XCR9U0QYxfTM
         0IomoQxbyerNsV0HKAbZFEIQmsHL5mv5kfNPCGOkaAaoXpbJN5LdTERX6lHh4bjsaeaY
         Q4ZiTD6esVONpJI95dvfQqK9+ZDT2b0YFne2EKP4ffBMzHF3oMupAbghcG+AokwoKk0F
         sVTkQKq+RIi3OGHlf4LoL1Trk1663AM/AuymuFku6RllRa2Dpeul5fqceukEjT+Pf3MR
         QqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781634659; x=1782239459;
        h=mime-version:date:content-transfer-encoding:message-id:subject
         :reply-to:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UogYtRqBiVjHWJC7z8/Zh+EB+hJzxz738BDN0Q4YOLI=;
        b=iqsGv9CYUIJpUcTL0W7YMkrNK+I4YGFxvuQHYQFqEmtEvAxwvSCHclLf5pTq7AHamf
         3PT5kf3uqYtUqSPzxp5YPBqv3Oco92TRTc+/SCo8uGMEx5EAA3OIHODzHOxpKWkabrh+
         ZYYXKFgisiJYop+1NWpUqzJ+koVY87tDzdYybJGJjUAG6fczH1x1ObuhuCN9EvJhBXgN
         7Eh9DLcdwt/sAPeBmSeGQzYfJw7betOIkM6Cm8r0upV8t81tzC2ERZ+NEZfgTEuOIrKP
         U5ACtl6D1xqhRqc8N4giA9AKztSyWqHhjSqhvlAF8+IxKUoXvSuZDNzagLH6VV/I1LWU
         T+ig==
X-Gm-Message-State: AOJu0YzG0LTHsuz+8zQVtCf9beTi1by07BWZrSP+FsZwKX9ijjaWgRTP
	sk/92vWQeW3uEdygjNFNmiJJ1sC3R3Dl+40wz0rLcC/H3RjinUN0XzC5/MXih/FxICY=
X-Gm-Gg: Acq92OEU3JMS4epBRqafikYxkuO8xDNowlhn86zaGq/PaPnl/4wON0+MtFt89/2zDN2
	Cosf697JLuY03YsPzMeeO5s73Kdk6YnZYK2+o3U1hf3b50yghPP4nL0DjOkuGqrEeTqK81ThL1Y
	gxUw8F+bTFp62bQW7cCJMDG3mp6F//5e7Va+0B6Fpx1st7Y2h9QMXp89FRh0v3WmpbwWWpkvnOX
	eDCmQ+rMT6ylwOqKhj5VNgFtSQcH6dsgmuJR+mdxysBuEZkM0YZYviSDtfjjEZp7UuEku6XMpVw
	6bE4RIkdR1HZuXtQFHOo8xO8dLGfGBfqnShCMEz8k7nUEF4qwNnbulECMYbR4RViaaitDYsOr9G
	YBTc4rH02mwnh2GI4W2Fz7JszH5TFvsItDscmRWlO5f6cYjb6muql542aH84d5bw7xgbECg07Dc
	YzVw57VUe1tblDIAziEQFh+yIrxVRn+Z9+LAmfFg==
X-Received: by 2002:a5d:6f08:0:b0:45e:73a1:8d04 with SMTP id ffacd0b85a97d-4622a7dad40mr1512385f8f.1.1781634658819;
        Tue, 16 Jun 2026 11:30:58 -0700 (PDT)
Received: from [127.0.0.1] ([154.80.21.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619fb12edbsm9303602f8f.17.2026.06.16.11.30.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 11:30:58 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
From: Donald Marvin <kodraroland601@gmail.com>
To: linux-next@vger.kernel.org
Reply-To: donaldmarvin.pe@gmail.com
Subject: Project Takeoffs
Message-ID: <a5c6f32b-2132-d4a7-7dda-5ce9193ac95f@gmail.com>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 18:30:58 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

It comes from City Estimating, LLC

We specialize in full cost =
estimates and all related bidding services for all construction projects in=
 all 50 states. We provide our services to both general and subcontractors,=
 as well as owners/developers, architects and engineers.

Feel free to contact me if you have any question or want to see our sample =
work.

Regards,
Donald Marvin
Marketing Executive
City Estimating, LLC
