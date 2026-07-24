Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AEB3EE1C0
	for <linux-next@vger.kernel.org>; Fri, 24 Jul 2026 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784927834; cv=none; b=O6O+GSCNLc6KdspGyGn+Wnn0/inKtvvP3gy95/jTHNgB0ClQHkSV3jUF/uVfL2gd0ak6kIloJa+bRupQ4qFtGrhOB7DWREsVkmuT3910CkC9O1nKVBJydL0QzW7cuZhptnrwFipq1bVFGmH8F00ISlx+b6t3vXYL/9btATUaRpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784927834; c=relaxed/simple;
	bh=BEwN5yn41O5I1oL4ZLMU9amdD5lbxproUkOikwxvwtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dxzx+tWxQ0c3VoTCx0EN8X2BLtkV0FK8/sRqOSr+ga/z90D7eoNjg2+H9Srf+CAaZR0U8vaSrWG/HwjpQ83jiAoGZjY5b9FwbrM9nMjeK+zZ3/AWcQIM0KTgRjMNyphjYHRQlKQBiHgMytqLVTuavuZ9PjUM0Mwa3mzyxEObCQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=fail smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=GdOSlMF8; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="GdOSlMF8"
Received: from macsyma.thunk.org (pool-108-49-209-71.bstnma.fios.verizon.net [108.49.209.71])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66OL6Goi008155
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 17:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784927182; bh=QEc3au+xal4DFcA55nr/7xl+qFvvqmdbfDL0WA4044M=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=GdOSlMF8HSgo46v5Qh7x8J7/5PsRLJ8ARt7ludGls6c3CAn29EeF3frjK9fhwXOBS
	 P3vfoLC0Tb9NN5N85fO9LrJzzgrg5g4RXXfMn3FB+jI8oFetpdap9KqwoVhDRby2o1
	 R2wUq2ueV1JCKF2OQqEAMh8ZBQ+jC4vkEJHKwBOJK8YkNxKuZdLj9dmbTbD7qnfyXR
	 IRwojA3Sl+MawGr+IoFi0zKEtrtMex8VLhxcpRDeJcUK/3jtFmOTqFDMFw77g0EOMw
	 f9OWEXeNvQ6kSDUD/J56OUBWLcEf5HGjc1b6S4PX5oeyXbj9/+BjvrE5JbG1Utm9n8
	 NzbDpaUejo6Cw==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 55275BEE22D; Fri, 24 Jul 2026 17:05:16 -0400 (EDT)
Date: Fri, 24 Jul 2026 17:05:16 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Alexander Potapenko <glider@google.com>, Mark Brown <broonie@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: Policy regarding linux-next only changes
Message-ID: <amPGflb7w6RcOO1M@mit.edu>
References: <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <amN5Gu2J5mILKs_j@mit.edu>
 <7250a5ad-ec2d-4852-af56-9c1c653d24c7@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7250a5ad-ec2d-4852-af56-9c1c653d24c7@I-love.SAKURA.ne.jp>

On Sat, Jul 25, 2026 at 12:29:27AM -0500, Tetsuo Handa wrote:
> The problem is that a maintainer who has the permission to
> accept/reject patches tends to become defunctional when syzbot is
> involved. What actions can the Linux kernel community take in order
> to address this problem (instead of just ignoring developers who are
> trying to fix bugs)?

Fundamentally, not all bugs are worth fixing.  And if you believe that
all bugs are worth fixing, you need to convince companies to **fund**
that work, and not leave it as unfunded mandate.  If you give me some
minions who can be dedicated to help fix bugs, I'm certainly willing
to provide technical direction.  But there's no such thing as a free
lunch --- and the business case is not as clear cut as you seem to be
assuming.

In essence, this is a cost allocation problem.  When you ask for help
from other maintainers to fix something that you care about, if it's
not important to them or their company / management chain, you are
dumping costs from you to them.  This can work if you can also help
them in turn in other areas.  This happens all the time, actually, and
it's what makes Open Source work.

So I think the way we solve this problem is by finding ways to
allocate the costs to those companies or organizations that think it
is a good fit for their business, and to reduce the burden on those
whose company (or management chain) doesn't think the business case is
sufficiently compelling.

Other solutions might include finding some AI solution which can
filter the low-priority quality Syzbot reports from the high-quality
ones.  If some companies or some departments may have different
priorities, perhaps they can use different filuters, so they can work
on those bugs that they think are important.

Perhaps AI's can do a better job at proposing some patches that
resolve the problem, or creating reliable reproducers that don't
require thousands of VM hours of testing.

One of the reasons why I am personally more supportive about Sashiko
than syzbot is because Sashiko is a technology which is reducing *my*
workload.  It does transfer more work to the contributor, but if they
are trying to get code into the kernel and if their company think
there is a business case for that new feature, it seems right that we
require that pay the development costs of submitting high-quality
code.

Cheeres,

					- Ted
