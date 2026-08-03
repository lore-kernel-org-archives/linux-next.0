Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9EE370D47;
	Mon,  3 Aug 2026 13:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764047; cv=none; b=uITI5bg4v3fUSBZ3TQF2H0Iyn5WAz99LIayn3uY1eRSFkivZeA9mfPMF0eDE4kBQlcs+0Wtk9/6P0d/Rcqyce6EjhAAkMvSgyuAmOoKW8JpqdxKS6gOS06qljJqJlIswfi8mEqUjEpLrLJdRzxf0S73MvJ6fy2scojOpyLG5Fo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764047; c=relaxed/simple;
	bh=SRyj3xgPnVEUpTjLnSp8fmMtztI2Tcgncixv7KWSLYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUtytVxPcIVzuhc/hS/rHwUNS7lSCpc4r2qYWktwRIxJV26VkccVuh6BaybqJiNjLh3aMFmlJMwkJexNgYN4R1WHSrMQrEcEyWbEAVps4SAvqcgwGSjupxTLbMFYFuI4RFaRDxvQ68aku+ArBDOQCG7OHRGSWN+TxWNS5VqhJvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJF/60UC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJF/60UC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982A91F000E9;
	Mon,  3 Aug 2026 13:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785764039;
	bh=3So7ClLEwnT3xOZP+LZF0vvOGkIVgtejJApA2/1XsDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jJF/60UCdMh+5nWfLLqe/ebBQ1uM9JYKjJdWaSQ4iO4LPfmZxt0tgIqzrkZkg47ga
	 EZd9cABXLfeThQB6Q2P+WcWGGDxgGWW8DOpvkyShml1h5RCRpamkrUIZ+Jm6Xf43Az
	 sM3HCmhVD/p2cvpMCdQnPj6dPir0HfAmhh62MGYnnlo58hFDMNpsJTcKbh/6JHvjCd
	 ZxIxoAiWdpH4LRTfBxEyTZMftbC14wu3w784QMOa4xASjxrXJuN4Euh22JhzWDX+6t
	 D71oYGKyCybNAccvAnn4vQsjoMtHue7V36yYblDJ13ptvMDbeO/VvBvLmqHTjlGGbI
	 TKhWe3Bn1GHxw==
Message-ID: <a68ad6a2-f14d-4ee8-bdcc-16ea361a4428@kernel.org>
Date: Mon, 3 Aug 2026 15:33:55 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Content-Language: en-US
To: Harry Yoo <harry@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 paulmck@kernel.org, puranjay@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bert Karwatzki <spasswolf@web.de>
References: <amth-CMf3Xz5hR32@sirena.org.uk>
 <20260731075644.20215-1-ojeda@kernel.org> <am0AjzHc0m03CLVa@tardis.local>
 <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>
 <20260731220137.GA3307698@ax162> <anBBhmBSwLgcLjht@dev>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <anBBhmBSwLgcLjht@dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/3/26 09:23, Harry Yoo wrote:
> On Fri, Jul 31, 2026 at 03:01:37PM -0700, Nathan Chancellor wrote:
>> On Fri, Jul 31, 2026 at 11:14:42PM +0200, Alice Ryhl wrote:
>> > I like Nathan's fix as well.
> 
> I don't really have a strong preference  this, and it would be
> appropriate to fix this in a way Rust folks would prefer...

It should be also possible to apply Miguel's fix immediately in the
char-misc tree, and then changing it to Nathan's fix as a followup clean-up
after both trees are mainline?

>> > Not sure if it needs to be done in the merge commit, or if we can
>> > apply it as a patch to char-misc despite the unknown CFG_*?
>> 
>> It would need to be applied at the merge of the two trees because
>> CONFIG_KVFREE_RCU_BATCHED was introduced back in 6.15 in commit
>> c9f8f1242a4c ("slab: don't batch kvfree_rcu() with SLUB_TINY").
> 
> What do we do when it needs to be fixed in the merge commit,
> mention this in the pull request email?
> 

