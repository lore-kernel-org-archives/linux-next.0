Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA6B3FF889;
	Mon,  3 Aug 2026 11:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755844; cv=none; b=lT6hog8WC2iswX6CNFLLO4lOs3mwlWchak1NrMj51iOs8ByNIs3g9uC10PWRjDUr4OpBYiT0N/8xhZEIdjRdyGiJNTCyeNLYaP0nBnh+5xioqW4tZWIA+d7fnXPrIbkzj3l2PLZTROoWl8kGLSUBPVCFt/MbggrkOlmftgrvbgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755844; c=relaxed/simple;
	bh=/vS/jvgUVXQgPiAtupyIgq30cvT7Zl3pK/0khlLU6J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqpkSamBwpvW7VSYtwTNjo256xuLEUv0WIybelqVHi5wShnh224DYmACAUwbohr8/dfoTVjjWvf+rcVhxj9Yhz417mZgmw+H8q3Ji7ym/5rhtXyaxlDpKNPl3QxiSu9JsYk258QsB945XSraXmEHugKAVjThIjMGVJGdun2fmjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/AEylub; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/AEylub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB991F00A3D;
	Mon,  3 Aug 2026 11:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785755843;
	bh=Ty/PbCBxconwrcsDUF/xLHJu+cvTmhsTYrPMLf1YopQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F/AEylubXPeY1EPRgARjVjv6QjZH1Ah2I0xatPUJO3fExpYuGYVuBBGPqHVTeZ6VB
	 EsbHmREkyLC1qcgSZrHyNi+ELIjvT58OVnSqYHV6MWZZF7vWS9/R6huVQWNTxw1/un
	 SDccjH9Bj7NPD9RRsIqGyvg06FWLJvO3cx3nDSaOOkAqOOZAnKpp0M2leARovvCG0E
	 1zdyiMzBGkx5g6nOeXfr9EoCq+aASa3+DfC5XqDEyR156GLIYnPiw/vhqNADDR9qDS
	 vlJNHk5ap1DdNcuqEeFRtD6sd0yWakvTW5qZH/8hxCTdcXJ0IC07HkPZQsE5xMOCoP
	 7VfauJ7o2zotQ==
Date: Mon, 3 Aug 2026 11:17:20 +0000
From: Harry Yoo <harry@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	broonie@kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	paulmck@kernel.org, puranjay@kernel.org, vbabka@kernel.org, vbabka@suse.cz, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bert Karwatzki <spasswolf@web.de>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Message-ID: <anB4nsW4iLYMs288@dev>
References: <amth-CMf3Xz5hR32@sirena.org.uk>
 <20260731075644.20215-1-ojeda@kernel.org>
 <am0AjzHc0m03CLVa@tardis.local>
 <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>
 <20260731220137.GA3307698@ax162>
 <anBBhmBSwLgcLjht@dev>
 <CANiq72=-yqp1JDHn-ucDpWcx=wJ7Z60K6am6X84OTqNiR6yytA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=-yqp1JDHn-ucDpWcx=wJ7Z60K6am6X84OTqNiR6yytA@mail.gmail.com>

On Mon, Aug 03, 2026 at 10:07:16AM +0200, Miguel Ojeda wrote:
> On Mon, Aug 3, 2026 at 9:23 AM Harry Yoo <harry@kernel.org> wrote:
> >
> > What do we do when it needs to be fixed in the merge commit,
> > mention this in the pull request email?
> 
> Yeah, it is also good to make sure the resolutions in linux-next are
> good, so that they serve as a point of reference and so that
> linux-next is testable etc.

Makes sense, thanks for explaining Miguel!

> Cheers,
> Miguel

-- 
Cheers,
Harry / Hyeonggon
