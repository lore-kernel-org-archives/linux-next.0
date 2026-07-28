Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD53A759C
	for <linux-next@vger.kernel.org>; Tue, 28 Jul 2026 22:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276720; cv=pass; b=mfl/lLMkZ7PCoPYSgZyDSGXNKiB9sccpH9SXkRBrJTRvxxSXurS5B3plCXnmPold4YG2RV9lKSxjX7fA9Xo47+u05gPPJ8liQn8hVZ997OLTHtoE7N51FgcF/GZDm9h9XBGCrViAvUBSjQ28PnWWSeDS22BY4rd/94wQHzez1UM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276720; c=relaxed/simple;
	bh=0sjE6q1pTHhYTWxhv6r6iJjoLT5263VahOXbBfbbJyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9LoTc3dZV0jUyXFfyEkWDJdwxN8E5jaznF/e4BomAFo6CHtwzl3uMeYH7Lf+HAlQkzrq8xEgq38KV3QHapbHZivFE23EVatGQCl/pCUF/v+Y+G/TB6VIhCpO/piiffVK9IWPz0YMJMNh5WpVtItFzJcp3VTvZxF5DX/Cuc5ChM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQhyUXtL; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQhyUXtL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cfd2e4e83cso123985ad.2
        for <linux-next@vger.kernel.org>; Tue, 28 Jul 2026 15:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785276718; cv=none;
        d=google.com; s=arc-20260327;
        b=M/PrnePG512FlS6ZEHxIDPsjkhIqmcwgXZ8VsXDfa7qmJzrnmjzwrCHan+Z/tTgzF8
         BeJ6w5C8aIRKzpsprilQcAWPzgokxwzSk4SGgxTkcFuHRGNI9ZVjLV28m2hBD4fFqu7I
         tnlWRR4sII7m99Dkn0l8d1LrL0lcojxanTgijO9fa/KK4ouUeVmv7bRmuFBoaioX+d8r
         V9R1AXTEgKoUpekbzBR0eRXWh2exEVIH0MXyxeNu97WFXHZbcVt6hUyn9uQ1PmpEtZPx
         j+VsYaI1mgoCBfDGccvhp82UAGQUumrLyNp7BSBq42KgTpM/cEDWjfCglrAkd38AvlnQ
         AQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0sjE6q1pTHhYTWxhv6r6iJjoLT5263VahOXbBfbbJyY=;
        fh=aE0y+D/QQCFpVDvQT8fdXdealQXBdfGHf+guDg9SO0U=;
        b=IaHroMaW0+NcO8xHU3T/+3FD7zYlfFxStQkudmNKN3uiYpWSBpybkP3OocCHBwNTm1
         OH8xqa0T2RWVXK+e6+VLeaEGwwh9GTGXBhxrEqkYZuN8r+0NSVvL83VgBqYe8MTYJixp
         mi/TsXiigSx1H+T0Uk3wc9pdmbjDGWLVY/aeNjHMqdNplCHF52D0zUKTGDJ6utIO0Kvf
         KEgBV+nX7wZf8xIiqsoCgSVjktYbbj5jY+lsaVWMdvUGHRNsE0IoP8KCZA+duxQjS5Rm
         1bMiyqozqkWs6gYUVszlBJu3pB6BageiEVLN2v8D70yq3+7aa8qNzMsO5EsuPitrNG2s
         ia2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276718; x=1785881518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0sjE6q1pTHhYTWxhv6r6iJjoLT5263VahOXbBfbbJyY=;
        b=hQhyUXtLXzz5odYvWD8ShSYqCfJwIbcKrtvYkAY8vBBH2lt7PXEtMAHAXFqGcoN9S1
         ZwYq6voi6scLpJkpQSdPtNsm2e/yzvshRNsHLG+8Glo9HBQsO/sDfyDzsVVEPGkVAdNS
         VS7+W5Iov1LoNURcWLRNAxHn4NbfgV7BIdN3wZtc5/QbETzpydVY0j3QR6yfVOzN9mhR
         5v4E7saViiBquPPOeNvgHg2oU024tsVihBiuIgSSAEbTgu/ibdb4WRT9hrqdZfgghZCx
         yZ0RfoV52HJZokM5PtOaIOFJifpI2QoPR07awj94SOcDX+zBzAwV90rUYAWVSNK/yY77
         gKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276718; x=1785881518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0sjE6q1pTHhYTWxhv6r6iJjoLT5263VahOXbBfbbJyY=;
        b=PjzaLFcOeZJmIPIMXUKjZ3sdwtWfaHeTj9B6hh3oUOOEL4n6CT0uzkSHATPN64ZDdW
         qriKqblT35TRjwcaX3CFNO4xBNv4KlnFafQWLjg7ib+YVDOHhMdUpzco5EPKd36TiL+J
         YPtvKoLqAuaJDYBOUAgPNCn0dce2GfqaExJ+6lqbYwumm0yaUect1UGEC1YrwjFYrYl2
         yH3m5pFS1cZ9BsLSTzNG+H5AeJndTFdeBfr474BJmtzoWjBduZKiNevRrxv0vj26p9on
         ixyUJ10po0ppW1rfIsGmlFZwX41ErHi6qKzZ/RDq3l5f8mABQL2+lnyMFF/Y7nU/XHEk
         /wbA==
X-Forwarded-Encrypted: i=1; AHgh+RqJyDfnj9IYO8lRwmsfkM56mNZ5qGTbNL/LpqyavyvNZ4/I34TH2fVwXh+W7kfEdRpH35SVhNr+kNbo@vger.kernel.org
X-Gm-Message-State: AOJu0YwtIB1+6eMCnJi6/0L1b0cEQd8OSe6MEhpYkfpAVLN4LYFuwqRp
	U0DhaU6raouHdNThJAd6Y5ls2vI41nK+1iqUUioncS0WhZfexfndR0OeI6a4pdt2Ke7etXkAoLD
	k7p16MwG9vLx+ZQCE++47d9se7gAJ2GA=
X-Gm-Gg: AR+sD138e+ZDvodjzVnbFHBFrKH7Mw+8ZT3tSTduTWxtGU8rIyX+Ffa9CsZIteil+t0
	wxJCPgscazPNCjXs8fu9H0lwjV9kE9123Z6iJQVmAvdsjIjsL3Tr27pb4urDEju2444P2b+nIjU
	/S7BnMFF/yEX6cKNDkK9QjJGyzZsZUGP9VBzguEgda5Re0fOmev1fADuaJ6uAYymu7Hhiz/d8Xp
	+L8YgsVdTlzx5HvgxuS2SVCd6w9ztfe5FdetvXfO+rz8nCWI5uRIg+jME0JG6WSpnMUakd3ngxQ
	N3Zp2MMxSjruir2Xj+HPHTr7lRJGSXHfcllBBtI2O+7XzkZ/npVXXXFgICVouDonaCF+S/J8un8
	JObUumY1CGHzJqKh7kT966+0vAUx4B5YHv6T33naWJmmWgh5Kzf5Hrnr8rbqecNVebgCcy/6x
X-Received: by 2002:a17:903:181:b0:2c9:8287:fd0d with SMTP id
 d9443c01a7336-2d015d0b77amr36634555ad.3.1785276718062; Tue, 28 Jul 2026
 15:11:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu> <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu> <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk> <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
 <c7b9cce5-5d69-43db-91c6-10f6bcd07b68@sirena.org.uk> <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
In-Reply-To: <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Jul 2026 00:11:44 +0200
X-Gm-Features: AUfX_mybY3jd8I_-bMYAwD5Ck2DdSJWDQ_F5GunGUVDffAKcxMJG2s8SEV3pGBc
Message-ID: <CANiq72kcrJw4Kt=5zTN9vvnDq33_4NV4AZ3jHTFNBJjVxmU+8Q@mail.gmail.com>
Subject: Re: Policy regarding linux-next only changes
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Mark Brown <broonie@kernel.org>, Leandro Ribeiro <leandro.ribeiro@collabora.com>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, Daniel Stone <daniels@collabora.com>, 
	Theodore Tso <tytso@mit.edu>, Alexander Potapenko <glider@google.com>, Christoph Hellwig <hch@infradead.org>, 
	Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org, 
	will@kernel.org, longman@redhat.com, mingo@kernel.org, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 4:46=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> syzbot stops upon encountering "BUG:" or "WARNING:" within printk() outpu=
t.

Out of curiosity, is that a fundamental property or something that
could be optionally be relaxed (for certain linux-next runs only,
perhaps) so that you can continue testing in certain cases where the
"WARNING:" may be harmless (i.e. irrelevant for your particular
fuzzing)?

i.e. I was wondering whether the system could ignore the "WARNING:"s
(and avoid the kernel panicking on them etc.) until after boot, i.e.
when the fuzzing starts.

Cheers,
Miguel
