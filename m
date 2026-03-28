Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560B1315D40
	for <linux-next@vger.kernel.org>; Sat, 28 Mar 2026 01:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774659681; cv=none; b=DRl8EGTy9o7QP/Fc7KX7yK7HvJLJtJszlBZ2blCHqqQPazfkgZ907LJWlh3Kk0m40rm942slTmGFPvXTcYfTy0YvReDiqX8V4nicNQaMHhgqP2aGmTpV7OpnAMGxVMXkDFUX2GlnP3jHO1F4uV/EYURcZfklmZ6z8DT0Sa/JIo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774659681; c=relaxed/simple;
	bh=0KQ690zeEEZrGVHICVDA/146V+XuGl9aCKfgWN6pEtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwgt/EhoaAvUqU+OWLX9VCjMGM8uQDrquebcY+nzw6fG6l0UfY6WsXxcIrMKVwF/uKeZX2NwYGYC+lR+3n1VqQh3mnr2IurV7/EZsRVU5UL7QOxhGn3+chQp4lH52vsPWuJGtSY5t8yf9+JXYY6c1CEQG0SYorBN2HtQe/YM9QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtPsdu2s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtPsdu2s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06572C2BCB0
	for <linux-next@vger.kernel.org>; Sat, 28 Mar 2026 01:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774659681;
	bh=0KQ690zeEEZrGVHICVDA/146V+XuGl9aCKfgWN6pEtU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZtPsdu2sG9a6TAQV6B7wjHZh01sTRgiKrw7ODI1HK8tZHAcXIbf7XW1zh31L6GZcE
	 TfXLwZ5C6oDNjq8sbM8teznMLJGa9VaRmtPmLlSWwP7Oz17ZUxzhChyfVF8QcJBns4
	 4l1RS7Ebd2YQexTJp+K0ptz/BqZ+I11XFvPPLm4Tv2TsuAm5RxGaSqsgJQJP5kU81e
	 FrcEJlE5o7UuyDcZcpLY0swoBsO7BF7FOVIrqwhzVYhaaO/FNHNoGFz5ufmPDwUVJW
	 JEUB5odieifwrHfCpXANoJNgcFaYPxyX3bme2sJZYt61FkqGK5Bo8GdBn4szzct3SO
	 9t3rxPPlPPxLw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66b678e75fdso638172a12.0
        for <linux-next@vger.kernel.org>; Fri, 27 Mar 2026 18:01:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKqiyIY8EY37QkX0paJqzaw8HR6wXbcpXEdDvkksXUHCuPql9/EYBU+4UDvsZ7VQ+IuebeVLdwkSFP@vger.kernel.org
X-Gm-Message-State: AOJu0YwmIZDDOJeeLscq6BrZPAk/gvaniSchSP8tb+GdL8e5lBkcvkeD
	cnTSgvnH5Kl1++1AA8/ker+Wq2+grHfAkfabNxsGHvinAzHk1w2hMeVKomicrnnI25OnYQFQ7OU
	AiEv2/B+DxW3Ww2xuUxBOLkSCw1A9568=
X-Received: by 2002:a05:6402:1464:b0:66a:b01:5342 with SMTP id
 4fb4d7f45d1cf-66b28c5274emr3092385a12.16.1774659679552; Fri, 27 Mar 2026
 18:01:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aca_9wyB29931jgP@sirena.co.uk>
In-Reply-To: <aca_9wyB29931jgP@sirena.co.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 28 Mar 2026 10:01:07 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8+wgj5s+qFBM92062pMkSqPU6WrQOCWyCC1Yro5wHwqQ@mail.gmail.com>
X-Gm-Features: AQROBzB8sCbd7MhTa3SycAsmOLSoaRMxWE3lVnLaDuhMPuQ5vd3gBNAWTKjrmaY
Message-ID: <CAKYAXd8+wgj5s+qFBM92062pMkSqPU6WrQOCWyCC1Yro5wHwqQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the exfat tree
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 2:35=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>
>   fs/exfat/file.c
>
> between commit:
>
>   9b373eacd6e6c4 ("exfat: add iomap buffered I/O support")
>
> from the exfat tree and commit:
>
>   5f36c9ca333360 ("fs: Rename generic_file_fsync() to simple_fsync()")
>
> from the vfs-brauner tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating

@@@ -633,14 -577,10 +633,14 @@@ int exfat_file_fsync(struct file *filp
        if (unlikely(exfat_forced_shutdown(inode->i_sb)))
                return -EIO;

 -      err =3D simple_fsync_noflush(filp, start, end, datasync);
 +      err =3D file_write_and_wait_range(filp, start, end);
        if (err)
                return err;

Looks good to me:)
To avoid merge conflicts, I will wait for Christian to send his PR to
Linus first. I=E2=80=99ll then include this change and submit exfat's PR
afterward.
Thanks!
