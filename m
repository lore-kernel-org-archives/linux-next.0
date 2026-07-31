Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB02369D74
	for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 21:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785532498; cv=pass; b=eBD17hnzTeG8uTidXH2BpkA55iSXF7xVFyxsNCBoovQwT4pdtGn7c66eHpFZHRp7JJO+8ZrWC5bKtTH8xioURp8YX/W1gp4o5WSFtPinbN8JjEksSq43EWKsT1CJeqE6zO6pOnrlKvpf0nVFf+2WK8pajl+9+UQUdo/AYOz8d0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785532498; c=relaxed/simple;
	bh=wLWY+WSdibRtEJbMRhwJ+tmuYCIDNzsW1uBpbWgN6pM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ei1RDTKK1M7XTTDc+7MM/Z4PqljxkQyd4duRU1Jo0xgv7/YVH8rxrW02IQZRQ0Y4k4BUrqox9AhgTE3c1eQr/dh+p+42iUzsEU7ZRoU31cQKMmYlgdoF/BTCNwH6FGEBsBv4bX3z12Nhy1dGJtBJtPIZ4Y0S2Euatcw5aajBnac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kz3gl4DW; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kz3gl4DW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f707e5d75so1184668f8f.1
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 14:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785532495; cv=none;
        d=google.com; s=arc-20260327;
        b=ft2ECFybjoMOxzN1+qRCudsU0QVHlRQvYg3D3n47p9gSQ4tHg9/X5v0+mfARjT4tHs
         +0Jq/y5hTFL+0mK88d7/oQx8cU5PltcXhQLgaCbIsm7poMda+2ZBVuLo4BJHkQM9XVEr
         P0TsrlcobC3/IYwGiQY060dtsmlbsHwjuZzNe4DSYGPcXpGc022JvpfQNTl3JAuboSl1
         Jv89VC4zAUyDeVInt5gmo9oC1iULhta0UAnEG4NpqfdX3uzIlRUYNv4Z7hPQ5sQNrIe+
         8jnMj7ffpmBxBCU32IdvyRhU9s/CH0tkBHKcGV4gWJHgdxVnsAqd/p/0xlB1fBjUUDvG
         Qitw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x/+tAZadlozyO5e/ZDbWwajBHDv37pfPg1IsfIpc6ro=;
        fh=GOqphqE2tKG8tTKjiUS7p+iBrncjBb82azcUAPswefo=;
        b=Msj74lUa2dIS1R9RTCgrRKla7VSvfHR0haYIn1d+lOqdfz9ZZx2imtG2Rr129iIHt0
         75/KbnvC8HBCbE76CDnT/OAOgxOaRfVIOeRqXt2Q9bEpCbQwpJFjOjX41opSPhPapyqC
         svipl3QsNeJBo8A+u1gn7rHUN9UEzvvfWfdP/EqP6+Cchu5EbhFimUHzOyjB6Rut0fot
         VKSCNAFKUq6Z4IPTc2b0l8vlvHTUn6MF2mTZCJOSB8SZPkuTdtALd3YmT20MpgJDG8HJ
         CRIjRYRozPE8zsgzZupDDspxvWjcv0mRcify8KfonM3a3lJAwfhWZqfDd7USemrKW+RH
         aDYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785532495; x=1786137295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x/+tAZadlozyO5e/ZDbWwajBHDv37pfPg1IsfIpc6ro=;
        b=kz3gl4DWkHTx/eprn2edjrHCPrRdwqFKUNBoz1BnXuOcdtpmCapLbDe88eucoV6Snn
         9BkTNcxR9QMc8jk4vVZ0nysF+tf5Xihuy0YGodCujR3Ah8jLrfHbsU+DsGw73sYbvnVG
         NPK6zgO4xvxCyu+1YwDkmSMuC4pUZoogRF4YW6/BeUXMracsPc1HIg5yQFyJPntohFn5
         ZRVUE+51VUX90vr/8T986Yld3mKfGs3GaModYiLyrhf73KxVh2HviwOf9iUjIUsVpBGG
         3toUSsF8u/5uVhl7GHhTjAnYd0jYIbqr62ckwpjmTUOSEds50JlEl5xEAuNSFKRB5YBF
         N5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785532495; x=1786137295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/+tAZadlozyO5e/ZDbWwajBHDv37pfPg1IsfIpc6ro=;
        b=fGxLzXTLtYaeycYNZ4lvmhKQklZz5XY1jnvMRXI0g4VZEzbtFic6f+fzkoi/VhyhWw
         BSjbqEWYl2D6p2V3MH9OLuL6N7L4RJ0gJfGfMUX3dZ2q5UE7eKonTFT3eDapKc7d4izu
         eHq2eHfEWWsYXHXsWAysXiLktNT1hEGexL92UQbt9lRstKD14AYXHml48dNfl5pr9kke
         5P0inEij5Vgnw+Xe0HaVXWJrs8af+8bEUQukVOzM3aJTt+d3zIhmrYb3N788EUs/OGbu
         E1r8gQJQfFBlbr5JcJqGUX0ntTnqdKWG4y+MrGGu3LEbLzMH/vgBOqgcdqp1X0PxaDv0
         984w==
X-Forwarded-Encrypted: i=1; AHgh+Ro6mhT5s6GvfWrWymWBcHgnzqTG9U9XF0vudVTrj46xyLJTBVo5FFyjQJ/QDzHs1cjk/ES0ZEM72OTQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61KcIskualB5ssP35tJuak5KrTRen0YAcFLBx2bZpgoEgAhOm
	cfUT+kUi4Ju9PLsLH6gMyAtvAGhKk6Vk0X/hVMr6D28wjrT3QWcZxf2np/CwOoUdzJVoPah9EvH
	noVuWY8++JDEhleuc4xbgkCiAk6MemOf6MpIML/oU
X-Gm-Gg: AR+sD12xvyyt/+x/sBzFSZMBoYBrL9ar5ZJWf/pL1WoCP7kiZ5W5i1vhsk7PJav+bwz
	IFJQ0lPVc55xdfrkjR3+Q/YJCsOI12lfda+9TeyAZhYkugg3U5YeSO7xHbWin2wSC9yvMHpUb6O
	tcwOQsT5GzxGPPo1a4X8gmgkmIM8adJQYcv2b+ukOpRHo1xBfzhAl+8dkBZuFWaTYkRQhruSgMG
	mfftLvQ1fk5kKr9j9edRF5WZpmITRU0eByN1vz4DA0PoqeavhzCowu1gj7CZomJLtijky+yKOkg
	s/7oO849qHGo+E4i3cJjrY1auhhAk/RldQfa/QE+5aYRJvBlujbxjsb9HN2iLULNPdAnYzhxqEM
	=
X-Received: by 2002:a05:6000:1a53:b0:47f:8326:454d with SMTP id
 ffacd0b85a97d-47fd7314abamr1786888f8f.40.1785532494478; Fri, 31 Jul 2026
 14:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amth-CMf3Xz5hR32@sirena.org.uk> <20260731075644.20215-1-ojeda@kernel.org>
 <am0AjzHc0m03CLVa@tardis.local>
In-Reply-To: <am0AjzHc0m03CLVa@tardis.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 31 Jul 2026 23:14:42 +0200
X-Gm-Features: AUfX_mxN5XKkL8dGR_lzlBjIRZt5cdIKAmvxFfdJcXqxUuUiJUVw41rP5PFIXYc
Message-ID: <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
To: Boqun Feng <boqun@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, harry@kernel.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, paulmck@kernel.org, 
	puranjay@kernel.org, vbabka@kernel.org, vbabka@suse.cz, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bert Karwatzki <spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 10:07=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrot=
e:
>
> On Fri, Jul 31, 2026 at 09:56:44AM +0200, Miguel Ojeda wrote:
> > On Thu, 30 Jul 2026 15:38:48 +0100 Mark Brown <broonie@kernel.org> wrot=
e:
> > >
> > > Today's linux-next merge of the slab tree got a conflict in:
> > >
> > >   mm/slab_common.c
> > >
> > > between commit:
> > >
> > >   736084507faa3 ("rcu: Rename struct rcu_gp_oldstate to rcu_gp_seq")
> > >
> > > from the rcu tree and commit:
> > >
> > >   bdd0cc9f0ffc3 ("mm/slab: introduce struct kvfree_rcu_head for kvfre=
e_rcu batching")
> > >
> > > from the slab tree.
> >
> > The slab one semantically conflicts as well with commit:
> >
> >   e5e86df8b666 ("rust: poll: use kfree_rcu() for PollCondVar")
> >
> > from the char-misc tree:
> >
> >     error[E0308]: mismatched types
> >          --> rust/kernel/sync/poll.rs:175:44
> >           |
> >       175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get()=
, ptr.cast::<ffi::c_void>()) };
> >           |                  ------------------------- ^^^^^^^^^^^^^^^^=
 expected `*mut kvfree_rcu_head`, found `*mut callback_head`
> >           |                  |
> >           |                  arguments to this function are incorrect
> >           |
> >           =3D note: expected raw pointer `*mut bindings::kvfree_rcu_hea=
d`
> >                      found raw pointer `*mut bindings::callback_head`
> >     note: function defined here
> >          --> rust/bindings/bindings_generated.rs:90407:12
> >           |
> >     90407 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr:=
 *mut ffi::c_void);
> >           |            ^^^^^^^^^^^^^^^
> >
> > The C API was not meant to have a visible effect, but we don't use the
> > `kvfree_rcu()` macro, so we notice the change. We can add a similar cas=
t
> > to the C side:
> >
> >     diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
> >     index 684dfa242b1a..79d7e08215b0 100644
> >     --- a/rust/kernel/sync/poll.rs
> >     +++ b/rust/kernel/sync/poll.rs
> >     @@ -172,6 +172,6 @@ fn drop(&mut self) {
> >              unsafe { bindings::__wake_up_pollfree((*ptr).inner.inner.w=
ait_queue_head.get()) };
> >
> >              // SAFETY: This was allocated using `KBox::pin_init`, so i=
t can be freed with `kvfree`.
> >     -        unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.c=
ast::<ffi::c_void>()) };
> >     +        unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get().cast()=
, ptr.cast::<ffi::c_void>()) };
> >          }
> >      }
> >
> > Clippy doesn't complain about the "unneeded" `cast()` under
> > `CONFIG_KVFREE_RCU_BATCHED=3Dn`, so it should be fine.
> >
> > Cc: Alice Ryhl <aliceryhl@google.com>
> > Cc: Boqun Feng <boqun@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Harry Yoo (Oracle) <harry@kernel.org>
> > Cc: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> >
>
> Cc Nathan & Bert because of:
>
>         https://lore.kernel.org/rust-for-linux/20260731192522.GA1014697@a=
x162/
>
> I actually prefer Nathan's fix, since it's more explicit about the
> kvfree_rcu_head requirement. Alice & Miguel, thoughts?

I like Nathan's fix as well.

Not sure if it needs to be done in the merge commit, or if we can
apply it as a patch to char-misc despite the unknown CFG_*?

Alice
