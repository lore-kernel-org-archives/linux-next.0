From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: Tree for May 7
Date: Tue, 12 May 2009 11:06:52 +0200
Message-ID: <200905121106.52896.borntraeger@de.ibm.com>
References: <20090507171918.4ecdd6fd.sfr@canb.auug.org.au> <200905071541.28639.borntraeger@de.ibm.com> <20090507140331.GC21250@suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate4.uk.ibm.com ([195.212.29.137]:33038 "EHLO
	mtagate4.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752300AbZELJGy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2009 05:06:54 -0400
In-Reply-To: <20090507140331.GC21250@suse.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Forest Bond <forest@alittletooquiet.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Am Thursday 07 May 2009 16:03:31 schrieb Greg KH:
[...]
> > > > can we please remove the wpactl.c.bak file from drivers/staging/vt6655/ ?
[...]
> I'll remove it from your patch that is in the staging tree.  But I'm on
> the road right now, so that's not going to happen until Friday afternoon
> at the earliest...

Ping.

The bak file is still there. My tooling (and myself) find it disturbing to
have a dirty localversion after a "make distclean"

Christian
