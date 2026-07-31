Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678932F12AC
	for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 13:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505745; cv=pass; b=VuVe+0AG8lL+HFBF8wm1hX6DqG1mZS/z87kDoa0Bs216adxcL3ytE/wJSsbjMSIJ/nyLWqVMlqwVh+AG57MculPkh2FvV+DnMmuM2NMF3mIOkLIC68uZpsQDISxZL8ctnPMwxz1RjFagdQmqOTw4XyctAHnVOo4yHwLmqmvnTmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505745; c=relaxed/simple;
	bh=+5Dx6O+22FOct7QvrPmHj/hYfyUYOlW+JktxcsApXa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtVgT1B3HT6kOK7yC0nQGEbM6muaaNjXTu2PTD9QI78Yq5Ac7f+mS8TCNJ7/k12RxlOcsD1yotAt1JG8Sp1CVvgvpw04qKVIyqMrk0oC+cOgDvY2R9R+fV1k+23Oyi9V7JF0/+IV6bBM0XRKwurNRVXm/oojQTPxWx2ZXNT2zmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVlksRms; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVlksRms"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso9196505ad.2
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 06:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785505744; cv=none;
        d=google.com; s=arc-20260327;
        b=M6+qT5x5676bYKpl9sDyd1xhDWorTyLUNzs2LNUcl7B8qm3zBiuor5DnQVnL2vNOmZ
         LMFpdFpLRWKmXUkzdfZEfQiihTamHE8q87LP4DCXh/DrkJdx3ATiozJMlG4HWSFzHjRP
         IpFZyqC3HtUVwHv6aRrxroWVnWyC0R+CSUn9yeaJ0FpJ2WJOLaLVDK87g5KMAI6fC61B
         goJpM+AnrwY5sfdGigUei68QEHa6LzcEbvV2s3JGXFssBnYHBAWzUFOYgKx7ELbNbSDP
         E2/kvCAIaSgysFOBdSrzG8ee7B5imsnKp0btqhkKwp1OyNxMEyzbc32a7w+rxjNuFqak
         EyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IEgDxMWh9uDWWULdXcAAQHKrPjbSwPSpzBVVp3o/wCM=;
        fh=tZlVBUDfeEEANu9CidcIi7UXfAf9WQZqqguXvXsd55s=;
        b=A2dNBUYj/oB9kw7iGTJI72IBxRmCr5IgPWoS0GmdO70szUR4MuBW+0go8vgl0ML3hs
         JdRANcpuvKZMcAQ4GxIKOTuN5KQ0XgItDP7+ztgi7KBk4aZWDAdK4738eJK/ZuPfRPNl
         kLPUb8CcrHnGx8WxMIuu7f1G5m7SAcepIBI/stP3P1frozoSw6hk17pgdR5jfkl6wJRE
         rCKg5fJM9d11YKIxC/0GxLek5ad89ecnVuWf0YhnkSvaI/micAUV18MqZfcpJB5zDSkx
         2+nIHNdGopJwP55rzOXGkEHyAOaWgfbFRr/qOxNdWvEV3r5n8NWfwoJigGoDsoMppIcj
         VHWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785505744; x=1786110544; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEgDxMWh9uDWWULdXcAAQHKrPjbSwPSpzBVVp3o/wCM=;
        b=bVlksRmsmu51fmzUEPfjFZ/TqQpDgTqxsu1KYOT3isLyngfxpjG9galf0nckATS0XE
         adV6sqEMqpZC6lYVLwbPFgR/6Cc471PZ6AW2ZbRyvJux+M28Ok28SzBQkZNROnywn4fz
         UqgI2mXAeMDByu3wnMlLvPijByJl+64ursmUd+ZsTP9fsAO0gHv209YNgN2XYYTv01HZ
         zxl5rvgZuXI3qG0UnCK5Rcq0dHDr7Y3HNTDplkHq+GO27CwV8yHina6z+fbx774AXp0Y
         gb90rzIdHtzJV1VCmzn4pAMD9q199GsWdP/Ha1Fh5uL9U7e/y/WhbZDYVEvuDIXsgve3
         fTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785505744; x=1786110544;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IEgDxMWh9uDWWULdXcAAQHKrPjbSwPSpzBVVp3o/wCM=;
        b=dBOahCnMx4kiVC3KS4sRS9JAhT0Ai8zKSBvQdMlLbz3VCsvA7mwUBdpjT6OyltuSuj
         BHvF8ES0LYzvpjJKMkBhchWAZfLODHyVvpM+i9HUJUBO6zt2xRrkVgv5B/nbIODDJDB1
         /S+DK6vYrD5vYDFPEsbtaLOGoKRzhX311sQQNqnKZUc11z7DeJIhPzhV5NT3RNgClQfQ
         1JoLj03lIvCes155wF2tL25kSVWeOLuxnGYsWWxeKSMK9LRI4DE0m84pYPYhXgV0RCiI
         XHQ88vWyVt9zENetpBRUcXq3dGq8mpl5A4jjh/UkAVDqJLhXvoLDNO/wvYwwx7eZ7wyU
         zAag==
X-Forwarded-Encrypted: i=1; AHgh+RpJCRFX6YyLu0/OlPolFn4Vvqn40Q5xmFBDj9LuS669sQutPps3PHETou8oSaJ7+BXHTLfSSPZ9u3Wj@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMnMTccZrotjY706skPXDHqMEBfzoC3ISN6FSXu+zGhb+NrhD
	tEuVq160ji9Q5YG1DmTFxuigY4rUBN4XMb3uZhBQbUw6HTMAVXz/eElpZzShji9uzc7FlFQp8xG
	3nuXDIooyPFSNKPJiDP3A1TwTvg+Teew=
X-Gm-Gg: AR+sD11eQO0Njqg+oI4+AGOLhLvF6WM2ntjN6cuPOa7umwhqwK54LQW+DTcRktwZO4v
	wTCN5A5zhuJygzCg6WPU2TZVySRUlA1X/G4f2h0rB2ip5rsQo/bbZL6Pq9dVWjvxAd4e6s/pVL7
	bu/l7ilTj38Hrp+UuKi+Qzxvh/U2aSjbdMdY8mGyrmGXmXrHRpXYM5+xyzRMhcfe/6cYCFB98hZ
	IwVLsf4+wdLrEWlaziSvLr7KWw7TGEmX6XMQ25B4OJwtvi2+KgyzGCi3IhkTHDbyNMzBMoZ+r9+
	HRihB1Qk3jpOcLc9yc2ygnQJKkYVWrrW8rhs3UTprQa8fEl1u9ej/Vbj0hy6xfX/vXuvIMuMkbZ
	Vf7BFNdaVa2VmKXVJ1OElKLDdDIOawAhWmSp2DUAkBxBjTusivFVgu37RAAl1mjWnc4pLwptjss
	OBMwleYy+TdH9JlA7FmxLYxVRf29Z1tdPh7e2D1tGV
X-Received: by 2002:a17:903:1aa3:b0:2ca:106c:7122 with SMTP id
 d9443c01a7336-2d05219f5bemr1193585ad.9.1785505743504; Fri, 31 Jul 2026
 06:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731122826.737703-1-spasswolf@web.de> <ae141e31-dcc0-46a0-9f3c-6bf7089722b0@leemhuis.info>
In-Reply-To: <ae141e31-dcc0-46a0-9f3c-6bf7089722b0@leemhuis.info>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Fri, 31 Jul 2026 15:48:50 +0200
X-Gm-Features: AUfX_myN8on3SUdI8jMlZxUbEjpGjEbT6xoeXpoJPKe3im_O65fK3BFIAtWSHtk
Message-ID: <CADo9pHi=w2OM__hqCNu4H-HCMER61Hiw76QrxG7B16ZnBsQp7Q@mail.gmail.com>
Subject: Re: rust compile failure in next-20260730
To: Thorsten Leemhuis <linux@leemhuis.info>, spasswolf@web.de, 
	Luna Jernberg <droidbittin@gmail.com>
Cc: Harry Yoo <harry@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Noticed this too

Den fre 31 juli 2026 kl 15:21 skrev Thorsten Leemhuis <linux@leemhuis.info>:
>
> On 7/31/26 14:28, Bert Karwatzki wrote:
> > With next-20260730 building a kernel with CONFIG_RUST=y fails with
> > the following error:
>
> Ran into this, too. Fixing this is discussed in this thread:
> https://lore.kernel.org/all/20260731075644.20215-1-ojeda@kernel.org/
>
> >  RUSTC L rust/kernel.o
> > error[E0308]: mismatched types
> >      --> rust/kernel/sync/poll.rs:175:44
> >       |
> >   175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
> >       |                  ------------------------- ^^^^^^^^^^^^^^^^ expected `*mut kvfree_rcu_head`, found `*mut callback_head`
> >       |                  |
> >       |                  arguments to this function are incorrect
> >       |
> >       = note: expected raw pointer `*mut bindings::kvfree_rcu_head`
> >                  found raw pointer `*mut bindings::callback_head`
> > note: function defined here
> >      --> /mnt/data/linux-forest/linux-next/rust/bindings/bindings_generated.rs:73708:12
> >       |
> > 73708 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr: *mut ffi::c_void);
> >       |            ^^^^^^^^^^^^^^^
> >
> > error: aborting due to 1 previous error
> >
> > For more information about this error, try `rustc --explain E0308`.
> > make[5]: *** [rust/Makefile:781: rust/kernel.o] Fehler 1
> > make[4]: *** [Makefile:1420: prepare] Fehler 2
> > make[3]: *** [debian/rules:80: build-arch] Fehler 2
> >
> > Reverting the following commits:
> > ef32a74f8f6a ("mm/slab: introduce kfree_rcu_nolock()")
> > bdd0cc9f0ffc ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu batching")
> >
> > make the compilation work again.
> >
> > Bert Karwatzki
>
>
