Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD0C72631
	for <linux-next@vger.kernel.org>; Sun, 15 Feb 2026 06:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771135369; cv=none; b=KxfXR+i3vM+i6SPKRk3cV0mHD0e4yLPqh7u8jntxqAW+QY2nPx/QB96EwHJzRdEN488rVfmhJ/cysoz5A82k8ESaOfNNMnlf7plTU6c2/aFaQ+aKGSKl28hbR0AQs8yZSurVpciinbTaEizop/fzf6TVUEZhX/6WZYqbYMzK5kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771135369; c=relaxed/simple;
	bh=K/RPztt6qKqG3y5NRAnKMu9JsGWrZehzSNtOied5XL4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=G9v8Kk//FWd/UV9SoDK4SroKsWlKEiMRJG4MffIUVNGdbN2l13CHbJWPTjal2exXLyMxKje/TJfg+r/BrhTqGfWlWVCIEfQJRpe1gWv1X761VTOTYibTg9N5sLxZipAVb1tnOMRKhhYIOGGTUKpcixAp0zZsohBmX79j2+/Y/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oz8yhKCN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oz8yhKCN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B604DC4CEF7
	for <linux-next@vger.kernel.org>; Sun, 15 Feb 2026 06:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771135368;
	bh=K/RPztt6qKqG3y5NRAnKMu9JsGWrZehzSNtOied5XL4=;
	h=From:Date:Subject:To:Cc:From;
	b=Oz8yhKCNniUnvas2BupghpZMAPcjI0J4ZCxFFn7+FEOI50qdqB1+eLrb6TGdF3apJ
	 3B4ReVLBjubP0ekMOYUlqNAgdKBm4pNKGbbH5nn2YXJoYlerp4HtSM4awl4BlWZbMk
	 TWqnX2n74TekcsC1/nBWLsAFs8YFRWnr0+1ivYrcymFhhjwiN6aMlFfd5IbWMs0gKY
	 fBlYWGFIZP7Tapf198AR34KrLLUAk55sXAEnA3BZsD/8ZcfE+vP/yTC/QqjjcUsRan
	 psmo7btlt/jQovDzIA9ltiBRf+Bn4WeFMQ4lDB23/+OiHkqC4JPP/EhfacS0RY4ylm
	 5UPc0aSvw33tQ==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b883c8dfb00so408470366b.1
        for <linux-next@vger.kernel.org>; Sat, 14 Feb 2026 22:02:48 -0800 (PST)
X-Gm-Message-State: AOJu0YySN0v6dUpCyy5MG18dw1tDDB3p3ojGJbzoTV4YQII6smWBw8BF
	mmdMkr057WMzjuKljt/XNRLsTC3e/12D6gMYOtggQIrvQc0nRiWJFnbqADPhU/UONoQcIbL2Wf+
	lB54OfpKqXZYTl5CmrV87uLhG02zTJgA=
X-Received: by 2002:a17:907:9687:b0:b87:2f29:2060 with SMTP id
 a640c23a62f3a-b8fb420f8admr390821466b.26.1771135367297; Sat, 14 Feb 2026
 22:02:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 15 Feb 2026 15:02:34 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_rfwTt+uhOgBa4mEO5j0CQhZdTp=YcoU2RCng+scDbXQ@mail.gmail.com>
X-Gm-Features: AaiRm51vDumabb3NG-FzzElnKQp8OEhtj1IOKar4K7D16xtU_lwX2yoXgbK0n50
Message-ID: <CAKYAXd_rfwTt+uhOgBa4mEO5j0CQhZdTp=YcoU2RCng+scDbXQ@mail.gmail.com>
Subject: linux-next inclusion request : ntfs filesystem
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Could you please add ntfs -ntfs-next tree to linux-next ?

git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next

Thanks a lot!
