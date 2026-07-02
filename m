Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BDA3B8BC6
	for <linux-next@vger.kernel.org>; Thu,  2 Jul 2026 23:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783034836; cv=none; b=ZM0BVAiK0N894GKsBJRFP0ydCh2K7uUPKuH+KwZH3AdqtU/IrUvfUQguT9c05qeg2ca6fK2e7o0as6pTnqehU25uRDLjDK1OLPydb5pK6yjyLQCRJipXvJSV3FS8zW5xBFmy0hzIUCNaM+1jgTxlbtrAoySEgA0JIyeoHSGIBig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783034836; c=relaxed/simple;
	bh=SUgHh3pUTOxZcslPeL+Zx+BFjeNOxlqnlEMEAr+MHr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4gZwUi5DA33dItgjzAaa5d8TI+WySnggYgJs65cPSN8DBQUnS+z7BzhVfgSfx1R7rCXa1nonCOwr6NmJEE7KH6nNm3GzXmm8dG9nKpHUPFqVM347YjFwxnfMZe1FKZjeE9QcBreu/hf+bIeNE7wRwG+mfulT6I2dL95ksKZl5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2AUxrkd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2AUxrkd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7441F00A3A
	for <linux-next@vger.kernel.org>; Thu,  2 Jul 2026 23:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783034835;
	bh=iW6nkXYZ9OG29zDrwClTARODBslfUHg/nmhKSTjpWaA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K2AUxrkd8ayCn7jexCtRW1Koh0WOOf6erO8ZVNEBQB35y33MBTWFDHYcJeSxQ8U0M
	 8Sy5oDNMuufEBv3rHxqKhSGotVhSo324bVWzqJUdrZc44EZCL9T9kqX8vINK1CqLhm
	 PSYn1UOd8oMmXgHdul3Ri9PSYBtUsQeRYGEqAD73GWN/COy1ZENaw5lrNvFTMYPnkH
	 9sGEauvnMzVGOy9HWrWZLdOd9e1Hn6ofZg7R5MYyRRy3H5nHkns0INXezkDNkDQQYD
	 81Gh/kU9HNVOuyuY5w0tF+aagR51xtbRLAh0giKwJZwqCfEGs8kA8XfjQDPUcXSW40
	 prgM2uotFCw2Q==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1297f37073so294363466b.2
        for <linux-next@vger.kernel.org>; Thu, 02 Jul 2026 16:27:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roh75g/gOv1l3InOVN9rUNZpFianAbLIDRgtfXg/omcem0JBLb/7iD4g+LE1DL1CN/skcyLvquy47xs@vger.kernel.org
X-Gm-Message-State: AOJu0YxCECTll6qlfrN8e45v78sNJ00OpOeverO4MibTTEXwYpXZRdEf
	UP2hjrBjdIGkSXscI8DTR9+RRShFDWYhh+W7m61pbny6VbJmMWWil008rnVzdpLpiZW8CoJ6B6G
	G+poiJTeoyLSnCOUXD3UHwl2bXOaDHrY=
X-Received: by 2002:a17:906:b793:b0:c12:83c9:d41 with SMTP id
 a640c23a62f3a-c12a9de3cd8mr259916066b.12.1783034833695; Thu, 02 Jul 2026
 16:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <akZvxeIEgr8bYu8o@sirena.org.uk>
In-Reply-To: <akZvxeIEgr8bYu8o@sirena.org.uk>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 3 Jul 2026 08:27:01 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9_PbJmmNvEkcA_ikHALPsXdsSOc_-d6ACnPo7gz0W=mA@mail.gmail.com>
X-Gm-Features: AVVi8CcxdXkoETtUuleAj8pxbBt05vhCQW2H_X81Gi3gsloxTM7MXBLNKc4JEls
Message-ID: <CAKYAXd9_PbJmmNvEkcA_ikHALPsXdsSOc_-d6ACnPo7gz0W=mA@mail.gmail.com>
Subject: Re: Fixes tags need work in the ntfs tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 11:03=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
Hi Mark,
>
> In commit
>
>   ec050fc4cf17d ("ntfs: validate error codes from untrusted disk data")
>
> Fixes tag
>
>   Fixes: 1e9ea7e04472d ("Revert \"fs: Remove NTFS classic\"")
>
> has these problem(s):
I will fix it.
Thanks for sharing it with me.
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format=3D'Fixes: %h ("%s")'
