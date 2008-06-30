From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: manual merge of the v4l-dvb tree
Date: Mon, 30 Jun 2008 08:14:25 -0300
Message-ID: <20080630081425.125ca842@gaivota>
References: <20080630145645.b671b13d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:47536 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755928AbYF3LOe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jun 2008 07:14:34 -0400
In-Reply-To: <20080630145645.b671b13d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Mon, 30 Jun 2008 14:56:45 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
> 
> Today's linux-next merge of the v4l-dvb tree got a trivial conflict in
> drivers/media/video/videodev.c between commit
> 7fa8e6fa1519194fc0c931f40d530fb55137bad9 ("V4L/DVB (8092): videodev:
> simplify and fix standard enumeration") from Linus' tree (which is also
> in the v4l-dvb tree) and commit 561216cf5e422669b4f9e54a6157d731245feecc
> ("V4L/DVB (8103): videodev: fix/improve ioctl debugging") from the
> v4l-dvb tree.
> 
> Again, I fixed it up and will carry it.

Thanks. I'll rebase my tree.

>  But also my comments about a bug
> fix branch/tree apply here also.
> 
Hmm... I have here two branches, one with bug fixes only and another with bug fixes
+ improvements. The last one is exported into my linux-next tree. Having just
improvements on it seems a good idea, except that, sometimes, an improvement
requires first that some bug fix patch to be applied first. Anyway, I'm seeking
for some time to change my upstream procedures to get rid of those issues.

Cheers,
Mauro
