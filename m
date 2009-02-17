From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the v4l-dvb
 tree
Date: Tue, 17 Feb 2009 12:35:16 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0902171234180.18110@jikos.suse.cz>
References: <20090217192831.c22ad27b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51192 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751047AbZBQLfR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 06:35:17 -0500
In-Reply-To: <20090217192831.c22ad27b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Jean-Francois Moine <moinejf@free.fr>, Mauro Carvalho Chehab <mchehab@redhat.com>, Tobias Klauser <tklauser@distanz.ch>

On Tue, 17 Feb 2009, Stephen Rothwell wrote:

> Today's linux-next merge of the trivial tree got a conflict in
> drivers/media/video/gspca/t613.c between commit
> 99a9fcc84dd6310b724f6dca684043f1cd33f00d ("V4L/DVB (10381): gspca - t613:
> New unknown sensor added") from the v4l-dvb tree and commit
> 3c2e94a5fac4daac0bacd432ceeaff067957ee2b ("trivial: V4L: Storage class
> should be before const qualifier") from the trivial tree.
> 
> Juts context changes.  I fixed it up (see below) and can carry the fix as
> necessary.  Jiri, maybe some of these could be fed to the appropriate
> maintainers?

Hi Stephen,

yes, in fact I have pinged linux-media and other parties about that 
yesterday [1]. When Mauro confirms that he picked it up, I will drop it 
from trivial tree.

[1] http://www.mail-archive.com/linux-media@vger.kernel.org/msg01568.html

Thanks,

-- 
Jiri Kosina
SUSE Labs
