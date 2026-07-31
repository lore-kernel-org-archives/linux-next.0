Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA562386553;
	Fri, 31 Jul 2026 07:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785484707; cv=none; b=LYgFv9oC6DXODp5Dyhpa01N3azU3JOpmiaFXO7fR+tE7T/2bMmeBi95YWCsv2vuUehVT9tMh8KQgyxUP9eSPpsQ/JEHXpB2R5w9WinbVnMQ0dzzMF1WjCRKd/d0eacvOVOgdD3GLv+dUoQJkjbfGo6ri/eYzDnicRqlJ6zfx+lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785484707; c=relaxed/simple;
	bh=ZEJxjPllKwvJNsT93gZ8uX1QbHxwWOXWifX4UUPjRr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=du6nMCn4EnvonDBprj1BzgQJ1X78y2ammFMJUSrEhzuiyA/yOvDq0RjjRM8WY23e5mU7iP9cfel+MJ0wplsKkIK8U6YxphcJtxfpJJMEfMcsseyYq+4LJXn/I4vbclCFT2ADM+cUwNMthXHySaiQ9FsG7HSoaU5ZP5VxTiX4QjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/6EQwY3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/6EQwY3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4201F000E9;
	Fri, 31 Jul 2026 07:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785484706;
	bh=IG88wE0f7GGzTt5gnnXGafKF8fE9JEliMMPBzSo5YeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R/6EQwY3/0axwlBQfTVmiDHummB7dgmMqs77BEtuSnfzOP6YT47vuQhq0dsug+g90
	 QC9bQV/MNUpoeSWyuUeZ2Y82JcGdWPpoGbgjtzi/JFRF5dZYj0cUd/SncorJ54ofSr
	 AWH4g5j/BfsQXULWhK59nAuXNOfNxKu9CbM36GbLcHndDIiD5xRvj/tNuDZg9d0Ugv
	 9xi+wJxCaq94QgNrvnyVOrFWegwBIDgsl3/OYEHjyKYc4eZjkmelotXgnDnjkiWXoc
	 5iBBlZ3NIufZKhUKII8A+xZyqoRBGYUH1Nh0j/Y+e1To7L37h5u2nrOIgaJpZfudJC
	 cuy99oo6YQmJA==
From: Miguel Ojeda <ojeda@kernel.org>
To: broonie@kernel.org
Cc: harry@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	paulmck@kernel.org,
	puranjay@kernel.org,
	vbabka@kernel.org,
	vbabka@suse.cz,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Date: Fri, 31 Jul 2026 09:56:44 +0200
Message-ID: <20260731075644.20215-1-ojeda@kernel.org>
In-Reply-To: <amth-CMf3Xz5hR32@sirena.org.uk>
References: <amth-CMf3Xz5hR32@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 30 Jul 2026 15:38:48 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the slab tree got a conflict in:
>
>   mm/slab_common.c
>
> between commit:
>
>   736084507faa3 ("rcu: Rename struct rcu_gp_oldstate to rcu_gp_seq")
>
> from the rcu tree and commit:
>
>   bdd0cc9f0ffc3 ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu batching")
>
> from the slab tree.

The slab one semantically conflicts as well with commit:

  e5e86df8b666 ("rust: poll: use kfree_rcu() for PollCondVar")

from the char-misc tree:

    error[E0308]: mismatched types
         --> rust/kernel/sync/poll.rs:175:44
          |
      175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
          |                  ------------------------- ^^^^^^^^^^^^^^^^ expected `*mut kvfree_rcu_head`, found `*mut callback_head`
          |                  |
          |                  arguments to this function are incorrect
          |
          = note: expected raw pointer `*mut bindings::kvfree_rcu_head`
                     found raw pointer `*mut bindings::callback_head`
    note: function defined here
         --> rust/bindings/bindings_generated.rs:90407:12
          |
    90407 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr: *mut ffi::c_void);
          |            ^^^^^^^^^^^^^^^

The C API was not meant to have a visible effect, but we don't use the
`kvfree_rcu()` macro, so we notice the change. We can add a similar cast
to the C side:

    diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
    index 684dfa242b1a..79d7e08215b0 100644
    --- a/rust/kernel/sync/poll.rs
    +++ b/rust/kernel/sync/poll.rs
    @@ -172,6 +172,6 @@ fn drop(&mut self) {
             unsafe { bindings::__wake_up_pollfree((*ptr).inner.inner.wait_queue_head.get()) };

             // SAFETY: This was allocated using `KBox::pin_init`, so it can be freed with `kvfree`.
    -        unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
    +        unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get().cast(), ptr.cast::<ffi::c_void>()) };
         }
     }

Clippy doesn't complain about the "unneeded" `cast()` under
`CONFIG_KVFREE_RCU_BATCHED=n`, so it should be fine.

Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Harry Yoo (Oracle) <harry@kernel.org>
Cc: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Cheers,
Miguel
