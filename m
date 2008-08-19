From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: linux-next: manual merge of the v4l-dvb tree
Date: Tue, 19 Aug 2008 07:59:01 +0200
Message-ID: <200808190759.01899.hverkuil@xs4all.nl>
References: <20080819141113.1a0a9819.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-vbr10.xs4all.nl ([194.109.24.30]:1825 "EHLO
	smtp-vbr10.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752908AbYHSF7j (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Aug 2008 01:59:39 -0400
In-Reply-To: <20080819141113.1a0a9819.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

On Tuesday 19 August 2008 06:11:13 Stephen Rothwell wrote:
> Hi Mauro,
>
> Today's linux-next merge of the v4l-dvb tree got a conflict in
> drivers/media/video/zr364xx.c between commit
> 8aac48f4f2460b00468fd5f1101addf3df04e94c ("USB: remove info() macro
> from usb.h") from the usb tree and commit
> dcdbac23cc15325ae04696803537b35bb0bcb3cb ("V4L/DVB (8613): v4l: move
> BKL down to the driver level") from the v4l-dvb tree.
>
> A context clashing change and addition.  I fixed it up (see below)
> and can carry it.

Signed-off-by: Hans Verkuil <hverkuil@xs4al.nl>

Thanks!

	Hans
