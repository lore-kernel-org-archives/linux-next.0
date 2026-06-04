Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0977199D8
	for <linux-next@vger.kernel.org>; Thu,  4 Jun 2026 00:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533127; cv=none; b=QIYFS5ycWmm70635H3K8Y+Qpn0tcAWqHHRlWOdVQEd/SwCq2Xbk9zSx/BYIHmhoRrRGZIb8foi5VeUym53OFOhtgS4vBl7765zQWdOJDqBNO+53TJ0OmpJsP7X/JEMnwNY5vLw12LVEqI4JS04cnk1cfSn34VxgQMI7BG5sgD5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533127; c=relaxed/simple;
	bh=jZoIBQxjQ7P3tlUSk0EEmDO+cPHIkeVPtdsxpvA+jEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEFAdpcrTs507uVDbqGC40RUwjno1O8v2tOtrsC1DNEKlEW18P97cTfLpMP99nZ+1xPkKRfD+tovSkK4xGO3F9ByEKV4LTQ1FEuFjo+8aJihMTyM8NtbQB/FOBHD5/EkMZCEabrBy71e8LtxabH4UnbbDhcPeEBpa2by1pfSLpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NguiVgiX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NguiVgiX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf22d29dabso841605ad.2
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2026 17:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1780533125; x=1781137925; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oKGAYmkPB1Hr3YB+iaIUqqiRIAjAPxQPvI1HFGUlMt0=;
        b=NguiVgiXmRyttKiiYfJ4KugCmIXvrh5mhlV/6TVijBT/B05/KbU2qgpZyClNMGVJFi
         R1zQP7T9O0xuOiGsWsVL3wXs49viFcSNNvLh+ceVngdeW+eEQOLP6s0SMzhb0ezdAx7v
         QXlWkEdVpzyhwQtlqhFhG2+YsXY/DB6IqE0/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533125; x=1781137925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKGAYmkPB1Hr3YB+iaIUqqiRIAjAPxQPvI1HFGUlMt0=;
        b=aSz0MJOuZF3E7Z7BAJcbO+FmVSZTi2i6wgk35jUPHihvt4ttAg9nC5eNdCvdFe87Um
         cZwQr0oOGABMwc+7Rdh4zKmY3Ca06X8tfftdT69gr57ySqBuiahtQYw6Xn9NJgn3H4Q6
         5whNTSPmqn/8shb4jgV/GAh25YOUlx7lPFoWXNWVbVAnJO5mS222wZN/RqpjK6umB2Fb
         5XuhatypwxY0q12NLgV0IbQwa6oWd+2MfCL/zmtrEaGueB1xGeAq24vATXPKFdccWygI
         ENlbNYNoMle96A/HOjpMMsrZhakp55EcSP8BUio2K33zo1gE4QWFlVy7wbnM2vTNTTO3
         bNBg==
X-Forwarded-Encrypted: i=1; AFNElJ/7X3e5IPLn3jHqum7jFvgUUrkAd7BEHuy51pcmNPlgDv6xS2aMODAwMK0sOcNnjS8m3fo2+webYk38@vger.kernel.org
X-Gm-Message-State: AOJu0YwBKc+Rm9h76WKqu+ik3YfSAgMhpQ23z2GTgH/B+d5Gh+ktfTR/
	noH+S8sosISClyLd0gYb+QiSdQ6HoxtFKM5+EX0VZE9P8CqVOE66eDlk5vh3idfxN1DpVUZUkn0
	G96aeMi3aRA==
X-Gm-Gg: Acq92OFaztrvZjWeryQ67nDPiyEAtxyPEkGR8E3nBnSZJDXJTGxh93fmhToSY/o0qhn
	6R7MgOQ6A9Mqda4zyjeR4Ch7QqRBaAgtSFMJbWS0NGxn6v7+KA+POlgxQnmdfptqP0FWNrEGgHa
	8NBMeB1Xpw1Lqm6h1NJiZczdqQEdkVIOIRqWfC1Gis9L1bNp5CdVs7FzG8Fb1OciL8EwmkMghPO
	PtiYDHT/2VYLRkBfJzp/skHHP4Lej+xbYPX2Mkg6lXGJgayB4DAPlJ8Yt22RYIAj7eMxCIQz65K
	M/obIqBHByTznqO6kJe7Iqx0smFu+LoiUVn8pkPslLRehrUHBA8apCpIjDszEcivKI5FKmPk6F+
	kXQKwkWKOV4CIXTrmJbSg6jdVaUU68NKZUKPcWQ7/zWrao7gO717aCPzGlrAKhtX5DP9ObcorRy
	TYaTFI2bFEu/Yt59TtO05+vSeKEEkApA6Is23n/eaP4Hcb7y8Hwv+tGGEIbKW0NgG3s6Ammf+o3
	0IAvTTLZME55gps5Iho3ibqPA==
X-Received: by 2002:a17:902:f60e:b0:2c0:c2c7:58ad with SMTP id d9443c01a7336-2c163a59938mr60340015ad.13.1780533124884;
        Wed, 03 Jun 2026 17:32:04 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609ed97sm37068425ad.41.2026.06.03.17.32.04
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 17:32:04 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c859a374903so37611a12.3
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2026 17:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ96F5nPjFw2M41XDEKcQxshm3N9PNAVpCHWSALshzY/ytLWIWXqOsYrdQIgXyKTNuDC+0LQL5v0lRCW@vger.kernel.org
X-Received: by 2002:a05:6a21:3989:b0:3b4:8ba9:4d8e with SMTP id
 adf61e73a8af0-3b4979a4e44mr6703825637.23.1780533123566; Wed, 03 Jun 2026
 17:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <83f77b2b-8c00-424d-b6f9-b044e7ea1ee7@sirena.org.uk>
 <CAHk-=wj6CtZS9hbwFjQcoNkPwQLoyKmk8czaBF6=bBOCYuXEUQ@mail.gmail.com> <CAHC9VhRX1=tx4+arzuH76kirYFFJozexa5L=41Bb2QbgWZXOkQ@mail.gmail.com>
In-Reply-To: <CAHC9VhRX1=tx4+arzuH76kirYFFJozexa5L=41Bb2QbgWZXOkQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Jun 2026 17:31:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj_rtiufEEVudMCSbh86HYrnmEa9NhYfKeWHs1SOzJVnA@mail.gmail.com>
X-Gm-Features: AVHnY4LFh1aPXsQ6zdDL4_HlTChSE-hAiyStcDf8UlBB35Dp83kOTZRnA_qQqTs
Message-ID: <CAHk-=wj_rtiufEEVudMCSbh86HYrnmEa9NhYfKeWHs1SOzJVnA@mail.gmail.com>
Subject: Re: -next status as at v7.1-rc6
To: Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Blaise Boscaccy <bboscaccy@linux.microsoft.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 17:04, Paul Moore <paul@paul-moore.com> wrote:
>
> It's worth mentioning that resolving the merge issue was relatively
> straightforward and we had a tested patch ready in a few hours

This is not the reason I'm not going to pull it - the merge issue was
just the reminder I got about an earlier email that I had dropped on
the floor.

No, the reason I won't pull it is that the main developer I pull bpf
code NAK'ed it.

Now, I will cdertainly sometimes override maintainers, so it's not
like a NAK is always some final thing.

I don't _like_ overriding developers, but I'll do it when I feel it is
necessary to make forward progress.

But I also have to  feel people have been unnecessarily difficult, and
I have been extensively informed about the decision and I feel like I
can make a reasonable judgement on it.

So it happens, but it happens with my explicit understanding.

My tree is *not* some kind of "we are bypassing developers by sending
a pull request directly to Linus" tree.

NEVER is that the way things get done.

[ Yes, that too has happened, and I have done that unwittingly because
I didn't realize what was going on ]

So I will not pull this tree. End of story.

The way to get me to override developers is to make me aware of the
conflict and convince me that yes, something needs overriding - but it
is typically not very easy to do with active developers.

And honestly, I also have two+ decades of history of "LSM people
cannot agree on a single thing".

That is _literally_ why the LSM layer exists in the first place.

So when LSM people then disagree with _other_ developers, quite
frankly my immediate and visceral reaction then is "oh, these people
who have decades of history of not being able to even agree amongst
themselves are now disagreeing with outsiders too".

Put another way: LSM people have a  higher barrier to convince me that
I should take their disagreements seriously.

And no, I'm afraid that may not be entirely fair.  But "history of
being disagreeable" is a thing.

              Linus
