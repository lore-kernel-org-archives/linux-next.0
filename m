From: Tejun Heo <tj@kernel.org>
Subject: expected linux-next conflicts from workqueue/for-3.7
Date: Mon, 20 Aug 2012 15:04:21 -0700
Message-ID: <20120820220421.GY24861@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:63852 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755843Ab2HTWEZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Aug 2012 18:04:25 -0400
Received: by dady13 with SMTP id y13so2481395dad.19
        for <linux-next@vger.kernel.org>; Mon, 20 Aug 2012 15:04:25 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>, linux-next@vger.kernel.org

Hello, Stephen.

I just applied patch series to deprecate flush[_delayed]_work_sync().
All in-kernel users are converted to use flush[_delayed]_work()
instead.  It will cause conflicts in the following files on
linux-next.

* drivers/media/video/omap24xxcam.c
* drivers/media/video/cx23885/cx23885-input.c
* drivers/media/video/cx18/cx18-driver.c
* drivers/hid/hid-picolcd.c

The first three files have been renamed and the last file has been
split.  Resolution should be simple and if not, for whatever reason,
the changes can be safely skipped.

Thanks.

-- 
tejun
