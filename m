From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: Tree for December 3 (media/video/cx88)
Date: Sat, 6 Dec 2008 08:10:40 -0200
Message-ID: <20081206081040.79b8dd44@pedra.chehab.org>
References: <20081203183602.c06f8c39.sfr@canb.auug.org.au>
	<4936F718.2000101@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:48225 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751947AbYLFKK7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 6 Dec 2008 05:10:59 -0500
In-Reply-To: <4936F718.2000101@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, v4l-dvb-maintainer@linuxtv.org, video4linux-list@redhat.com

Hi Randy,

On Wed, 03 Dec 2008 13:16:08 -0800
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> CONFIG_VIDEO_CX88=y
> CONFIG_VIDEO_CX88_DVB=m

That's the issue: cx18-dvb shouldn't be a module, since it depends on cx88.
I'll take a look at the kconfig stuff to solve this issue.

Thanks for reporting!

Cheers,
Mauro
