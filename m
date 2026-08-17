Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3566330568B
	for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 06:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786948016; cv=none; b=E3QY+4cIBVo7pkBxFJZecHAfxogSb7c+YopIEDrB4wdhVdQ/vAVWCj8c1XC/nkouQD+ZobPNrwmHTOpcIPbSOLrsNLHINflelCmmZM48X5LjtKwwNNLZ9vYvOMmOhyPffYvqOUXb0yKMtAYEY+fw0DNEu5rTpsBYsHrQd46RM14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786948016; c=relaxed/simple;
	bh=CsPuGY6RlGx/qdNh8lHyjNMQH+eLf1dH8ekAFVs+Rqs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BGtBAhbi6L4e8Vi8JrDwDt2IKt/DnLSRvkXQBoizvPyBWmfcu2z60vBz7yJohAmxQUL1sNRXv/71iUttYoPK0wfYkN9paDhSRg187dPmnf4FGykNTVcc8rP1k7Wcvw4tjRCSlTRbEPrjN/f82e2A7razWxNdxyqpGdSwIcYuuWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZgjjoZC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZgjjoZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B981F000E9
	for <linux-next@vger.kernel.org>; Mon, 17 Aug 2026 06:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786948014;
	bh=CsPuGY6RlGx/qdNh8lHyjNMQH+eLf1dH8ekAFVs+Rqs=;
	h=From:Date:Subject:To:Cc;
	b=kZgjjoZCInltjm6bgCrwrOCvdpa/tZ7jXO+UynRLSWvHdibIVKkhBXmsLZqcGpmqx
	 K7iFVT3j8eE5P9jAowbaGunjRDABPu44EuyM24feDuzhruYbRslwWzFQbMaedRnwmz
	 z6r3lHK8KFq/wd3W1LMovpf/6yVjs3s4itZ4l7QdAoTeDAnz/W4sQVi7qnIXc+4jpq
	 UnJbjD6y0W8CtElFdYopcLSoXIFi2sCmYmyoPzcK8Do1vBbhuGqKfuxX9sCa5tLl5u
	 UE6F+DTZJKNErjf+bdnDtB+BuSCMOxu71uuuP10oGEDF/RTlhQPtGycpw5m/sMs4dR
	 gg4ffDUDxaAHg==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c20ce3c118aso558397866b.0
        for <linux-next@vger.kernel.org>; Sun, 16 Aug 2026 23:26:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqX9e7eQ7sP4tTUzK4+vWu5gXK4GWB8ug9p0cXJsFesUS4tx03r30feNBFdnrAwsUb61iAX3T0RK6Sd@vger.kernel.org
X-Gm-Message-State: AOJu0YzaKEdukn7eQ12BaX70vEnIWJWkscjw68ZR1P1Bf5BBOq3+J9B7
	99C8jF+lir5oiuSE7hH8/s4Hmp1We3Pp5z+N8uHwUZXsim4lQ+6tXT9y8VOJXiQpibjUGLLZph2
	/7b10HJZsxfPBR3QRcVBpLC/fkaAlFWg=
X-Received: by 2002:a17:907:c491:b0:c1c:2218:f317 with SMTP id
 a640c23a62f3a-c2109e5c469mr1290923466b.2.1786948013523; Sun, 16 Aug 2026
 23:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 17 Aug 2026 15:26:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_-ZXHbfTT=2Hwkaujo4Jt1itQ1xd1gaNt=A0LjjrgR4w@mail.gmail.com>
X-Gm-Features: AcwNN1VcCIPM7fuOfH_Pj_HmrfxSXTY7Nt_QRDoItiuAzkJgnlqAPT6YIhoSPjA
Message-ID: <CAKYAXd_-ZXHbfTT=2Hwkaujo4Jt1itQ1xd1gaNt=A0LjjrgR4w@mail.gmail.com>
Subject: linux-next: Update git repository URL for ksmbd
To: Mark Brown <broonie@kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Due to Steve's health issue, I will be taking over the management of
the ksmbd git tree.

Please update the git tree URL for ksmbd in linux-next as follows:

Old tree: git://git.samba.org/ksmbd.git ksmbd-for-next

New tree: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git
ksmbd-for-next

Thanks!
