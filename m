Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D4397688
	for <linux-next@vger.kernel.org>; Sun, 18 Oct 2026 16:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341499; cv=pass; b=FJTOugLTDuynadOCArUEirgnKKaJE0SVrnSyRM/jeSrHRKD/U8FUywWU34BCCDviuSHg1RdACCPiP+jd7iAEonkg1FjmiYFJWOgqRIIapmfD75OmrrZ4jrTddqlaI10jPN/iW/Fcxxj5ujEtOhlhChOYzl8m8k5554YuwEiOa9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341499; c=relaxed/simple;
	bh=0UpPY2txaMJkrBSnDz/4PPngnBkfOnuBUPOCszgwXXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYXdAJvOxCzrOYLMsWcS5aSf1Nkv/oXjG07WT1pE0hrsOQmyXxKphalwcChc+d6qBfTK4W1P2+2b2NwLPvDima+hKF+liQEHUGpntGMBTv1UdrL9yMAC8zCy1oE9ZNp8NT1KvpRtVRP7gOkfuEyiNzkiwZUsbeq5Xp2hbl1PDlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkaaHsLt; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkaaHsLt"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-355724d032fso148008eec.3
        for <linux-next@vger.kernel.org>; Sun, 18 Oct 2026 09:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792341493; cv=none;
        d=google.com; s=arc-20260327;
        b=nAMxXCrKmZP7raZ0wugw8/5C13nQdRYrX9O0b1fvqf31gOWnUdw5w7Uzr3XMjKGOfM
         uEGSpKDfODbAGgiLiNVQENX3KUc9dTxs4hJ8eVE3mfEtbXzr5iI5Q0ECb1md0I0wFVa0
         bOrxEa58R309R3ZvG1NCZP37oHQAPNBl3rc1KwXxmxBoPX3/zOlG8NBLa2tqzx68+YTK
         h2GkQHPgPcwlxnepxVVYevVJnu0VWAo8Q0us0ecwhVd4SO+l2Ky6Heigmemmcae8C1XU
         JSXaBR2y71xIXQR/pzZsixIgv1TipXBqJ2qHZYZnls2EEUipH5MybuEqpkr2tp8QkCsT
         FUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dl0vrGfBJKdVsQEvxtbhW2bHMSJ+Rhsx6tTEIjZJwj4=;
        fh=M3IQsFIprrot3pRH7ROMMP+ov0Sw0O0JGjPO0FEbzME=;
        b=DuUwE2NpgFdKjIT2FMDkjJW0W1nmn/UVXcTfiiRqMpYENwrozr7K782FzX59ihbDsI
         hCwhO4F2GTCRM/bhQ3EY16DgH6bWC12uuW2NPtUh9IH4bWRLBhg5kw2l+m+Zer6Ogm5a
         tkOcbup1wa4q4kfg6VlVAJoromPOt0YBjN08CY2mgYzgC8hfHFXJ6dVgpihxt9KQfD3O
         fB/vP0Np46QYV0THOwLuz3IQRyrfdyYZK265WB8O9tpAgNrpKICXnjDWH19+0+M+hw/8
         aphgH2WNNGOcTa414GMxbQULtytzppAXYaSkV8aSr8INOIzedG+X37FHhX5JJlWg7Msw
         /mXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341493; x=1792946293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dl0vrGfBJKdVsQEvxtbhW2bHMSJ+Rhsx6tTEIjZJwj4=;
        b=GkaaHsLtsMvjARfgDj/s9oskEptk6m23b1ZEOu+30+7863UiWdeZ0oixojp69NWmJz
         XQmaJS4nmU9JrpeeckD+uILWTtHf0jYzvk2hXb65TjhQk72ZbE0Ly6zymCc29OfwYi+O
         OzgfKXt58uQvJG/+R2Tbayaxopj2Qq65Th2mjxXxBnFpJ/jBAUiJAZ4aOHDRtrYvvehe
         GMMuHw/yCi31FdeFOQgYSW8NXCdYZVURIIy0H2C/OT5XjEmhaFFFglJl6unkjKwVqO/G
         QN8KWlMfYwcxSdv8gciEwyaLoQnQdY9DZTyXQ2DOmz19qNMUyOxGgudm5BjNccDzCdVo
         QhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341493; x=1792946293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dl0vrGfBJKdVsQEvxtbhW2bHMSJ+Rhsx6tTEIjZJwj4=;
        b=S5KBBJfikV+EgwWHaeuvJqYCxOYCMDPSXhyOVEv+IChr2cjUMj24Gm9qxLgjOtpQdo
         FUUYAnL+9nMhw4AwGN5V2yF4meDNVaVYrsex6S3l0BIJvQFQlGB1Y5yffJZEzohjzyra
         lCO0Z0JtNLSDbDDo4V5XQ9JYu37Z+B8Suo+/NWqOCCdHsc+SE8uzBiQfTyjhd+ouygdO
         ZkgQ2H5j5LmiJQKgp6gyrmZzR/ET78ZgKhet2gEf4yfUaUBmYAQxUfbj1rFKUSQwdmbP
         i8tFwYmCxI5GUG4DlpZ2sMI1uogPMJBIuraNSI5/ZK8qQokqTZq1BiFz7kg25ZcTlnwN
         nRXA==
X-Forwarded-Encrypted: i=1; AKwUvBw4aihGBfz+Lbd9gvC+/TvFfp/2wpxmDoGby7CWerv3RObf/N6ghykp+cy/bcF+7sz+ndamcjDxjkDL@vger.kernel.org
X-Gm-Message-State: AFq9FYJSqMp1CgTbcAfet4TnDyxMBKsgvpuSsMTYO931y3n3ra03BN9s
	9YhzoAZsYIs2KxFLQe7pPCdDfHb5GMzztsNvGTdr4GJpjQaChH/ML/J+tbnPP46PQEE8emDKvv+
	ObFdrZFf/uT+/UkyXKGfzkZklCdrICFA=
X-Gm-Gg: AYBFou3vV6K4gm0Cu9QJBh1H9rS8AhHnKKigqYRMWivCaf6+MMk7WbQ7oJC4Uh1KAFe
	L8J20JwBEBH1UzNrr0E55Gcr+7D4AyjOxjRWeCS7n4Q+OrlH6J8E83OGLye88Vs6i0YiXhx70ze
	r5zXQHEiTdP099TA3bn9tBuZa7avp8kBkt2GGeUXl+h9cDGBddECn152nwxaRJdFFIZ9zG6tCIp
	NmSdhpPjsN2Ki8hUwAep/hahJaNUdHiOVoKPA87zCnC+0n8t5Gw9EopO7JyTfGCTsTOzpiNcDuY
	M8cRYu2Z0bxa/CzFTrhnzx7t6FN8rJIQHPjlT5tOXrx43cERNJ4lDu5MpAFntejVwRaQWcEUSPJ
	OUutTYk2Z3H+L3nkYWbyoqoTdDeb6hipnMrkY2iQCjPgny6DETZjdo31XktHAnKg2IYa3MuNFyq
	7GrWGCs+/3ENhUdZhbmDNjiQBYe1hmQQtB64x5KMLy1GyxbMLZgMaA
X-Received: by 2002:a05:7301:da84:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3619b30919emr12488146eec.0.1792341493523; Sun, 18 Oct 2026
 09:38:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar_0MTEPHARiUqc0@sirena.co.uk> <CANiq72nR4sz5xvTVqqnwvoVJ0s-sDETQyPc9MUKo2698Ocp-Kg@mail.gmail.com>
In-Reply-To: <CANiq72nR4sz5xvTVqqnwvoVJ0s-sDETQyPc9MUKo2698Ocp-Kg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Oct 2026 18:37:58 +0200
X-Gm-Features: AclHuK9-cF_lYeu55ygeKwCSKpAu7DsZfmVWxzzJwXnFU9wvkc2Y5qIzKIwufsk
Message-ID: <CANiq72nALxFQ9xDe7xU26e9ae+25-=v3wmapz_SqA7UuqPvRkg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-rust tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 8:43=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Ideally we would do:
>
>     use crate::prelude::*;
>
>     // TODO: `Alignment` should be moved here as well, Rust moved it
> upstream in 1.96.
>     pub use crate::ptr::Alignment;
>
> since one is a re-export and has the `TODO` message, but apart from
> that, it looks good, thanks!

This is needed to pass `rustfmt` too; so I have noted it in my PR to
Linus -- I thought we were enforcing it in -next?

Thanks!

Cheers,
Miguel
