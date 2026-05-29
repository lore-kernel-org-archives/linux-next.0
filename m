Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9818B38398B
	for <linux-next@vger.kernel.org>; Fri, 29 May 2026 17:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780075452; cv=none; b=KOI4jx3JH/kR/JQnQ9iYxbvqn8S2Y0w3K4uQG9xs9Io6QZqaaQFVZBRX1E3N4he3LBOTtbhr+qVweBcrxZa2JNC9BwWKBAi2vQkxu+ZhXEGgsqILznWX4nbUs4PlsPYPSTSKRmFDR9e1y9A91/dde68H6rxEzsYm6NPycRElgqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780075452; c=relaxed/simple;
	bh=SgbT6WkygpvXvzquwCwHSl4Xsen2DGi1wOZdHxtvmLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rkwPgT/hGxcUUFq/LCE1CgZSL9kHaoF9bazN+qIZtH+5q6WEE3pYJbMZBTW9QHfl8vJxeK73gxcXW36lUs1r0Q1AxC8Q0wfrsCYnAAe+H1Ac726AU9bXv8ohZ2gR5sopZVKWsWXyLH/Y3zy+X4xDgaoY5U78y/MX/kic6vVaiRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8cvTnwh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8cvTnwh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB831F00898
	for <linux-next@vger.kernel.org>; Fri, 29 May 2026 17:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780075451;
	bh=KSRuyYn3vSPNW7Q+20AsShOPpB5Al4y1rOjiugaxBuE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F8cvTnwhqE/QayZHMxP5EUMkBH3rCSzbFK6ZdovvD5QH+wm1YgHzg+cdsAAxH16hF
	 bUvMK7CoQLRj1psL203TRRyUKgXt/S4hFAuWZPhxLznlQHgk8yWQIxKbJiZ3fnhVtW
	 pTXbJxSdRMaMwuJfhRQxd7/Vqdht9q3p7eNtEQcPG1vTtHJUKsO6mhmpTzawcvwqte
	 3lEgerHM+XDeAm4EaJ/TSVXRRNZSi/jPpMpwBZWOUC3aT9XHp1VibbcGTypkz3sQ+O
	 6OaO8yx7z4lutoFIStpVFdLOtDKIcaXUqgNgTRYkrpK4iSgq5WclNz3Ge6wgWm+KQM
	 M8tPEU7YzMzRw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa4bb157c6so3752448e87.3
        for <linux-next@vger.kernel.org>; Fri, 29 May 2026 10:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/dkCtu4u46Hs6qp5Bnk5/iSXOjhHMuuhkCg5lRG3YeepJLENw0c01pBBdENGvZFh8vxHbfYvKRBqgb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw156ITyk9NJDtJsgXcVg521SqJrimaFomtOwg9IS/WJZS2trrm
	EpbB81hC+a0vaoAqld3eEvELuBv3Bd7jTDzUjz2BFxB551eNCPj8YnVu57nw/666q4P7joiUQ9e
	i0uhnCHRhUvtKHP1qkqvTC759UZm6vWU=
X-Received: by 2002:a05:6512:ad6:b0:5a1:1496:922 with SMTP id
 2adb3069b0e04-5aa608fe25emr271459e87.33.1780075449625; Fri, 29 May 2026
 10:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahnBWgbK1BBQfkY9@sirena.org.uk>
In-Reply-To: <ahnBWgbK1BBQfkY9@sirena.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 29 May 2026 19:23:57 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gAPEsLmYGv-fP0m81HFRq0SSFe1UH-_eck=Cb4fzSN9g@mail.gmail.com>
X-Gm-Features: AVHnY4INXHRRKqiOYqgWjOBHDtXWPawVriLW4MQtbKmaTgJOVqYYoOGqCBNGaRk
Message-ID: <CAJZ5v0gAPEsLmYGv-fP0m81HFRq0SSFe1UH-_eck=Cb4fzSN9g@mail.gmail.com>
Subject: Re: Missing signoff in the pm tree
To: Mark Brown <broonie@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 6:39=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Commits
>
>   f8d14b7bb0063 ("ACPICA: Fix NULL pointer dereference in acpi_ns_custom_=
package()")
>   2543fbb21642f ("ACPICA: fix I2C LVR item count in the conversion table"=
)
>   53a3a7723c9ea ("ACPICA: Mention the LVR bits")
>   d364d76f3d0cc ("ACPICA: Change LVR to 8 bit value")
>   468adc6b1ff83 ("ACPICA: Fetch LVR I2C resource descriptor")
>   f0ee0b0927f78 ("ACPICA: Add LVR to acrestyp.h")
>   15a07a5a96d5c ("ACPICA: Fix FADT 32/64X length mismatch warning")
>   555233110be78 ("ACPICA: actypes: Distinguish between D3hot/cold")
>
> are missing a Signed-off-by from their authors

These are backports of upstream ACPICA commits that don't carry S-o-b
tags from their authors (BSD folks mostly).
