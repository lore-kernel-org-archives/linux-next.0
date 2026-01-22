Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545D92BD033;
	Thu, 22 Jan 2026 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106311; cv=none; b=sT59VLCmpADg2KELsm91AoNc0ulsUnTeKl8I1yjXqEXhJFqSc30WpN+ovPycXdqFEHQ6RmmExj36BPuOCBcD+4Yfc2CKf5+ft6IjVTGVPu7e2aUZfer0CoZ07PzXObqG+IccfW+n2heFDeRxvK+fqLFQVlLSPOcdOjlmJD+zFFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106311; c=relaxed/simple;
	bh=zL2gFPFI22aw+eEzv1uPLP5RhqkpvCt7uScDUQ6q3Lw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pJuXzhxJOQPG2tTwaJxC5a3CrMjd3ct4cgHTAPlCsGfTIyYSf/DfSKkkszTZCrzCl3IUsKayc+8cJXdl8lxwpYklxOoqVotORxw05m8CtIVDJl21VaPANubvgzXnhEIMXfjVmYwav84UjaP2Qjqf47iZ+WiNSUoMTH/IXW0sI0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDOLcq0Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDOLcq0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34E5C116C6;
	Thu, 22 Jan 2026 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769106309;
	bh=zL2gFPFI22aw+eEzv1uPLP5RhqkpvCt7uScDUQ6q3Lw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZDOLcq0Qza/TwH3Q3iDdOaWtD3TB3QqbwTlbmJwKOHA3SCxvydoniXxNSaWqGvdyW
	 NuNXgvWIWKE4TOFY6PfvjW4rrxq7rZ0JwuLjRpilMc5CfKxwB17QCDqaR+A8N8MIk8
	 UVytNXRDlQiLd3XrddG8HmQMQIceEO5tltGFNGVsN28rJTBeAucnM//6Ym4rwDjqQQ
	 D7MRzHDSkg6ZI3KjfenWCS6wauVai69mcYsYoZUCUgSt5F6I+llInppTNl69+pWhd2
	 tTUj9ENJ46I1pwjMAfeR+zXx9u5QzVtl28uWGY4QAlVvi5Z/8IgD9ui2Vc5giQG9iX
	 xOz0iVUtLU6bA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Mark Brown <broonie@kernel.org>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>
Cc: David Gow <davidgow@google.com>, Tamir Duberstein <tamird@gmail.com>, Jens
 Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
In-Reply-To: <8cc01720-427d-4cec-b4d0-721b22c47552@sirena.org.uk>
References: <aW5xqLq7gatOy1DV@sirena.org.uk>
 <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
 <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
 <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk>
 <CANiq72nS94wv50XyOJq5CeiVQvb0+3mNdWxJpFy_+2FH1x4RYQ@mail.gmail.com>
 <aa4bc767-8128-440c-a2a2-81fbb6992a8d@sirena.org.uk>
 <CANiq72njSUPt2CvjBiNyKw1KHSgnMdcBnXNL_pHV4iURYL1n6g@mail.gmail.com>
 <b17da8b5-6640-46ea-ba73-d2f4a08e246c@sirena.org.uk>
 <CANiq72kT9ThJcr5W0OhBmbwKZCpULjUehNjijTt8W09yB0CxSg@mail.gmail.com>
 <vTqxQtPb82EIUJtln5_7rGW5a8ot7hGZeTwDlTSiQPJwSr8IZ5COad9CBcZY9jg8YssEH6NyvESidrBA1sx4JA==@protonmail.internalid>
 <8cc01720-427d-4cec-b4d0-721b22c47552@sirena.org.uk>
Date: Thu, 22 Jan 2026 19:25:00 +0100
Message-ID: <874iodtshv.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Mark Brown" <broonie@kernel.org> writes:

> On Wed, Jan 21, 2026 at 07:55:39PM +0100, Miguel Ojeda wrote:
>> On Wed, Jan 21, 2026 at 3:56=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
>
>> > We do really want things to respect O=3D, all the -next builds are usi=
ng
>> > that, so if anything shows up in the source tree that's a concern.  I =
am
>> > bodging that for the kselftest build at the minute but it's not great.
>
>> Not sure what you mean about `O=3D`. Using `O=3D` is supported (both for
>> the subdir and external dir cases which are slightly different in the
>> build system). Modulo bugs, of course.
>
>> If you mean to ask whether `rustfmt` creates files: no, it replaces
>> in-place, i.e. by `git status` I meant you would see modified files,
>> not new ones.
>
> I was asking because you were mentioning checking git status and since
> we are doing out of tree builds there should be nothing changing in the
> source at all.  I think with the way we get trees to the build machine
> it won't make a difference in the end though if no new files are
> created so it'll actually be fine...

The `rustfmt` target will change the source directory even when building
with `O=3D...`, if it decides formatting changes are required.


Best regards,
Andreas Hindborg


