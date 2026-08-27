Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C465F412280
	for <linux-next@vger.kernel.org>; Thu, 27 Aug 2026 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822139; cv=none; b=Oect9+VOypQa42YdGhK1DuuQfyp7M8GpUYeaWXWKyHI9yxFHaG5ghJVK3KIg1PIFxP7TFC9I+hrotB7rEiBO+yz622EuYi4EkDKcNdDA/hxky+NNMwnUNC2buRIxkDQtJ/rrmGOtg04udS8GrdVc5dCmKDqqJwSIVgs6RZ780Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822139; c=relaxed/simple;
	bh=mbO7YkJqsW0E25TQKoXhnzPr5lhwET6pljUZCWyiX1I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Ow4CdHkDxNL4vAkKzpahxLfx081unCAZ8TMnFRDfMKwRx4sgPSW+5e9fymfKeBHI3sF+/IPQBUfFhDQx5xod/ouKtPUSoo/gB9LZsSELAwUfX6WyEZvkEoaaJrsptDWwdMmLSrWT3ydrUga/gzboE0QfInx/mZQfYd+8eX/6e54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUAgKtx5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUAgKtx5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65ACA1F00A3A;
	Thu, 27 Aug 2026 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787822129;
	bh=17oXhVGc1ID0Rsr2u0eNeaCRsLo0OT/TR/gineFcfPU=;
	h=Date:From:Subject:To:Cc;
	b=ZUAgKtx5AawPQtzD6vFVgb5hVc3kJFGU5PDTcu1MXxGMF/5hJvlD73MsiXuXxWEVX
	 LPnV6+YzYyJqqkF/1arbwa69Oc1RSVRHNMt89USWZxZ/ye7DVJdccLvoU+98dOP728
	 BkASeVnwaBSsGwcB9Gnp7BIGis8nW/xR2bgtvsYmf8vdGPOP+iNweWJXlYOFMucZ6h
	 x1V4jUJvRvWKlqo7XTYd7k4Q4i8zcACwBPqD71/jm90vUmBI2TGC2Pm9UyZCrT0XWW
	 LM/EmHIQ+K5hZhQ8B4d8WmxcqaaEoH/3LVmvtez9a9ZCb3uwg7LFJrJ9Aub/BCr4g+
	 v+G4bXGCHfswg==
Message-ID: <19ad8f06-4671-4eae-b8c2-fa6c54177886@kernel.org>
Date: Thu, 27 Aug 2026 11:15:18 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
Subject: [Update] mm-next status 2026/08/27
To: "linux-mm@kvack.org" <linux-mm@kvack.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

this is the second status update about the MM transition [1]. Since the last
update [2] we had two further mm-next calls.

Below a status update on things that happened, things that were decided, or
things that were discussed.

I'm sure I forgot something or messed something up; all involved people are on
BCC, so please correct me!


1) Tree/branch Locations
------------------------

The mm-next tree is now live at:

	https://git.kernel.org/pub/scm/linux/kernel/git/mm/linux.git/

And the memblock tree now has a mirror at:

	https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git/


2) mm/linux.git ("mm-next") Branches
------------------------------------

The following branches are now updated daily (well, mostly ;) ) and linux-next
started integrating mm-next instead of slab/memblock/Andrew's MM trees yesterday
the first time. Successfully as it seems.

for-next-fixes:
- Based on Linus' master outside the merge window and on the last tagged
  release during the merge window
- Integrates all component's “for-next-fixes” branches and Andrew's mm-
  hotfixes-unstable branch.
- Goes to linux-next.git pending-fixes.

for-next:
- Based on for-next-fixes.
- Further integrates all component's “for-next” branches and Andrew's mm-
  unstable branch.
- Goes to linux-next.git master.

for-test:
- Based on for-next.
- Further integrates all all component's “for-test” branches and Andrew's mm-
  new branch. For now it's really only mm-new.

All integration trees are entirely rebuild daily, similar to linux-next, to then
get force-pushed. Commit IDs will be stable as long as they remain stable in the
source branch from which they are getting merged into mm-next. Branches are
tagged daily.

After integration and before pushing the branches, the I currently perform
various cross-compiles for the for-next-fixes and for-next branch + performs a
local CI run. More tests to be added in the future.

The for-test branch is best-effort for now (effectively only includes mm-new).


3) Component Branch Handling Rules
----------------------------------

We started creating a list of rules component trees should obey, and reached out
to other trees to learn best-practices.

For example:

- During the merge window, for-next + for-test should be mostly frozen, but for-
  next-fixes remains active.
- Before the merge window starts, for-next should only contain material
  targeting the next release.
- No new features into for-next around -rc5/-rc6. There are certainly
  exceptions.
- Fixes should ideally be in for-next-fixes for at least a week.
- Otherwise we target 2 weeks of stable commit IDs in next before PULL.

More to come as we move forward and learn.


4) Against Which Branches to Submit Patches
-------------------------------------------

We decided on the following preference list (highest to lowest):

(1) Submit against component for-next tree (indicated in MAINTAINERS)

(2) Submit against mm-next integration tree

(3) Support against Linus' master / release / rc

For many patches it won't matter, and many submitters will get it wrong either
way. We can always ask for a resend on conflicts.

Especially when a series involves multiple components, we'll have to learn about
best practices.

Ideally, we pick up stuff into for-next when it was properly reviewed and no
major changes are expected (which matches linux-next rules :) ). If a resend is
required after already in for-next, we can ask to submit against the old base,
or yank the series to then ask for a resend against the updated branch.

We discussed where to place cover letter information in a git-focused model.
Likely, merge commits already provided by tools like b4 shazam will be the best
and easiest option.


5) PULL Request Handling
------------------------

We decided to follow a staged approach:

Stage 1: we keep the existing model whereby slab/memblock/Andrew send PULL
requests independently.

Stage 2: I will start queuing patches for some components and start getting
experience with simpler PULL requests, before moving on to the next stage.

Stage 3: switch to the KVM model: as we get more components and more conflicts,
maintainers will send PULL requests to the mm-next maintainer, which will send
(bundled) PULL requests to Linus, performing similar integration testing as done
during mm-next maintenance.

Instead of involving Andrew into stage 3, we will instead try taking more and
more MM components over, so we can avoid him changing his workflow.


6) Documentation
----------------

We discussed what to document and where to document.

We'll likely create a "mm" subdirectory in Documentation/process/ where we will
document things like:
- Tree/branches, integration flow, CI ... essentially a lot of stuff included in
  these status update mails
- Submitter guidelines, including templates for bug reports / bug fixes / cover
  letters
- MM preferences, such as selftests primarily in C, coding style, AI review
  expectations, when to send new revisions, how to send new revisions ...

We'll also need MM component maintainer doc. We'll either make them publicly
available in the process docs as well, or maintain them out of tree.

We also discussed whether some easy way to (semi-automatically) send information
to first-time submitters would be helpful. Apparently, there is similar work
going on on the lkml level.


7) AI Review
------------

We discussed current challenges with Sashiko, including unclear expectations for
submitters when it comes to reports about existing problems, and how the
external website is suboptimal, but flooding the mailing list is also bad.

This topic should be discussed with the wider MM community in the future, and
maybe better tooling can help us.


8) Patchwork Integration
------------------------

We discussed how the existing MM patchwork instance [3] might make it easier for
us to keep track of the state of upstream submissions.

b4 has a great patchwork integration that we can use as well.

Mike already taught the MM CI to reflect CI status in patchwork; maybe other
status (AI review?) could similarly be reflected there to have one central tool.

We also talked about other approaches, such as netdevs patch review queue [4]
and patchew [5].


9) Next Steps
-------------

- Relocate slab tree.
- Better integration tests.
- Start picking patches for smaller, well-isolated components and see how that
  integrates.
- David to send first PULL request for this stuff.


10) Topics to Discuss Next
---------------------------

What we'll cover in the next session(s) will likely be around:

- Hotfixes process
- MM component separation: how to reduce or prepare for conflicts.
- MM component maintainer communication: how to efficiently communicate


There are still plenty of things to figure out. If you feel like you should be
part of the discussions and were missed so far, please let me known and I can
add you to the meeting invitation.


[1]
https://lore.kernel.org/linux-mm/3166fcdd-5f08-4f7c-a743-192d0e0207d1@kernel.org/
[2] https://lore.kernel.org/r/bed81e01-7303-4957-bd7d-38e3a094e96f@kernel.org
[3] https://patchwork.kernel.org/project/linux-mm/list/
[4] http://netdev.bots.linux.dev/suie.html
[5] https://patchew.org/linux/
