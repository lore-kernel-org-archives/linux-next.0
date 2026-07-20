Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD974398F8
	for <linux-next@vger.kernel.org>; Mon, 20 Jul 2026 22:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784587542; cv=pass; b=j0CSkYpIY1Rc+Q5AiOOolAkIwo9EzsS9GVIh4YS21dYwpy5gQwMvrJDiypsabD6I6vhZqcUybyWo8LFhiaijo9+CbuzYerL/5H9CquC2+aH2OeYtl51cyiRHkGSO52+NUxrWQBkw+seVlLZaWkztzXyhCZWmTOUWnmWxsiUVx0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784587542; c=relaxed/simple;
	bh=JSz4lcEfsZXOUBOqte83BAq7FxPgai1LulTMJXJ+/ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+hHPNSQfi+FX2anytGNl/ARsQrlupjMRjJlMuUUvPPQglpT9pJaEVWp+MgcQd1gAGkjgBDV3+QFwl9Ak6p3wnNZkKWnwxyHeZnWMQ7vOKCG3UCaT3GHHbghiSj+VJbYijY4VKPH7lZ/2/P2We/cXxSq2phBYUz/U62GF/3VGf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=SmR28NhC; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="SmR28NhC"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so3080098a91.0
        for <linux-next@vger.kernel.org>; Mon, 20 Jul 2026 15:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784587537; cv=none;
        d=google.com; s=arc-20260327;
        b=ctg/Lx8stBzIGwIbH6hNNHuNQ3XdnBAb5TlUKOr/XnbPCp7mDSGCgTmtKqwR2DGX1j
         Cpe5cp7T8ZiyugBXUZ2MzUNQ2ilhJst+DVjKWrZpp7NLmyzvv1YbGu/NS3G1aYXl0YkD
         4wSO+t0RtEUEc4r8A7S3ef4EDpboSMCxZhakRZ9mI2mLyas8cy8v93eKX/7cwhNkgqSi
         prmvBpA+0kLX766Bvn0BvvbUWa9XsvpimkrfDLqrHWyROOwkiVvgRhBZP342Zfq/wDN+
         y+/RNJ/HCuFjdQubqrlzWvBGtcwa9pbQdu5VAZ+JpLeGTGrA3WgaGwMksWCHyy1CBAT+
         zGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y0lZo3t/W6fbrm70lvko/8PAydBIYBLSD9IwRNY+kms=;
        fh=GqJO8wiBUrotxUqvRD8uROTU+0i4q0YNfrT3WApojfA=;
        b=lNNto4krckYXjR0Y7RqVU47Z2tbC6H1ulBoWgjS4m4tFtWaZIBjqVByPpEQGwBYFVK
         v8Cr28CiqnsRyL+RVc9Jx0OYpPSyA0jgYbNj2hMKbCwxciqI5WggmE9ZkPCy5qLpaG7r
         TbtUy+h/yK1Xvq+dyFlIcuLHw8zrolHcv3rwr2t+16DfSQL3M1x2Tl6RR8XgPZ9mytoZ
         vPY5abmdt55P3asjj2iwkQ1QlHSX2hMQ6AjaHQBXXrqm9eAsHxzapeZEbGEUWt1qUUxl
         eJezZLW7uWBXnSXyW3n9szDIC/93fnRc82FtiB6SvwWtAZrCaz1wCZqCHOUezSQTzfsV
         KKfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1784587537; x=1785192337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y0lZo3t/W6fbrm70lvko/8PAydBIYBLSD9IwRNY+kms=;
        b=SmR28NhCBNxlZM7fhVAr0nODfTrBvT+RnuVlZpMkuBIg9CF89BQ4C4cpThXj7ipPQq
         3zdPLHE+TclWqS8Uf7W7PEFETIGPbWZ5xx4m64V7FaWeoj8s38LysmTnFzHexGHL+GwI
         nW8pMoM+JowOh1m7HDmALnuEtp5SXcJKQQ3h35mZVERZjuYWIZVPPks9pisCkTu6HbdP
         UyWOyhHoWB596gvYqMMe3IWbNSm6nKqjmSzKsLGsBWXe/8k8dpf5OGVq1dNJOKBpatJt
         /Px6TyyOYZ+MPVoyt8YG+BD3l3PNtwLdzZPUKSRyHFQwjKJULM8UE6RDXEPuRTQBzhm7
         iV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784587537; x=1785192337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y0lZo3t/W6fbrm70lvko/8PAydBIYBLSD9IwRNY+kms=;
        b=Qf+di1aGT6RFBXsBWquAlcsZSh73wMOIIs93WoUiNJBXx8QDedgo8zLN9nvFtsIWj3
         elNVCFUv0h/jY9tcp0wpEjuCIlvj9ObKswGyDWFCFXtp1cwsv4K1mxAptmq+p/EHHZm3
         QhIjzC6xD9MQtusbf/JYB/jP7DiwwBCKesfRtmcIc6lJCGVWwFVHVPwg2hw0J/YnBjAz
         Klxt1Ify9j/4WV+v468VjomQnjPoRkRyOlifVSCwHTEj1pWilS9ZvVi9gkD9yOshTRLJ
         70CiNL25RChgTojOP3FnayXObLiawIJV5uliZkQJbEmzWfV9Z51h4KnQfsERQWL7A9/Y
         L0jg==
X-Forwarded-Encrypted: i=1; AHgh+RoRs5BGh3etOALBRssQcP/u9TNxUEmLL0odHvz3POq4dMQGDSRlFGW/n1lTXnfwDYAsvKnpZDHGECXo@vger.kernel.org
X-Gm-Message-State: AOJu0YzXHE5AoK4hwpCpUoJTbosHndCLrpTYbER/hLAtC0RyIVRdzZbC
	r2l3d8Ef8zLB/NUoEpWIe3cHdNYO1DB/CwC1hh2i9x8sNRL0XkhG6Wlw05TRhHX41ONcoqUczoS
	kjFF5eIzaW1ljj01Esxlb7Mq1zDIq2R/67TjdlH39
X-Gm-Gg: AR+sD10GJOjZrea5+tfO69S8f8y8Kf8swC+uSKq4IR/n5P0ti8itGCy406SB7E1cDnX
	DwfJNfb4MxfA4I9zpOIn0piQLsIyX3FTk+RoNuyFmefvGQSbyVsexcYp6AYYVHukoafQylenSPg
	Ji81i7LgLMMlYH5zzDRBoLJsvquBJSb9GEZN8dRlxH8iPcvEvxw0vC8tjyk6eq3b4EmvAK4A7OC
	zyu0MkvFekldysI+9GF7UmQryLGDLOaTzvTE/4b7Zub6eo+4TwoC8WUKoLMzywLoFwoBvXn
X-Received: by 2002:a17:90a:c2cd:b0:385:3ab:fecb with SMTP id
 98e67ed59e1d1-38e4b4d3dadmr14364669a91.4.1784587536814; Mon, 20 Jul 2026
 15:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <al41SRxNtHYU5coA@sirena.org.uk>
In-Reply-To: <al41SRxNtHYU5coA@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 20 Jul 2026 18:45:23 -0400
X-Gm-Features: AUfX_mxbOynoiWQCMASdAGwfqtW7EcVJFiFwn7jGft-AX6qluH3JUU-izfnBtKg
Message-ID: <CAHC9VhQAYWzzcd6KnbCg+nNAfSHVBetgOnzd5axnL2_6E+wL5g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the security tree
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jahnavi MN <jahnavimn@google.com>, 
	Jann Horn <jannh@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 10:48=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Hi all,
>
> Today's linux-next merge of the char-misc tree got a conflict in:
>
>   rust/kernel/task.rs
>
> between commits:
>
>   ef2d3e4635761 ("rust: task: clarify comments on task UID accessors")
>   15c1f17979712 ("cred: delete task_euid()")
>
> from the security tree and commit:
>
>   2847d9ab088bb ("rust_binder: Add dynamic debug logging mask")
>
> from the char-misc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc rust/kernel/task.rs
> index c2b3457b700c1,1b290c61714db..0000000000000
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@@ -210,7 -210,14 +210,14 @@@ impl Task
>           unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
>       }
>
> +     /// Returns the TGID (Thread Group ID / Process ID) of the given ta=
sk.
> +     pub fn tgid(&self) -> Pid {
> +         // SAFETY: The tgid of a task never changes after initializatio=
n, so reading this field is
> +         // not a data race.
> +         unsafe { *ptr::addr_of!((*self.as_ptr()).tgid) }
> +     }
> +
>  -    /// Returns the UID of the given task.
>  +    /// Returns the objective real UID of the given task.
>       #[inline]
>       pub fn uid(&self) -> Kuid {
>           // SAFETY: It's always safe to call `task_uid` on a valid task.

Thanks Mark, that fixup looks reasonable to me.

--=20
paul-moore.com
