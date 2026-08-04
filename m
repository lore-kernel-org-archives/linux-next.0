Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB72346ACE;
	Tue,  4 Aug 2026 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833097; cv=none; b=C+xIqaq77OWcFdaoVbT219PRWhrpFNdGgm6OPIAv5UsEuEiwsPQ8YBsGlr3kF+pf6Ea0Hig8uU2KNLKTtNjda43CTUNFcUX/BqYZltcbqGzF4hXxAs4UPk1kHIYA7qgEe9eGJx/gHCfQoqPA4jS6jBE0MqtprXbdS/lRiqm0Szw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833097; c=relaxed/simple;
	bh=E/SQ+ZQlx0Gt56FBg5RSYpdotMb8gG8qyAcF6wQlu+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8RW9HnYq1RJ77xRLfO0mVhU4vf0Zau70kZlqxUwkIou3KYwV080XPqYizs8K8Obxe/4f0zjxg/DBubxbxPZQGONFGZTtB9n3YcOHposbJzRl9sksdouXM9LjM6k4yxJWVAEFCmSOqFp6dau7aESXxQojP7UV/jdSHTgU9nnShU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8k+K4wN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8k+K4wN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC981F000E9;
	Tue,  4 Aug 2026 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785833095;
	bh=5H6RJSZDPSmwbooABTk+unARmGwOSegsfChkBx3+G1g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=h8k+K4wNBTRdXo0xOJL7GudQvyhO97L1Z7liu2PElWNyNmQxZ3o42v1nrg/Ro9Vep
	 HOKlYdjwlztIsnXCz/fKGtOK9xpJdfdnKuqe6jGfA5TRdtM73MRRLRLP8a3P4w4m8K
	 RcWDgBC6FHuoLj7qYHcT4hVIgZ8DZM4wT021eCwJSRa8Azos+G9gya2TQsALvZPyj4
	 ClNFr71IkNtyEo+R4o24mE2ZFHhLRjBuAZ0RpdxS+iy6LtG2J4724c5umY/iviQPD6
	 RaS/maiEVIFSUOfF0rhQUlysuhu1Qy730NTecch8yCKTv40kCJnUNSiMwix+whG/5I
	 bcvwepCNYY8Ag==
Message-ID: <2827aefd-30f6-424d-8bf5-aa46b97ee5eb@kernel.org>
Date: Tue, 4 Aug 2026 10:44:51 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Content-Language: en-US
To: Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 broonie@kernel.org, harry@kernel.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, paulmck@kernel.org, puranjay@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bert Karwatzki <spasswolf@web.de>, Gary Guo <gary@garyguo.net>
References: <amth-CMf3Xz5hR32@sirena.org.uk>
 <20260731075644.20215-1-ojeda@kernel.org> <am0AjzHc0m03CLVa@tardis.local>
 <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>
 <20260731220137.GA3307698@ax162> <anGiIkvkDfYogBlu@google.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <anGiIkvkDfYogBlu@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/4/26 10:26, Alice Ryhl wrote:
> On Fri, Jul 31, 2026 at 03:01:37PM -0700, Nathan Chancellor wrote:
>> On Fri, Jul 31, 2026 at 11:14:42PM +0200, Alice Ryhl wrote:
>> > I like Nathan's fix as well.
>> > 
>> > Not sure if it needs to be done in the merge commit, or if we can
>> > apply it as a patch to char-misc despite the unknown CFG_*?
>> 
>> It would need to be applied at the merge of the two trees because
>> CONFIG_KVFREE_RCU_BATCHED was introduced back in 6.15 in commit
>> c9f8f1242a4c ("slab: don't batch kvfree_rcu() with SLUB_TINY").
> 
> Is that required? Yes, the cfg(CONFIG_KVFREE_RCU_BATCHED) will fail in
> Greg's tree because the CFG doesn't exist and is hence not enabled ...
> but the cfg not applying is what we want.

But it does exist, CONFIG_KVFREE_RCU_BATCHED itself is old. What's new in
slab tree is kvfree_call_rcu() taking a "struct kvfree_rcu_head *" parameter
instead of "struct rcu_head *head" (which is actually "callback_head").

With Gary's suggestion [1] CONFIG_KVFREE_RCU_BATCHED will go out of the
picture completely anyway. What remains is an unconditional change of the
parameter. Can it be "resolved in advance" or only in the merge commit?

https://lore.kernel.org/all/11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org/

> The main risk I can think of is a warning about an unknown CFG being
> used. Perhaps we could silence the warning?
> 
> Or I mean, we can also just fix it in the merge commit if that works for
> everyone.
> 
> Alice

