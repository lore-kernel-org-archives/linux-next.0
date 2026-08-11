Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1002D45C6E1
	for <linux-next@vger.kernel.org>; Tue, 11 Aug 2026 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468506; cv=none; b=JM8UgAqj/YsoJ6PsN5Yp7uaYLjwu/flqhP2cumJKVACl3YZitPfSYzmnGrBvSCotIU0blJpWxea7i7g+0WZkg4EIlVxpcv27BW8I9/7Z4IZpZafPP19ko5c9+/vT8teG03r1bK5rON5zb7HZ140iB3flgM9U0EcJd0JEPcjxiJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468506; c=relaxed/simple;
	bh=flbNuP+kVTJxdjUl+xPxBEZXtyZa1sjbO4TZEU0g7Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opdeydv8CwQPRica19+B4WC6mmXvJeBc9qpJOfR1Me9r9rIjQnL49mTz6SW/eoN7JkHsqHrE2Amil78BBqQmGEHyCXULgMhzmqXinN8FSnrLhbWPQ+EmkViH5LfWaQFiRKCmU1k5RYw1il2bQP49tLt9L9tZKXxtNVWEuC+Ajnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goyi5BNT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goyi5BNT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AED1F00A3F
	for <linux-next@vger.kernel.org>; Tue, 11 Aug 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786468504;
	bh=GviYgoHerqSjMQvh7fhp3lqKhEMQoU3HZIV+JdPqlzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=goyi5BNTbO32MgO84y8OZkqu1Fb/XySozP94qTlYkaY8jc6x3KchJfpKv3e/kA6JP
	 9hQ9fa58LE80YiUWg4HduvjZ5CnSA6CGg7I2PDU0zxbhZtjyEm1DVlkfpAOdhmVqLc
	 SK4YI6uUrTR1JZhzfYKlkf49dad5Y6OkHAFpsoay2FjKnOef9nBC2ciK+jMFfQkaDT
	 K6Ofcl+KYf4hStmz7gZg8QwK5iQliU6c6GcMeJZF9BvrcIdnM7GXfi0SCwVAwQrjm0
	 9lN+uhWH73Z1GUfXzY5X4z7qx/qK1GKQJjdDNFqhSl60tXUldTHiR3Xj+aP92X8TjX
	 Qze7NPzlfkImw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D444F4006A;
	Tue, 11 Aug 2026 13:15:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 11 Aug 2026 13:15:03 -0400
X-ME-Sender: <xms:l1h7aiIYUQMV4yl4IYOtrqA_VaV-bJtrTNh3Iu_QY82QhxPtT-Dqfw>
    <xme:l1h7avGHGg72nxLI-tRTJ2AidwYM1sxBCFb332S00WQuV2EPEYGXePZDrsZTR3AA2
    D61w8nFR3TTBxzTOngeIIosVnXrd-heKUtznw2GShU9NywlsXMQ_g>
X-ME-Received: <xmr:l1h7am-XGqmSUsTMXNimKmvVrCBrI9JBBlsUT8G5hPoFI7K8mIo6wIYgp4ZhuWG8Jl79Zh6bxL-nGSKC0m0O70M_44GhBRBr>
X-ME-Proxy-Cause: dmFkZTF9ywZ4+owm93Wft81cnlKFvmqDNLHI2VL/0oSD/702Dw8qfoX3+pG7B4NiXkjZ0k
    5Sa/nni0ssoqOPomNdSUvadp8hMLMvaPjNywVFbUW9A5e6/BoM4a+YWiELzSKS9Q4W1KJS
    0JSnrcACeMLqYkjH88z97PYDt2GB/UWDm0cfaGQpi2WRcQ+7BwHVbMnz57h1ATQVrV7tAL
    7VMXaAoKDMGu0GBUc67lxdWYeKKGN9DoKSNVMW99j5V5hG4wdI6sXKF2CWltzTwhEkfsAd
    1EQByQhv6yp1qO6pF58wEU2qwmdTz1FwpxP58a0wivU9vVYGGNe/f2O8sJRld5c6N57Cll
    nwnhtPK6KP34WWgQqoJgqvDE81FMnQ5CKnO6juOnN8dBwL6oJwUcn/M/ZdGzboZO8lmDM6
    LxBnVCHpGE6jr95dFFlkhOIqOpd0V3esnbKbHaTKycb0nMpeL+CwDENJSmC8Wx0u2ZX4Gp
    CkN6eflwV0/vFNIwDF20sGyupLx6/vPFZb589BLqwzB8WZaDMLbvXkk1enw9EzlZODAwni
    waEsb32+MYlIRn2DefDWD11/9k+PP2A1/c1o8hz4rtM8eUnHpKBoj6I9YaE7fzQ/p8N5Tv
    udefavRJv4RU8BS0PmJx6YlaUPMB7jIfeMbGDnz83Z0Oz4V30LDyRuBrMkoQ
X-ME-Proxy: <xmx:l1h7anLqVdKhOPzhRefeg1kERKmphhP_t-kJGj9NlKARI6lXGxhDYA>
    <xmx:l1h7ass6VoWwEMTAQjsMlWRMxSVllI3akpufbcJoQao3wMUFRPa7dA>
    <xmx:l1h7amBRefPHaWRXVfo6pKEAdVf6NXd9gLO0ucH7q-ivbKzkReTPww>
    <xmx:l1h7asMe6mFmb6BUNcjP3d88e8MKQVpkaLqgSEvd5jZEUlUe2Vtabw>
    <xmx:l1h7amBMi66D0kO5F20jaRzmCK7pxdJcn2j-wo1_uIY3TroohXoVobLs>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 13:15:03 -0400 (EDT)
Date: Tue, 11 Aug 2026 10:15:01 -0700
From: Boqun Feng <boqun@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the tip tree
Message-ID: <antYlduNGrwx_s9a@tardis.local>
References: <anoDJw4Y6kX_7eio@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anoDJw4Y6kX_7eio@sirena.org.uk>

On Mon, Aug 10, 2026 at 05:58:15PM +0100, Mark Brown wrote:
> Hi all,
> 

Hi Mark,

> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   rust/kernel/sync/poll.rs
> 
> between commit:
> 
>   47c3367ff096e ("rust: sync: Use safe synchronize_rcu() abstraction in poll")
> 
> from the tip tree and commit:
> 
>   e5e86df8b6661 ("rust: poll: use kfree_rcu() for PollCondVar")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

The fix-up looks good to me, thank you!

Regards,
Boqun

> diff --cc rust/kernel/sync/poll.rs
> index 5aa0ce9ba01b7,684dfa242b1aa..0000000000000
> --- a/rust/kernel/sync/poll.rs
> +++ b/rust/kernel/sync/poll.rs
> @@@ -8,13 -9,14 +9,18 @@@ use crate::
>       bindings,
>       fs::File,
>       prelude::*,
>  -    sync::{CondVar, LockClassKey},
>  +    sync::{
>  +        rcu::synchronize_rcu,
>  +        CondVar,
>  +        LockClassKey, //
> -     }, //
> ++    },
> +     types::Opaque, //
> + };
> + use core::{
> +     marker::PhantomData,
> +     mem::ManuallyDrop,
> +     ops::Deref, //
>   };
> - use core::{marker::PhantomData, ops::Deref};
>   
>   /// Creates a [`PollCondVar`] initialiser with the given name and a newly-created lock class.
>   #[macro_export]
> @@@ -103,6 -106,72 +110,70 @@@ impl PinnedDrop for PollCondVar 
>           unsafe { bindings::__wake_up_pollfree(self.inner.wait_queue_head.get()) };
>   
>           // Wait for epoll items to be properly removed.
>  -        //
>  -        // SAFETY: Just an FFI call.
>  -        unsafe { bindings::synchronize_rcu() };
>  +        synchronize_rcu();
>       }
>   }
> + 
> + /// A [`KBox<PollCondVar>`] that uses `kfree_rcu`.
> + ///
> + /// [`KBox<PollCondVar>`]: PollCondVar
> + pub struct PollCondVarBox {
> +     inner: ManuallyDrop<Pin<KBox<PollCondVarBoxInner>>>,
> + }
> + 
> + #[pin_data]
> + #[repr(C)]
> + struct PollCondVarBoxInner {
> +     #[pin]
> +     inner: PollCondVar,
> +     rcu: Opaque<bindings::callback_head>,
> + }
> + 
> + // SAFETY: PollCondVar is Send
> + unsafe impl Send for PollCondVarBoxInner {}
> + // SAFETY: PollCondVar is Sync
> + unsafe impl Sync for PollCondVarBoxInner {}
> + 
> + impl PollCondVarBox {
> +     /// Constructs a new boxed [`PollCondVar`].
> +     pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> Result<Self, AllocError> {
> +         let b = KBox::pin_init(
> +             pin_init!(PollCondVarBoxInner {
> +                 inner <- PollCondVar::new(name, key),
> +                 rcu: Opaque::uninit(),
> +             }),
> +             GFP_KERNEL,
> +         )
> +         .map_err(|_| AllocError)?;
> + 
> +         Ok(PollCondVarBox {
> +             inner: ManuallyDrop::new(b),
> +         })
> +     }
> + }
> + 
> + impl Deref for PollCondVarBox {
> +     type Target = PollCondVar;
> +     fn deref(&self) -> &PollCondVar {
> +         &self.inner.inner
> +     }
> + }
> + 
> + impl Drop for PollCondVarBox {
> +     #[inline]
> +     fn drop(&mut self) {
> +         // SAFETY: ManuallyDrop::take ok because not already taken.
> +         let boxed = unsafe { ManuallyDrop::take(&mut self.inner) };
> + 
> +         // SAFETY: The code below frees the box without calling the actual destructor of the type,
> +         // but it's okay because it re-implements the destructor using `kfree_rcu()` in place of
> +         // `synchronize_rcu()`.
> +         let ptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(boxed) });
> + 
> +         // SAFETY: The pointer points at a valid `wait_queue_head`.
> +         unsafe { bindings::__wake_up_pollfree((*ptr).inner.inner.wait_queue_head.get()) };
> + 
> +         // SAFETY: This was allocated using `KBox::pin_init`, so it can be freed with `kvfree`.
> +         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
> +     }
> + }


