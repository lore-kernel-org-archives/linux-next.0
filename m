From: Mauro Carvalho Chehab <maurochehab@gmail.com>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Wed, 2 Sep 2009 23:12:14 -0300
Message-ID: <20090902231214.495d4002@pedra.chehab.org>
References: <20090902121713.f709b1ce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.156]:6671 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751528AbZICCMX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2009 22:12:23 -0400
In-Reply-To: <20090902121713.f709b1ce.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>

Em Wed, 2 Sep 2009 12:17:13 +1000
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Mauro,
> 
> Today's linux-next merge of the v4l-dvb tree got a conflict in
> drivers/media/video/gspca/Kconfig between commit
> b6b85048c059e3f085095e48e12ed3f7a92c88d4 ("V4L/DVB (12502): gspca -
> sn9c20x: Fix gscpa sn9c20x build errors") from Linus' tree and commit
> 7b5ab5558fbce09584d8795bc91eb64d8c685782 ("V4L/DVB (12452):
> gspca/Kconfig: Fix bad identation for USB_GSPCA_SN9C20X_EVDEV") from the
> v4l-dvb tree.
> 
> I fixed it up (see below) and will carry the fix for a while.

Thanks.

I've rebased it to fix this merge conflict between my devel tree and upstream.
You probably can drop it on your next merge.



Atenciosamente,
Prof. Mauro Carvalho Chehab, MSc, CISSP
maurochehab@gmail.com
