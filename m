Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1523A1C69D
	for <linux-next@vger.kernel.org>; Wed, 18 Feb 2026 00:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771372933; cv=none; b=nfzxyksDEAaBCQw25ni01XB0EvYkc/OOv7l2/SBi2wbJLaUg3m5NIeQ+cjC0uifsIapPsQXTjEoGwLokpDpPw5NluKH5oTdVRYw2Fr0B0QbkHCGGo4Us72K0pr8RQxuaLwUbvda60KH7mSQbm/gS41k9ibOvu5PSjOG3cULXZ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771372933; c=relaxed/simple;
	bh=ENoo5Ga/HWAJuW65PGj98x96A+R4ScAa0jEytccWqn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXIh1+VXqGDX765DT/nZU923XBcHcyz9Y3OsODQ1HaWEJ2OD6hW0vYm5FwGMm3VUYliVeLnczFBdHY7kHq9Cl0JfqyNfieQs1WM3FqDjHjT8c2j7efZ/ovkJJ18NnNhN8t0PsvqUcIhdS1Y3vnv5pJgSEHcyoLnj3WVaH3z1KjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEirBBx4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEirBBx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA221C19425
	for <linux-next@vger.kernel.org>; Wed, 18 Feb 2026 00:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771372932;
	bh=ENoo5Ga/HWAJuW65PGj98x96A+R4ScAa0jEytccWqn4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LEirBBx43fuCODr+9/lUoX3SuSqcwzIS79cFG2bA3cu8wXh5J71fQUsWCS0ql/P8j
	 sCxatnkJxU9Su9l0QsKoBbtn/F4KH9kPvrwmScHbwI3tvE3HbcPHzOTA4H1juW4K03
	 M3OF8qCbus7ALvYuWbYcyPPQzlIPvXeK6kcrpwYsVIa0Rpp6VCuKG/mBuMMDubNDNl
	 87+KWOdNEPDrC4QbMLq2K+J7DR0IkSCVOQKglDVHNRRriYylf0LmD9xuIs7cUeG/1D
	 awZxeKlDJ4QhL/kk9QuhXhXJ3DaTUxrM1u7omHKMH7TIJdaIKlKZgLyLgRhxy3Mjp7
	 9Hd0avqxsK0bA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65c20dc9577so2375166a12.2
        for <linux-next@vger.kernel.org>; Tue, 17 Feb 2026 16:02:12 -0800 (PST)
X-Gm-Message-State: AOJu0YwwFagGRB+9uHJHrhmyzIBQBYNlfQZei/VpbBaeAgZoMmZTN0sC
	eFqCBX8ZvxW/Nut7JMkfCA7LejXJ5bNsHPIbvzQcENda65ubgP5Y3fn9DhrSRebnba6nHoBcrhq
	mfXqhRlazRh2KkMdGORCnm1bgM6xnPJk=
X-Received: by 2002:a17:907:9289:b0:b8f:f136:20f6 with SMTP id
 a640c23a62f3a-b8ff136212fmr522641066b.22.1771372931135; Tue, 17 Feb 2026
 16:02:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKYAXd_rfwTt+uhOgBa4mEO5j0CQhZdTp=YcoU2RCng+scDbXQ@mail.gmail.com>
 <1dc54be7-f8f1-4555-9004-8e15437023ef@sirena.org.uk> <d4e59537-f51e-4860-bc66-8fe5f9f3e66f@sirena.org.uk>
In-Reply-To: <d4e59537-f51e-4860-bc66-8fe5f9f3e66f@sirena.org.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 18 Feb 2026 09:01:59 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-M+apvWoQUD=ucj0zhz3bN=Efi0GV8h+LtEhQZC4PU1Q@mail.gmail.com>
X-Gm-Features: AaiRm52-q2Ab1wF-6-uaHv7lt6dd9QFO9mk6eX0PR3Rjbln8ooUwqkVY4wE8FHY
Message-ID: <CAKYAXd-M+apvWoQUD=ucj0zhz3bN=Efi0GV8h+LtEhQZC4PU1Q@mail.gmail.com>
Subject: Re: linux-next inclusion request : ntfs filesystem
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 11:24=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Mon, Feb 16, 2026 at 04:05:42PM +0000, Mark Brown wrote:
> > On Sun, Feb 15, 2026 at 03:02:34PM +0900, Namjae Jeon wrote:
> >
> > > Could you please add ntfs -ntfs-next tree to linux-next ?
> >
> > > git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntf=
s-next
> >
> > I've done this, with you as the contact - let me know if you want to ad=
d
> > anyone else.  It should start appearing tomorrow, though I note that it
> > is the middle of the merge window so if it were going to go to Linus
> > this time around it should really have already been there already.  If
> > you want to also add a separate fixes branch let me know about that too=
.
>
> This is breaking at least an arm multi_v7_defconfig in conjunction with
> things already in -next:
>
> /tmp/next/build/fs/ntfs/file.c: In function 'ntfs_file_mmap_prepare':
> /tmp/next/build/fs/ntfs/file.c:657:19: error: 'struct vm_area_desc' has n=
o member named 'vm_flags'; did you mean 'vma_flags'?
>   657 |         if (desc->vm_flags & VM_WRITE) {
>       |                   ^~~~~~~~
>       |                   vma_flags
>
> so I'll drop it for now, I'll try again after -rc1 (next week).
It seems the build error is caused by a dependency on Lorenzo Stoakes'
recent MM change ("mm: update all remaining mmap_prepare users to use
vma_flags_t"), which replaces vm_flags with vma_flags in struct
vm_area_desc.
I will update the ntfs tree to align with this change and ensure it
builds correctly against the current -next.
Thanks for your help!
