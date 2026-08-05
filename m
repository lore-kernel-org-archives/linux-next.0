Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0905C47ECDF
	for <linux-next@vger.kernel.org>; Wed,  5 Aug 2026 16:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947058; cv=pass; b=ESOJRRJbq2NwhtoPcSTnQ/XXyAcE7UtOW5jALL+elnxTzIqg2zCtbB+ULaFrvAuMeBD2GDGPzkQpWxMZ/8TBSL1HPQCm/U1fA3RswNbWOcW0zMuJ/vOlKJsnk/j0qQBto6QkD1+8Dz7nqueYpHwOg655KpFG0dXsMSVquu8lxWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947058; c=relaxed/simple;
	bh=rKAZ3Lkdt6WEA5wFMWmLMVDk2hee68HtY6N4UyDz42I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrBH4C3wSKkvQmwmiZGe1xFa+t/v/EwJ9Xv2DAVIsQeGrY0gvBYU39xZRjQcTJzcZK6L6tJ7zBwyQMhnfnOmbszyQZsdaKWpDb+CsUx0oMAb+KmBnvyDo2oxm+8P3jZZQft+lXB90b2TLu6kBbkBEVj0vjz9//IpBzhFwTibgoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJA0Bwk2; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJA0Bwk2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cecdc24b1cso1730605ad.1
        for <linux-next@vger.kernel.org>; Wed, 05 Aug 2026 09:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785947056; cv=none;
        d=google.com; s=arc-20260327;
        b=XQZeoGXe073tfBvVlEQT0KLcQBAXQpptK9h3JunVNvlqXvqAb+buP24beiBlOgJpqG
         r7+btOfI9gks/7Vy/o/Xz1e546xwfqDVIxdgP7+z+z7qTwRABXe7Cnt26zQYUXqkL8hz
         pnDXGl7VbbXaz+3KRmC45HdXm6K7kHROUO6lYoG4f7qq3mjNtvvOHuZxd6m68lc7BlSE
         foxROFQih+Ix0WIk9no2OZMcobyYr8TEFAKCWhtUno0GvbYnU+sVbfZ4M13n1ohccUe/
         dhb6DTcP8Is1NzN/axYnw0wTEn2EBP9aNqlQJZzfn8KeO9vYmqJiH5lHtHIM6po1HCEj
         eErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xh5IJEgMTtV1LRctkdQByNw6TmfCgKyTJ338f2MQFak=;
        fh=N150sYleP1njONuv/8gYQXNqMLcvrhLfrjL7GiY+gZk=;
        b=IA5H7oeAM7ZruqJOzMjRQs7I3vLHk9Uh+fOglkXEQk6M/dwOoJKRZE3p8prb3Kpvr4
         8YukB+3hDLyoTll8dWfHjcN9ElLvqbtT4CodKbjIU6dJZWwESNK44qy5KZWjbCygvhBF
         dA7vqBsqEe656JZxIrpOkYen7UuppYLRJIbuCMPrF+L+zQWuQr/9UlDT3UiGTVC2HOz6
         FAtCKK3k5ri7HblHVvVh80plAh7Bw+U/NeaUjb9EGO2SgqeDi6xtR+5jYg+fnBcf8Lv2
         YyRcH6r85WBgvseJ0fybwQ/XRcrwWfBGqta+VKG/iHLCAdyhIxC7xwzLqC/fy2/ooTM1
         Cxag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785947056; x=1786551856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xh5IJEgMTtV1LRctkdQByNw6TmfCgKyTJ338f2MQFak=;
        b=IJA0Bwk2Hl6Zf0FnJMyrHsnXW83KRxgQypgn6wDjH9LVPmEUBcsL359jbmDwvv03jT
         1Pi9sJqigcuuGcRAIhha12HDTemXi+AKWIPmCV7wRsQGy1xpE2sbw7OA221ibQF+bQiA
         qZjoeGvWFaAL+GLRhg0lcQFhfqaSVFQdesCMuXMENJW+IfGjHk+NRIF0TTAjTB9FdML+
         2ITDXAMBaPuMyLfwEz5nJ0Yyco85147N5MjmhzxHkoW+F0fwQatNG76jNPz3nuv/51Dm
         PKMnMAVvpQH7bKtTQoI3Pi+4zhalsJT/dzksyA7yR676WLFn0XjwAhj22tWLfjbAdvI5
         bZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785947056; x=1786551856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xh5IJEgMTtV1LRctkdQByNw6TmfCgKyTJ338f2MQFak=;
        b=VoJpdWnzfpfmXbvZKoqE1b0yc5F8524d3gc4ns1SYgrdjIgxmS4cUUgsOfZb+Hjnhe
         uaTpnPK79azAfzt5oaRge6x2VW3Ic8uCm7F/hOplZozh/U4fJ9ED1acxz5MZXNLMOZ7d
         ammy1YI4CNSKjyUiDRTuGivmLvbRRajnLCESWL7qUDSbUusjikL0RZTZ1Vl/yJu9jymW
         DANsTaRJ/BNBtgut5hsMeLk9EDLdKnkKP2WyswN6pFra7izYfPkRPu0zC4T/F2EvNIxL
         xrDedJlT+/Rf5yQ2q3e8ju9ufLrnjB+kgQ6LQBlJwGsbbyVRiuuvL9WGi+5DQLOXN+3u
         IDbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8EWLYF7bYWymX6OxS0GaGNGXHNA/ZHOxnrlElsWkAMX5tkplt+thK68jHU0dyP4pXVq3yP+2qtfO4@vger.kernel.org
X-Gm-Message-State: AOJu0YzMqw4GeN6ZxRKiAgbWN4ma5mYzGVSyETm+CMxHXLgkVVOoZEMp
	X6KN/gVR3hBMnspDqs8c4BCd3XQogOIZPKZC/vJAZxsYEq2i8Z3vLN2nf/T0ClZzhmYgsUFIIpB
	u3OdGyhF+fy5Wm6f1dSrWUEEBz2hBLbI=
X-Gm-Gg: AR+sD11mgvAZTjx378bfRDCjRN50u3U530zNwxx4Dw7kUj6WSlBtiogz5vmBjYx4fkM
	zB/ktiTgCeFojpLuwlXSXQO6X8/h1pEyODZgCvwmIww0fOI5tK1nz4/ZuJh5l7gGE6RiqO+leoY
	CiOJDwLWE3AGOs4MSEo019i/HuB9VITjCCICMX4mrjKpmBYL67CgBvEyv2c0zP49T929GAAqziF
	WnBIZo7c5jIs4Ql1WeKjnICTBWD69BaenSkVb/YP/7/adZUeMfugFZmp23m1++P1OzyqIFtyy/O
	uVo8TnU+wz2X4k9tFFLjBbXcYfRJffLW93K5emxUdvts3+nuKc2KapIOuFfNeBRWFM1cEGqNnQ9
	fEFYyrxQM+5WvGXVQd9K3fvXNnoXoxob2jYNBrtEXVAMjXE0+54+HTzXqdtG+fNeuhDbxRCM=
X-Received: by 2002:a17:903:468b:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d0ca761dffmr69410425ad.1.1785947056397; Wed, 05 Aug 2026
 09:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731122826.737703-1-spasswolf@web.de> <20260731192522.GA1014697@ax162>
 <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net> <anCkbMyUIscmAheK@tardis.local>
 <7c39e6cb-0ccf-4a50-a853-0f6012b05044@kernel.org> <DKFF147BG8PR.I12RKSRFQS1B@garyguo.net>
 <11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org> <DKG2TQ94TGLB.3EO7ZNVKB50KY@garyguo.net>
 <7189ebb5-ae48-4466-9055-1ab1b0b5ef7c@kernel.org>
In-Reply-To: <7189ebb5-ae48-4466-9055-1ab1b0b5ef7c@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2026 18:24:03 +0200
X-Gm-Features: AUfX_mygijAuCVxeQaTTUH-pXgVCFiiXo2upSYBRt13e-biayo0C4LzxsKAA0vI
Message-ID: <CANiq72=Y1eVO5F0j4NXbnUzVvEnDGg0evAkeiE9hd-7hkeVr7A@mail.gmail.com>
Subject: Re: rust compile failure in next-20260730
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bert Karwatzki <spasswolf@web.de>, Harry Yoo <harry@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:35=E2=80=AFPM Vlastimil Babka (SUSE)
<vbabka@kernel.org> wrote:
>
> Thanks. The slab/for-next branch now includes the slab changes.
> The merge commit should thus perform the rust/kernel/sync/poll.rs change.

I don't see it in next-20260805 -- Mark, could we please get the last
diff hunk from:

  https://lore.kernel.org/all/11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.o=
rg/

applied tomorrow in the char-misc-next merge? i.e.

    -    rcu: Opaque<bindings::callback_head>,
    +    rcu: Opaque<bindings::kvfree_rcu_head>,

in `rust/kernel/sync/poll.rs`.

Thanks!

Cheers,
Miguel
