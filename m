Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561800;
	b=bIYZQas7p0NMjPdivj6L8svcf8MQMP2s0UuZA4MdXuCZNTx+E+4Dw+QNkyrilcPL91Fs
	 xFYwdrqogLgEeUzCbYxmCFhccOb3NqFJS6eOKN8UAUtxl6XTtWa7oe9rpd6LGs0qjU+5n
	 6zodkeQbsUpnGQIxYQyCGikbe9KlXm4gT61cMNcIxHIcADkw/FkdTnyjX6PykEDQh1ybL
	 jDWRi9WBNDKJ7OKQrsST9Zmxn5DDOMBjz/tMUbKneV5Hn3z9fexKpnK8irf2rJrPBpL7G
	 tXwXjG1FX0a/QaI//htUj7vH92eEUTalZsREb0wwvL1VqABxP4qwK0tcmfAQAdHkwgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561800;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jhT8LtsJSb8QVNl46dCzwpIOZ7q30r8sf5zR/55MKKM=;
	b=txWL/iyHRgMNCf0+Kf8TGdeDs5TRjA78wBOGFxNzywgPKqs+IAwn2ylHw07CnZ1HM0iF
	 memOncdHd4bVn+ehT8+A6scW/ReBBADhJvwAt7/O059j1f7TIXor+m37kVpPCRQ9sPO1D
	 lFHh/eRHGP6TUpPDGiwuUBjziudRCJtRyBWvhiXUOKPkm68cdjm0CPq6xAaJQ2oDNd3pN
	 V5kWHzNo565qKJUpGhYzRIlhMiOWHdnulyqhQnkUOLU/OCn/bGlOicEzgKjhVp8uxnbkz
	 Ihf8EOIcQLgaQa5b2GEm6ueIPcQKpxIWOcsQFbjwvCbOjpE81Bjlo8ZI6Tac3OIM4lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bamJArbo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FD0606A31E
	for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 23:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bamJArbo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02AE1F000D1
	for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 23:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795561799;
	bh=jhT8LtsJSb8QVNl46dCzwpIOZ7q30r8sf5zR/55MKKM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bamJArbo7ASD0ch4tNodbHkx8EQtb+DJUX60p4N/YmRXW/YVXWsR57x0KDvK2ZNkP
	 hrf5D/7G1gY5HUR7c9Ewfebw7h45a5CO7naO7erqzGHcewQUNFrrJ/jT/3W+ONUSIq
	 lJ1JZg+PYHpkbqJU1qZyzvUS7YlOg9EfZnB/3L/pb70XBYXmsrewlDqXZRwotqHVgT
	 8AT7eeEQLStvZFUbrhcnNLeN2tsK5ys065gLlubpZxlVjmcSLiBmsMWCDd4n4OifMI
	 XWYVi31fht0Dlvl5TRMdzMFTE0GX/us5/6YJ/2quNfOg78QLMW5UnBjIru4WMg9Uem
	 uewXM3qgwgJrg==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c516a192844so444144066b.1
        for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 15:09:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGb8BzoVJpLbMA9D6LN++CYQsJTXqHnIk9/d0foR2V/JnwBXdJtzOS6egrTuGClvLwm234x4fiP81Ob@vger.kernel.org
X-Gm-Message-State: APuU4Z/LsinZq9X5ltqdbQJs3NO/n6cgwSa5MeVmvB95gxBq66B601F8
	rou3YFKQhBYeARJju1Q4ds0zVmS3cloctxpTYKKbL7tjf9bAz7Tb932Dm6kwclZ9kESNsA7ALDn
	tvprIMSjUH6v4mmjzqjA8W5seN9YbOcw=
X-Received: by 2002:a17:907:9306:b0:c3e:e677:5608 with SMTP id
 a640c23a62f3a-c513a5da8d0mr1279513666b.12.1795561798427; Tue, 24 Nov 2026
 15:09:58 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124174726.2223430-1-sashal@kernel.org>
In-Reply-To: <20261124174726.2223430-1-sashal@kernel.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 25 Nov 2026 08:09:46 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-DRpoYgs0sAKcQEOzFRgV61xw25iw+Bpd7J_y3WvP_kg@mail.gmail.com>
X-Gm-Features: Aa3M54qY8g7RrUxDQKkEFmIukaXDceRIy7iERNeOs12-ZdsiYHR6ozBAnFpB220
Message-ID: <CAKYAXd-DRpoYgs0sAKcQEOzFRgV61xw25iw+Bpd7J_y3WvP_kg@mail.gmail.com>
Subject: Re: [PATCH linux-next RESEND] exfat: check the emergency state in exfat_writeback_range()
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Chi Zhiling <chizhiling@kylinos.cn>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:47=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Since next-20261119 the merge of the vfs-brauner tree with the exfat
> tree drops an error check from exfat writeback.
>
> Commit 788f21d1f192 ("exfat: don't set SB_RDONLY after filesystem
> errors") in the vfs-brauner tree switches the write side shutdown checks
> to exfat_emergency_state(), which also fails after a filesystem error.
> One of them is in exfat_writepages(). Commit b900c61a3f21 ("exfat: drain
> dirty pages after forced shutdown") in the exfat tree moves that check
> from exfat_writepages() into exfat_writeback_range().
>
> The merge takes the exfat side of exfat_writepages() but keeps
> exfat_forced_shutdown() in exfat_writeback_range(). So after an error
> with errors=3Dremount-ro, writeback keeps writing dirty data to the disk
> instead of dropping it as the vfs-brauner commit intends.
>
> Use exfat_emergency_state() in exfat_writeback_range(), as
> next-20261118 did.
>
> Fixes: ce0505a38004 ("Merge branch 'vfs.all' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/vfs/vfs.git")
> Link: https://lore.kernel.org/all/20261120003508.2135492-1-sashal@kernel.=
org/
> Signed-off-by: Sasha Levin <sashal@kernel.org>
Looks good to me:)
Thanks!
