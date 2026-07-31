Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E749240B364;
	Fri, 31 Jul 2026 12:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502479; cv=none; b=BvtznzRP7Pwra8pPn43XoTFrXtqt09y0pdMrMnkUAbUiPbSaW1Muqguh8wYhnhb44Mz+yDHZ+xg23GVLKEIvEFDeU/IbwL/wMJ3+e0cHmcpmDZNilyW2bxIxGb+h3JZAy3trLqGBry+K1/d5bmcBSQYs7Uc3NIZeIDbM/R9cJiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502479; c=relaxed/simple;
	bh=arJLDTm4SQgaOqkJMu265y19GUPya0NqRXB0uL5aZNg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kBPIrcu+2m8BfkEHKIPX0XMzNP6VX8tC4V0YO7ZDXY4YY2tLFaF3xABAJtt7lX3ny64NcYz5jpG+wpfJKgjumm/lUMG0SQ02zQjagM2FiggPb9zaob6yBeamASmPOf+FkERKUqQ1YwajAUXc+hJ79AhTp9wIxzsbA+uUHvcPei0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zt+6u3js; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zt+6u3js"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F931F000E9;
	Fri, 31 Jul 2026 12:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785502477;
	bh=VOjbtnHvFY4qYQxlLF/zgjoDjZU515ttThtSCI5MrWU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=Zt+6u3jsucCzHp0X+ckZPchw3uuTBkAzPN+fcECNBUy+TSw0mvBQEiq+AsQYlCZ1n
	 GZh76NCkY1azHIPhUmnXjKW6gNQXRMqinP1c3dXOX60IQgkdvD54eVdq088W0iJj0X
	 Qz+7qi2iK4GQrzYWcyZjinnGR2e1Ec5Tnw3pFyAfgIGYV7ve8XERBmCSEwuNTnIJMs
	 mjLip89r1JKDdJAbHI1ibLnjfdo7EXm7A0dufozwH6A8EiFj8aATNgjSQq5rkXS/66
	 RMPHG4v+6bwESGkxfiuXH3OKAxs/JFHEET40/ey2xpuThqL1nnVTdBNP32dQUN1+95
	 Ui75Dnwgv2uow==
Message-ID: <60021f1b-0533-430d-8ed3-6fa331b4e7e6@kernel.org>
Date: Fri, 31 Jul 2026 14:54:33 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Content-Language: en-US
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org
Cc: harry@kernel.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, paulmck@kernel.org, puranjay@kernel.org,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <amth-CMf3Xz5hR32@sirena.org.uk>
 <20260731075644.20215-1-ojeda@kernel.org>
 <7abffd3a-cc96-46e9-a85b-7dbc9cadc21e@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <7abffd3a-cc96-46e9-a85b-7dbc9cadc21e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/26 11:59, Vlastimil Babka (SUSE) wrote:
> On 7/31/26 09:56, Miguel Ojeda wrote:
>> On Thu, 30 Jul 2026 15:38:48 +0100 Mark Brown <broonie@kernel.org> wrote:
>>>
>>> Today's linux-next merge of the slab tree got a conflict in:
>>>
>>>   mm/slab_common.c
>>>
>>> between commit:
>>>
>>>   736084507faa3 ("rcu: Rename struct rcu_gp_oldstate to rcu_gp_seq")
>>>
>>> from the rcu tree and commit:
>>>
>>>   bdd0cc9f0ffc3 ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu batching")
>>>
>>> from the slab tree.
>> 
>> The slab one semantically conflicts as well with commit:
>> 
>>   e5e86df8b666 ("rust: poll: use kfree_rcu() for PollCondVar")
>> 
>> from the char-misc tree:
>> 
>>     error[E0308]: mismatched types
>>          --> rust/kernel/sync/poll.rs:175:44
>>           |
>>       175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
>>           |                  ------------------------- ^^^^^^^^^^^^^^^^ expected `*mut kvfree_rcu_head`, found `*mut callback_head`
>>           |                  |
>>           |                  arguments to this function are incorrect
>>           |
>>           = note: expected raw pointer `*mut bindings::kvfree_rcu_head`
>>                      found raw pointer `*mut bindings::callback_head`
>>     note: function defined here
>>          --> rust/bindings/bindings_generated.rs:90407:12
>>           |
>>     90407 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr: *mut ffi::c_void);
>>           |            ^^^^^^^^^^^^^^^
>> 
>> The C API was not meant to have a visible effect, but we don't use the
>> `kvfree_rcu()` macro, so we notice the change. We can add a similar cast
>> to the C side:
>> 
>>     diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
>>     index 684dfa242b1a..79d7e08215b0 100644
>>     --- a/rust/kernel/sync/poll.rs
>>     +++ b/rust/kernel/sync/poll.rs
>>     @@ -172,6 +172,6 @@ fn drop(&mut self) {
>>              unsafe { bindings::__wake_up_pollfree((*ptr).inner.inner.wait_queue_head.get()) };
>> 
>>              // SAFETY: This was allocated using `KBox::pin_init`, so it can be freed with `kvfree`.
>>     -        unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
>>     +        unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get().cast(), ptr.cast::<ffi::c_void>()) };
>>          }
>>      }
>> 
>> Clippy doesn't complain about the "unneeded" `cast()` under
>> `CONFIG_KVFREE_RCU_BATCHED=n`, so it should be fine.
> 
> Thanks! Should I thus amend bdd0cc9f0ffc3 ("mm/slab: introduce struct
> kvfree_rcu_head for kvfree_rcu batching") with this fixup or you'll do that
> in the char-misc tree?

I see, it has to be in char-misc which introduces that patched code, we
don't have it.

>> Cc: Alice Ryhl <aliceryhl@google.com>
>> Cc: Boqun Feng <boqun@kernel.org>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Harry Yoo (Oracle) <harry@kernel.org>
>> Cc: Vlastimil Babka (SUSE) <vbabka@kernel.org>
>> 
>> Cheers,
>> Miguel
> 

