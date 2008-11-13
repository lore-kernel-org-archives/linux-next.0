From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 13 (v4l2 build error)
Date: Thu, 13 Nov 2008 09:36:16 -0800
Message-ID: <20081113093616.a3308a7e.randy.dunlap@oracle.com>
References: <20081113183316.3601c13d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:39561 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751268AbYKMRi0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Nov 2008 12:38:26 -0500
In-Reply-To: <20081113183316.3601c13d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, v4l-dvb-maintainer@linuxtv.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, video4linux-list@redhat.com

On Thu, 13 Nov 2008 18:33:16 +1100 Stephen Rothwell wrote:

linux-next-20081113/drivers/media/video/v4l2-ioctl.c: In function '__video_do_ioctl':
linux-next-20081113/drivers/media/video/v4l2-ioctl.c:1819: warning: format '%d' expects type 'int', but argument 3 has type 'struct v4l2_fract'
linux-next-20081113/drivers/media/video/v4l2-ioctl.c:1819: warning: format '%d' expects type 'int', but argument 4 has type 'struct v4l2_fract'
linux-next-20081113/drivers/media/video/v4l2-ioctl.c:1819: warning: format '%d' expects type 'int', but argument 5 has type 'struct v4l2_fract'

---
~Randy
