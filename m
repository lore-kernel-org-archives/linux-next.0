Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DED128816
	for <linux-next@vger.kernel.org>; Sat, 28 Mar 2026 01:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774660591; cv=none; b=WyaniUshxSCb2wgpW9et1BTO+NyDHW+ZG0MZW2JVIPtPyb4fbfLJCLnpVUfTK/G/cnA10kRt5SOTN4HNlw0mMp6/9NLNMj4wWOAbeuTQ4PCMXiav4qGk1i+foZw+4px66NBd0/7KJuJQI7gTZ5Xs5pEchUPr6R6Xxz1/KRhXQa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774660591; c=relaxed/simple;
	bh=P9MvzbD6wnBlxQ7eVLGhGvgVXRXnqMoD/gYoT9ngE1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDh2NDqk8rvjHJs14fn6HYzKWOjys9r9pAhfguEUOXUpYrXEvvKmcnTPiOKL+k4lv8orSnUSn4lbbYakrQWAg6hRQoY21EFmRtZJ2qbAIaJtr3UztychispLP5XnEipy7Ti9dhosydajb9n399ssaYNtwv4ZRQzTj/hHeBgGLOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpfzzpPW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpfzzpPW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B49C19424
	for <linux-next@vger.kernel.org>; Sat, 28 Mar 2026 01:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774660591;
	bh=P9MvzbD6wnBlxQ7eVLGhGvgVXRXnqMoD/gYoT9ngE1s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LpfzzpPW8Og783KJ+r4ktCLrHKysIZKFtncA8DfARVPyrn8mu43C7wi/6GHaGDO8h
	 TFUBg4dXNGmOCZlNGrz5NQe8U6/S+UF2VgFPolkXlnAm+opuY2ucbFNkgWXQmX5r55
	 W0cS72PJbM72Kc06tfDxbl85tUAhp8MB8h5OOzx5tBtONdFkyuCfLmx38Bum7OVdEH
	 mVc01Z1A4/1M+rwb/L/lyCMJgOrk/pSirREfhrwGoWosnV+Zpz1/12yQ1ZIW4I2wdK
	 TdjkfzFROBaYExYDmETiadROWyrDs65JR7cXkisUQzQ2OirugzMRoewS3OoR6EZotj
	 Ih+tXwd9tayHw==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-661cfb9f3aaso4107696a12.2
        for <linux-next@vger.kernel.org>; Fri, 27 Mar 2026 18:16:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQ6e9paT7cvq0PyGxbKX2xjxz/Wf9ohPxueCIvxt3JnMzk3uI0UFhRdPYpOKYZSwiF8NV6IjU1gxfI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2XEgHF1W7cXZPVCyVBQOCeemcifOv8wFmO2bA2BCJkt+KsaNH
	WPmwlaP9QJzcF4NEXh2q+hha+IuwcsRr6bKS5RiGdPcbGM3yXBKOy4hB2gNRS+BnK+cqCGvnF/d
	jdO21gKLtfSuKYVX1kI7aCPAKn0d64qU=
X-Received: by 2002:a05:6402:21c2:b0:66a:186f:ba1b with SMTP id
 4fb4d7f45d1cf-66b2836a468mr2323949a12.5.1774660589969; Fri, 27 Mar 2026
 18:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <acbY5CCmsk8C95m5@sirena.co.uk>
In-Reply-To: <acbY5CCmsk8C95m5@sirena.co.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 28 Mar 2026 10:16:18 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-G=E8_X_aTXE9qD1bU+Q8FNoqpd_4+i7s4v7KH-teN1A@mail.gmail.com>
X-Gm-Features: AQROBzAkC9l1nn91flZtxYX3XfEHeTNPz2C7bi-IzoyOfWQ10TFbSIXVdDKfjVE
Message-ID: <CAKYAXd-G=E8_X_aTXE9qD1bU+Q8FNoqpd_4+i7s4v7KH-teN1A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the fs-next tree
To: Mark Brown <broonie@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index 9a30c32b3a0526..82db5ebaaad7b7 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -839,7 +839,7 @@ static int exfat_file_mmap_prepare(struct vm_area_desc *desc)
>         if (unlikely(exfat_forced_shutdown(file_inode(desc->file)->i_sb)))
>                 return -EIO;
>
> -       if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
> +       if (vma_desc_test(desc, VMA_WRITE_BIT)) {
>                 struct inode *inode = file_inode(file);
>                 loff_t from, to;
>                 int err;
Looks good to me:)
Thank you, Mark!
> --
> 2.47.3
>
