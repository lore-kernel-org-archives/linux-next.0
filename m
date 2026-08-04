Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC043B5E01;
	Tue,  4 Aug 2026 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785839947; cv=none; b=iw48iRp0pQnaQtVrqJt7Z5Dr8cdKq/5kllSLgRP1QGnJQFvhOQc2x74usqRemkQpg1XPinEiNfaTCVeyGOQ0rX9RMBgIfF9SPtZHehEMa2LD1arv6kP4FW12nHQwSxaJ0AHBknkvVuQMf5tIvAIA4EIXabPwqykUPf9hrBOW+Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785839947; c=relaxed/simple;
	bh=0K8ldsuOOmmp4E468z4pchWjxwHx6OM1T7MBD8rtgMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFGnBrMwlZk6reo1nCAiNG2bmUKrn4Dd8C3HIJ+PylDUTtL48VhxPLd8CuzA/iGJHU1sSsDT8rzXPMZi+E2+7+7LGQvXQCSuTzoW9yHzEOPDPodo0aqxM5WlVIsfZKy0TqFw6j48LYazCoO93KG/sW6CjVnDYu8GNyqb+jLrf1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmHy6nA4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmHy6nA4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC64D1F000E9;
	Tue,  4 Aug 2026 10:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785839945;
	bh=1EYoIE/Bb2qkYhVVtYA17E42iMUCNLmxdssxEzRcOLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EmHy6nA48yNo4kLsbk5LPnsJPH6tzVTzbr9CNqu9ekwGojO/9w/jYes+BygJHNdZU
	 3Ns/DskY+5dhjPYpgYqj8nRObYEii/nTFF/2xp37vxEh1t7DxVB4uGegcaaUzEvtnc
	 XO2e3nZ6Qc7xwGIslU0Nvn0fCWh1YMyTqtiPdu3HG8U4sqwOe+em5jUdP5AqnOLZ1k
	 lkSAvfy+OiVDDIp0ix1AjAhVAMNXYG/ykZvG4MxvIVYZFo4i52KCS5bZ5jZb5txFOO
	 jOUJtjC23dUC4AqeJa3IBOjaz6S/aP09rNLF1z2nHgmfo0BipSg4AqEgwczfKkeJvf
	 L29eEMf75VdMA==
Message-ID: <2a24fa82-ddf5-490f-9451-fe2b35a06861@kernel.org>
Date: Tue, 4 Aug 2026 12:39:01 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 broonie@kernel.org, harry@kernel.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, paulmck@kernel.org, puranjay@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bert Karwatzki <spasswolf@web.de>, Gary Guo <gary@garyguo.net>
References: <amth-CMf3Xz5hR32@sirena.org.uk>
 <20260731075644.20215-1-ojeda@kernel.org> <am0AjzHc0m03CLVa@tardis.local>
 <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>
 <20260731220137.GA3307698@ax162> <anGiIkvkDfYogBlu@google.com>
 <2827aefd-30f6-424d-8bf5-aa46b97ee5eb@kernel.org>
 <CANiq72nZM6ANY4ThdiRd8hGaXfE2Cd-3MfKcA9RQP39x8mgv5g@mail.gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <CANiq72nZM6ANY4ThdiRd8hGaXfE2Cd-3MfKcA9RQP39x8mgv5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/4/26 12:01, Miguel Ojeda wrote:
> On Tue, Aug 4, 2026 at 10:44 AM Vlastimil Babka (SUSE)
> <vbabka@kernel.org> wrote:
>>
>> With Gary's suggestion [1] CONFIG_KVFREE_RCU_BATCHED will go out of the
>> picture completely anyway. What remains is an unconditional change of the
>> parameter. Can it be "resolved in advance" or only in the merge commit?
>>
>> https://lore.kernel.org/all/11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org/
> 
> Hmm... I am not sure I follow why we are trying to resolve these
> things in advance.
> 
> Semantic conflicts can be painful because they can be easily forgotten
> about, but as long as it is warned about when doing the pull (and
> making sure linux-next has the wanted resolution), it should be fine
> -- branches can still be independent.

Alright, let's leave it to the merge commit then. The slab side was updated
to allow the simple merge commit resolution Gary suggested. It's better than
relying on the #define in any case.

https://lore.kernel.org/all/7189ebb5-ae48-4466-9055-1ab1b0b5ef7c@kernel.org/

> Now, if for some reason one really wants to solve the conflict on one
> of the sides, then one can do a merge commit and justify it well. The
> diffs proposed here seem small, so I am not sure why we would want
> that. Usually what Linus prefers is to give him that merge in another
> branch for reference, rather than sending the merge itself.
> 
> What I would avoid is adding a workaround that requires knowing about
> the "future" (like depending on an unknown `cfg`, assuming it was
> unknown). Sometimes we do that (e.g. when building features), but it
> isn't really the case here...
> 
> Cheers,
> Miguel

