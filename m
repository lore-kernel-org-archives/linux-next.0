Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D348989E;
	Fri, 31 Jul 2026 20:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528468; cv=none; b=Dp6X+y1ShbgIWUwgHDXNxc5MGAySAeVri/9lZXKmZ4yHl2YmEz4aYfbG1CvZEXJgE+I9g2Z0HTWVyxu/NJn7E1NDJHg22XcFLioHpiYHWABmaH+1Ocv4Wt0/F3CnXY3R5sKiPGwFxbB7hc7ks0hsM/7feww/nSkS+Ov4qZTV4Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528468; c=relaxed/simple;
	bh=TT6uJymB3UGeUaiK+KRhHH6tSsBP2LC1Si1VX+5f3QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfcQx4+8EWzEnRc4jisxDspXPtgYuffnlSNQOsjp73aX6QLNP/vQ2BWJMoaBJbI+8so3HAgYiI8Z9/MhbFcra1FdtPQvKGLc0B3yFBoOKygprB8on6G+Nao1er6nDCo30icKBdFvUBi0aibgOW9ZoR6Ldms/+TL1/Kso0rRlCA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUppgbNY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUppgbNY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B148C1F00ACA;
	Fri, 31 Jul 2026 20:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785528467;
	bh=ps3O+5OZWAMjluzvU/thMKwxH0hAkWElH0af0twGw98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XUppgbNYxLV15DJeQ/LL1IGQaepbrSmlBZxqZQUWuSsUM0ofHAya8Flsp+lTXV3Zd
	 FG77ZGwZzsWLUFai9fRPj6EThQ6YK8So2mcWx0DnMQixRscHsuO4GTZClrAJF48j6U
	 /w8T/JfkuQZ1gnl2LhVohNgpf5xAtGi7r5kT17Lkp7ynoXuxwmlQ1vQDCNgVozITRd
	 wPwP/fyIygEy9X7lw9bRQF4HjMh/Zt6OxfgRb/ludMJ8ZG7sdmGKrfljNGPkV9TLaC
	 7z/WxQm/OWOzR9W5o3xl+v9OgQKOoqKSXu8wbsExp0v0gQI3+IozeGKK0I/XU3W20G
	 YFSmqIkE7uKeQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id B33B8F4007C;
	Fri, 31 Jul 2026 16:07:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 31 Jul 2026 16:07:45 -0400
X-ME-Sender: <xms:kQBtal79h8JVh9_LkLLxG8-4rhbSHebTMPjE_BsyMpkrAyxtXhnd1g>
    <xme:kQBtaoGcsUjuuie86_MK_LpCLI3hvbvz46SZt0AdYUl0ldQmdQGGs24m2w28duxTZ
    aWp4sIYQypQfCLwLU4rgNOo9wRRXsp6YlqsGor8sfoz2IhvySws3A>
X-ME-Received: <xmr:kQBtav0QksqA8omqEGXLETak-UhDovy2-66RNlETvWsIwqMrQZ8p8vT5tyPAi0Y4PgsgFxKanTr7zZ8yP1eLPoy5Kdf3PTbW>
X-ME-Proxy-Cause: dmFkZTEC6nhBOd3HjFmWIeZ7q+EB7psPkULdKEP0lhlvgiah9PGN2owvQvqDz/9wy87C3P
    9uNsy7jNuj4WWBvrXI1+1vTks7mAZOyqpFRctlw34werQTljnApC68gvb36raq2/qnJoic
    phhz1qEN/yEXjKEUv6G8FBPSgxWXZBn89TgGF1b78s/IybCpcMHSXPzT0JCCHvXRTzpiDg
    Hquq6C9o18Y2EHHJXWs0DC4iJI/JPd8rQ8y4uHhSuVvx9hTztBngvM950tBOxmAkU6rshG
    EUo6oHEPy4OtTy0cm6qC+SZlDVu+2e6RhI4fhJQCE1l+CZaKfHcrVQ6fN+XAQ16ijY27N8
    Q3b11R5Kc80rELG69CaGDnFDC25IXOauCDoxJymVdXzyTcyqZMTlxXqggyB+EP6mh+fEiV
    w78pHx/USD84IXM08w+1NJBoWMitMZIgORmWOXFV8rVu8FDfDFXMrep+FCXSTHxABJLuMq
    uxZaBF5YBmcX7cr3HJpYyxXEYiZe0AokDPli/vRp9PJiUhAybUGKGtVoqwGL6bwdun2JGF
    UGD+JbN4j5c/YFRL9tZ2rrHjv+mr1F7sTQ34KeafWJfbYPrsqHRwytREU7wN0R8GAO5pHP
    lssO8otJdT8iVhcn0/3/Qb9exk4qXtop0kNRKsJ0s5TyQKYLn1qzeX19aJRg
X-ME-Proxy: <xmx:kQBtatrIzigctWuYW_-dffYG1i0tYxACFvfVIFciVncOE1l4be0QjA>
    <xmx:kQBtakP08j9Badu60xOVepFUH-xY6RdA4CdgXqmcPBPzknWo_37lUw>
    <xmx:kQBtanWyigoUWlnf4Kzcf2JYkbK8ueBFly4LvkPtdi2DPPVsUAvGSA>
    <xmx:kQBtavuq-lU_lVOSDSnvQJLM_5tDRriaW5Shlr8Z25UOTapR3AHz-g>
    <xmx:kQBtaq1j8aFJ03F4XGYv_tIGZfNdmDLC3YBhzwJGoQ1yvQfadh_dGLOm>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:07:45 -0400 (EDT)
Date: Fri, 31 Jul 2026 13:07:43 -0700
From: Boqun Feng <boqun@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: broonie@kernel.org, harry@kernel.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, paulmck@kernel.org, puranjay@kernel.org,
	vbabka@kernel.org, vbabka@suse.cz,
	Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Bert Karwatzki <spasswolf@web.de>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Message-ID: <am0AjzHc0m03CLVa@tardis.local>
References: <amth-CMf3Xz5hR32@sirena.org.uk>
 <20260731075644.20215-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731075644.20215-1-ojeda@kernel.org>

On Fri, Jul 31, 2026 at 09:56:44AM +0200, Miguel Ojeda wrote:
> On Thu, 30 Jul 2026 15:38:48 +0100 Mark Brown <broonie@kernel.org> wrote:
> >
> > Today's linux-next merge of the slab tree got a conflict in:
> >
> >   mm/slab_common.c
> >
> > between commit:
> >
> >   736084507faa3 ("rcu: Rename struct rcu_gp_oldstate to rcu_gp_seq")
> >
> > from the rcu tree and commit:
> >
> >   bdd0cc9f0ffc3 ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu batching")
> >
> > from the slab tree.
> 
> The slab one semantically conflicts as well with commit:
> 
>   e5e86df8b666 ("rust: poll: use kfree_rcu() for PollCondVar")
> 
> from the char-misc tree:
> 
>     error[E0308]: mismatched types
>          --> rust/kernel/sync/poll.rs:175:44
>           |
>       175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
>           |                  ------------------------- ^^^^^^^^^^^^^^^^ expected `*mut kvfree_rcu_head`, found `*mut callback_head`
>           |                  |
>           |                  arguments to this function are incorrect
>           |
>           = note: expected raw pointer `*mut bindings::kvfree_rcu_head`
>                      found raw pointer `*mut bindings::callback_head`
>     note: function defined here
>          --> rust/bindings/bindings_generated.rs:90407:12
>           |
>     90407 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr: *mut ffi::c_void);
>           |            ^^^^^^^^^^^^^^^
> 
> The C API was not meant to have a visible effect, but we don't use the
> `kvfree_rcu()` macro, so we notice the change. We can add a similar cast
> to the C side:
> 
>     diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
>     index 684dfa242b1a..79d7e08215b0 100644
>     --- a/rust/kernel/sync/poll.rs
>     +++ b/rust/kernel/sync/poll.rs
>     @@ -172,6 +172,6 @@ fn drop(&mut self) {
>              unsafe { bindings::__wake_up_pollfree((*ptr).inner.inner.wait_queue_head.get()) };
> 
>              // SAFETY: This was allocated using `KBox::pin_init`, so it can be freed with `kvfree`.
>     -        unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
>     +        unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get().cast(), ptr.cast::<ffi::c_void>()) };
>          }
>      }
> 
> Clippy doesn't complain about the "unneeded" `cast()` under
> `CONFIG_KVFREE_RCU_BATCHED=n`, so it should be fine.
> 
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Boqun Feng <boqun@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Harry Yoo (Oracle) <harry@kernel.org>
> Cc: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> 

Cc Nathan & Bert because of:

	https://lore.kernel.org/rust-for-linux/20260731192522.GA1014697@ax162/

I actually prefer Nathan's fix, since it's more explicit about the
kvfree_rcu_head requirement. Alice & Miguel, thoughts?

Regards,
Boqun

> Cheers,
> Miguel
