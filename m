Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486EF392C27
	for <linux-next@vger.kernel.org>; Mon,  3 Aug 2026 12:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785759703; cv=pass; b=gZcn6Wl8OGM4z7B9b8o/XmNSHK0xoMK2a8K8C+3qV/aOq0AxHjfdUzNTCKGr9Ch4vB4xggaZPOaU3mCuMlXYzJtf64roEQSPDJ/O8mUxwfZy0c3agJNOj59pwRkLKqa6FgR+TVHBnFnznrcM5ZjnwmioekmYPpcTurOpd/feO5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785759703; c=relaxed/simple;
	bh=+evJChw7RfljZEnRqnC3eY6/uavBJEgL5/Aq479N6eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdVNJlhftNLOtSDSgL1kkIUTjB1IUzxuxcgp0MdjsXHxjuWrHC3em6xlyBpq1LfuIUymTsUqU3pwBOyyll8vyBUSJiV7pA4SP5MHO3F7AYs3orQOX9nApzol8pzP5WV1VVbZ05gx+mPrpIgoUaudgpMjxPDYezcVIdcb/xTF3jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dy2Q+1OA; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dy2Q+1OA"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cb2513ec378so159487a12.3
        for <linux-next@vger.kernel.org>; Mon, 03 Aug 2026 05:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785759702; cv=none;
        d=google.com; s=arc-20260327;
        b=amxotMKOrNUEFuF6QHB/UkWzKyWtXTAhpYMG+r1X6T+VMdAnhZ5v5/P2RGcm3O4FaV
         X0rbNZsIeUj1KHngw3n6hvA3EJQT14225lk/NoddeqwUyDbiUX7UlnJYGLDA+fuNHJmn
         Blj5pGGd9uKmjgTwrjm1eNrPNyXupIZ+C2DBuW+KgYQiTPlK5qzJDRb5mRr4q6KbjET8
         NRDHX5HNTMdFMI5uvp75dxqDy9paecbUMJ8RluJce5wksI6oKfVg5A0wpvGP9f8I7eVS
         CC0T4Z6rth4YOIwh2Z8U737O+yn3uuetkKJRKEMtGhslaVRP29C+URfUo3cRkE5MUhQW
         ewSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+evJChw7RfljZEnRqnC3eY6/uavBJEgL5/Aq479N6eg=;
        fh=j0bdUQAF8KQEZRcpxLPrTgq4tTX6KnC85MPRLUrbi2Y=;
        b=rGvWFYUAnxDToi+R1xFnGuWpvjvp9OWLDne3ey7QeETozmtbN4VzjkS+ZRATo30AJP
         J5Omx3pYXQLlWbMG7wAwI3GcUlHq7wJr7BIdimP7OjKBOUBjwBP6Lkvco5FZaPai6AHR
         bcjfveAfHl2Rz7VeOPRu7Q9nnSL7dZLN7+o7Q1pPx6pYpe8Bmor+AwaSluaneTpQgk+V
         1u6MNzrQvlW0WuoLlSmDpWm5sgM+KFYNQ5M14u4Qzrb7slyIJLHjrytqFVk5f879t0Av
         sWGm/qYJ7KOvmJjkjEVS0X6DzsocuCeQQzp3UOj24xrvau8+8KqzyHE56E6W7Ag8dlgf
         tKjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785759702; x=1786364502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+evJChw7RfljZEnRqnC3eY6/uavBJEgL5/Aq479N6eg=;
        b=dy2Q+1OAOgP2Brm4MPA68ShO742Xmbkl5uZBcHAW5x+DuPZfDsUiI+1GJvcWEGvRU4
         295zg1XpaADrDbFXpblFvihQtoX6cSl57mgNEBbIyRXM8+wn6hi1ZWp3j4QcAreYQcKo
         e5Ju8p1HhUS3yQt2+TZ9RoJf2Ylxmj2gzWg3Y06IB6MP4NwBX+RPlDngoul4SLUyqvTw
         0bKgyNvCVCWxswDbrKD4V7OtPlP0Vi9AvJ38bpqHKgcPhA9/RiZekDCj5eZ7rDxVVb1B
         +n8C0UQ/WQOFnL0RVdm3kslFV8tLq+cOTUNi/a+BKxJfpxZDdX4nNBo+CCmfu+saNCCV
         u52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785759702; x=1786364502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+evJChw7RfljZEnRqnC3eY6/uavBJEgL5/Aq479N6eg=;
        b=qS6dHl6G57gykHXQbcBvtnQpl+0RFKxptzrdRqMqidnGspCBDK/y5rFYsR5hjdW4qR
         DQDBl2U9X1REWhzIxUpcYnu9/JhiMUhqTNZiC2J6Fs4w2cAB9mI5J/UR0NFj/+Lnu8tH
         WHEc3ZFPxsp2r2LZS6hyzLzD+S8zJVfm+fd6mBKghELeTXUs8gqxULUBA9r0npGIe6M0
         RrG6BKz2ZN7XkcASw/cuq4pME7BfcQy5pD/A8GTv5FiueOHIvfy+AB6vT2DebkClDCBf
         AklVInyOqjB6nfqE90H3a9/YKV4mwpqw23oNuO6cIKmtaBLxfvrM2khZBsbJgzKW+vpw
         5xxw==
X-Forwarded-Encrypted: i=1; AHgh+RrRGFlZ/jzpV5gH2Y0Zdfv1Bs+ZHsVGtsCZBwbcr1X1h7Z+HLSKvDQYJQ96hPuE//qw1qVTpCTptC4V@vger.kernel.org
X-Gm-Message-State: AOJu0YxgOxQVGIfgZiqOtKwPUWRJw5N+aOyh1Y14wGMn/t/1HkEcLox+
	7XBMRyyuf9qJ8k9/ofgSSKOwTdYS8s5K49/jDz8SrmUhvGlqpubAw+IMIuUDIhM9zohQszAM2g7
	CixiNUGdsjBaPcJXvo0qd5JQ1O4e8+4U=
X-Gm-Gg: AR+sD1150v90r4/ieeeCOOXdWvIv3XhN7f3aD33+7ex/96We0WnpUNRJ07F0TD9QPBO
	lA+iwHNc6gfQdSoA4wnRlcigQ2RVoU8QivL/iQUYPeKWQlc/uNMmQl6JsjpFvsiX3Hba5JX7y0+
	E8YfETZRHG1hKgWjr/EQnCLd41ItpzMfp0YaVA9+085QB1FvZvP2pZIqdY/yzggswLEtcIgr2iq
	8I0GlJ4S1twU58d7glWJ/GiHEdfaFROmwh9Lw0RaZl6PvBiAv5noIG1IBZ0sovkIKYmr9BXd+mc
	4+4rwp+SfN4pkGn9CVg7mApVUbppfJruDrKxb8xilqtzM1veZuJd96xqN5Io+bpZc93m0QqoyEI
	JI1bRdimMSeI+meQhyTpJYrrqXeycGQfcFKM+7KPvy9RcOWLD/jAxdDTx0MYd
X-Received: by 2002:a17:903:190:b0:2cf:7dfa:7f56 with SMTP id
 d9443c01a7336-2d052404e64mr139230855ad.2.1785759701718; Mon, 03 Aug 2026
 05:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amth-CMf3Xz5hR32@sirena.org.uk> <20260731075644.20215-1-ojeda@kernel.org>
 <am0AjzHc0m03CLVa@tardis.local> <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>
 <20260731220137.GA3307698@ax162> <anBBhmBSwLgcLjht@dev> <CANiq72=-yqp1JDHn-ucDpWcx=wJ7Z60K6am6X84OTqNiR6yytA@mail.gmail.com>
 <anB4nsW4iLYMs288@dev>
In-Reply-To: <anB4nsW4iLYMs288@dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 14:21:29 +0200
X-Gm-Features: AUfX_my3lHqez72BuqdReItiNIUHcrKEOVXdZ6wyFJH5Savd7pLdFgCLwf1vRXk
Message-ID: <CANiq72kfe7sQEK3WjTQHg8cLnB86dsx9Cr4uC8+asr0q702xhw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
To: Harry Yoo <harry@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, paulmck@kernel.org, 
	puranjay@kernel.org, vbabka@kernel.org, vbabka@suse.cz, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bert Karwatzki <spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 1:17=E2=80=AFPM Harry Yoo <harry@kernel.org> wrote:
>
> Makes sense, thanks for explaining Miguel!

You're welcome, it is nothing of course :)

(I forgot to mention that in your PR you may want to mention the
linux-next resolution to Linus explicitly -- he usually appreciates
those)

If it gives trouble, please let me know and I am happy to help.

Cheers,
Miguel
