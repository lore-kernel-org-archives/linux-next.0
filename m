From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: manual merge of the async_tx tree with Linus' tree
Date: Fri, 27 May 2011 12:08:37 -0700
Message-ID: <BANLkTikAShzPv_6c6Z8Z9Xdt9TgQbcM-xA@mail.gmail.com>
References: <20110527133003.8299b429.sfr@canb.auug.org.au>
	<20110527095336.25007886@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:41642 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751131Ab1E0TIi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 May 2011 15:08:38 -0400
In-Reply-To: <20110527095336.25007886@endymion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Havard Skinnemoen <hskinnemoen@gmail.com>, Jiri Kosina <jkosina@suse.cz>, Viresh Kumar <viresh.kumar@st.com>

On Fri, May 27, 2011 at 12:53 AM, Jean Delvare <khali@linux-fr.org> wro=
te:
> Hi Stephen, Dan,
>
> On Fri, 27 May 2011 13:30:03 +1000, Stephen Rothwell wrote:
>> Today's linux-next merge of the async_tx tree got a conflict in
>> drivers/dma/dw_dmac.c between commit e05503ef1186 ("Haavard Skinnemo=
en
>> has left Atmel") from Linus' tree and commit aecb7b64dd9e
>> ("dmaengine/dw_dmac: Update maintainer-ship") from the async_tx tree=
=2E
>>
>> Just context changes. =A0I fixed it up (see below) and can carry the=
 fix as
>> necessary.
>
> Dan's patch is just plain wrong. MODULE_AUTHOR is about who wrote the
> code, not who maintains it. A change of maintainer should lead to an
> update or addition to file MAINTAINERS.

The patch in question did also update MAINTAINERS.  Since Viresh has
done a good amount of work on the driver (top-developer by commits
since the initial merge) and likely cares about user reports (now that
he has stepped up to maintain it) is there a reason that he should not
have his own MODULE_AUTHOR line in the driver as well?

The real problem here is the late detection of the merge conflict.  We
need to submit Vinod's git tree for inclusion in -next.  Given the
relative patch traffic I think async_tx.git should come after
slave-dma.git in the merge order, and any reworks I do of the
non-slave case will be based on Vinod's baseline.  We'll get this in
shape for the next cycle as I had to rebase things a bit when pulling
the current slave-dma.git tree.

> Thanks Viresh for stepping in, BTW, new maintainers are always welcom=
e.
>
> (As a side note, the relevance of MODULE_AUTHOR given the development
> and maintenance model the Linux kernel has embraced can certainly be
> discussed, but that's a different story.)

We don't seem to have documentation around it, but making a bunch of
commits and stepping up to be a maintainer seems enough justification
to have your contact info show up in modinfo...

--
Dan
