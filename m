Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A08436E48B
	for <linux-next@vger.kernel.org>; Wed, 30 Sep 2026 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781978; cv=pass; b=WXKtiZZhXPfwvobDZHZhLP39u466tx9usIMl7LjPsqPyDh1UvJvZcC9cKH0UeQlzX3E0lCt28BO6PCGw/GGqiebfKj5CDJ9UqUWwaluF9OoqcQsOFeP2nJD7OSgBiUum3qajTUlfug13ORi3qsQLZn2FOE65eHn45pGxpp6TdF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781978; c=relaxed/simple;
	bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lpp/rr7crA78iHJMeMrwcZtcR5IfWG3CE3sxrttc3NDuHBY/2eyhtvrGk2SYJpFCrBh4Df9zk2klWRk1zX627aasHrZlUFO1Coum9cWE4OWvGs0DyZiOav5rGveVG/QH68QQCr+g3z+K+LaXKotLwHnee8fNlc0BA9ShHDQc0iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2l7/XlY; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2l7/XlY"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e79c06622so600123eec.3
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2026 08:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790781970; cv=none;
        d=google.com; s=arc-20260327;
        b=UpKv99QkyBQfYpnjLd9L1VG2bKHnGibF7WFgE4nVyLlACCZm/17wTG01Pf6g2LH6TO
         NI6waDkhagUDIJO+8E9dbQJ7dij1Tcdvyuy+XpbQ4o0JeFocg0yVWsmFzvJZUktGyjbH
         d+Q5sq75jZ1IrXMTTqDYYaNBQL4s6ZXQHAYeOgZWdtUlP9FZWqbJH/JDrTcx2ML/Wzcw
         o5p8m08ALaXl2xkQJ2W6tI+VBXOwvOJgVZ9Rh4hjje166ay/yziY3ihK3JyYjU6GjYad
         6PXAZ4Qhk4WEeBesoKk8+AgpasruSS6CQfhfufHEhyLb19znovz9v8c6QHFXm9ZoyN15
         aQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        fh=aO3wck77YW2WBKpGvXoYCJZuYQwTjSSiegJ6inBGw9k=;
        b=mn1REE6E4nwx6IjI005gXdkyGVfLVbpLHUJFAmhaeTiWGUdLW9VWTPtQvBIcanKCkW
         6DMdMKoD+9O8IYY2NAnaWBzS/vXgHrBat3yzdhcciUpPJ3DoAQPKosa8FiV2LdtPq2gP
         wFxByuegHccM5Y0g2pxNBZ4c0t95mXe2p8shC+0CB4YVSxqYbs9hXmsvNZovNd9AWM9y
         F8wS/IqCMceozSjkjolDBDvf36KXnIS9XyQqs4i/xUtHfkXAhlvEhJx18++YlpKrrt9z
         Kn+elemoS/3msv5iHarnKpp3y5F3MYNun1CjuGVi8kXq3BFbbzEhSyKKkKn1dhMkG6pl
         PruQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781970; x=1791386770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        b=G2l7/XlY3zQ6NT95T4GJIABV70dQH3YXfhm4enxJMeipuwl+3j1XoUkEd8u8oHldOK
         esuecKKwebCbmzlTH9xuDG4FzzeSEAX58acn2Sv6Miqp0XhSDE5nU4vxFdfpDOVZZFRc
         LwN+K2QUSnmzMioeswr6m+PTzU01zYe1ikW/ZbHMWFZtlbNdvpl5a0gl37FJqtb0bRX9
         5g52nlVMtKtu4x6GY2+fQcJiHz85/rlk573rk9oNCNmlG4aPmR/XFdDVLgpw6NBLOK6Y
         5SGhhvCUzM97hK80rknNUoW6UjGSqbJUARHn8XvaFHmRFork3u6xX2D8znP/ZC8nJfjg
         9CIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781970; x=1791386770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        b=B/gs9gvsw4WJ9n8U+NOOwyts5KRvlZzHp0p2KRizUCMGTa06p6i059xMgz2Kd1oIgH
         XjPbVGKHU60FH7kqz+qFBl/u06YrYGcjw4/ci41ehUT5TzvgM8/N32QC4VfBdEienkcV
         ldXO75eNhwOwku2mDsM3sf/rFe1FLHIFLCliwNAJXaQi38DaIpx5nOUhds1bwY/c6bT6
         CcMmtbwH11ciia0nFP4TQX+g6ZB64LRE9VZE86lh3eULmMUj7lzzFINuaQ5W4wrtS+9/
         mTc1lHVzWpqWuH8uKoeAJcZopywCX0sOaNRX7YsBnsxTnNxqwHIhnj2RN5qp1d9fSlTz
         0HAg==
X-Forwarded-Encrypted: i=1; AKwUvBy9ZvFU6Bx6GrHb8PAAznJr0dRFNpSkf1KjSqDb2REMoZsnHOvIoET+XvujPW3D3xSXaNG44NQuQFNp@vger.kernel.org
X-Gm-Message-State: AFq9FYKuEk+n6f1kEpu91o0p8r+i7qqNnrk/ZKzMWRiHPX0ebZHH9qVY
	G+YWb5WL3O1KvKqs/YfS1P+qHee6UMWF5Nmen/P899cw/6VSWEF80JqLLJIeSnLdGgoAws3NJeJ
	Gf9mIqLygwlRQhTFZ2Uh9CsultVZcJ4w=
X-Gm-Gg: AYBFou0a23eQM3eDASAuCp/+xRjIIH2BUZIVWSqs6tVl3TEUrahVI5gAPssm2ySMJBL
	mgb1dnbb0UEynwhsTR4elXdwWjhzmnsVHzpVra8VrSO1/4b+0kU3OAsLwiumgiL4hxM36n9/De4
	SHAPjsL2JofTDRObzVFRiMjdgl9I+1B+y1u72rGiuy4VsMa4sM2/2QuNPwWnGlfTisSIJFujF5d
	aAdvHwCcnv3tuPJjLbQ62FglcuHzX3IL437PlKufPCaJJNck1CWO8/1/ZT7/t78/6yRxv56kix7
	/wgWWyCBr2OtmuqlD4w+U8iUM48MqpIsnpFDEkYSEWwv4NWhGPYnu3n9gy1p8p1Ey9D/txv6hnL
	q/dVA9rtp/D/i+9Zf30SETPs/UpmvqrjOg2O2ybhARudQFhVcTSF8e9uwLx9O99TRd89cjkRj32
	JatHSKe70b8rXKzxxbMl8cT/hQmGhugS+a7zrlyIhOZ+B2MdHDcZE=
X-Received: by 2002:a05:7300:4fa9:b0:33e:8552:6e06 with SMTP id
 5a478bee46e88-34cd6003e42mr3012710eec.0.1790781969755; Wed, 30 Sep 2026
 08:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rust-block-for-v7-4-rc1-b4-v1-0-642a4c1aebd7@kernel.org>
 <179068244058.1205226.1765319338142659278.b4-ty@b4> <d1381ed8-eab8-4fd7-8b15-1e94876d7099@leemhuis.info>
In-Reply-To: <d1381ed8-eab8-4fd7-8b15-1e94876d7099@leemhuis.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 17:25:56 +0200
X-Gm-Features: AclHuK_OBw9tG-s9O8MtvXyTH10ESbf_7IiKq4RprYC7l6RRjV0_TwsAnU0VqBg
Message-ID: <CANiq72nFiT0EoL8Z9iPT3xcPWynofUAs4F2gb6-NWmUQmtBHPw@mail.gmail.com>
Subject: Re: [GIT PULL PATCH 0/9] Rust changes for v7.4-rc1
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jens Axboe <axboe@kernel.dk>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>, stable@vger.kernel.org, 
	Priya Bala Govindasamy <pgovind2@uci.edu>, Dylan Zueck <dzueck@uci.edu>, Yuan Tan <ytan089@ucr.edu>, 
	Sophon Z <aiqubits@hotmail.com>, Qingxiao Xu <qingxiao@tamu.edu>, 
	Malte Wechter <maltewechter@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:07=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.i=
nfo> wrote:
>
> This series showed up in next today and broke the build for me on
> various Fedora releases for aarch64 and x86_64; reverting this series
> fixed that from a quick build test limited to drivers/block/rnull/
>
> The full error msg is quote long, find the top of it below. Full log:
> https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/f=
edora-rawhide-aarch64/11055137-next-next-all/builder-live.log.gz

Confirmed, I see it e.g. in my arm32 build.

Cheers,
Miguel
